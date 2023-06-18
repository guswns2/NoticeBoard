package com.arian.noticeboard.DTO;

import java.util.Date;

public class CommentDto {
	private int pstNum;
	private int cmtNum;
	private int forNum;
	private int cmtDepth;
	private String cmtUser;
	private String cmtContent;
	private Date cmtTime;
	
	
	
	public int getPstNum() {
		return pstNum;
	}
	public void setPstNum(int pstNum) {
		this.pstNum = pstNum;
	}
	public int getCmtNum() {
		return cmtNum;
	}
	public void setCmtNum(int cmtNum) {
		this.cmtNum = cmtNum;
	}
	public int getForNum() {
		return forNum;
	}
	public void setForNum(int forNum) {
		this.forNum = forNum;
	}
	public int getCmtDepth() {
		return cmtDepth;
	}
	public void setCmtDepth(int cmtDepth) {
		this.cmtDepth = cmtDepth;
	}
	public String getCmtUser() {
		return cmtUser;
	}
	public void setCmtUser(String cmtUser) {
		this.cmtUser = cmtUser;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public Date getCmtTime() {
		return cmtTime;
	}
	public void setCmtTime(Date cmtTime) {
		this.cmtTime = cmtTime;
	}
}
