package com.example.back_code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("booklist")
@Data
public class BookList {
    @TableId(value = "book_id", type = IdType.AUTO)
    private Integer bookId;//ID
    private String barcode;//条码
    private String bookNum;//索书号
    private String bookTitle;//书名
    private String bookAuthor;//作者
    private String bookPublisher;//出版社
    private double bookPrice;//价格
    private String bookShelf;//架位号
    private String bookIsbn;//标准编码
    private String bookYear;//出版年
    private String bookPlace;//出版地
    private int bookType;//图书类型
    private int userId;//读者绑定
    private int statusId;//状态绑定
    private String bookPic;//书籍图片
    private  int countVisit;//访问次数
    private  String bookContent;//简介
    @TableField(exist = false)
    private User user;
    @TableField(exist = false)
    private status sts;
    @TableField(exist = false)
    private bookstype bke;
    @TableField(exist = false)
    private User_Type user_types;
    @TableField(exist = false)
    private  Record record;
}
