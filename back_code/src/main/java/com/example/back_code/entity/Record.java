package com.example.back_code.entity;

import cn.hutool.core.date.DateTime;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.time.LocalDateTime;

@TableName("record")
@Data
public class Record {
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String name;
    private String nick;
    private String tel;
    private String sex;
    private String barcode;//条码
    private String bookTitle;//书名
    private String bookAuthor;//作者
    private LocalDateTime lendTime;
    private LocalDateTime backTime;
    private int recordState;
}
