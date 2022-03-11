package com.example.back_code.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.entity.Record;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecordMapper extends BaseMapper<Record> {
 Page<Record> querypage(Page<Record> page,String search,String searchtype,String radio);


}
