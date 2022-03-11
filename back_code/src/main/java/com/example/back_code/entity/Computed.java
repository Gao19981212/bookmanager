package com.example.back_code.entity;

public class Computed {
    public long getBookNum() {
        return BookNum;
    }

    public void setBookNum(long bookNum) {
        BookNum = bookNum;
    }

    public long getReadNum() {
        return ReadNum;
    }

    public void setReadNum(long readNum) {
        ReadNum = readNum;
    }

    public long getLendNum() {
        return LendNum;
    }

    public void setLendNum(long lendNum) {
        LendNum = lendNum;
    }

    public long getBackNum() {
        return BackNum;
    }

    public void setBackNum(long backNum) {
        BackNum = backNum;
    }

    private long BookNum;
    private long ReadNum;
    private long LendNum;
    private  long BackNum;




}
