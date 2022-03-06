package com.example.back_code.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("bookstype")
@Data
public class bookstype {
    @TableId(value = "id",type = IdType.AUTO)
private  Integer id;
private  String Typename;
}
