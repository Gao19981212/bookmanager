package com.example.back_code.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.example.back_code.common.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/files")
public class Filecontroller {
    @Value("${server.port}")
    private String port;
    @Value("https://${server.address}")
    private  String ip;
    @CrossOrigin(origins = {"*", "null"})
    @PostMapping("/upload")
    public Result<?> upload(MultipartFile file) throws IOException {
        String filename = file.getOriginalFilename();//获取源文件名称
//        String flag = IdUtil.fastUUID();
        String path = System.getProperty("user.dir") + "/src/main/resources/file/"+ filename;//获取上传的路径
        FileUtil.writeBytes(file.getBytes(), path);//把文件写入到上传的路径
        String url="/files/"+filename;
        return Result.success(url);
    }
    @CrossOrigin(origins = {"*", "null"})
    @GetMapping(value = "/{flag}",produces ="image/png")
    public void getFiles(@PathVariable String flag, HttpServletResponse response) {
        OutputStream os;//新建一个输出流对象
        String basePath = System.getProperty("user.dir") + "/src/main/resources/file/";//定义文件上传的根路径
        List<String> fileNames = FileUtil.listFileNames(basePath);//获取所有文件名称
        String fileName = fileNames.stream().filter(name -> name.contains(flag)).findAny().orElse("");//找到参数一致的文件
        try {
            if (StringUtils.isNotEmpty(fileName)) {
//                response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
                response.setContentType("image/png");
                response.setHeader("Access-Control-Allow-Origin", "*");
                byte[] bytes = FileUtil.readBytes(basePath + fileName);
                os = response.getOutputStream();
                os.write(bytes);
                os.flush();
                os.close();
            }

        } catch (Exception e) {
            System.out.println("文件下载失败");
        }
    }

}
