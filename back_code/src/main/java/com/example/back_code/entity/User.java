package com.example.back_code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;
@TableName("user")
@Data
public class User{
    @TableId(value = "id",type = IdType.AUTO)
private  Integer id;
    @JsonProperty(value = "name")
private  String name;
    @JsonProperty(value = "password")
private String password;
private  String nick;
private  Integer age;
private String tel;
private String sex;
private  Integer type;
@TableField(exist = false)
private User_Type user_types;
}
