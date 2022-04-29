package com.example.back_code.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.entity.Bindinfo;
import com.example.back_code.entity.BookList;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BindMapper extends BaseMapper<Bindinfo> {
    Page<Bindinfo> findpage(Page<Bindinfo> page,String name);
}
