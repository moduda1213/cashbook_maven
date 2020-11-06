package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

// @Conpoment
// @Controller, @Service, @Mapper, @Repository : 스테레오타입
@Mapper
public interface CashbookMapper {
	int insertCashbook(Cashbook cashbook); //가계부 수정 액션
	int deleteCashbook(int cashbookId); // 가계부 삭제 액션
	int updateCashbook(Cashbook cashbook); // 가계부 수정 액션
	List<Map<String, Object>> selectCashInOutList();
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	List<Cashbook> selectCashBookListByDay(Map<String, Object> map);
	Cashbook selectCashbookOne(int cashbookId);
	
}