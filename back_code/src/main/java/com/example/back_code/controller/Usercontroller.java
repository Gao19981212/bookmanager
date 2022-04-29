package com.example.back_code.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.common.Result;
import com.example.back_code.entity.BookList;
import com.example.back_code.entity.User;
import com.example.back_code.mapper.BookMapper;
import com.example.back_code.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


@RestController
@RequestMapping("/user")
public class Usercontroller {
    @Resource
    UserMapper userMapper;

    @PostMapping(value = "/login")
    public Result<?> login(@RequestBody User user) {

        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getName, user.getName()).eq(User::getPassword, user.getPassword()).eq(User::getType, user.getType()));
        User type = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getName, user.getName()).eq(User::getPassword, user.getPassword()));
        if (type == null) {
            return Result.error("-1", "账号或者密码错误！");
        } else if (type != null && res == null) {
            return Result.error("-1", "登录类型错误！");
        } else {
            res.setPassword(null);
            return Result.success(res);
        }
    }

    @PutMapping("/update")
    public Result<?> update(@RequestBody User user) {
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getName, user.getName()));
        if (res == null
        ) {
            userMapper.updateById(user);
            return Result.success();
        }

            return Result.error("-1","用户名已重复,不能修改");


    }
    @PutMapping("/readupdate")
    public Result<?> readupdate(@RequestBody User user) {
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getName, user.getName()));
        userMapper.updateById(user);
        if (res.getPassword().equals(user.getPassword())){

            return Result.success();
        }
        else {

            return Result.success("密码已改变！");
        }



    }

    @Autowired
    BookMapper bookMapper;

    @DeleteMapping("del/{id}")
    public Result<?> delete(@PathVariable long id) {
        BookList bookList = bookMapper.selectOne(Wrappers.<BookList>lambdaQuery().eq(BookList::getUserId, id));
        if (bookList == null) {
            userMapper.deleteById(id);
            return Result.success();
        }
        return Result.error("-1", "有书未还，无法删除！");

    }

    @PostMapping("/adduser")
    public Result<?> save(@RequestBody User user) {
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getName, user.getName()));
        if (res == null
        ) {
            if (user.getPassword() == null || user.getPassword() == "") {
                user.setPassword("123456");
            }
            if (user.getType() == null) {
                user.setType(2);
            }
            userMapper.insert(user);
            return Result.success();
        }
        return Result.error("-1", "用户名已存在");
    }

    @GetMapping("/pageshow")
    public Result<?> finpage(@RequestParam Integer pageNum, @RequestParam Integer pagesize, @RequestParam String search) {
        Page<User> userPage = userMapper.finpage(new Page<>(pageNum, pagesize), search);
        return Result.success(userPage);
    }

    @GetMapping("/info")
    public Result<?> info(@RequestParam String name) {
        User user = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getName, name));
        return Result.success(user);
    }

}
