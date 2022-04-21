package gu.warehouse;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.json.simple.JSONArray;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import gu.common.FileUtil;
import gu.common.FileVO;
import gu.common.ParamVO;
import gu.common.SearchVO;
import gu.common.UtilEtc;


@Controller
public class WarehouseCtr {

	@Autowired
	private WarehouseSvc warehouseSvc;
	@Autowired
	private WarePubAPISvc wareApiSvc;

	static final Logger LOGGER = LoggerFactory.getLogger(WarehouseCtr.class);

	/**
	 * 창고 조회(리스트) MAIN SEARCH
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/search")
	public String searchPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		System.out.println("************************************search*********************************");
		if ("".equals(searchVO.getSearchKeyword())) {
			return "main/search";
		}

		List<?> listview = warehouseSvc.searchWareList(searchVO);
		modelMap.addAttribute("searchVO", searchVO);
		modelMap.addAttribute("listview", listview);

		return "main/search";
	}
	
	

	/**
	 * 창고상세화면 (detail)
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/detail")
	public String detailPage(HttpServletRequest request, WahamaVO wareInfo, WahaflVO wahafl, ModelMap modelMap) {

		System.out.println("************************************detail*********************************");

		String whcode = request.getParameter("whcode").toString();

		wareInfo = warehouseSvc.selectWareOne(whcode);
		modelMap.addAttribute("warehouseVO", wareInfo);

		List<?> listview = warehouseSvc.selectWareFloor(whcode);
		modelMap.addAttribute("listview", listview);

		return "main/detail";
	}
	

	/**
	 * 창고 인허가정보 조회(리스트) --- 인허가 MAIN SEARCH
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/searchBasis")
	public String searchBasisPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		String area = searchVO.getSearchExt4();
		String useAprDay = searchVO.getSearchExt5();

		System.out.println("************************************searchBasis*********************************");

		if ("".equals(searchVO.getSearchExt1()))
			return "main/searchBasis";
		List<?> listview = warehouseSvc.selectBasisList(searchVO);

		modelMap.addAttribute("radio_area", area);
		modelMap.addAttribute("radio_useAprDay", useAprDay);
		modelMap.addAttribute("searchVO", searchVO);
		modelMap.addAttribute("basisList", listview);

		return "main/searchBasis";
	}
	
	

	// --------------------------------------------------------------------------------------------//
	/**
	 * 창고 건축물대장 조회(리스트) --- 표제부 MAIN SEARCH
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/searchBrtitle")
	public String searchBrtitlePage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		System.out.println("************************************searchBrtitle*********************************");
		if ("".equals(searchVO.getSearchExt1()))
			return "main/searchBrtitle";
		List<?> listview = warehouseSvc.selectBrtitleList(searchVO);

		modelMap.addAttribute("searchVO", searchVO);
		modelMap.addAttribute("brTitleList", listview);

		return "main/searchBrtitle";
	}
	
	

	/**
	 * 창고 인허가정보 층별조회(리스트) --- 인허가 층별
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/searchBasisFloor")
	public void searchBasisFloorPage(HttpServletRequest request, HttpServletResponse response) {

		String strBrpk = request.getParameter("brpk");
		System.out.println("************************************searchBasisFloor*********************************");
		String[] params = { strBrpk };

		List<?> listview = warehouseSvc.selectBasisFloorList(params);
		UtilEtc.responseJsonValue(response, listview);
	}
	
	

	/**
	 * 창고 건축물대장 층별조회(리스트) --- 표제부층별
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/searchBrtitleFloor")
	public void searchBrtitleFloorPage(HttpServletRequest request, HttpServletResponse response) {

		String strBrpk = request.getParameter("brpk");
		System.out.println(
				"************************************searchBrtitleFloor*********************************" + strBrpk);

		String[] params = { strBrpk };

		List<?> listview = warehouseSvc.selectBrtitleFloorList(params);
		UtilEtc.responseJsonValue(response, listview);
	}
	
	

	/**
	 * 임차의뢰 관리페이지(등록페이지 표시)
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/reqlmForm")
	public String reqlmFormPage(HttpServletRequest request, ModelMap modelMap) {

		System.out.println("************************************reqlmForm*********************************"
				+ request.getParameter("reqseq"));

		ReqLmInfo reqlmInfo = new ReqLmInfo();
		UpfileVO upfileInfo = new UpfileVO();

		String strReqseq = request.getParameter("reqseq");

		if (strReqseq != null && !strReqseq.equals("")) {
			reqlmInfo = warehouseSvc.selectReqlmOne(strReqseq);
		}

		modelMap.addAttribute("reqlmInfo", reqlmInfo);
		modelMap.addAttribute("upfileInfo", upfileInfo);

		return "main/reqlmForm";
	}
	
	

	/**
	 * 임차의뢰 관리페이지(등록)
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/reqlmSave")
	public String reqlmSave(HttpServletRequest request, ReqLmInfo reqlmInfo) {

		if (reqlmInfo.getReqseq() != null) {
			// 수정모드
			warehouseSvc.updateReqlmInfo(reqlmInfo);

		} else {
			// 등록모드
			Integer iReqseq;
			iReqseq = warehouseSvc.getSeqReqseq();
			reqlmInfo.setReqseq(iReqseq);

			warehouseSvc.insertReqlmInfo(reqlmInfo);
		}
		return "redirect:reqlmlist";
	}
	
	

	/**
	 * 임차의뢰 관리페이지(리스트)
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/reqlmlist")
	public String reqlmlistPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		System.out.println("************************************reqlmlist*********************************");

		List<?> listview = warehouseSvc.selectReqlmList(searchVO);

		modelMap.addAttribute("searchVO", searchVO);
		modelMap.addAttribute("reqlmList", listview);

		return "main/reqlmlist";
	}
	
	

	/**
	 * 물류창고현황(통계정보)
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/wareSatistics")
	public String wareSatisticsPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		System.out.println("************************************wareSatistics*********************************");

		return "main/wareSatistics";
	}
	
	

	/**
	 * 창고정보등록페이지
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/ctrWareForm")
	public String ctrWareFormPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		String strFromPage = request.getParameter("fromP");
		System.out.println(
				"************************************ctrWareForm*********************************" + strFromPage);

		WahamaVO wareInfo = null;
		List<?> listview = null;

		String strWhcode = request.getParameter("whcode");
		String strBrpk = request.getParameter("brpk");
		modelMap.addAttribute("brpk", strBrpk);

		if (strWhcode != null && !strWhcode.equals("")) {
			wareInfo = warehouseSvc.selectWahamaOne(strWhcode);
			listview = warehouseSvc.selectWahaflList(strWhcode);
			System.out.println("************ctrWareForm(등록데이터 기반)************");

		} else {

			if (strFromPage.equals("basis")) {
				wareInfo = warehouseSvc.selectWahamaBaOne(strBrpk);
				listview = warehouseSvc.selectWahaflBaList(strBrpk);
				System.out.println("************ctrWareForm(인허가 기반)************");
			} else if (strFromPage.equals("brtitle")) {
				wareInfo = warehouseSvc.selectWahamaBrOne(strBrpk);
				listview = warehouseSvc.selectWahaflBrList(strBrpk);
				System.out.println("************ctrWareForm(표제부 기반)************");
			} else {
				System.out.println("************참조없음************");
			}
		}

		modelMap.addAttribute("wahama", wareInfo);
		modelMap.addAttribute("wahaflVOList", listview);

		UpfileVO upfileInfo = new UpfileVO();
		modelMap.addAttribute("upfileInfo", upfileInfo);

		return "main/ctrWareForm";
	}
	
	

	/**
	 * 창고정보등록 실행
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/ctrWareSave")
	@ResponseBody
	public String ctrWareFormSave(HttpServletRequest request, WahamaVO wahaVO, WahaflVO wahaflVO, ModelMap modelMap,
			@RequestBody String jsonWmFl) throws ParseException {

		System.out.println("************************************ctrWareSave*********************************");
		System.out.println(String.valueOf(jsonWmFl));

		String StrMode;
		Integer iWhcode;

		// 전체 파싱 정보가 저장된 jsonAdd의 json을 자체 String을 생성하여 옮겨 담음
		String jsonStr = jsonWmFl;
		JSONParser jsonParser = new JSONParser();
		JSONObject wahamaObj = (JSONObject) jsonParser.parse(jsonStr);
		JSONObject wmObj = (JSONObject) wahamaObj.get("wahamaJVO");

		WahamaVO wahamaVo = new WahamaVO();
		String StrWhcode = (String) wmObj.get("whcode");

		System.out.println("StrWhcode  : ---------------------------------" + StrWhcode + "---");
		if ("0".equals(StrWhcode) || "".equals(StrWhcode)) {
			iWhcode = warehouseSvc.getSeqWhcode();
			StrMode = "Insert";
		} else {
			iWhcode = Integer.parseInt((String) wmObj.get("whcode"));
			StrMode = "Update";
		}
		System.out.println("warehouseSvc.getSeqWhcode() : " + StrMode + ": " + iWhcode);

		wahamaVo.setWhcode(iWhcode);
		wahamaVo.setWhname((String) wmObj.get("whname"));
		wahamaVo.setMpadrs((String) wmObj.get("mpadrs"));
		if ("".equals((String) wmObj.get("szposi"))) {
			wahamaVo.setSzposi(0);
		} else {
			wahamaVo.setSzposi(Double.parseDouble((String) wmObj.get("szposi")));
		}
		if ("".equals((String) wmObj.get("szstrt"))) {
			wahamaVo.setSzstrt(0);
		} else {
			wahamaVo.setSzstrt(Double.parseDouble((String) wmObj.get("szstrt")));
		}
		if ("".equals((String) wmObj.get("szarea"))) {
			wahamaVo.setSzarea(0);
		} else {
			wahamaVo.setSzarea(Double.parseDouble((String) wmObj.get("szarea")));
		}
		if ("".equals((String) wmObj.get("sbcret"))) {
			wahamaVo.setSbcret(0);
		} else {
			wahamaVo.setSbcret(Double.parseDouble((String) wmObj.get("sbcret")));
		}
		if ("".equals((String) wmObj.get("svlret"))) {
			wahamaVo.setSvlret(0);
		} else {
			wahamaVo.setSvlret(Double.parseDouble((String) wmObj.get("svlret")));
		}
		if ("".equals((String) wmObj.get("sbcvlt"))) {
			wahamaVo.setSbcvlt(0);
		} else {
			wahamaVo.setSbcvlt(Double.parseDouble((String) wmObj.get("sbcvlt")));
		}
		wahamaVo.setPrusdy((String) wmObj.get("prusdy"));
		wahamaVo.setIfstrt((String) wmObj.get("ifstrt"));
		wahamaVo.setCofine((String) wmObj.get("cofine"));
		wahamaVo.setCooper((String) wmObj.get("cooper"));
		wahamaVo.setMpicif((String) wmObj.get("mpicif"));
		wahamaVo.setEtcstr((String) wmObj.get("etcstr"));
		wahamaVo.setPrprdy((String) wmObj.get("prprdy"));
		wahamaVo.setPrstdy((String) wmObj.get("prstdy"));
		wahamaVo.setBrcode((String) wmObj.get("brcode"));
		wahamaVo.setBacode((String) wmObj.get("bacode"));
		wahamaVo.setImg001((String) wmObj.get("img001"));
		wahamaVo.setImg002((String) wmObj.get("img002"));
		wahamaVo.setStflnu(Integer.parseInt((String) wmObj.get("stflnu")));
		wahamaVo.setStblnu(Integer.parseInt((String) wmObj.get("stblnu")));
		if ("".equals((String) wmObj.get("stflnu"))) {
			wahamaVo.setStflnu(0);
		} else {
			wahamaVo.setStflnu(Integer.parseInt((String) wmObj.get("stflnu")));
		}
		if ("".equals((String) wmObj.get("stblnu"))) {
			wahamaVo.setStblnu(0);
		} else {
			wahamaVo.setStblnu(Integer.parseInt((String) wmObj.get("stblnu")));
		}
		wahamaVo.setKkompx((String) wmObj.get("kkompx"));
		wahamaVo.setKkompy((String) wmObj.get("kkompy"));

		if ("".equals((String) wmObj.get("lmpsif"))) {
			wahamaVo.setLmpsif(0);
		} else {
			wahamaVo.setLmpsif(Integer.parseInt((String) wmObj.get("lmpsif")));
		}
		if ("".equals((String) wmObj.get("lmpsit"))) {
			wahamaVo.setLmpsit(0);
		} else {
			wahamaVo.setLmpsit(Integer.parseInt((String) wmObj.get("lmpsit")));
		}

		wahamaVo.setLmppay((String) wmObj.get("lmppay"));
		wahamaVo.setLmpinc((String) wmObj.get("lmpinc"));
		wahamaVo.setLmpdps((String) wmObj.get("lmpdps"));
		wahamaVo.setLmpwhc((String) wmObj.get("lmpwhc"));
		wahamaVo.setLmpdcc((String) wmObj.get("lmpdcc"));
		wahamaVo.setLmpofc((String) wmObj.get("lmpofc"));
		wahamaVo.setLmppbc((String) wmObj.get("lmppbc"));
		wahamaVo.setLmpwtc((String) wmObj.get("lmpwtc"));
		wahamaVo.setLmpupp((String) wmObj.get("lmpupp"));

		wahamaVo.setLmprtf((String) wmObj.get("lmprtf"));
		wahamaVo.setLmpadd((String) wmObj.get("lmpadd"));

		wahamaVo.setCdvown((String) wmObj.get("cdvown"));
		wahamaVo.setCdvsih((String) wmObj.get("cdvsih"));
		wahamaVo.setCdvsig((String) wmObj.get("cdvsig"));
		wahamaVo.setCdvgam((String) wmObj.get("cdvgam"));
		wahamaVo.setCdvsul((String) wmObj.get("cdvsul"));
		wahamaVo.setLmvown((String) wmObj.get("lmvown"));
		wahamaVo.setLmvamc((String) wmObj.get("lmvamc"));
		wahamaVo.setLmvcom((String) wmObj.get("lmvcom"));
		wahamaVo.setLmvetc((String) wmObj.get("lmvetc"));
		wahamaVo.setCatnam((String) wmObj.get("catnam"));
		wahamaVo.setCatpos((String) wmObj.get("catpos"));
		wahamaVo.setCattel((String) wmObj.get("cattel"));
		wahamaVo.setCathpg((String) wmObj.get("cathpg"));
		wahamaVo.setCateml((String) wmObj.get("cateml"));
		wahamaVo.setCatcad((String) wmObj.get("catcad"));

		wahamaVo.setMpsggc((String) wmObj.get("mpsggc"));
		wahamaVo.setMpdngc((String) wmObj.get("mpdngc"));
		wahamaVo.setMpabun((String) wmObj.get("mpabun"));
		wahamaVo.setMpadji((String) wmObj.get("mpadji"));

		System.out.println("-------------------------------" + (String) wmObj.get("lmprtf"));
		System.out.println("-------------------------------" + (String) wmObj.get("lmpadd"));
		wahamaVo.setIfsize("지상 : " + wahamaVo.getStflnu() + "층 ~ 지하 : " + wahamaVo.getStblnu() + "층");

		// 기본정보 등록
		if (StrMode == "Insert") {
			warehouseSvc.insertWahamaInfo(wahamaVo);
		} else {
			warehouseSvc.updateWahamaInfo(wahamaVo);
			////////////////////////////////////////////////////////////////
		}

		JSONArray arrWf = (JSONArray) wahamaObj.get("wahaflJVO");
		for (int i = 0; i < arrWf.size(); i++) {
			JSONObject wahawfObj = (JSONObject) arrWf.get(i); // 인덱스 번호로 접근해서 가져온다.
			WahaflVO wahaflVo = new WahaflVO();

			if ("".equals((String) wahawfObj.get("whfseq"))) {
				wahaflVo.setWhfseq(0);
			} else {
				wahaflVo.setWhfseq(Integer.parseInt((String) wahawfObj.get("whfseq")));
			}
			wahaflVo.setWhfudn((String) wahawfObj.get("whfudn"));
			if ("".equals((String) wahawfObj.get("whflcd"))) {
				wahaflVo.setWhflcd(0);
			} else {
				wahaflVo.setWhflcd(Integer.parseInt((String) wahawfObj.get("whflcd")));
			}
			wahaflVo.setWhfuse((String) wahawfObj.get("whfuse"));
			wahaflVo.setWhtemp((String) wahawfObj.get("whtemp"));
			if ("".equals((String) wahawfObj.get("flarea"))) {
				wahaflVo.setFlarea(0);
			} else {
				wahaflVo.setFlarea(Double.parseDouble((String) wahawfObj.get("flarea")));
			}
			wahaflVo.setFllmyn((String) wahawfObj.get("fllmyn"));
			if ("".equals((String) wahawfObj.get("fllmsz"))) {
				wahaflVo.setFllmsz(0);
			} else {
				wahaflVo.setFllmsz(Double.parseDouble((String) wahawfObj.get("fllmsz")));
			}
			if ("".equals((String) wahawfObj.get("flszwa"))) {
				wahaflVo.setFlszwa(0);
			} else {
				wahaflVo.setFlszwa(Double.parseDouble((String) wahawfObj.get("flszwa")));
			}
			if ("".equals((String) wahawfObj.get("flszof"))) {
				wahaflVo.setFlszof(0);
			} else {
				wahaflVo.setFlszof(Double.parseDouble((String) wahawfObj.get("flszof")));
			}
			if ("".equals((String) wahawfObj.get("flszdo"))) {
				wahaflVo.setFlszdo(0);
			} else {
				wahaflVo.setFlszdo(Double.parseDouble((String) wahawfObj.get("flszdo")));
			}
			if ("".equals((String) wahawfObj.get("flszmz"))) {
				wahaflVo.setFlszmz(0);
			} else {
				wahaflVo.setFlszmz(Double.parseDouble((String) wahawfObj.get("flszmz")));
			}
			if ("".equals((String) wahawfObj.get("flslwa"))) {
				wahaflVo.setFlslwa(0);
			} else {
				wahaflVo.setFlslwa(Double.parseDouble((String) wahawfObj.get("flslwa")));
			}
			if ("".equals((String) wahawfObj.get("flslof"))) {
				wahaflVo.setFlslof(0);
			} else {
				wahaflVo.setFlslof(Double.parseDouble((String) wahawfObj.get("flslof")));
			}
			if ("".equals((String) wahawfObj.get("flsldo"))) {
				wahaflVo.setFlsldo(0);
			} else {
				wahaflVo.setFlsldo(Double.parseDouble((String) wahawfObj.get("flsldo")));
			}
			if ("".equals((String) wahawfObj.get("flslmz"))) {
				wahaflVo.setFlslmz(0);
			} else {
				wahaflVo.setFlslmz(Double.parseDouble((String) wahawfObj.get("flslmz")));
			}

			if ("".equals((String) wahawfObj.get("flsewa"))) {
				wahaflVo.setFlsewa(0);
			} else {
				wahaflVo.setFlsewa(Double.parseDouble((String) wahawfObj.get("flsewa")));
			}
			if ("".equals((String) wahawfObj.get("flsedo"))) {
				wahaflVo.setFlsedo(0);
			} else {
				wahaflVo.setFlsedo(Double.parseDouble((String) wahawfObj.get("flsedo")));
			}
			if ("".equals((String) wahawfObj.get("flseof"))) {
				wahaflVo.setFlseof(0);
			} else {
				wahaflVo.setFlseof(Double.parseDouble((String) wahawfObj.get("flseof")));
			}
			if ("".equals((String) wahawfObj.get("flsemz"))) {
				wahaflVo.setFlsemz(0);
			} else {
				wahaflVo.setFlsemz(Double.parseDouble((String) wahawfObj.get("flsemz")));
			}
			if ("".equals((String) wahawfObj.get("flsesz"))) {
				wahaflVo.setFlsesz(0);
			} else {
				wahaflVo.setFlsesz(Double.parseDouble((String) wahawfObj.get("flsesz")));
			}

			wahaflVo.setPricyn((String) wahawfObj.get("pricyn"));

			if ("".equals((String) wahawfObj.get("flmpay"))) {
				wahaflVo.setFlmpay(0);
			} else {
				wahaflVo.setFlmpay(Integer.parseInt((String) wahawfObj.get("flmpay")));
			}
			if ("".equals((String) wahawfObj.get("admpay"))) {
				wahaflVo.setAdmpay(0);
			} else {
				wahaflVo.setAdmpay(Integer.parseInt((String) wahawfObj.get("admpay")));
			}
			if ("".equals((String) wahawfObj.get("pprice"))) {
				wahaflVo.setPprice(0);
			} else {
				wahaflVo.setPprice(Integer.parseInt((String) wahawfObj.get("pprice")));
			}

			wahaflVo.setLsfnow((String) wahawfObj.get("lsfnow"));
			wahaflVo.setLsfrom((String) wahawfObj.get("lsfrom"));
			wahaflVo.setLstmto((String) wahawfObj.get("lstmto"));

			if ("".equals((String) wahawfObj.get("flhegt"))) {
				wahaflVo.setFlhegt(0);
			} else {
				wahaflVo.setFlhegt(Double.parseDouble((String) wahawfObj.get("flhegt")));
			}
			if ("".equals((String) wahawfObj.get("docknu"))) {
				wahaflVo.setDocknu(0);
			} else {
				wahaflVo.setDocknu(Integer.parseInt((String) wahawfObj.get("docknu")));
			}
			if ("".equals((String) wahawfObj.get("flweit"))) {
				wahaflVo.setFlweit(0);
			} else {
				wahaflVo.setFlweit(Double.parseDouble((String) wahawfObj.get("flweit")));
			}

			wahaflVo.setLsusr1((String) wahawfObj.get("lsusr1"));
			wahaflVo.setLsusr2((String) wahawfObj.get("lsusr2"));
			wahaflVo.setLsusr3((String) wahawfObj.get("lsusr3"));
			wahaflVo.setStatus((String) wahawfObj.get("status"));

			wahaflVo.setTrdock((String) wahawfObj.get("trdock"));
			wahaflVo.setBapkcd(wahamaVo.getBacode());
			wahaflVo.setBrpkcd(wahamaVo.getBrcode());

			// ---- 부가 추가 ----
			wahaflVo.setWhcode(iWhcode);
			wahaflVo.setWhflnm(wahaflVo.getWhfudn() + wahaflVo.getWhflcd());

			if (StrMode == "Insert") {
				// 층별정보 등록
				warehouseSvc.insertWahaflInfo(wahaflVo);
			} else {
				warehouseSvc.updateWahaflInfo(wahaflVo);
			}

		}


		return iWhcode.toString();

	}
	
	
	/**
	 * 등록창고삭제 (delflg = Y)로 함 : wahama, wahafl
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/delWareForm")
	public String delWareForm(HttpServletRequest request, WahamaVO paramWm) {

		System.out.println("************************************delWareForm*********************************");

		String whcode = request.getParameter("whcode").toString();
		String delflg = request.getParameter("delflg").toString();

		Integer iWhcode = Integer.parseInt(whcode);

		paramWm.setWhcode(iWhcode);
		paramWm.setDelflg(delflg);
		
		// 수정모드
		warehouseSvc.updatedDelWare(paramWm);
			
		return "redirect:search";
	}
	
	
	/**
	 * 이미지업로드
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/upFileImg01")
	public void upFileImg01(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			UpfileVO upfileInfo) {

		System.out.println(" ************************ serverlet upFileImg01 *********************************");

		FileUtil fs = new FileUtil();
		FileVO fileInfo = fs.saveFile(upfileInfo.getFile001());
		String strImg001 = "";
		if (fileInfo != null) {

			System.out.println(" ******" + fileInfo.getRealname());
			strImg001 = "images/" + fileInfo.getRealname();
		}

		System.out.println(strImg001);
		JSONObject json = new JSONObject();
		json.put("strImg001", strImg001);

		UtilEtc.responseJsonValue(response, json);
	}
	
	

	/**
	 * 이미지업로드
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/upFileImg02")
	public void upFileImg02(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			UpfileVO upfileInfo) {

		System.out.println(" ************************ serverlet upFileImg02 *********************************");

		FileUtil fs = new FileUtil();
		FileVO fileInfo = fs.saveFile(upfileInfo.getFile002());
		String strImg002 = "";
		if (fileInfo != null) {

			System.out.println(" ******" + fileInfo.getRealname());
			strImg002 = "images/" + fileInfo.getRealname();
		}

		System.out.println(strImg002);
		JSONObject json = new JSONObject();
		json.put("strImg002", strImg002);

		UtilEtc.responseJsonValue(response, json);
	}
	
	

	/**
	 * 임차의뢰 관리페이지(리스트)
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/matchList")
	public String matchListPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		System.out.println("************************************matchlist*********************************");

		List<?> listview = warehouseSvc.selectMatchList(searchVO);

		modelMap.addAttribute("searchVO", searchVO);
		modelMap.addAttribute("matchList", listview);
		

		return "main/matchList";
	}
	
	

	/**
	 * 창고 조회(맵) Map Search
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/searchMap")
	public String searchMapPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		System.out.println("************************************searchMap*********************************");
		if ("".equals(searchVO.getSearchKeyword())) {
			return "main/searchMap";
		}

		List<?> listview = warehouseSvc.searchWareMapList(searchVO);
		modelMap.addAttribute("searchVO", searchVO);
		modelMap.addAttribute("listview", listview);

		return "main/searchMap";
	}
	
	

	/**
	 * 창고 조회(맵)-대외용 Map Search
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/searchMapExt")
	public String searchMapExtPage(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {

		System.out.println("************************************searchMapExt*********************************");

		if ("".equals(searchVO.getSearchKeyword())) {
			return "main/searchMapExt";
		}

		List<?> listview = warehouseSvc.searchWareMapList(searchVO);
		modelMap.addAttribute("searchVO", searchVO);
		modelMap.addAttribute("listview", listview);

		return "main/searchMapExt";
	}
	
	

	/**
	 * test
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/test")
	public String testPage(HttpServletRequest request) {

		return "main/test";
	}
	

	/**
	 * excelUploadAjax
	 */
	@RequestMapping(value = "/excelUploadAjax")
	public void excelUploadAjax(MultipartFile upFile, MultipartHttpServletRequest request) throws Exception {

		System.out.println("************************************excelUploadAjax*********************************");
		MultipartFile excelFile = request.getFile("excelFile");
		System.out.println("엑셀 파일 업로드 컨트롤러");
		if (excelFile == null || excelFile.isEmpty()) {
			throw new RuntimeException("엑셀파일을 선택 해 주세요.");
		}

		File destFile = new File("C:\\upload\\" + excelFile.getOriginalFilename());

		try {
			excelFile.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		// Service 단에서 가져온 코드
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("A", "B", "C", "D", "E", "F");
		excelReadOption.setStartRow(2);

		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);

		warehouseSvc.insertXLS(excelContent);

	}
		
	
	
