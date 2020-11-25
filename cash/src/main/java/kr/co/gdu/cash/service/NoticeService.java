package kr.co.gdu.cash.service;



import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service 
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	@Autowired private CashbookMapper cashbookMapper;
	private final String PATH ="C:\\Users\\ECS\\Desktop\\springwork\\maven.1604882343550\\cash\\src\\main\\webapp\\upload\\";
	private final Logger logger = LoggerFactory.getLogger(this.getClass()); 
	
	public int totalList() {
		return noticeMapper.totalList();
	}
	//파일 하나 삭제
	public void removeUploadFileOne(int noticefileId, String noticefileName) {
		String filename = noticefileName;
		File file = new File(this.PATH+filename);
		if(file.exists()) {
			file.delete();
		}
		noticefileMapper.deleteNoticefileOne(noticefileId);
	}
	//공지 리스트 수정
	public void updateNotice(NoticeForm noticeForm,int noticeId) {
		Notice notice = new Notice();
		
		notice.setNoticeId(noticeId);
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		notice.setNoticeDate(noticeForm.getNoticeDate());
		noticeMapper.updateNotice(notice);
		
		//공지 파일 추가
		List<Noticefile> noticefile=null;
		System.out.println("---------------noticefileList : " + noticeForm.getNoticefileList() );
		if(noticeForm.getNoticefileList() != null) {
			noticefile = new ArrayList<Noticefile>();
			
			for(MultipartFile mf : noticeForm.getNoticefileList()){
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize((int)mf.getSize());
				noticefile.add(nf);
				System.out.println("for 문 : " + nf);
				//파일 저장
				try {
					mf.transferTo(new File(this.PATH+filename+ext)); // 생성경로 지정
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		System.out.println("----------------------------------noticefile : " + noticefile);
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.addNoticefile(nf);
			}
		}
	}
		
	
	//공지 리스트 삭제
	public int deleteNotice(int noticeId) {
		return noticeMapper.deleteNotice(noticeId);
	}
	//notice 추가
	public void addNotice(NoticeForm noticeForm) {
		//공지 제목,내용,작성일자 추가
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		notice.setNoticeDate(noticeForm.getNoticeDate());
		
		//공지 파일 추가
		List<Noticefile> noticefile=null;
		System.out.println("---------------noticefileList : " + noticeForm.getNoticefileList() );
		if(noticeForm.getNoticefileList() != null) {
			noticefile = new ArrayList<Noticefile>();
			
			noticeMapper.addNoticeList(notice);
			
			for(MultipartFile mf : noticeForm.getNoticefileList()){
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileType(mf.getContentType());
				nf.setNoticefileSize((int)mf.getSize());
				noticefile.add(nf);
				System.out.println("for 문 : " + nf);
				//파일 저장
				try {
					mf.transferTo(new File(this.PATH+filename+ext)); // 생성경로 지정
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		System.out.println("----------------------------------noticefile : " + noticefile);
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.addNoticefile(nf);
			}
		}
	}
	
	//notice 상세보기
	public Notice getNoticeOne(int noticeId) {
		return noticeMapper.selectNoticeOne(noticeId);
	}
	
	//notice 더보기
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage){
		// int currentPage, int rowPerPage -> beginRow
		// noticeMapper 호출
		int beginRow = (currentPage-1)*rowPerPage; // 시작 행
		//System.out.println(beginRow+"<- beginRow");
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("beginRow",beginRow);
		map.put("rowPerPage", rowPerPage);
		return noticeMapper.selectNoticeListByPage(map);
	}
	
	// issue : noticeList....중복
	public Map<String, Object> getNoticeAndInOutList() { 
		List<Notice> noticeList = noticeMapper.selectLatestNoiceList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	public List<Notice> getNoticeList() {
		return noticeMapper.selectLatestNoiceList();
	}
}