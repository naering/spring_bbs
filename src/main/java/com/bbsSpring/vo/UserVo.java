package com.bbsSpring.vo;

import java.sql.Timestamp;

public class UserVo {

    private String memberId;
    private String memberPwd;
    private String memberName;
    private int memberAge;
    private String roleId;
    private String memberAddress;
    private String memberEmail;
    private String memberPhone;
    private String memberGender;
    private Timestamp memberStartDate;
    private Timestamp memberEndDate;
    private Timestamp pwdUpdDate;
    private String memberRePwd;

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberPwd() {
        return memberPwd;
    }

    public void setMemberPwd(String memberPwd) {
        this.memberPwd = memberPwd;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public int getMemberAge() {
        return memberAge;
    }

    public void setMemberAge(int memberAge) {
        this.memberAge = memberAge;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getMemberAddress() {
        return memberAddress;
    }

    public void setMemberAddress(String memberAddress) {
        this.memberAddress = memberAddress;
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail;
    }

    public String getMemberPhone() {
        return memberPhone;
    }

    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }

    public String getMemberGender() {
        return memberGender;
    }

    public void setMemberGender(String memberGender) {
        this.memberGender = memberGender;
    }

    public Timestamp getMemberStartDate() {
        return memberStartDate;
    }

    public void setMemberStartDate(Timestamp memberStartDate) {
        this.memberStartDate = memberStartDate;
    }

    public Timestamp getMemberEndDate() {
        return memberEndDate;
    }

    public void setMemberEndDate(Timestamp memberEndDate) {
        this.memberEndDate = memberEndDate;
    }

    public Timestamp getPwdUpdDate() {
        return pwdUpdDate;
    }

    public void setPwdUpdDate(Timestamp pwdUpdDate) {
        this.pwdUpdDate = pwdUpdDate;
    }

    public String getMemberRePwdPwd() {
        return memberRePwd;
    }

    public void setMemberRePwdPwd(String memberRePwd) {
        this.memberRePwd = memberRePwd;
    }

}
