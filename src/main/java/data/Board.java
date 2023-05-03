package data;

import java.util.Date;

public class Board {
	
	int boardId;
	String writer;
	String body;
	
	int totalUsers;
	int currentUsers;
	
	String time;
	String continent;

	
	public int getCurrentUsers() {
		return currentUsers;
	}
	public void setCurrentUsers(int currentUsers) {
		this.currentUsers = currentUsers;
	}
	
	public String getContinent() {
		return continent;
	}
	public void setContinent(String continent) {
		this.continent = continent;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public int getTotalUsers() {
		return totalUsers;
	}
	public void setTotalUsers(int totalUsers) {
		this.totalUsers = totalUsers;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
