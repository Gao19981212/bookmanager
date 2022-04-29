package com.example.back_code.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.common.Result;
import com.example.back_code.entity.Bindinfo;
import com.example.back_code.mapper.BindMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.PushBuilder;
import java.util.List;

@RestController
@RequestMapping("/bindinfo")
public class Bindcontroller {
    @Resource
    BindMapper bindMapper;

    @PutMapping("/collect")
    public Result<?> collect(@RequestBody Bindinfo bindinfo) {

        if (bindinfo.getIsBind() == 2) {
            bindMapper.updateById(bindinfo);
            return Result.success("已加入个人书架！");
        } else {
            bindMapper.updateById(bindinfo);
            return Result.error(("-1"), "已从个人书架移除！");
        }
    }

    @PutMapping("/rate")
    public Result<?> rate(@RequestBody Bindinfo bindinfo) {
        bindMapper.updateById(bindinfo);
        return Result.success("评价成功！");
    }

    @GetMapping("/show")
    public Result<?> show(@RequestParam String barcode, @RequestParam String name) {
        Bindinfo bindinfo = bindMapper.selectOne(Wrappers.<Bindinfo>lambdaQuery().eq(Bindinfo::getBarcode, barcode).eq(Bindinfo::getName, name));
        return Result.success(bindinfo);
    }

    @GetMapping("/bookmark")
    public Result<?> bookmark(@RequestParam String name) {
        QueryWrapper<Bindinfo> bindinfoQueryWrapper = new QueryWrapper<>();
        bindinfoQueryWrapper.eq("name", name).eq("is_bind",2);
        List<Bindinfo> bindinfos = bindMapper.selectList(bindinfoQueryWrapper);
        return Result.success(bindinfos);
    }
    @GetMapping("/recommend")
     public  Result<?> findpage(@RequestParam Integer current, @RequestParam Integer pagesize,@RequestParam String name){
         Page<Bindinfo> page=bindMapper.findpage(new Page<>(current, pagesize),name);

         return Result.success(page);
     }
}
