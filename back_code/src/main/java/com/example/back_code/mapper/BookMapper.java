package com.example.back_code.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.back_code.entity.BookList;
import com.example.back_code.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper extends BaseMapper<BookList> {
    Page<BookList> finpage(Page<BookList> page,int status,int booktype,String search,String searchtype);
    List<BookList> queryinfo(String name);
    List<BookList> lendbook(int id);
    List<BookList> backbook(String barcode);
    List<BookList> hotbook();
}
