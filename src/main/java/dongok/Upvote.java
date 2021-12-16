package dongok;

public class Upvote {
	public String upvoter_id;
	public String upvoted_post_id;
	public int upvote;// 1 == 추천, -1 == 비추천, 0은 table에서 삭제
	
	public Upvote(String upvoter_id, String upvoted_post_id, int upvote) {
		this.upvoter_id = upvoter_id;
		this.upvoted_post_id = upvoted_post_id;
		this.upvote = upvote;
	}

}
