package gu.warehouse;

import java.io.File;
import java.io.IOException;


import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import gu.admin.organ.DepartmentVO;
import gu.board.BoardSearchVO;
import gu.board.BoardVO;
import gu.common.ComboVO;
import gu.common.Field3VO;
import gu.common.FileUtil;
import gu.common.FileVO;
import gu.common.SearchVO;
import gu.common.UtilEtc;
import gu.member.UserVO;
import gu.warehouse.WarehouseVO;
import gu.warehouse.WareTitlepartVO;


@Controller 
public class WarehouseCtr {

    @Autowired
    private WarehouseSvc warehouseSvc;
    
    static final Logger LOGGER = LoggerFactory.getLogger(WarehouseCtr.class);
    
    /**
     * 창고 조회(리스트)
     * @throws IOException 
     */
    @RequestMapping(value = "/wareList")
    public String searchWareList(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
    	
		System.out.println("serverlet wareList ------------------------------------------");
		
	    List<?> listview  = warehouseSvc.selectWareList(searchVO);
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("listview", listview);
    	    
        return "warehouse/wareList";    	
    }   
    
    
    /**
     * 창고 조회(선택리스트 > 맵으로)
     * @throws IOException 
     */
    @RequestMapping(value = "/viewCheckedMap")
    public String viewCheckedMap(HttpServletRequest request, String[] checkRow, ModelMap modelMap) {
    	
		System.out.println("serverlet viewCheckedMap ------------------------------------------");

        List<?> listview  = warehouseSvc.selectCheckWarehouse(checkRow);
        modelMap.addAttribute("listview", listview);
        return "warehouse/viewCheckedMap";    	
    }       
    
       
    /**
     *  창고 상세 정보
     */
    @RequestMapping(value = "/wareDetail")
    public String viewDetail(HttpServletRequest request, WarehouseVO wareInfo, ModelMap modelMap) {
    	
		System.out.println("serverlet viewDetail ------------------------------------------");    	
    	
        String whcode = request.getParameter("whcode").toString();
        wareInfo =  warehouseSvc.selectWareOne(whcode);
        
        modelMap.addAttribute("warehouseVO", wareInfo);        
        
        return "warehouse/wareDetail";
    }        
    
   

    /**
     * 신규창고 등록화면 이동
     */
    @RequestMapping(value = "/viewAddWare")
    public String viewAddWare(HttpServletResponse response, ModelMap modelMap, WarehouseVO wareInfo) {
    	
		System.out.println("serverlet viewAddWare ------------------------------------------");    	
		
		
    	
//    	FileUtil fs = new FileUtil();
//        FileVO fileInfo = fs.saveFile(wareInfo.getPhotofile());
//        if (fileInfo != null) {
//        	wareInfo.setImg001(fileInfo.getRealname());
//        }
//        userSvc.insertUser(userInfo);
//        return common_UserList(modelMap, wareInfo.getDeptno());
        modelMap.addAttribute("warehouseVO", wareInfo);        
    	
        return "warehouse/viewAddWare";        
    }
    

    /**
     * 신규창고 등록(저장).
     */
    @RequestMapping(value = "/saveNewWare")
    public String saveNewWare(HttpServletRequest request,  WarehouseVO wareInfo) {
    	
		System.out.println("serverlet saveNewWare ------------------------------------------");
		String str = wareInfo.getWhname();
		
//		warehouseSvc.insertWare(wareInfo);
		
		
//        String userno = request.getSession().getAttribute("userno").toString();
//        boardInfo.setUserno(userno);
//
//        if (boardInfo.getBrdno() != null && !"".equals(boardInfo.getBrdno())) {    // check auth for update
//            String chk = boardSvc.selectBoardAuthChk(boardInfo);
//            if (chk == null) {
//                return "common/noAuth";
//            }
//        }
//        
//        String[] fileno = request.getParameterValues("fileno");
//        FileUtil fs = new FileUtil();
//        List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile());
//
//        boardSvc.insertBoard(boardInfo, filelist, fileno);

        
//        return "warehouse/wareList";                
        return "redirect:register";
    }

    
    /**
     * test
     * @throws IOException 
     */
    @RequestMapping(value = "/test")
    public String test(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
    	
		System.out.println("serverlet test ------------------------------------------");
		
        return "warehouse/test";    	
    }   
    
//--------------------------------------------------------------------------------------------//    
    /**
     * 창고 조회(리스트) MAIN SEARCH
     * @throws IOException 
     */
    @RequestMapping(value = "/search")
    public String searchPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
    	
