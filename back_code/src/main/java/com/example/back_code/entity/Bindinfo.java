package com.example.back_code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import jdk.nashorn.internal.objects.annotations.Property;
import lombok.Data;

import java.time.LocalDateTime;

@TableName("bindinfo")
@Data
public class Bindinfo {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String name;
    private String nick;
    private String barcode;
    private String bookTitle;
    private String bookAuthor;
    private String bookType;
    private String bookPic;
    private double bookRate;//评分
    private Integer isBind;//1收藏0不收藏
    private Integer accessCount;//访问次数
    private LocalDateTime accessTime;//访问时间
    private Integer bookTypeid;//书目类型ID
    @TableField(exist = false)
    private BookList bookList;
}
