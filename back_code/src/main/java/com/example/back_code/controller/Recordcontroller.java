package com.example.back_code.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.common.Result;
import com.example.back_code.entity.Computed;
import com.example.back_code.entity.Record;
import com.example.back_code.mapper.BookMapper;
import com.example.back_code.mapper.RecordMapper;
import com.example.back_code.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/record")
public class Recordcontroller {
    @Resource
    RecordMapper recordMapper;
    @Autowired
    BookMapper bookMapper;
    @Autowired
    UserMapper userMapper;

    @GetMapping("/querypage")
    public Result<?> querypage(@RequestParam Integer current,
                               @RequestParam Integer pagesize,
                               @RequestParam String search, @RequestParam String searchtype, @RequestParam String radio) {
        Page<Record> recordPage = recordMapper.querypage(new Page<>(current, pagesize), search, searchtype, radio);
        return Result.success(recordPage);
    }

     @GetMapping("/circulation")
    public  Result<?> circulation(){
      long lennum=recordMapper.selectCount(Wrappers.<Record>lambdaQuery().eq(Record::getRecordState,1));
         long backnum=recordMapper.selectCount(Wrappers.<Record>lambdaQuery().eq(Record::getRecordState,2));
         long readnum=userMapper.selectCount(null);
         long booknum=bookMapper.selectCount(null);
         Computed computed=new Computed();
         computed.setLendNum(lennum);
         computed.setBackNum(backnum);
         computed.setBookNum(booknum);
         computed.setReadNum(readnum);
         return Result.success(computed);
    }
}
