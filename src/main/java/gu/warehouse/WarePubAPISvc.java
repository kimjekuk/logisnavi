package gu.warehouse;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import gu.common.SearchVO;



@Service
public class WarePubAPISvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
    @Autowired
    private DataSourceTransactionManager txManager;

    static final Logger LOGGER = LoggerFactory.getLogger(WarehouseSvc.class);
    
    //공공데이터 API : 1.표제부정보 
    public List<?> getBrTitleInfo(SearchVO param) throws SAXException, IOException, ParserConfigurationException {
    	
        String url = new String("http://apis.data.go.kr/1613000/BldRgstService_v2/getBrTitleInfo"); /*URL*/
        url = url + "?" + "serviceKey" + "=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D"; /*Service Key*/
        url = url + "&" + "sigunguCd" + "=" + param.getSearchExt1(); /*시군구코드*/
        url = url + "&" + "bjdongCd" + "=" + param.getSearchExt2(); /*행정표준코드*/
        url = url + "&" + "platGbCd" + "=" + "0"; /*0:대지 1:산 2:블록*/

        url = url + "&" + "bun" + "=" + padLeftZeros(param.getSearchExt3(), 4); /*번*/
        url = url + "&" + "ji" + "="  + padLeftZeros(param.getSearchExt4(), 4); /*지*/
        
//        url = url + "&" + "bun" + "=" + param.getSearchExt3(); /*번*/
//        url = url + "&" + "ji" + "="  + param.getSearchExt4(); /*지*/        
        url = url + "&" + "startDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "endDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "numOfRows" + "=" + "100"; /*페이지당 목록 수*/
        url = url + "&" + "pageNo" + "=" + "1"; /*페이지번호*/	
		
        System.out.println("표제부 정보 API Call : " + url);
		
		Document documentInfo =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		documentInfo.getDocumentElement().normalize();
		NodeList nList = documentInfo.getElementsByTagName("item");  /// <-- 여기 값확인
		
		List<BrTitleInfoVO> alist = new ArrayList<BrTitleInfoVO>();

		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				
				Element eElement = (Element) nNode;
				
				//주용도코드 창고시설(18000), 연면적 100평이상
				if("18000".equals(getTagValue("mainPurpsCd",eElement)) && (Double.valueOf(getTagValue("totArea",eElement)) > 330.58)) {
				
					BrTitleInfoVO titleInfo = new BrTitleInfoVO();
					
					titleInfo.setRnum(Integer.valueOf(getTagValue("rnum",eElement)));
					titleInfo.setPlatPlc(getTagValue("platPlc",eElement));
					titleInfo.setSigunguCd(getTagValue("sigunguCd",eElement));
					titleInfo.setBjdongCd(getTagValue("bjdongCd",eElement));
					titleInfo.setPlatGbCd(getTagValue("platGbCd",eElement));
					titleInfo.setBun(getTagValue("bun",eElement));
					titleInfo.setJi(getTagValue("ji",eElement));
					titleInfo.setMgmBldrgstPk(getTagValue("mgmBldrgstPk",eElement));
					titleInfo.setRegstrGbCd(getTagValue("regstrGbCd",eElement));
					titleInfo.setRegstrGbCdNm(getTagValue("regstrGbCdNm",eElement));
					titleInfo.setRegstrKindCd(getTagValue("regstrKindCd",eElement));
					titleInfo.setRegstrKindCdNm(getTagValue("regstrKindCdNm",eElement));
					titleInfo.setNewPlatPlc(getTagValue("newPlatPlc",eElement));
					titleInfo.setBldNm(getTagValue("bldNm",eElement));
					titleInfo.setSplotNm(getTagValue("splotNm",eElement));
					titleInfo.setBlock(getTagValue("block",eElement));
					titleInfo.setLot(getTagValue("lot",eElement));
					titleInfo.setBylotCnt(Integer.valueOf(getTagValue("bylotCnt",eElement)));
					titleInfo.setNaRoadCd(getTagValue("naRoadCd",eElement));
					titleInfo.setNaBjdongCd(getTagValue("naBjdongCd",eElement));
					titleInfo.setNaUgrndCd(getTagValue("naUgrndCd",eElement));
					titleInfo.setNaMainBun(Double.valueOf(getTagValue("naMainBun",eElement)));
					titleInfo.setNaSubBun(Double.valueOf(getTagValue("naSubBun",eElement)));
					titleInfo.setDongNm(getTagValue("dongNm",eElement));
					titleInfo.setMainAtchGbCd(getTagValue("mainAtchGbCd",eElement));
					titleInfo.setMainAtchGbCdNm(getTagValue("mainAtchGbCdNm",eElement));
					titleInfo.setPlatArea(Double.valueOf(getTagValue("platArea",eElement)));
					titleInfo.setArchArea(Double.valueOf(getTagValue("archArea",eElement)));
					titleInfo.setBcRat(Double.valueOf(getTagValue("bcRat",eElement)));
					titleInfo.setTotArea(Double.valueOf(getTagValue("totArea",eElement)));
					titleInfo.setVlRatEstmTotArea(Double.valueOf(getTagValue("vlRatEstmTotArea",eElement)));
					titleInfo.setVlRat(Double.valueOf(getTagValue("vlRat",eElement)));
					titleInfo.setStrctCd(getTagValue("strctCd",eElement));
					titleInfo.setStrctCdNm(getTagValue("strctCdNm",eElement));
					titleInfo.setEtcStrct(getTagValue("etcStrct",eElement));
					titleInfo.setMainPurpsCd(getTagValue("mainPurpsCd",eElement));
					titleInfo.setMainPurpsCdNm(getTagValue("mainPurpsCdNm",eElement));
					titleInfo.setEtcPurps(getTagValue("etcPurps",eElement));
					titleInfo.setRoofCd(getTagValue("roofCd",eElement));
					titleInfo.setRoofCdNm(getTagValue("roofCdNm",eElement));
					titleInfo.setEtcRoof(getTagValue("etcRoof",eElement));
					titleInfo.setHhldCnt(Integer.valueOf(getTagValue("hhldCnt",eElement)));
					titleInfo.setFmlyCnt(Integer.valueOf(getTagValue("fmlyCnt",eElement)));
					titleInfo.setHeit(Double.valueOf(getTagValue("heit",eElement)));
					titleInfo.setGrndFlrCnt(Integer.valueOf(getTagValue("grndFlrCnt",eElement)));
					titleInfo.setUgrndFlrCnt(Integer.valueOf(getTagValue("ugrndFlrCnt",eElement)));
					titleInfo.setRideUseElvtCnt(Integer.valueOf(getTagValue("rideUseElvtCnt",eElement)));
					titleInfo.setEmgenUseElvtCnt(Integer.valueOf(getTagValue("emgenUseElvtCnt",eElement)));
					titleInfo.setAtchBldCnt(Integer.valueOf(getTagValue("atchBldCnt",eElement)));
					titleInfo.setAtchBldArea(Double.valueOf(getTagValue("atchBldArea",eElement)));
					titleInfo.setTotDongTotArea(Double.valueOf(getTagValue("totDongTotArea",eElement)));
					titleInfo.setIndrMechUtcnt(Integer.valueOf(getTagValue("indrMechUtcnt",eElement)));
					titleInfo.setIndrMechArea(Double.valueOf(getTagValue("indrMechArea",eElement)));
					titleInfo.setOudrMechUtcnt(Integer.valueOf(getTagValue("oudrMechUtcnt",eElement)));
					titleInfo.setOudrMechArea(Double.valueOf(getTagValue("oudrMechArea",eElement)));
					titleInfo.setIndrAutoUtcnt(Integer.valueOf(getTagValue("indrAutoUtcnt",eElement)));
					titleInfo.setIndrAutoArea(Double.valueOf(getTagValue("indrAutoArea",eElement)));
					titleInfo.setOudrAutoUtcnt(Integer.valueOf(getTagValue("oudrAutoUtcnt",eElement)));
					titleInfo.setOudrAutoArea(Double.valueOf(getTagValue("oudrAutoArea",eElement)));
					titleInfo.setPmsDay(getTagValue("pmsDay",eElement));
					titleInfo.setStcnsDay(getTagValue("stcnsDay",eElement));
					titleInfo.setUseAprDay(getTagValue("useAprDay",eElement));
					titleInfo.setPmsnoYear(getTagValue("pmsnoYear",eElement));
					titleInfo.setPmsnoKikCd(getTagValue("pmsnoKikCd",eElement));
					titleInfo.setPmsnoKikCdNm(getTagValue("pmsnoKikCdNm",eElement));
					titleInfo.setPmsnoGbCd(getTagValue("pmsnoGbCd",eElement));
					titleInfo.setPmsnoGbCdNm(getTagValue("pmsnoGbCdNm",eElement));
					titleInfo.setHoCnt(Integer.valueOf(getTagValue("hoCnt",eElement)));
					titleInfo.setEngrGrade(getTagValue("engrGrade",eElement));
					titleInfo.setEngrRat(Double.valueOf(getTagValue("engrRat",eElement)));
					titleInfo.setEngrEpi(Integer.valueOf(getTagValue("engrEpi",eElement)));
					titleInfo.setGnBldGrade(getTagValue("gnBldGrade",eElement));
					titleInfo.setGnBldCert(Integer.valueOf(getTagValue("gnBldCert",eElement)));
					titleInfo.setItgBldGrade(getTagValue("itgBldGrade",eElement));
					titleInfo.setItgBldCert(Integer.valueOf(getTagValue("itgBldCert",eElement)));
					titleInfo.setCrtnDay(getTagValue("crtnDay",eElement));
					titleInfo.setRserthqkDsgnApplyYn(getTagValue("rserthqkDsgnApplyYn",eElement));
					titleInfo.setRserthqkAblty(getTagValue("rserthqkAblty",eElement));
					
					alist.add(titleInfo);
				}
				
			}
			//
			
		}    	
    	
        return alist;
    }

    //공공데이터 API : 2.인허가정보 
    public List<?> getApBasisOulnInfo(SearchVO param) throws SAXException, IOException, ParserConfigurationException {
    	
//    	http://apis.data.go.kr/1613000/ArchPmsService_v2
//    	http://apis.data.go.kr/1613000/BldRgstService_v2/getBrBasisOulnInfo?serviceKey=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D&sigunguCd=11680&bjdongCd=10300&platGbCd=0&bun=0012&ji=0000&numOfRows=10&pageNo=1    	
        String url = new String("http://apis.data.go.kr/1613000/ArchPmsService_v2/getApBasisOulnInfo"); /*URL*/
        url = url + "?" + "serviceKey" + "=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D"; /*Service Key*/
        url = url + "&" + "sigunguCd" + "=" + param.getSearchExt1(); /*시군구코드*/
        url = url + "&" + "bjdongCd" + "=" + param.getSearchExt2(); /*행정표준코드*/
        url = url + "&" + "platGbCd" + "=" + ""; /*0:대지 1:산 2:블록*/
        
        url = url + "&" + "bun" + "=" + padLeftZeros(param.getSearchExt3(), 4); /*번*/
        url = url + "&" + "ji" + "="  + padLeftZeros(param.getSearchExt4(), 4); /*지*/
        
        url = url + "&" + "startDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "endDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "numOfRows" + "=" + "100"; /*페이지당 목록 수*/
        url = url + "&" + "pageNo" + "=" + "1"; /*페이지번호*/
        
        System.out.println("인허가 정보 API Call : " + url);
		Document documentInfo =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		documentInfo.getDocumentElement().normalize();
		NodeList nList = documentInfo.getElementsByTagName("item");  /// <-- 여기 값확인
		
		List<ApBasisOulnInfoVO> alist = new ArrayList<ApBasisOulnInfoVO>();

		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				
				Element eElement = (Element) nNode;
				//주용도코드 창고시설(18000), 연면적 100평이상
				if("18000".equals(getTagValue("mainPurpsCd",eElement)) && (Double.valueOf(getTagValue("totArea",eElement)) > 330.58)) {
					ApBasisOulnInfoVO basisInfo = new ApBasisOulnInfoVO();
					
					
					basisInfo.setRnum(Integer.valueOf(getTagValue("rnum",eElement)));
					basisInfo.setPlatPlc(getTagValue("platPlc",eElement));
					basisInfo.setSigunguCd(getTagValue("sigunguCd",eElement));
					basisInfo.setBjdongCd(getTagValue("bjdongCd",eElement));
					basisInfo.setPlatGbCd(getTagValue("platGbCd",eElement));
					basisInfo.setBun(getTagValue("bun",eElement));
					basisInfo.setJi(getTagValue("ji",eElement));
					basisInfo.setMgmPmsrgstPk(getTagValue("mgmPmsrgstPk",eElement));
					basisInfo.setBldNm(getTagValue("bldNm",eElement));
					basisInfo.setSplotNm(getTagValue("splotNm",eElement));
					basisInfo.setBlock(getTagValue("block",eElement));
					basisInfo.setLot(getTagValue("lot",eElement));
					basisInfo.setJimokCdNm(getTagValue("jimokCdNm",eElement));
					basisInfo.setJiyukCdNm(getTagValue("jiyukCdNm",eElement));
					basisInfo.setJiguCdNm(getTagValue("jiguCdNm",eElement));
					basisInfo.setGuyukCdNm(getTagValue("guyukCdNm",eElement));
					basisInfo.setJimokCd(getTagValue("jimokCd",eElement));
					basisInfo.setJiyukCd(getTagValue("jiyukCd",eElement));
					basisInfo.setJiguCd(getTagValue("jiguCd",eElement));
					basisInfo.setGuyukCd(getTagValue("guyukCd",eElement));
					basisInfo.setArchGbCdNm(getTagValue("archGbCdNm",eElement));
					basisInfo.setArchGbCd(getTagValue("archGbCd",eElement));
					basisInfo.setPlatArea(Double.valueOf(getTagValue("platArea",eElement)));
					basisInfo.setArchArea(Double.valueOf(getTagValue("archArea",eElement)));
					basisInfo.setBcRat(Double.valueOf(getTagValue("bcRat",eElement)));
					basisInfo.setTotArea(Double.valueOf(getTagValue("totArea",eElement)));
					basisInfo.setVlRatEstmTotArea(Double.valueOf(getTagValue("vlRatEstmTotArea",eElement)));
					basisInfo.setVlRat(Double.valueOf(getTagValue("vlRat",eElement)));
					basisInfo.setMainBldCnt(Integer.valueOf(getTagValue("mainBldCnt",eElement)));
					basisInfo.setAtchBldDongCnt(Integer.valueOf(getTagValue("atchBldDongCnt",eElement)));
					basisInfo.setMainPurpsCd(getTagValue("mainPurpsCd",eElement));
					basisInfo.setMainPurpsCdNm(getTagValue("mainPurpsCdNm",eElement));
					basisInfo.setHhldCnt(Integer.valueOf(getTagValue("hhldCnt",eElement)));
					basisInfo.setHoCnt(Integer.valueOf(getTagValue("hoCnt",eElement)));
					basisInfo.setFmlyCnt(Integer.valueOf(getTagValue("fmlyCnt",eElement)));
					basisInfo.setTotPkngCnt(Integer.valueOf(getTagValue("totPkngCnt",eElement)));
					basisInfo.setStcnsSchedDay(getTagValue("stcnsSchedDay",eElement));
					basisInfo.setStcnsDelayDay(getTagValue("stcnsDelayDay",eElement));
					basisInfo.setRealStcnsDay(getTagValue("realStcnsDay",eElement));
					basisInfo.setArchPmsDay(getTagValue("archPmsDay",eElement));
					basisInfo.setUseAprDay(getTagValue("useAprDay",eElement));
					basisInfo.setCrtnDay(getTagValue("crtnDay",eElement));
					
					alist.add(basisInfo);
				}
				
			}
			//
			
		}    	
    	
        return alist;
    }
    
    
    //공공데이터 API : 3.표제부정보(층별)
    public List<?> getBrTitleFloorInfo(SearchVO param) throws SAXException, IOException, ParserConfigurationException {
    	
        String url = new String("http://apis.data.go.kr/1613000/BldRgstService_v2/getBrFlrOulnInfo"); /*URL*/
        url = url + "?" + "serviceKey" + "=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D"; /*Service Key*/
        url = url + "&" + "sigunguCd" + "=" + param.getSearchExt1(); /*시군구코드*/
        url = url + "&" + "bjdongCd" + "=" + param.getSearchExt2(); /*행정표준코드*/
        url = url + "&" + "platGbCd" + "=" + "0"; /*0:대지 1:산 2:블록*/

        url = url + "&" + "bun" + "=" + padLeftZeros(param.getSearchExt3(), 4); /*번*/
        url = url + "&" + "ji" + "="  + padLeftZeros(param.getSearchExt4(), 4); /*지*/
        
//        url = url + "&" + "bun" + "=" + param.getSearchExt3(); /*번*/
//        url = url + "&" + "ji" + "="  + param.getSearchExt4(); /*지*/        
        url = url + "&" + "startDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "endDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "numOfRows" + "=" + "100"; /*페이지당 목록 수*/
        url = url + "&" + "pageNo" + "=" + "1"; /*페이지번호*/	
		
        System.out.println("표제부(층별) 정보 API Call : " + url);
		
		Document documentInfo =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		documentInfo.getDocumentElement().normalize();
		NodeList nList = documentInfo.getElementsByTagName("item");  /// <-- 여기 값확인
		
		List<BrTitleInfoFloorVO> alist = new ArrayList<BrTitleInfoFloorVO>();

		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				
				Element eElement = (Element) nNode;
				
				//주용도코드 창고시설(18000), 연면적 100평이상 //  && (Double.valueOf(getTagValue("area",eElement)) > 330.58)
//				if("18000".equals(getTagValue("mainPurpsCd",eElement))) {
				
					BrTitleInfoFloorVO titleFloorInfo = new BrTitleInfoFloorVO();
					
					titleFloorInfo.setRnum(Integer.valueOf(getTagValue("rnum",eElement)));
					titleFloorInfo.setPlatPlc(getTagValue("platPlc",eElement));
					titleFloorInfo.setSigunguCd(getTagValue("sigunguCd",eElement));
					titleFloorInfo.setBjdongCd(getTagValue("bjdongCd",eElement));
					titleFloorInfo.setPlatGbCd(getTagValue("platGbCd",eElement));
					titleFloorInfo.setBun(getTagValue("bun",eElement));
					titleFloorInfo.setJi(getTagValue("ji",eElement));
					titleFloorInfo.setMgmBldrgstPk(getTagValue("mgmBldrgstPk",eElement));
					titleFloorInfo.setNewPlatPlc(getTagValue("newPlatPlc",eElement));
					titleFloorInfo.setBldNm(getTagValue("bldNm",eElement));
					titleFloorInfo.setSplotNm(getTagValue("splotNm",eElement));
					titleFloorInfo.setBlock(getTagValue("block",eElement));
					titleFloorInfo.setLot(getTagValue("lot",eElement));
					titleFloorInfo.setNaRoadCd(getTagValue("naRoadCd",eElement));
					titleFloorInfo.setNaBjdongCd(getTagValue("naBjdongCd",eElement));
					titleFloorInfo.setNaUgrndCd(getTagValue("naUgrndCd",eElement));
					titleFloorInfo.setNaMainBun(Double.valueOf(getTagValue("naMainBun",eElement)));
					titleFloorInfo.setNaSubBun(Double.valueOf(getTagValue("naSubBun",eElement)));
					titleFloorInfo.setDongNm(getTagValue("dongNm",eElement));
					titleFloorInfo.setFlrGbCd(getTagValue("flrGbCd",eElement));
					titleFloorInfo.setFlrGbCdNm(getTagValue("flrGbCdNm",eElement));
					titleFloorInfo.setFlrNo(Double.valueOf(getTagValue("flrNo",eElement)));
					titleFloorInfo.setFlrNoNm(getTagValue("flrNoNm",eElement));
					titleFloorInfo.setStrctCd(getTagValue("strctCd",eElement));
					titleFloorInfo.setStrctCdNm(getTagValue("strctCdNm",eElement));
					titleFloorInfo.setEtcStrct(getTagValue("etcStrct",eElement));
					titleFloorInfo.setMainPurpsCd(getTagValue("mainPurpsCd",eElement));
					titleFloorInfo.setMainPurpsCdNm(getTagValue("mainPurpsCdNm",eElement));
					titleFloorInfo.setEtcPurps(getTagValue("etcPurps",eElement));
					titleFloorInfo.setMainAtchGbCd(getTagValue("mainAtchGbCd",eElement));
					titleFloorInfo.setMainAtchGbCdNm(getTagValue("mainAtchGbCdNm",eElement));
					titleFloorInfo.setArea(Double.valueOf(getTagValue("area",eElement)));
					titleFloorInfo.setAreaExctYn(getTagValue("areaExctYn",eElement));
					titleFloorInfo.setCrtnDay(getTagValue("crtnDay",eElement));
					
					alist.add(titleFloorInfo);
//				}
				
			}
			//
			
		}    	
    	
        return alist;
    }
    
    //공공데이터 API : 4.인허가정보(층별)
    public List<?> getApBasisOulnFloorInfo(SearchVO param) throws SAXException, IOException, ParserConfigurationException {
    		
//    	http://apis.data.go.kr/1613000/ArchPmsService_v2
//    	http://apis.data.go.kr/1613000/BldRgstService_v2/getBrBasisOulnInfo?serviceKey=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D&sigunguCd=11680&bjdongCd=10300&platGbCd=0&bun=0012&ji=0000&numOfRows=10&pageNo=1    	
        String url = new String("http://apis.data.go.kr/1613000/ArchPmsService_v2/getApFlrOulnInfo"); /*URL*/
        url = url + "?" + "serviceKey" + "=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D"; /*Service Key*/
        url = url + "&" + "sigunguCd" + "=" + param.getSearchExt1(); /*시군구코드*/
        url = url + "&" + "bjdongCd" + "=" + param.getSearchExt2(); /*행정표준코드*/
        url = url + "&" + "platGbCd" + "=" + ""; /*0:대지 1:산 2:블록*/
        
        url = url + "&" + "bun" + "=" + padLeftZeros(param.getSearchExt3(), 4); /*번*/
        url = url + "&" + "ji" + "="  + padLeftZeros(param.getSearchExt4(), 4); /*지*/
        
        url = url + "&" + "startDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "endDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "numOfRows" + "=" + "100"; /*페이지당 목록 수*/
        url = url + "&" + "pageNo" + "=" + "1"; /*페이지번호*/
        
        System.out.println("인허가(층별)정보 API Call : " + url);
		Document documentInfo =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		documentInfo.getDocumentElement().normalize();
		NodeList nList = documentInfo.getElementsByTagName("item");  /// <-- 여기 값확인
		
		List<ApBasisOulnInfoFloorVO> alist = new ArrayList<ApBasisOulnInfoFloorVO>();

		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				
				Element eElement = (Element) nNode;
				//주용도코드 창고시설(18000), 연면적 100평이상 // && (Double.valueOf(getTagValue("flrArea",eElement)) > 330.58)
//				if("18000".equals(getTagValue("mainPurpsCd",eElement)) ) {
					ApBasisOulnInfoFloorVO basisFloorInfo = new ApBasisOulnInfoFloorVO();
					
					basisFloorInfo.setArchGbCd(getTagValue("archGbCd",eElement));
					basisFloorInfo.setCrtnDay(getTagValue("crtnDay",eElement));
					basisFloorInfo.setRnum(Integer.valueOf(getTagValue("rnum",eElement)));
					basisFloorInfo.setPlatPlc(getTagValue("platPlc",eElement));
					basisFloorInfo.setSigunguCd(getTagValue("sigunguCd",eElement));
					basisFloorInfo.setBjdongCd(getTagValue("bjdongCd",eElement));
					basisFloorInfo.setPlatGbCd(getTagValue("platGbCd",eElement));
					basisFloorInfo.setBun(getTagValue("bun",eElement));
					basisFloorInfo.setJi(getTagValue("ji",eElement));
					basisFloorInfo.setMgmFlrOulnPk(getTagValue("mgmFlrOulnPk",eElement));
					basisFloorInfo.setMgmDongOulnPk(getTagValue("mgmDongOulnPk",eElement));
					basisFloorInfo.setMgmPmsrgstPk(getTagValue("mgmPmsrgstPk",eElement));
					basisFloorInfo.setBldNm(getTagValue("bldNm",eElement));
					basisFloorInfo.setSplotNm(getTagValue("splotNm",eElement));
					basisFloorInfo.setBlock(getTagValue("block",eElement));
					basisFloorInfo.setLot(getTagValue("lot",eElement));
					basisFloorInfo.setStrctCd(getTagValue("strctCd",eElement));
					basisFloorInfo.setStrctCdNm(getTagValue("strctCdNm",eElement));
					basisFloorInfo.setMainPurpsCd(getTagValue("mainPurpsCd",eElement));
					basisFloorInfo.setMainPurpsCdNm(getTagValue("mainPurpsCdNm",eElement));
					basisFloorInfo.setFlrNo(Double.valueOf(getTagValue("flrNo",eElement)));
					basisFloorInfo.setFlrArea(Double.valueOf(getTagValue("flrArea",eElement)));
					basisFloorInfo.setFlrGbCd(getTagValue("flrGbCd",eElement));
					basisFloorInfo.setFlrGbCdNm(getTagValue("flrGbCdNm",eElement));
					basisFloorInfo.setArchGbCdNm(getTagValue("archGbCdNm",eElement));

					alist.add(basisFloorInfo);
//				}
				
			}
			//
			
		}    	
    	
        return alist;
    }
        

    //JSON 공공데이터 API : 표제부정보 100
    public JSONArray getJsonBrTitleInfo(SearchVO param) throws SAXException, IOException, ParserConfigurationException {
    	
        String url = new String("http://apis.data.go.kr/1613000/BldRgstService_v2/getBrTitleInfo"); /*URL*/
        url = url + "?" + "serviceKey" + "=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D"; /*Service Key*/
        url = url + "&" + "sigunguCd" + "=" + param.getSearchExt1(); /*시군구코드*/
        url = url + "&" + "bjdongCd" + "=" + param.getSearchExt2(); /*행정표준코드*/
        url = url + "&" + "platGbCd" + "=" + "0"; /*0:대지 1:산 2:블록*/

        url = url + "&" + "bun" + "=" + padLeftZeros(param.getSearchExt3(), 4); /*번*/
        url = url + "&" + "ji" + "="  + padLeftZeros(param.getSearchExt4(), 4); /*지*/
        
//        url = url + "&" + "bun" + "=" + param.getSearchExt3(); /*번*/
//        url = url + "&" + "ji" + "="  + param.getSearchExt4(); /*지*/        
        url = url + "&" + "startDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "endDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "numOfRows" + "=" + "100"; /*페이지당 목록 수*/
        url = url + "&" + "pageNo" + "=" + "1"; /*페이지번호*/	
		
        System.out.println("표제부 정보 API Call : " + url);
		
		Document documentInfo =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		documentInfo.getDocumentElement().normalize();
		NodeList nList = documentInfo.getElementsByTagName("item");  /// <-- 여기 값확인
		
//		List<BrTitleInfoVO> alist = new ArrayList<BrTitleInfoVO>();
		JSONArray jarray = new JSONArray();
		int seq = 0;
		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				
				Element eElement = (Element) nNode;
				
				//주용도코드 창고시설(18000), 연면적 100평이상
				if("18000".equals(getTagValue("mainPurpsCd",eElement)) && (Double.valueOf(getTagValue("totArea",eElement)) > 330.58)) {
			
//					BrTitleInfoVO titleInfo = new BrTitleInfoVO();
					JSONObject json = new JSONObject();
					seq = seq + 1;	
						json.put("seq" ,seq);
						json.put("rnum" ,(getTagValue("rnum",eElement)));
						json.put("platPlc" ,(getTagValue("platPlc",eElement)));
						json.put("sigunguCd" ,(getTagValue("sigunguCd",eElement)));
						json.put("bjdongCd" ,(getTagValue("bjdongCd",eElement)));
						json.put("platGbCd" ,(getTagValue("platGbCd",eElement)));
						json.put("bun" ,(getTagValue("bun",eElement)));
						json.put("ji" ,(getTagValue("ji",eElement)));
						json.put("mgmBldrgstPk" ,(getTagValue("mgmBldrgstPk",eElement)));
						json.put("regstrGbCd" ,(getTagValue("regstrGbCd",eElement)));
						json.put("regstrGbCdNm" ,(getTagValue("regstrGbCdNm",eElement)));
						json.put("regstrKindCd" ,(getTagValue("regstrKindCd",eElement)));
						json.put("regstrKindCdNm" ,(getTagValue("regstrKindCdNm",eElement)));
						json.put("newPlatPlc" ,(getTagValue("newPlatPlc",eElement)));
						json.put("bldNm" ,(getTagValue("bldNm",eElement)));
						json.put("splotNm" ,(getTagValue("splotNm",eElement)));
						json.put("block" ,(getTagValue("block",eElement)));
						json.put("lot" ,(getTagValue("lot",eElement)));
						json.put("bylotCnt" ,(getTagValue("bylotCnt",eElement)));
						json.put("naRoadCd" ,(getTagValue("naRoadCd",eElement)));
						json.put("naBjdongCd" ,(getTagValue("naBjdongCd",eElement)));
						json.put("naUgrndCd" ,(getTagValue("naUgrndCd",eElement)));
						json.put("naMainBun" ,(getTagValue("naMainBun",eElement)));
						json.put("naSubBun" ,(getTagValue("naSubBun",eElement)));
						json.put("dongNm" ,(getTagValue("dongNm",eElement)));
						json.put("mainAtchGbCd" ,(getTagValue("mainAtchGbCd",eElement)));
						json.put("mainAtchGbCdNm" ,(getTagValue("mainAtchGbCdNm",eElement)));
						json.put("platArea" ,(getTagValue("platArea",eElement)));
						json.put("archArea" ,(getTagValue("archArea",eElement)));
						json.put("bcRat" ,(getTagValue("bcRat",eElement)));
						json.put("totArea" ,(getTagValue("totArea",eElement)));
						json.put("vlRatEstmTotArea" ,(getTagValue("vlRatEstmTotArea",eElement)));
						json.put("vlRat" ,(getTagValue("vlRat",eElement)));
						json.put("strctCd" ,(getTagValue("strctCd",eElement)));
						json.put("strctCdNm" ,(getTagValue("strctCdNm",eElement)));
						json.put("etcStrct" ,(getTagValue("etcStrct",eElement)));
						json.put("mainPurpsCd" ,(getTagValue("mainPurpsCd",eElement)));
						json.put("mainPurpsCdNm" ,(getTagValue("mainPurpsCdNm",eElement)));
						json.put("etcPurps" ,(getTagValue("etcPurps",eElement)));
						json.put("roofCd" ,(getTagValue("roofCd",eElement)));
						json.put("roofCdNm" ,(getTagValue("roofCdNm",eElement)));
						json.put("etcRoof" ,(getTagValue("etcRoof",eElement)));
						json.put("hhldCnt" ,(getTagValue("hhldCnt",eElement)));
						json.put("fmlyCnt" ,(getTagValue("fmlyCnt",eElement)));
						json.put("heit" ,(getTagValue("heit",eElement)));
						json.put("grndFlrCnt" ,(getTagValue("grndFlrCnt",eElement)));
						json.put("ugrndFlrCnt" ,(getTagValue("ugrndFlrCnt",eElement)));
						json.put("rideUseElvtCnt" ,(getTagValue("rideUseElvtCnt",eElement)));
						json.put("emgenUseElvtCnt" ,(getTagValue("emgenUseElvtCnt",eElement)));
						json.put("atchBldCnt" ,(getTagValue("atchBldCnt",eElement)));
						json.put("atchBldArea" ,(getTagValue("atchBldArea",eElement)));
						json.put("totDongTotArea" ,(getTagValue("totDongTotArea",eElement)));
						json.put("indrMechUtcnt" ,(getTagValue("indrMechUtcnt",eElement)));
						json.put("indrMechArea" ,(getTagValue("indrMechArea",eElement)));
						json.put("oudrMechUtcnt" ,(getTagValue("oudrMechUtcnt",eElement)));
						json.put("oudrMechArea" ,(getTagValue("oudrMechArea",eElement)));
						json.put("indrAutoUtcnt" ,(getTagValue("indrAutoUtcnt",eElement)));
						json.put("indrAutoArea" ,(getTagValue("indrAutoArea",eElement)));
						json.put("oudrAutoUtcnt" ,(getTagValue("oudrAutoUtcnt",eElement)));
						json.put("oudrAutoArea" ,(getTagValue("oudrAutoArea",eElement)));
						json.put("pmsDay" ,(getTagValue("pmsDay",eElement)));
						json.put("stcnsDay" ,(getTagValue("stcnsDay",eElement)));
						json.put("useAprDay" ,(getTagValue("useAprDay",eElement)));
						json.put("pmsnoYear" ,(getTagValue("pmsnoYear",eElement)));
						json.put("pmsnoKikCd" ,(getTagValue("pmsnoKikCd",eElement)));
						json.put("pmsnoKikCdNm" ,(getTagValue("pmsnoKikCdNm",eElement)));
						json.put("pmsnoGbCd" ,(getTagValue("pmsnoGbCd",eElement)));
						json.put("pmsnoGbCdNm" ,(getTagValue("pmsnoGbCdNm",eElement)));
						json.put("hoCnt" ,(getTagValue("hoCnt",eElement)));
						json.put("engrGrade" ,(getTagValue("engrGrade",eElement)));
						json.put("engrRat" ,(getTagValue("engrRat",eElement)));
						json.put("engrEpi" ,(getTagValue("engrEpi",eElement)));
						json.put("gnBldGrade" ,(getTagValue("gnBldGrade",eElement)));
						json.put("gnBldCert" ,(getTagValue("gnBldCert",eElement)));
						json.put("itgBldGrade" ,(getTagValue("itgBldGrade",eElement)));
						json.put("itgBldCert" ,(getTagValue("itgBldCert",eElement)));
						json.put("crtnDay" ,(getTagValue("crtnDay",eElement)));
						json.put("rserthqkDsgnApplyYn" ,(getTagValue("rserthqkDsgnApplyYn",eElement)));
						json.put("rserthqkAblty" ,(getTagValue("rserthqkAblty",eElement)));
						
					jarray.add(json);
				}
				
			}
			//
			
		}    	
    	
        return jarray;
    }    
    
    

    //공공데이터 API : 200.인허가정보 JSON 
    public JSONArray getJsonApBasisOulnInfo(SearchVO param) throws SAXException, IOException, ParserConfigurationException {
    	
//    	http://apis.data.go.kr/1613000/ArchPmsService_v2
//    	http://apis.data.go.kr/1613000/BldRgstService_v2/getBrBasisOulnInfo?serviceKey=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D&sigunguCd=11680&bjdongCd=10300&platGbCd=0&bun=0012&ji=0000&numOfRows=10&pageNo=1    	
        String url = new String("http://apis.data.go.kr/1613000/ArchPmsService_v2/getApBasisOulnInfo"); /*URL*/
        url = url + "?" + "serviceKey" + "=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D"; /*Service Key*/
        url = url + "&" + "sigunguCd" + "=" + param.getSearchExt1(); /*시군구코드*/
        url = url + "&" + "bjdongCd" + "=" + param.getSearchExt2(); /*행정표준코드*/
        url = url + "&" + "platGbCd" + "=" + ""; /*0:대지 1:산 2:블록*/
        
        url = url + "&" + "bun" + "=" + padLeftZeros(param.getSearchExt3(), 4); /*번*/
        url = url + "&" + "ji" + "="  + padLeftZeros(param.getSearchExt4(), 4); /*지*/
        
        url = url + "&" + "startDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "endDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "numOfRows" + "=" + "100"; /*페이지당 목록 수*/
        url = url + "&" + "pageNo" + "=" + "1"; /*페이지번호*/
        
        System.out.println("인허가 정보 API Call : " + url);
		Document documentInfo =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		documentInfo.getDocumentElement().normalize();
		NodeList nList = documentInfo.getElementsByTagName("item");  /// <-- 여기 값확인
		
//		List<ApBasisOulnInfoVO> alist = new ArrayList<ApBasisOulnInfoVO>();
		JSONArray jarray = new JSONArray();
		int seq = 0;
		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				
				Element eElement = (Element) nNode;
				//주용도코드 창고시설(18000), 연면적 100평이상
				if("18000".equals(getTagValue("mainPurpsCd",eElement)) && (Double.valueOf(getTagValue("totArea",eElement)) > 330.58)) {
//					ApBasisOulnInfoVO basisInfo = new ApBasisOulnInfoVO();
					JSONObject json = new JSONObject();
					seq = seq + 1;	
					json.put("seq" ,seq);
					json.put("rnum" ,(getTagValue("rnum",eElement)));
					json.put("platPlc" ,(getTagValue("platPlc",eElement)));
					json.put("sigunguCd" ,(getTagValue("sigunguCd",eElement)));
					json.put("bjdongCd" ,(getTagValue("bjdongCd",eElement)));
					json.put("platGbCd" ,(getTagValue("platGbCd",eElement)));
					json.put("bun" ,(getTagValue("bun",eElement)));
					json.put("ji" ,(getTagValue("ji",eElement)));
					json.put("mgmPmsrgstPk" ,(getTagValue("mgmPmsrgstPk",eElement)));
					json.put("bldNm" ,(getTagValue("bldNm",eElement)));
					json.put("splotNm" ,(getTagValue("splotNm",eElement)));
					json.put("block" ,(getTagValue("block",eElement)));
					json.put("lot" ,(getTagValue("lot",eElement)));
					json.put("jimokCdNm" ,(getTagValue("jimokCdNm",eElement)));
					json.put("jiyukCdNm" ,(getTagValue("jiyukCdNm",eElement)));
					json.put("jiguCdNm" ,(getTagValue("jiguCdNm",eElement)));
					json.put("guyukCdNm" ,(getTagValue("guyukCdNm",eElement)));
					json.put("jimokCd" ,(getTagValue("jimokCd",eElement)));
					json.put("jiyukCd" ,(getTagValue("jiyukCd",eElement)));
					json.put("jiguCd" ,(getTagValue("jiguCd",eElement)));
					json.put("guyukCd" ,(getTagValue("guyukCd",eElement)));
					json.put("archGbCdNm" ,(getTagValue("archGbCdNm",eElement)));
					json.put("archGbCd" ,(getTagValue("archGbCd",eElement)));
					json.put("platArea" ,(getTagValue("platArea",eElement)));
					json.put("archArea" ,(getTagValue("archArea",eElement)));
					json.put("bcRat" ,(getTagValue("bcRat",eElement)));
					json.put("totArea" ,(getTagValue("totArea",eElement)));
					json.put("vlRatEstmTotArea" ,(getTagValue("vlRatEstmTotArea",eElement)));
					json.put("vlRat" ,(getTagValue("vlRat",eElement)));
					json.put("mainBldCnt" ,(getTagValue("mainBldCnt",eElement)));
					json.put("atchBldDongCnt" ,(getTagValue("atchBldDongCnt",eElement)));
					json.put("mainPurpsCd" ,(getTagValue("mainPurpsCd",eElement)));
					json.put("mainPurpsCdNm" ,(getTagValue("mainPurpsCdNm",eElement)));
					json.put("hhldCnt" ,(getTagValue("hhldCnt",eElement)));
					json.put("hoCnt" ,(getTagValue("hoCnt",eElement)));
					json.put("fmlyCnt" ,(getTagValue("fmlyCnt",eElement)));
					json.put("totPkngCnt" ,(getTagValue("totPkngCnt",eElement)));
					json.put("stcnsSchedDay" ,(getTagValue("stcnsSchedDay",eElement)));
					json.put("stcnsDelayDay" ,(getTagValue("stcnsDelayDay",eElement)));
					json.put("realStcnsDay" ,(getTagValue("realStcnsDay",eElement)));
					json.put("archPmsDay" ,(getTagValue("archPmsDay",eElement)));
					json.put("useAprDay" ,(getTagValue("useAprDay",eElement)));
					json.put("crtnDay" ,(getTagValue("crtnDay",eElement)));

					
					jarray.add(json);
				}
				
			}
			//
			
		}    	
    	
        return jarray;
    }   
    
    //공공데이터 API : 3.표제부정보(층별) Json 300
    public JSONArray getJsonBrTitleFloorInfo(SearchVO param) throws SAXException, IOException, ParserConfigurationException {
    	
        String url = new String("http://apis.data.go.kr/1613000/BldRgstService_v2/getBrFlrOulnInfo"); /*URL*/
        url = url + "?" + "serviceKey" + "=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D"; /*Service Key*/
        url = url + "&" + "sigunguCd" + "=" + param.getSearchExt1(); /*시군구코드*/
        url = url + "&" + "bjdongCd" + "=" + param.getSearchExt2(); /*행정표준코드*/
        url = url + "&" + "platGbCd" + "=" + "0"; /*0:대지 1:산 2:블록*/

        url = url + "&" + "bun" + "=" + padLeftZeros(param.getSearchExt3(), 4); /*번*/
        url = url + "&" + "ji" + "="  + padLeftZeros(param.getSearchExt4(), 4); /*지*/
        
//        url = url + "&" + "bun" + "=" + param.getSearchExt3(); /*번*/
//        url = url + "&" + "ji" + "="  + param.getSearchExt4(); /*지*/        
        url = url + "&" + "startDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "endDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "numOfRows" + "=" + "100"; /*페이지당 목록 수*/
        url = url + "&" + "pageNo" + "=" + "1"; /*페이지번호*/	
		
        System.out.println("표제부(층별) 정보 API Call : " + url);
		
		Document documentInfo =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		documentInfo.getDocumentElement().normalize();
		NodeList nList = documentInfo.getElementsByTagName("item");  /// <-- 여기 값확인
		
//		List<BrTitleInfoFloorVO> alist = new ArrayList<BrTitleInfoFloorVO>();
		JSONArray jarray = new JSONArray();
		int seq = 0;
		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				
				Element eElement = (Element) nNode;
				
				//주용도코드 창고시설(18000), 연면적 100평이상 //  && (Double.valueOf(getTagValue("area",eElement)) > 330.58)
//				if("18000".equals(getTagValue("mainPurpsCd",eElement))) {
				
//					BrTitleInfoFloorVO titleFloorInfo = new BrTitleInfoFloorVO();
				JSONObject json = new JSONObject();
				seq = seq + 1;	
				json.put("seq" ,seq);					
				json.put("rnum" ,(getTagValue("rnum",eElement)));
				json.put("platPlc" ,(getTagValue("platPlc",eElement)));
				json.put("sigunguCd" ,(getTagValue("sigunguCd",eElement)));
				json.put("bjdongCd" ,(getTagValue("bjdongCd",eElement)));
				json.put("platGbCd" ,(getTagValue("platGbCd",eElement)));
				json.put("bun" ,(getTagValue("bun",eElement)));
				json.put("ji" ,(getTagValue("ji",eElement)));
				json.put("mgmBldrgstPk" ,(getTagValue("mgmBldrgstPk",eElement)));
				json.put("newPlatPlc" ,(getTagValue("newPlatPlc",eElement)));
				json.put("bldNm" ,(getTagValue("bldNm",eElement)));
				json.put("splotNm" ,(getTagValue("splotNm",eElement)));
				json.put("block" ,(getTagValue("block",eElement)));
				json.put("lot" ,(getTagValue("lot",eElement)));
				json.put("naRoadCd" ,(getTagValue("naRoadCd",eElement)));
				json.put("naBjdongCd" ,(getTagValue("naBjdongCd",eElement)));
				json.put("naUgrndCd" ,(getTagValue("naUgrndCd",eElement)));
				json.put("naMainBun" ,(getTagValue("naMainBun",eElement)));
				json.put("naSubBun" ,(getTagValue("naSubBun",eElement)));
				json.put("dongNm" ,(getTagValue("dongNm",eElement)));
				json.put("flrGbCd" ,(getTagValue("flrGbCd",eElement)));
				json.put("flrGbCdNm" ,(getTagValue("flrGbCdNm",eElement)));
				json.put("flrNo" ,(getTagValue("flrNo",eElement)));
				json.put("flrNoNm" ,(getTagValue("flrNoNm",eElement)));
				json.put("strctCd" ,(getTagValue("strctCd",eElement)));
				json.put("strctCdNm" ,(getTagValue("strctCdNm",eElement)));
				json.put("etcStrct" ,(getTagValue("etcStrct",eElement)));
				json.put("mainPurpsCd" ,(getTagValue("mainPurpsCd",eElement)));
				json.put("mainPurpsCdNm" ,(getTagValue("mainPurpsCdNm",eElement)));
				json.put("etcPurps" ,(getTagValue("etcPurps",eElement)));
				json.put("mainAtchGbCd" ,(getTagValue("mainAtchGbCd",eElement)));
				json.put("mainAtchGbCdNm" ,(getTagValue("mainAtchGbCdNm",eElement)));
				json.put("area" ,(getTagValue("area",eElement)));
				json.put("areaExctYn" ,(getTagValue("areaExctYn",eElement)));
				json.put("crtnDay" ,(getTagValue("crtnDay",eElement)));

					
				jarray.add(json);
//				}
				
			}
			//
			
		}    	
    	
        return jarray;

    }
    
    
    //공공데이터 API : 4.인허가정보(층별) Json 400
    public JSONArray getJsonApBasisOulnFloorInfo(SearchVO param) throws SAXException, IOException, ParserConfigurationException {
    		
//    	http://apis.data.go.kr/1613000/ArchPmsService_v2
//    	http://apis.data.go.kr/1613000/BldRgstService_v2/getBrBasisOulnInfo?serviceKey=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D&sigunguCd=11680&bjdongCd=10300&platGbCd=0&bun=0012&ji=0000&numOfRows=10&pageNo=1    	
        String url = new String("http://apis.data.go.kr/1613000/ArchPmsService_v2/getApFlrOulnInfo"); /*URL*/
        url = url + "?" + "serviceKey" + "=8POR7XUyNBJh8XncaWsxHFI72KheCrs%2FpVQ%2FbYOHvwG9Qn5Ek6E7qqXXSJz%2FvBTqFz9M0uVZnpRxf4Exe2GTwg%3D%3D"; /*Service Key*/
        url = url + "&" + "sigunguCd" + "=" + param.getSearchExt1(); /*시군구코드*/
        url = url + "&" + "bjdongCd" + "=" + param.getSearchExt2(); /*행정표준코드*/
        url = url + "&" + "platGbCd" + "=" + ""; /*0:대지 1:산 2:블록*/
        
        url = url + "&" + "bun" + "=" + padLeftZeros(param.getSearchExt3(), 4); /*번*/
        url = url + "&" + "ji" + "="  + padLeftZeros(param.getSearchExt4(), 4); /*지*/
        
        url = url + "&" + "startDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "endDate" + "=" + ""; /*YYYYMMDD*/
        url = url + "&" + "numOfRows" + "=" + "100"; /*페이지당 목록 수*/
        url = url + "&" + "pageNo" + "=" + "1"; /*페이지번호*/
        
        System.out.println("인허가(층별)정보 API Call : " + url);
		Document documentInfo =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(url);
		documentInfo.getDocumentElement().normalize();
		NodeList nList = documentInfo.getElementsByTagName("item");  /// <-- 여기 값확인
		
//		List<ApBasisOulnInfoFloorVO> alist = new ArrayList<ApBasisOulnInfoFloorVO>();
		JSONArray jarray = new JSONArray();
		int seq = 0;
		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE) {
				
				Element eElement = (Element) nNode;
				//주용도코드 창고시설(18000), 연면적 100평이상 // && (Double.valueOf(getTagValue("flrArea",eElement)) > 330.58)
//				if("18000".equals(getTagValue("mainPurpsCd",eElement)) ) {
//					ApBasisOulnInfoFloorVO basisFloorInfo = new ApBasisOulnInfoFloorVO();
				JSONObject json = new JSONObject();
				
				seq = seq + 1;	
				json.put("seq" ,seq);					
					json.put("archGbCd" ,(getTagValue("archGbCd",eElement)));
					json.put("crtnDay" ,(getTagValue("crtnDay",eElement)));
					json.put("rnum" ,(getTagValue("rnum",eElement)));
					json.put("platPlc" ,(getTagValue("platPlc",eElement)));
					json.put("sigunguCd" ,(getTagValue("sigunguCd",eElement)));
					json.put("bjdongCd" ,(getTagValue("bjdongCd",eElement)));
					json.put("platGbCd" ,(getTagValue("platGbCd",eElement)));
					json.put("bun" ,(getTagValue("bun",eElement)));
					json.put("ji" ,(getTagValue("ji",eElement)));
					json.put("mgmFlrOulnPk" ,(getTagValue("mgmFlrOulnPk",eElement)));
					json.put("mgmDongOulnPk" ,(getTagValue("mgmDongOulnPk",eElement)));
					json.put("mgmPmsrgstPk" ,(getTagValue("mgmPmsrgstPk",eElement)));
					json.put("bldNm" ,(getTagValue("bldNm",eElement)));
					json.put("splotNm" ,(getTagValue("splotNm",eElement)));
					json.put("block" ,(getTagValue("block",eElement)));
					json.put("lot" ,(getTagValue("lot",eElement)));
					json.put("strctCd" ,(getTagValue("strctCd",eElement)));
					json.put("strctCdNm" ,(getTagValue("strctCdNm",eElement)));
					json.put("mainPurpsCd" ,(getTagValue("mainPurpsCd",eElement)));
					json.put("mainPurpsCdNm" ,(getTagValue("mainPurpsCdNm",eElement)));
					json.put("flrNo" ,(getTagValue("flrNo",eElement)));
					json.put("flrArea" ,(getTagValue("flrArea",eElement)));
					json.put("flrGbCd" ,(getTagValue("flrGbCd",eElement)));
					json.put("flrGbCdNm" ,(getTagValue("flrGbCdNm",eElement)));
					json.put("archGbCdNm" ,(getTagValue("archGbCdNm",eElement)));

					jarray.add(json);
//				}
				
			}
			//
			
		}    	
    	
        return jarray;
    }    
    
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if(nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}
	
	
	private static  String padLeftZeros(String inputString, int length) {
	    if (inputString.length() >= length) {
	        return inputString;
	    }
	    StringBuilder sb = new StringBuilder();
	    while (sb.length() < length - inputString.length()) {
	        sb.append('0');
	    }
	    sb.append(inputString);

	    return sb.toString();
	}	
}
