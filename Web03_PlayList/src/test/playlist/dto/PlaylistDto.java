package test.playlist.dto;

public class PlaylistDto {
	private int num;
	private String checked;
	private String title;
	private String singer;
	private String time;
	
	//private String listName;
	
	public PlaylistDto() {}

	public PlaylistDto(int num, String checked, String title, String singer, String time) {
		super();
		this.num = num;
		this.checked = checked;
		this.title = title;
		this.singer = singer;
		this.time = time;
		//this.listName = listName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
