package com.example.back_code.controller;

import com.example.back_code.common.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.back_code.mapper.booktypeMapper;
import javax.annotation.Resource;
import com.example.back_code.entity.bookstype;

import java.util.List;

@RestController
@RequestMapping("/booktype")
public class b_typecontroller {
@Resource
    booktypeMapper booktypeMapper;
@GetMapping("/query")
 public Result<?> query(){
    List<bookstype> bookstype=booktypeMapper.selectList(null);
    return Result.success(bookstype);
 }
}
