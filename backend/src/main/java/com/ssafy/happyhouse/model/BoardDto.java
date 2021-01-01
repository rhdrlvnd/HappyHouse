package com.ssafy.happyhouse.model;

import java.time.LocalDateTime;

public class BoardDto {
    private int boardNo;
    private int userNo;
    private String userId;
    private String title;
    private String content;
    private LocalDateTime time;

    public BoardDto() {
    }

   

    public BoardDto(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}



	public BoardDto(int boardNo, int userNo, String userId, String title, String content, LocalDateTime time) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.time = time;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }



	@Override
	public String toString() {
		return "BoardDto [boardNo=" + boardNo + ", userNo=" + userNo + ", userId=" + userId + ", title=" + title
				+ ", content=" + content + ", time=" + time + "]";
	};

    
}