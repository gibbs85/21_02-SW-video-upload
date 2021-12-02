package dongok;

public class TestDataInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Query sql = new Query();

		User user00 = new User("id00", "pass00", "name00", "email@000", 2, "Hi im name00");
		User user91 = new User("test91", "test91", "test91", "test91@test.com", 1, "HI Im a tutor91");
		User user99 = new User("test99", "test99", "test99", "test99@test.com", 1, "HI Im a tutor99");
		if(!sql.check_dup(user00))
			sql.insert_value(user00);
		if(!sql.check_dup(user91))
			sql.insert_value(user91);
		if(!sql.check_dup(user99))
			sql.insert_value(user99);
		
		Post post00 = new Post("pid00", "some/adf/asdf/aa.mp4", "제목00", "내용00", "20211127", user91.id);
		Post post01 = new Post("pid01", "some/adf/asdf/aa.mp4", "제목01", "내용01", "20211127", user91.id);
		Post post02 = new Post("pid02", "some/adf/asdf/aa.mp4", "제목02", "내용02", "20211127", user91.id);
		Post post03 = new Post("pid03", "some/adf/asdf/aa.mp4", "제목03", "내용03", "20211127", user91.id);
		Post post04 = new Post("pid04", "some/adf/asdf/aa.mp4", "제목04", "내용04", "20211127", user91.id);
		Post post05 = new Post("pid05", "some/adf/asdf/aa.mp4", "제목05", "내용05", "20211127", user99.id);
		Post post06 = new Post("pid06", "some/adf/asdf/aa.mp4", "제목06", "내용06", "20211127", user99.id);
		Post post07 = new Post("pid07", "some/adf/asdf/aa.mp4", "제목07", "내용07", "20211127", user99.id);
		Post post08 = new Post("pid08", "some/adf/asdf/aa.mp4", "제목08", "내용08", "20211127", user99.id);
		Post post09 = new Post("pid09", "some/adf/asdf/aa.mp4", "제목09", "내용09", "20211127", user99.id);
		Post post10 = new Post("pid10", "some/adf/asdf/aa.mp4", "제목10", "내용10", "20211202", user99.id);
		Post post11 = new Post("pid11", "some/adf/asdf/aa.mp4", "제목11", "내용11", "20211202", user99.id);
		Post post12 = new Post("pid12", "some/adf/asdf/aa.mp4", "제목12", "내용12", "20211202", user99.id);
		
		
		
		

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
		
		
	}

}
