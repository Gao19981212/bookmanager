package com.example.back_code.controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.common.Result;
import com.example.back_code.entity.BookList;
import com.example.back_code.entity.User;
import com.example.back_code.mapper.BookMapper;
import com.example.back_code.mapper.UserMapper;
import com.example.back_code.mapper.RecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.back_code.entity.Record;
import org.springframework.expression.spel.support.ReflectiveConstructorResolver;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/book")
public class Bookcontroller {
    @Resource
    BookMapper bookMapper;

    @Autowired
    RecordMapper recordMapper;

    //显示数据
    @PostMapping("/bookdata")
    public Result<?> bookdata(@RequestBody BookList bookList) {
        BookList res = bookMapper.selectOne(Wrappers.<BookList>lambdaQuery().eq(BookList::getBarcode, bookList.getBarcode()));
        if (res == null) {
            bookList.setStatusId(1);
            bookMapper.insert(bookList);
            return Result.success();
        }
        return Result.error("-1", "条码重复，不能添加！");
    }

    @PutMapping("/update")
    public Result<?> update(@RequestBody BookList bookList) {
        if (bookList.getBarcode()==null&&bookList.getBookType()==0) {
            return Result.error("-1","条码和书本类型不能为空！");
        }
        bookMapper.updateById(bookList);
        return Result.success();
    }

    @Autowired
    UserMapper userMapper;

    //查询读者
    @GetMapping("/queryinfo")
    public Result<?> queryinfo(@RequestParam String name) {
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("name", name);
        User user1 = userMapper.selectOne(userQueryWrapper);
        if (user1 == null) {
            return Result.error("-1", "读者不存在！");
        } else {
            List<BookList> bookLists = bookMapper.queryinfo(name);
            if (null == bookLists || bookLists.size() == 0) {
                return Result.success(user1);
            }
            return Result.success(bookLists);
        }
    }


    //借书
    @PutMapping("/lendbook")
    public Result<?> lendbook(@RequestBody BookList bookList) {
        BookList res = bookMapper.selectOne(Wrappers.<BookList>lambdaQuery().eq(BookList::getBarcode, bookList.getBarcode()));
        User user = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getId, bookList.getUserId()));
        if (res != null) {
            if (res.getUserId() != 0) {
                return Result.error("-1", "这本书已被借阅，无法借出!");
            }
            Record record = new Record();
            record.setName(user.getName());
            record.setNick(user.getNick());
            record.setSex(user.getSex());
            record.setTel(user.getTel());
            record.setBookTitle(res.getBookTitle());
            record.setBarcode(bookList.getBarcode());
            record.setBookAuthor(res.getBookAuthor());
            record.setLendTime(LocalDateTime.now());
            record.setRecordState(1);
            recordMapper.insert(record);
            res.setUserId(bookList.getUserId());
            res.setStatusId(2);
            bookMapper.updateById(res);
            List<BookList> bookLists = bookMapper.lendbook(bookList.getUserId());
            return Result.success(bookLists);
        }
        return Result.error("-1", "条码不存在！");
    }
    //还书
    @PutMapping("/backbook")
    public Result<?> backbook(@RequestBody BookList bookList) {
        BookList res = bookMapper.selectOne(Wrappers.<BookList>lambdaQuery().eq(BookList::getBarcode, bookList.getBarcode()));
        Record record = recordMapper.selectOne(Wrappers.<Record>lambdaQuery().eq(Record::getBarcode, bookList.getBarcode()).eq(Record::getRecordState,1));
        if (res != null) {
            if (res.getUserId() == 0) {
                return Result.error("-1", "这本书未被借阅！");
            }
            if (record != null) {
                record.setRecordState(2);
                record.setBackTime(LocalDateTime.now());
                recordMapper.updateById(record);
            }
            List<BookList> bookLists = bookMapper.backbook(bookList.getBarcode());
            res.setStatusId(1);
            res.setUserId(0);
            bookMapper.updateById(res);
            return Result.success(bookLists);
        }
        return Result.error("-1", "条码不存在！");
    }
    @DeleteMapping("del/{id}")
    public Result<?> del(@PathVariable long id) {
        bookMapper.deleteById(id);
        return Result.success();
    }

    @GetMapping("/pageshow")
    public Result<?> finpage(@RequestParam Integer current, @RequestParam Integer pagesize, @RequestParam int status, @RequestParam int booktype, @RequestParam String search, @RequestParam String searchtype) {
        Page<BookList> bookListPage = bookMapper.finpage(new Page<>(current, pagesize), status, booktype, search, searchtype);
        return Result.success(bookListPage);
    }
    @GetMapping("/hotbook")
     public  Result<?> hotbook(){
        List<BookList> bookLists=bookMapper.hotbook();
        return  Result.success(bookLists);
     }



}


