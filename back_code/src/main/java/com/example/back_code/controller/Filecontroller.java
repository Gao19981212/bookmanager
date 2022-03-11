package com.example.back_code.controller;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.example.back_code.common.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
@RestController
@RequestMapping("/files")
public class Filecontroller {
    @Value("${server.port}")
    private String port;
    private static final String ip = "http://localhost";
    @CrossOrigin(origins = {"http://localhost:8080", "null"})
    @PostMapping("/upload")
    public Result<?> upload(MultipartFile file) throws IOException {
        String filename = file.getOriginalFilename();//获取源文件名称
        String flag = IdUtil.fastUUID();
        String path = System.getProperty("user.dir") + "/src/main/resources/file/" + flag + "_" + filename;//获取上传的路径
//        System.out.println(System.getProperty("user.dir"));
        FileUtil.writeBytes(file.getBytes(), path);//把文件写入到上传的路径
        return Result.success(ip + ":" + port + "/files/" + flag);
    }
    @GetMapping("/{flag}")
    public void getFiles(@PathVariable String flag, HttpServletResponse response) {
        OutputStream os;//新建一个输出流对象
        String basePath = System.getProperty("user.dir") + "/src/main/resources/file/";//定义文件上传的根路径
        List<String> fileNames = FileUtil.listFileNames(basePath);//获取所有文件名称
        String fileName = fileNames.stream().filter(name -> name.contains(flag)).findAny().orElse("");//找到参数一致的文件
        try {
            if (StringUtils.isNotEmpty(fileName)) {
                response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
                response.setContentType("application/octet-stream");
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
