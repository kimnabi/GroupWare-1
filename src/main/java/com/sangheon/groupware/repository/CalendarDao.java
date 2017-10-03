package com.sangheon.groupware.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sangheon.groupware.vo.CalendarVo;


@Repository
public class CalendarDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	public int addSchedule(CalendarVo scheduleVo ) {
		int count = sqlSession.insert("calendar.addSchedule", scheduleVo);
		return count;
	}
	
}
