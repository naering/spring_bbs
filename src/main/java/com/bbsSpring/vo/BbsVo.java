package com.bbsSpring.vo;

import java.sql.Timestamp;

public class BbsVo {

    private int bbsSeq;
    private int rowNum;
    private int bbsHits = 0;
    private String bbsTitle;
    private String bbsConts;
    private String bbsPwd;
    private String memberId;
    private String memberName;
    private String updUserId;
    private Timestamp updDate;
    private Timestamp regDate;
    private String bbsType;

    public int getBbsSeq() {
        return bbsSeq;
    }

    public void setBbsSeq(int bbsSeq) {
        this.bbsSeq = bbsSeq;
    }

    public int getRowNum() {
        return rowNum;
    }

    public void setRowNum(int rowNum) {
        this.rowNum = rowNum;
    }

    public int getBbsHits() {
        return bbsHits;
    }

    public void setBbsHits(int bbsHits) {
        this.bbsHits = bbsHits;
    }

    public String getBbsTitle() {
        return bbsTitle;
    }

    public void setBbsTitle(String bbsTitle) {
        this.bbsTitle = bbsTitle;
    }

    public String getBbsConts() {
        return bbsConts;
    }

    public void setBbsConts(String bbsConts) {
        this.bbsConts = bbsConts;
    }

    public String getBbsPwd() {
        return bbsPwd;
    }

    public void setBbsPwd(String bbsPwd) {
        this.bbsPwd = bbsPwd;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getUpdUserId() {
        return updUserId;
    }

    public void setUpdUserId(String updUserId) {
        this.updUserId = updUserId;
    }

    public Timestamp getUpdDate() {
        return updDate;
    }

    public void setUpdDate(Timestamp updDate) {
        this.updDate = updDate;
    }

    public Timestamp getRegDate() {
        return regDate;
    }

    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }

    public String getBbsType() {
        return bbsType;
    }

    public void setBbsType(String bbsType) {
        this.bbsType = bbsType;
    }
}