		System.out.println("serverlet search ------------------------------------------");
		
	    List<?> listview  = warehouseSvc.searchWareList(searchVO);
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("listview", listview);
    	    
        return "main/search";    	
    }
    
    
    /**
     * 조회 이력(history)
     * @throws IOException 
     */
    @RequestMapping(value = "/history")
    public String historyPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
 	
		System.out.println("serverlet history ------------------------------------------");
    	    
        return "main/history";    	
    }           
    
    /**
     * 즐겨찾기(favorite)
     * @throws IOException 
     */
    @RequestMapping(value = "/favorite")
    public String favoritePage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
 	
		System.out.println("serverlet favorite ------------------------------------------");
    	    
        return "main/favorite";    	
    }             
    
    
    
    /**
     * 가이드(guide)
     * @throws IOException 
     */
    @RequestMapping(value = "/guide")
    public String guidePage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
 	
		System.out.println("serverlet guide ------------------------------------------");
    	    
        return "main/guide";    	
    }       
    
    /**
     * 창고등록(register)
     * @throws IOException 
     */
    @RequestMapping(value = "/register")
    public String registerPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
 	
		System.out.println("serverlet register ------------------------------------------");
    	    
        return "main/register";    	
    }      
    
    /**
     * 로그인(mainlogin)
     * @throws IOException 
     */
    @RequestMapping(value = "/mainlogin")
    public String mainloginPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
 	
		System.out.println("serverlet guide ------------------------------------------");
    	    
        return "main/mainlogin";    	
    }      
    
    /**
     * 건축물대장정보 (titlepart)
     * @throws IOException 
     */
    @RequestMapping(value = "/titlepart")
    public String titlepartPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
 	
		System.out.println("serverlet titlepart ------------------------------------------");
		
		String searchKey = searchVO.getSearchKeyword();		
		if(searchKey == ""){  return "main/titlepart";   };
		
		String sido, sigungu, dong;
		if(searchKey.length()>=2) { sido = searchKey.substring(0,2);} else {sido = "";}
		if(searchKey.length()>=5) { sigungu = searchKey.substring(2,5);} else {sigungu = "";}
		if(searchKey.length()>=8) { dong = searchKey.substring(5,8);} else {dong = "";}
		
        searchVO.pageCalculate( warehouseSvc.selectTitlepartCount(searchVO) ); // startRow, endRow
	    List<?> listview  = warehouseSvc.searchTitlePartList(searchVO);
//        List<?> listview  = boardSvc.selectBoardList(searchVO);
	    
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("listview", listview);	
        modelMap.addAttribute("sido", sido);	 
        modelMap.addAttribute("sigungu", sigungu);	 
        modelMap.addAttribute("dong", dong);	 
        modelMap.addAttribute("searchKeyword", searchKey);
        
