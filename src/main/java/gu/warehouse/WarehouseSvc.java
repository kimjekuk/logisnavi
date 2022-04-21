package gu.warehouse;

import java.io.File;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import gu.board.BoardSearchVO;
import gu.board.BoardVO;
import gu.common.FileVO;
import gu.common.SearchVO;
import gu.etc.ExcelVo;
import gu.warehouse.WarehouseVO;

@Service
public class WarehouseSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;

    static final Logger LOGGER = LoggerFactory.getLogger(WarehouseSvc.class);
    
    
    //창고리스트 조회(메인 검색화면)
    public List<?> searchWareList(SearchVO param) {
        return sqlSession.selectList("selectWareListInfo", param);
    }
    
    //창고리스트 조회(지도 검색화면)
    public List<?> searchWareMapList(SearchVO param) {
        return sqlSession.selectList("selectWareMapList", param);
    }

    
    //리스트에서 선택한 창고들만
    public List<?>  selectCheckWarehouse(String[] param) {
    	HashMap hm = new HashMap();
    	hm.put("list", param) ;
    	return sqlSession.selectList("selectCheckWarehouse", hm);
    }    
    
    //1창고 상세정보
    public WahamaVO selectWareOne(String param) {
        return sqlSession.selectOne("selectWareOne", param);
    }    
    
    
    //1창고 층별정보
    public List<?> selectWareFloor(String param) {
        return sqlSession.selectList("selectWareFloor", param);
    }        
    
    //창고등록
    public void insertWare(WarehouseVO wareInfo) {
    	
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        try {
                 sqlSession.insert("insertWare", wareInfo);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("insertWare");
        }            
    }

    
    // 시군구콤보값 그룹조회
    public List<?> getSigunguAjax(String param) {
        return sqlSession.selectList("selectGrpSigunguList", param);
    }    
    // 동콤보값 그룹조회
    public List<?> getDongcdAjax(String param) {
        return sqlSession.selectList("selectGrpDongList", param);
    }      
    
    //건축물대장정보(표제부) 조회
    public List<?> searchTitlePartList(SearchVO param) {
        return sqlSession.selectList("selectTitlePartList", param);
    }
    //표제부 리스트 카운트(페이징처리)
    public Integer selectTitlepartCount(SearchVO param) {
        return sqlSession.selectOne("selectTitlePartCount", param);
    }
    //표제부 1정보(팝업처리)
    public WareTitlepartVO selectTitlepart(String param) {
        return sqlSession.selectOne("selectTitlePart", param);
    }    
    
    
    //-- 인허가 정보 --//    
    public List<?> selectBasisList(SearchVO param) {
        return sqlSession.selectList("selectBasisList", param);
    }

    
	//-- 건축물대장 정보 --//    
    public List<?> selectBrtitleList(SearchVO param) {
        return sqlSession.selectList("selectBrtitleList", param);
    }    
    
    
    //-- 인허가 정보(층별) --// 	   
     public List<?> selectBasisFloorList(String[] param) {
     	HashMap hm = new HashMap();
     	hm.put("list", param) ;
     	return sqlSession.selectList("selectBasisFloorList", hm);    	 
     }
     
     //-- 표제부 정보(층별) --//    
     public List<?> selectBrtitleFloorList(String[] param) {
     	HashMap hm = new HashMap();
     	hm.put("list", param) ;
     	return sqlSession.selectList("selectBrtitleFloorList", hm);    	 
     }     
    
    //excel upload
    public void excelUpload(File destFile) {
    	ExcelReadOption excelReadOption = new ExcelReadOption();
    }    
    
    //excel upload
    public void insertXLS(List<Map<String, String>>excelContent ) {

       	ExcelVo excelVo = new ExcelVo();
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        try {
        	
            for(Map<String, String> article: excelContent){
            	excelVo.setXls_data01(article.get("A"));
            	excelVo.setXls_data02(article.get("B"));
            	excelVo.setXls_data03(article.get("C"));
            	excelVo.setXls_data04(article.get("D"));
            	excelVo.setXls_data05(article.get("E"));
                sqlSession.insert("insertXLS", excelVo);
            }
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("insertXLS");
        }     
    }    
    
    // 임차접수정보 한건 조회
    public ReqLmInfo selectReqlmOne(String param) {
        return sqlSession.selectOne("selectReqlmOne", param);
    } 
    
    //임차접수정보 등록
    public void insertReqlmInfo(ReqLmInfo reqlmInfo) {
    	
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        try {
                sqlSession.insert("insertReqLm", reqlmInfo);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("insertReqLm");
        }            
    }
    
    //임차접수정보 등록
    public void updateReqlmInfo(ReqLmInfo reqlmInfo) {
    	
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        try {
                sqlSession.insert("updateReqLm", reqlmInfo);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
            LOGGER.error("updateReqLm");
        }            
    }

    //임차접수정보 리스트표시
      public List<?> selectReqlmList(SearchVO param) {
          return sqlSession.selectList("selectReqLmList", param);
      }
     
    // 창고등록폼 wahama (표제부 기반)기본세팅
      public WahamaVO selectWahamaBrOne(String param) {
          return sqlSession.selectOne("selectWahamaBrOne", param);
      } 
      
      // 창고등록폼 wahama (인허가 기반)기본세팅
      public WahamaVO selectWahamaBaOne(String param) {
          return sqlSession.selectOne("selectWahamaBaOne", param);
      } 

    // 창고등록폼 wahafl (표제부 기반)기본세팅
     public List<?> selectWahaflBrList(String param) {
         return sqlSession.selectList("selectWahaflBrList", param);
     }          
     
     // 창고등록폼 wahafl (인허가 기반)기본세팅
     public List<?> selectWahaflBaList(String param) {
         return sqlSession.selectList("selectWahaflBaList", param);
     }          

     // 창고등록폼 wahama 불러오기
     public WahamaVO selectWahamaOne(String param) {
         return sqlSession.selectOne("selectWahamaOne", param);
     }         

     // 창고등록폼 wahafl 불러오기
     public List<?> selectWahaflList(String param) {
         return sqlSession.selectList("selectWahaflList", param);
     }          
          
     //창고기본정보 등록
     public void insertWahamaInfo(WahamaVO wahamaInfo) {
     	
         DefaultTransactionDefinition def = new DefaultTransactionDefinition();
         def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
         TransactionStatus status = txManager.getTransaction(def);
         try {
                  sqlSession.insert("insertWahama", wahamaInfo);
             txManager.commit(status);
         } catch (TransactionException ex) {
             txManager.rollback(status);
             LOGGER.error("insertWahama");
         }            
     }     
     
     //창고층별정보 등록
     public void insertWahaflInfo(WahaflVO wahaflInfo) {
     	
         DefaultTransactionDefinition def = new DefaultTransactionDefinition();
         def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
         TransactionStatus status = txManager.getTransaction(def);
         try {
                  sqlSession.insert("insertWahafl", wahaflInfo);
             txManager.commit(status);
         } catch (TransactionException ex) {
             txManager.rollback(status);
             LOGGER.error("insertWahafl");
         }            
     }     

     //창고기본정보 수정
     public void updateWahamaInfo(WahamaVO wahamaInfo) {
     	
         DefaultTransactionDefinition def = new DefaultTransactionDefinition();
         def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
         TransactionStatus status = txManager.getTransaction(def);
         try {
                  sqlSession.insert("updateWahama", wahamaInfo);
             txManager.commit(status);
         } catch (TransactionException ex) {
             txManager.rollback(status);
             LOGGER.error("updateWahama");
         }            
     }     
     
     //창고층별정보 수정
     public void updateWahaflInfo(WahaflVO wahaflInfo) {
     	
         DefaultTransactionDefinition def = new DefaultTransactionDefinition();
         def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
         TransactionStatus status = txManager.getTransaction(def);
         try {
                  sqlSession.insert("updateWahafl", wahaflInfo);
             txManager.commit(status);
         } catch (TransactionException ex) {
             txManager.rollback(status);
             LOGGER.error("updateWahafl");
         }            
     }
     
     
     //등록창고 창고정보삭제Flg 수정(wahama, wahafl)
     public void updatedDelWare(WahamaVO paramWm) {
     	
         DefaultTransactionDefinition def = new DefaultTransactionDefinition();
         def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
         TransactionStatus status = txManager.getTransaction(def);
         try {
                  sqlSession.update("updatedDelWahama", paramWm);
                  sqlSession.update("updatedDelWahafl", paramWm);
             txManager.commit(status);
         } catch (TransactionException ex) {
             txManager.rollback(status);
             LOGGER.error("updateWahafl");
         }            
     }
     
     
     //임차접수정보 리스트표시
     public List<?> selectMatchList(SearchVO param) {
         return sqlSession.selectList("selectMatchList", param);
     }     
     
     //시퀀스 WHCODE
     public Integer getSeqWhcode() {
         return sqlSession.selectOne("getSeqWhcode");
     }       
     
     //시퀀스 REQSEQ
     public Integer getSeqReqseq() {
         return sqlSession.selectOne("getSeqReqseq");
     }         
     
    
}
