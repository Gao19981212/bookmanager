package com.example.back_code.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.common.Result;
import com.example.back_code.entity.BookList;
import com.example.back_code.entity.User;
import com.example.back_code.mapper.BookMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/book")
public class Bookcontroller {
@Resource
    BookMapper bookMapper;
@PostMapping("/bookdata")
public Result<?> bookdata(@RequestBody BookList bookList){
    BookList res=  bookMapper.selectOne(Wrappers.<BookList>lambdaQuery().eq(BookList::getBarcode,bookList.getBarcode()));
    if (res==null){
        bookList.setStatusId(1);
        bookMapper.insert(bookList);
        return Result.success();
    }
    return Result.error("-1","条码重复，不能添加！");
}
    @PutMapping("/update")
    public Result<?> update(@RequestBody BookList bookList){
        bookMapper.updateById(bookList);
        return  Result.success();
    }
@DeleteMapping("del/{id}")
    public Result<?> del(@PathVariable long id){
    bookMapper.deleteById(id);
    return  Result.success();
    }
    @GetMapping("/pageshow")
    public Result<?> finpage(@RequestParam Integer current, @RequestParam Integer pagesize, @RequestParam int status,@RequestParam int booktype,@RequestParam String search,@RequestParam String searchtype) {
        Page<BookList> bookListPage=bookMapper.finpage(new Page<>(current,pagesize),status,booktype,search,searchtype);
        return  Result.success(bookListPage);
    }
}
