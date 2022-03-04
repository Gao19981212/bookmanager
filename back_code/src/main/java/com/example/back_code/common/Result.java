package com.example.back_code.common;

public class Result<T> {
    private  String code;

    public void setCode(String code) {
        this.code = code;
    }

    private  String msg;

    public Result(T data) {
        this.data = data;
    }

    private T data;

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    public  Result(){

    }
    public static  Result success(){
        Result result=new Result();
        result.setCode("0");
        result.setMsg("成功");
        return  result;
    }
    public static <T> Result<T> success(T data){
        Result<T> result=new Result<>(data);
        result.setCode("0");
        result.setMsg("成功");
        return  result;
    }
    public  static Result error(String code,String msg)
    {
        Result result=new Result();
        result.setCode(code);
        result.setMsg(msg);
        return  result;
    }
}
