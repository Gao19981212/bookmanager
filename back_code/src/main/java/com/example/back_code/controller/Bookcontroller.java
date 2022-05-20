package com.example.back_code.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.common.Result;
import com.example.back_code.entity.Bindinfo;
import com.example.back_code.entity.BookList;
import com.example.back_code.entity.User;
import com.example.back_code.mapper.BindMapper;
import com.example.back_code.mapper.BookMapper;
import com.example.back_code.mapper.UserMapper;
import com.example.back_code.mapper.RecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.back_code.mapper.BooktypeMapper;
import com.example.back_code.entity.Record;
import org.springframework.web.bind.annotation.*;
import com.example.back_code.entity.Bookstype;

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
    @Autowired
    BindMapper bindMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    BooktypeMapper booktypeMapper;

    //新增图书
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

    //修改图书
    @PutMapping("/update")
    public Result<?> update(@RequestBody BookList bookList) {
        BookList old = bookMapper.selectOne(Wrappers.<BookList>lambdaQuery().eq(BookList::getBookId, bookList.getBookId()));
        BookList res = bookMapper.selectOne(Wrappers.<BookList>lambdaQuery().eq(BookList::getBarcode, bookList.getBarcode()));
        if (bookList.getBarcode() != null && bookList.getBookType() != 0) {
            if (null == res) {
              if (old.getUserId()!=0){
                  return Result.error("-1", "这本书已被借阅，条码不能被修改！");
              }
                bookMapper.updateById(bookList);
                return Result.success();

            } else if (res.getBarcode().equals(old.getBarcode())) {
                bookMapper.updateById(bookList);
                return Result.success();

            } else {
                return Result.error("-1", "当前条码已存在，不能修改！");
            }

        } else {
            return Result.error("-1", "条码和书本类型不能为空！");
        }


    }

    //删除图书
    @DeleteMapping("del/{id}")
    public Result<?> del(@PathVariable long id) {
        BookList bookList = bookMapper.selectOne(Wrappers.<BookList>lambdaQuery().eq(BookList::getBookId, id));
        if (bookList.getUserId() == 0) {
            bookMapper.deleteById(id);
            return Result.success();
        }
        return Result.error("-1", "该书已被借阅，不能删除！");
    }

    //查询图书
    @GetMapping("/pageshow")
    public Result<?> finpage(@RequestParam Integer current, @RequestParam Integer pagesize, @RequestParam int status, @RequestParam int booktype, @RequestParam String search, @RequestParam String searchtype) {
        Page<BookList> bookListPage = bookMapper.finpage(new Page<>(current, pagesize), status, booktype, search, searchtype);
        return Result.success(bookListPage);
    }

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
        Record record = recordMapper.selectOne(Wrappers.<Record>lambdaQuery().eq(Record::getBarcode, bookList.getBarcode()).eq(Record::getRecordState, 1));
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


    @CrossOrigin(origins = {"*", "null"})
    @GetMapping("/hotbook")
    public Result<?> hotbook() {
        List<BookList> bookLists = bookMapper.hotbook();
        return Result.success(bookLists);
    }

    //查看详情
    @GetMapping("/Detailbook")
    public Result<?> Detailbook(@RequestParam int id, @RequestParam String name) {
        User user = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getName, name));//查询读者
        BookList bookLists = bookMapper.Detailbook(id);//查询图书
        Bookstype bookstype = booktypeMapper.selectOne(Wrappers.<Bookstype>lambdaQuery().eq(Bookstype::getId, bookLists.getBookType()));
        Bindinfo bf = bindMapper.selectOne(Wrappers.<Bindinfo>lambdaQuery().eq(Bindinfo::getBarcode, bookLists.getBarcode()).eq(Bindinfo::getName, user.getName()));
        Bindinfo bindinfo = new Bindinfo();
        bindinfo.setName(user.getName());
        bindinfo.setNick(user.getNick());
        bindinfo.setBookTitle(bookLists.getBookTitle());
        bindinfo.setBookAuthor(bookLists.getBookAuthor());
        bindinfo.setBookPic(bookLists.getBookPic());
        bindinfo.setBarcode(bookLists.getBarcode());
        bindinfo.setBookType(bookstype.getTypename());
        bindinfo.setBookTypeid(bookstype.getId());
        bindinfo.setAccessTime(LocalDateTime.now());
        if (bf == null) {
            bindinfo.setAccessCount(1);
            bindinfo.setIsBind(1);
            bindMapper.insert(bindinfo);
        } else {
            bf.setAccessCount(bf.getAccessCount() + 1);
//            bindinfo.setId(bf.getId());
            bindMapper.updateById(bf);
        }


        return Result.success(bookLists);

    }

}


