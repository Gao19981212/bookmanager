package com.example.back_code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("status")
@Data
public class status {
    @TableId(value = "status_id",type = IdType.AUTO)
private  Integer statusId;
private  String statusname;
}
