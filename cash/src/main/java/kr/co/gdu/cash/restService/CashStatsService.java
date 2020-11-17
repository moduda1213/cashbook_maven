package kr.co.gdu.cash.restService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restMapper.CashStatsMapper;

@Service
@Transactional
public class CashStatsService {
	@Autowired CashStatsMapper cashStatsMapper;
	
	//18년~올해 총 지출
	public Map<String,Object> getTotalofYearForThreeYear(){
		return cashStatsMapper.selectTotalofYearForThreeYear();
	}
	
	//최근 3개월 간 카테고리별 지출
	public Map<String,Object> getCategoryForThreeMonth(){
		return cashStatsMapper.selectCategoryForThreeMonth();
	}
	//2020년 월별 지출
	public Map<String, Object> getTotalOfMonthByYear () {
		return cashStatsMapper.selectTotalOfMonthByYear();
	}
	//2019년 월별 지출
		public Map<String, Object> getTotalOfMonthByLastYear () {
			return cashStatsMapper.selectTotalOfMonthByLastYear();
	}
	//2018년 월별 지출
	public Map<String, Object> getTotalOfMonthByBeforeLastYear () {
		return cashStatsMapper.selectTotalOfMonthByBeforeLastYear();
	}
	
	public Map<String, Object> getTotalOutAndInByYear(int year) {
		return cashStatsMapper.selectTotalOutAndInByYear(year);
	}
}