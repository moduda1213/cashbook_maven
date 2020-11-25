package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	int addNoticefile(Noticefile noticefile); // 파일 추가
	int deleteNoticefileOne(int noticefileId); // 파일 삭제
}