	/**
	 * 제안 관리페이지(제안 편집페이지 표시)
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/suggestForm")
	public String suggestFormPage(HttpServletRequest request, ModelMap modelMap) {

		System.out.println("************************************suggestForm*********************************");
		
		String strReqseq = request.getParameter("paramReqseq");
//		String suggestWhs = request.getParameter("suggestWhs");
		String[] arrWhs = request.getParameterValues("suggestWhs");		
		
		ParamVO param = new ParamVO();
		param.setStrParam1(strReqseq);
//		param.setArrStr1(arrWhs);
		
		System.out.println("************************************" + strReqseq + "*********************************");
//		System.out.println("************************************" + suggestWhs + "*********************************");
//		System.out.println("************************************" +  Arrays.toString(test1) + "*********************************");
		System.out.println("***********************************1111111111*" + Arrays.toString(arrWhs) + "*********************************");
		
		ReqLmInfo reqlmInfo = new ReqLmInfo();
		UpfileVO upfileInfo = new UpfileVO();


		if (strReqseq != null && !strReqseq.equals("")) {
			reqlmInfo = warehouseSvc.selectReqlmOne(strReqseq);
		}

		modelMap.addAttribute("reqlmInfo", reqlmInfo);
		modelMap.addAttribute("upfileInfo", upfileInfo);

		return "main/suggestForm";
	}
		
	

	/**
	 * viewMapPoligon
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/viewMapPoligon")
	public String viewMapPoligon(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
		System.out.println("************************************viewMapPoligon*********************************");
		return "main/viewMapPoligon";
	}
	
	

	/**
	 * testQgis
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/testQgis")
	public String testQgis(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
		System.out.println("************************************testQgis*********************************");
		return "main/testQgis";
	}
	
	

	/**
	 * echart
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/echart")
	public String echart(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
		System.out.println("************************************echart*********************************");
		return "main/echart";
	}
	
	
	/**
	 * 창고 조회(선택리스트 > 맵으로)
	 * 
	 * @throws IOException
	 */
//	@RequestMapping(value = "/viewCheckedMap")
//	public String viewCheckedMap(HttpServletRequest request, String[] checkRow, ModelMap modelMap) {
//
//		System.out.println("serverlet viewCheckedMap ------------------------------------------");
//
//		List<?> listview = warehouseSvc.selectCheckWarehouse(checkRow);
//		modelMap.addAttribute("listview", listview);
//		return "warehouse/viewCheckedMap";
//	}	
	

}
