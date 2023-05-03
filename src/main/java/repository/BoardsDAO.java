package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import data.Board;

public class BoardsDAO extends DAO {
	public static int createBoard(Board board) {
		SqlSession session = factory.openSession();
		try {
			return session.insert("boards.createBorad", board);
		}finally {
			session.commit();
			session.close();
		}
	}
	public static List<Board> findByBoard(String continent) {
		SqlSession session = factory.openSession();
		try {
			return session.selectList("boards.findByBoard", continent);
		}finally {
			session.close();
		}
	}
}
