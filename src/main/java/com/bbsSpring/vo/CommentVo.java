package com.bbsSpring.vo;

import java.sql.Timestamp;

public class CommentVo {
    private int commentSeq;
    private int bbsSeq;
    private String commentConts;
    private Timestamp commentUpdDate;
    private String commentPwd;
    private Timestamp commentDate;
    private String memberId;

    public int getCommentSeq() {
        return commentSeq;
    }

    public void setCommentSeq(int commentSeq) {
        this.commentSeq = commentSeq;
    }

    public int getBbsSeq() {
        return bbsSeq;
    }

    public void setBbsSeq(int bbsSeq) {
        this.bbsSeq = bbsSeq;
    }

    public String getCommentConts() {
        return commentConts;
    }

    public void setCommentConts(String commentConts) {
        this.commentConts = commentConts;
    }

    public Timestamp getCommentUpdDate() {
        return commentUpdDate;
    }

    public void setCommentUpdDate(Timestamp commentUpdDate) {
        this.commentUpdDate = commentUpdDate;
    }

    public String getCommentPwd() {
        return commentPwd;
    }

    public void setCommentPwd(String commentPwd) {
        this.commentPwd = commentPwd;
    }

    public Timestamp getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Timestamp commentDate) {
        this.commentDate = commentDate;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
}