//        String whcode = request.getParameter("whcode").toString();
        return "main/titlepart";    	
    }          
    /**
     * 표제부 상세화면 (detailTitle)
     * @throws IOException 
     */
    @RequestMapping(value = "/detailTitle")
    public void detailTitle(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
 	
		System.out.println("serverlet detailTitle ------------------------------------------");    	
    	
        String mgbdrgpk = request.getParameter("mgbdrgpk").toString();
		System.out.println("serverlet detailTitle mgbdrgpk : ----------------------------" + mgbdrgpk);    	        
        WareTitlepartVO titlepartVO =  warehouseSvc.selectTitlepart(mgbdrgpk);
        
        modelMap.addAttribute("titlepartVO", titlepartVO);     
        
        UtilEtc.responseJsonValue(response, titlepartVO);	
    }    
    
    /**
     * get sggcd.     
     */
    @RequestMapping(value = "/getSigungu")
    public void getSigunguAjax(HttpServletRequest request, HttpServletResponse response) {
    	
        String sidocd = request.getParameter("sidocd");
		System.out.println("serverlet getSigunguAjax ------------------" + sidocd + "---------------");
		
	    List<?> listview  = warehouseSvc.getSigunguAjax(sidocd);
	    
		System.out.println("serverlet listview size ------------------" + listview.size() + "---------------");
        UtilEtc.responseJsonValue(response, listview);		
        //        boardSvc.insertBoardLike( new Field3VO(brdno, userno, null) );        
    }
    
    
    /**
     * get sggcd.     
     */
    @RequestMapping(value = "/getdongcd")
    public void getDongcdAjax(HttpServletRequest request, HttpServletResponse response) {
    	
        String sigungu = request.getParameter("sigungu");
		System.out.println("serverlet getdongcdAjax ------------------" + sigungu + "---------------");
		
	    List<?> listview  = warehouseSvc.getDongcdAjax(sigungu);
	    
		System.out.println("serverlet listview size ------------------" + listview.size() + "---------------");
        UtilEtc.responseJsonValue(response, listview);		
        //        boardSvc.insertBoardLike( new Field3VO(brdno, userno, null) );        
    }            
    
    
    /**
     * 창고상세화면 (detail)
     * @throws IOException 
     */
    @RequestMapping(value = "/detail")
    public String detailPage(HttpServletRequest request, WarehouseVO wareInfo, WareFloorVO warefloor, ModelMap modelMap) {
 	
		System.out.println("serverlet viewDetail ------------------------------------------");    	
    	
        String whcode = request.getParameter("whcode").toString();
        
        wareInfo =  warehouseSvc.selectWareOne(whcode);
        modelMap.addAttribute("warehouseVO", wareInfo);        

        List<?> listview  = warehouseSvc.selectWareFloor(whcode);
        modelMap.addAttribute("listview", listview);
        
        return "main/detail";
    }

    
    /**
     * get sggcd.     
     */
    @RequestMapping(value = "/excelUploadAjax")
    public void excelUploadAjax(MultipartFile upFile, MultipartHttpServletRequest request) throws Exception {
    	
        MultipartFile excelFile =request.getFile("excelFile");
        System.out.println("엑셀 파일 업로드 컨트롤러");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택 해 주세요.");
        }
        
    	File destFile = new File("C:\\upload\\"+excelFile.getOriginalFilename());
        
        try{
            excelFile.transferTo(destFile);
        }catch(IllegalStateException | IOException e){
            throw new RuntimeException(e.getMessage(),e);
        }
        
        //Service 단에서 가져온 코드 
        ExcelReadOption excelReadOption = new ExcelReadOption();
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        excelReadOption.setOutputColumns("A","B","C","D","E","F");
        excelReadOption.setStartRow(2);
        
        
        List<Map<String, String>>excelContent =ExcelRead.read(excelReadOption);
        
		/*
		 * for(Map<String, String> article: excelContent){
		 * System.out.println(article.get("A")); System.out.println(article.get("B"));
		 * System.out.println(article.get("C")); System.out.println(article.get("D"));
		 * System.out.println(article.get("E")); System.out.println(article.get("F")); }
		 */        
        warehouseSvc.insertXLS(excelContent);
        //userService.excelUpload(destFile); //서비스 부분을 삭제한다.
        
        //FileUtils.forceDelete(destFile.getAbsolutePath());
        
//        ModelAndView view = new ModelAndView();
//        view.setViewName("/user/list");
//        return view;

    }               	
    	    
    
}
