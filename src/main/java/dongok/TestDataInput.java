package dongok;

public class TestDataInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Query sql = new Query();

		User tutie00 = new User("tutie00", "pass00", "튜티요", "email@000", 2, "00번 튜티입니다.");
		User tutor91 = new User("tutor91", "pass91", "김튜터", "tutor91@test.com", 1, "HI Im a 튜터91");
		User tutor99 = new User("tutor99", "pass99", "이튜터", "tutor99@test.com", 1, "99번 튜터입니다.");
		
		Post post00 = new Post("pid00", "some/adf/asdf/aa.mp4", "제목00", "내용00", "20211127", tutor91.id);
		Post post01 = new Post("pid01", "some/adf/asdf/aa.mp4", "제목01", "내용01", "20211127", tutor91.id);
		Post post02 = new Post("pid02", "some/adf/asdf/aa.mp4", "제목02", "내용02", "20211127", tutor91.id);
		Post post03 = new Post("pid03", "some/adf/asdf/aa.mp4", "제목03", "내용03", "20211127", tutor91.id);
		Post post04 = new Post("pid04", "some/adf/asdf/aa.mp4", "제목04", "내용04", "20211127", tutor91.id);
		Post post05 = new Post("pid05", "some/adf/asdf/aa.mp4", "제목05", "내용05", "20211127", tutor99.id);
		Post post06 = new Post("pid06", "some/adf/asdf/aa.mp4", "제목06", "내용06", "20211127", tutor99.id);
		Post post07 = new Post("pid07", "some/adf/asdf/aa.mp4", "제목07", "내용07", "20211127", tutor99.id);
		Post post08 = new Post("pid08", "some/adf/asdf/aa.mp4", "제목08", "내용08", "20211127", tutor99.id);
		Post post09 = new Post("pid09", "some/adf/asdf/aa.mp4", "제목09", "내용09", "20211127", tutor99.id);
		Post post10 = new Post("pid10", "some/adf/asdf/aa.mp4", "제목10", "내용10", "20211202", tutor99.id);
		Post post11 = new Post("pid11", "some/adf/asdf/aa.mp4", "제목11", "내용11", "20211202", tutor99.id);
		Post post12 = new Post("pid12", "some/adf/asdf/aa.mp4", "제목12", "내용12", "20211202", tutor99.id);
		
		Suggestion sug00 = new Suggestion(tutor91.id, tutie00.id, post00.post_id);
		Suggestion sug01 = new Suggestion(tutor91.id, tutie00.id, post01.post_id);
		Suggestion sug02 = new Suggestion(tutor91.id, tutie00.id, post02.post_id);
		Suggestion sug03 = new Suggestion(tutor99.id, tutie00.id, post05.post_id);
		

		
		if(!sql.check_dup(tutie00))
			sql.insert_value(tutie00);
		if(!sql.check_dup(tutor91))
			sql.insert_value(tutor91);
		if(!sql.check_dup(tutor99))
			sql.insert_value(tutor99);
		
		
		
		if(!sql.check_dup(post00))
			sql.insert_value(post00);
		if(!sql.check_dup(post01))
			sql.insert_value(post01);
		if(!sql.check_dup(post02))
			sql.insert_value(post02);
		if(!sql.check_dup(post03))
			sql.insert_value(post03);
		if(!sql.check_dup(post04))
			sql.insert_value(post04);
		if(!sql.check_dup(post05))
			sql.insert_value(post05);
		if(!sql.check_dup(post06))
			sql.insert_value(post06);
		if(!sql.check_dup(post07))
			sql.insert_value(post07);
		if(!sql.check_dup(post08))
			sql.insert_value(post08);
		if(!sql.check_dup(post09))
			sql.insert_value(post09);
		if(!sql.check_dup(post10))
			sql.insert_value(post10);
		if(!sql.check_dup(post11))
			sql.insert_value(post11);
		if(!sql.check_dup(post12))
			sql.insert_value(post12);
		

		if(!sql.check_dup(sug00))
			sql.insert_value(sug00);
		if(!sql.check_dup(sug01))
			sql.insert_value(sug01);
		if(!sql.check_dup(sug02))
			sql.insert_value(sug02);
		if(!sql.check_dup(sug03))
			sql.insert_value(sug03);
		
		
		
		
	}

}
