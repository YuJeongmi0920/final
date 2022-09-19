package com.gd.finalproject.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.finalproject.vo.Notice;

@Mapper
public interface NoticeMapper {
	// 공지사항 리스트
	List<Notice> getNoticeList(@Param("beginRow") int beginRow, @Param("rowPerPage") int rowPerPage);
	
	// 공지사항 리스트 페이징 Total
	int getNoticeTotal();

	// 공지사항 상세페이지
	Map<String, Object> selectNoticeOne(@Param("noticeNo") int noticeNo);
	
}
