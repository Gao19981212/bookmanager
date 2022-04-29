package com.example.back_code.controller;

import com.example.back_code.common.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.back_code.mapper.BooktypeMapper;
import javax.annotation.Resource;
import com.example.back_code.entity.Bookstype;

import java.util.List;

@RestController
@RequestMapping("/booktype")
public class b_typecontroller {
@Resource
BooktypeMapper booktypeMapper;
@GetMapping("/query")
 public Result<?> query(){
    List<Bookstype> bookstype=booktypeMapper.selectList(null);
    return Result.success(bookstype);
 }
}
