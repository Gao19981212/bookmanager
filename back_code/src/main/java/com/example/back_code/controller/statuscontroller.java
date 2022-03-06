package com.example.back_code.controller;


import com.example.back_code.common.Result;
import com.example.back_code.mapper.statusMapper;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.back_code.entity.status;
import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/status")
public class statuscontroller {
    @Resource
    statusMapper statusMapper;
    @GetMapping("/query")
    public Result<?> query(){
        List<status> statuses =statusMapper.selectList(null);
        return Result.success(statuses);
    }
}
