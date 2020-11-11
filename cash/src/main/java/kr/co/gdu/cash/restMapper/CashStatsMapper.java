package kr.co.gdu.cash.restMapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CashStatsMapper {
	public Map<String,Object> selectTotalOfMonthByYear(); //2019년도의 매 월 지출
	public Map<String, Object> selectTotalOutAndInByYear(int year); // 해당 년도의 지출,수입
}
