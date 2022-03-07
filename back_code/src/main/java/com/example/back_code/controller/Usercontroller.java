package com.example.back_code.controller;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.common.Result;
import com.example.back_code.entity.User;
import com.example.back_code.mapper.UserMapper;
import org.springframework.validation.annotation.Validated;
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
            return Result.success();
        }
    }
    @PutMapping("/update")
    public Result<?> update(@RequestBody User user){
        userMapper.updateById(user);
        return  Result.success();
    }
  @DeleteMapping("del/{id}")
  public Result<?> delete(@PathVariable long id){
      userMapper.deleteById(id);
      return  Result.success();
  }

    @PostMapping("/adduser")
    public Result<?> save(@RequestBody User user) {
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getName, user.getName()));
        if (res == null
        ) {
            if (user.getPassword()==null||user.getPassword()==""){
                user.setPassword("123456");
            }
            userMapper.insert(user);
            return Result.success();
        }
        return Result.error("-1","用户名已存在");
    }

    @GetMapping("/pageshow")
    public Result<?> finpage(@RequestParam Integer pageNum, @RequestParam Integer pagesize, @RequestParam String search) {
        Page<User> userPage=userMapper.finpage(new Page<>(pageNum,pagesize),search);
        return  Result.success(userPage);
    }
}
