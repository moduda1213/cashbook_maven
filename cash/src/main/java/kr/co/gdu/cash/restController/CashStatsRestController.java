package kr.co.gdu.cash.restController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restService.CashStatsService;

@RestController
public class CashStatsRestController {

	@Autowired CashStatsService cashStatsService;
	
	@GetMapping("/totalOutAndInByYear/{year}")
	public Map<String, Object> totalOutAndInByYear(@PathVariable(name = "year") int year) {
		return cashStatsService.getTotalOutAndInByYear(year);
	}
	
	@GetMapping("/admin/chart1")
	public Map<String, Object> totalOfMonthByYear() {
		Map<String, Object> map = cashStatsService.getTotalOfMonthByYear();
		return map; 
	}
	
	@GetMapping("/admin/chart2")
	public Map<String, Object> totalOfMonthByThirdYear() {
		Map<String, Object> map = new HashMap<>();
		map.put("currentYear",cashStatsService.getTotalOfMonthByYear());
		map.put("lastYear", cashStatsService.getTotalOfMonthByYear());
		map.put("beforeLastYear",cashStatsService.getTotalOfMonthByYear());
		return map; 
	}
}
