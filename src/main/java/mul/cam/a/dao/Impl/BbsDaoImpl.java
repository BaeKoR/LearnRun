package mul.cam.a.dao.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.BbsDao;

@Repository
public class BbsDaoImpl implements BbsDao {
	@Autowired // singleton
	SqlSession session;
	
	String ns = "Bbs.";
}

























