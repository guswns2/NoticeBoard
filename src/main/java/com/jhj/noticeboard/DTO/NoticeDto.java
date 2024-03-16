package com.arian.noticeboard.DTO;

import java.util.Date;

public class NoticeDto {
	private int pstNum;
	private String pstTitle;
	private String pstContent;
	private String pstUser;
	private Date pstTime;
	private int pstView;
	
	
	public int getPstNum() {
		return pstNum;
	}
	public void setPstNum(int pstNum) {
		this.pstNum = pstNum;
	}
	public String getPstTitle() {
		return pstTitle;
	}
	public void setPstTitle(String pstTitle) {
		this.pstTitle = pstTitle;
	}
	public String getPstContent() {
		return pstContent;
	}
	public void setPstContent(String pstContent) {
		this.pstContent = pstContent;
	}
	public String getPstUser() {
		return pstUser;
	}
	public void setPstUser(String pstUser) {
		this.pstUser = pstUser;
	}
	public Date getPstTime() {
		return pstTime;
	}
	public void setPstTime(Date pstTime) {
		this.pstTime = pstTime;
	}
	public int getPstView() {
		return pstView;
	}
	public void setPstView(int pstView) {
		this.pstView = pstView;
	}

}
