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
    
    //창고리스트 조회
    public List<?> selectWareList(SearchVO param) {
        return sqlSession.selectList("selectWareList", param);
    }

    
    //창고리스트 조회
    public List<?> searchWareList(SearchVO param) {
        return sqlSession.selectList("selectWareListInfo", param);
    }
    
    //리스트에서 선택한 창고들만
    public List<?>  selectCheckWarehouse(String[] param) {
    	HashMap hm = new HashMap();
    	hm.put("list", param) ;
    	return sqlSession.selectList("selectCheckWarehouse", hm);
    }    
    
    //1창고 상세정보
    public WarehouseVO selectWareOne(String param) {
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
    

    
    
}
