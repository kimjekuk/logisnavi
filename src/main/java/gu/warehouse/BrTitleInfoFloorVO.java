package gu.warehouse;


public class BrTitleInfoFloorVO  {
	
private String 
	naUgrndCd                // 새주소지상지하코드
	, areaExctYn             // 면적제외여부
	, bldNm                  // 건물명
	, dongNm                 // 동명칭
	, flrGbCdNm              // 층구분코드명
	, flrNoNm                // 층번호명
	, strctCdNm              // 구조코드명
	, mainPurpsCdNm          // 주용도코드명
	, mainAtchGbCdNm         // 주부속구분코드명
	, naRoadCd               // 새주소도로코드
	, flrGbCd                // 층구분코드
	, block                  // 블록
	, lot                    // 로트
	, platPlc                // 대지위치
	, newPlatPlc             // 도로명대지위치
	, splotNm                // 특수지명
	, mgmBldrgstPk           // 관리건축물대장PK
	, bun                    // 번
	, ji                     // 지
	, sigunguCd              // 시군구코드
	, bjdongCd               // 법정동코드
	, naBjdongCd             // 새주소법정동코드
	, mainPurpsCd            // 주용도코드
	, etcStrct               // 기타구조
	, etcPurps               // 기타용도
	, crtnDay                // 생성일자
	, platGbCd               // 대지구분코드
	, strctCd                // 구조코드
	, mainAtchGbCd           // 주부속구분코드
	, registedflg         //   기존등록여부	
;
	private Double area            ;     // 면적(㎡)
	private Double flrNo             ;     // 층번호
	private Double naMainBun          ;     // 새주소본번
	private Double naSubBun         ;     // 새주소부번
	private Integer rnum                ;     // 순번
	public String getNaUgrndCd() {
		return naUgrndCd;
	}
	public void setNaUgrndCd(String naUgrndCd) {
		this.naUgrndCd = naUgrndCd;
	}
	public String getAreaExctYn() {
		return areaExctYn;
	}
	public void setAreaExctYn(String areaExctYn) {
		this.areaExctYn = areaExctYn;
	}
	public String getBldNm() {
		return bldNm;
	}
	public void setBldNm(String bldNm) {
		this.bldNm = bldNm;
	}
	public String getDongNm() {
		return dongNm;
	}
	public void setDongNm(String dongNm) {
		this.dongNm = dongNm;
	}
	public String getFlrGbCdNm() {
		return flrGbCdNm;
	}
	public void setFlrGbCdNm(String flrGbCdNm) {
		this.flrGbCdNm = flrGbCdNm;
	}
	public String getFlrNoNm() {
		return flrNoNm;
	}
	public void setFlrNoNm(String flrNoNm) {
		this.flrNoNm = flrNoNm;
	}
	public String getStrctCdNm() {
		return strctCdNm;
	}
	public void setStrctCdNm(String strctCdNm) {
		this.strctCdNm = strctCdNm;
	}
	public String getMainPurpsCdNm() {
		return mainPurpsCdNm;
	}
	public void setMainPurpsCdNm(String mainPurpsCdNm) {
		this.mainPurpsCdNm = mainPurpsCdNm;
	}
	public String getMainAtchGbCdNm() {
		return mainAtchGbCdNm;
	}
	public void setMainAtchGbCdNm(String mainAtchGbCdNm) {
		this.mainAtchGbCdNm = mainAtchGbCdNm;
	}
	public String getNaRoadCd() {
		return naRoadCd;
	}
	public void setNaRoadCd(String naRoadCd) {
		this.naRoadCd = naRoadCd;
	}
	public String getFlrGbCd() {
		return flrGbCd;
	}
	public void setFlrGbCd(String flrGbCd) {
		this.flrGbCd = flrGbCd;
	}
	public String getBlock() {
		return block;
	}
	public void setBlock(String block) {
		this.block = block;
	}
	public String getLot() {
		return lot;
	}
	public void setLot(String lot) {
		this.lot = lot;
	}
	public String getPlatPlc() {
		return platPlc;
	}
	public void setPlatPlc(String platPlc) {
		this.platPlc = platPlc;
	}
	public String getNewPlatPlc() {
		return newPlatPlc;
	}
	public void setNewPlatPlc(String newPlatPlc) {
		this.newPlatPlc = newPlatPlc;
	}
	public String getSplotNm() {
		return splotNm;
	}
	public void setSplotNm(String splotNm) {
		this.splotNm = splotNm;
	}
	public String getMgmBldrgstPk() {
		return mgmBldrgstPk;
	}
	public void setMgmBldrgstPk(String mgmBldrgstPk) {
		this.mgmBldrgstPk = mgmBldrgstPk;
	}
	public String getBun() {
		return bun;
	}
	public void setBun(String bun) {
		this.bun = bun;
	}
	public String getJi() {
		return ji;
	}
	public void setJi(String ji) {
		this.ji = ji;
	}
	public String getSigunguCd() {
		return sigunguCd;
	}
	public void setSigunguCd(String sigunguCd) {
		this.sigunguCd = sigunguCd;
	}
	public String getBjdongCd() {
		return bjdongCd;
	}
	public void setBjdongCd(String bjdongCd) {
		this.bjdongCd = bjdongCd;
	}
	public String getNaBjdongCd() {
		return naBjdongCd;
	}
	public void setNaBjdongCd(String naBjdongCd) {
		this.naBjdongCd = naBjdongCd;
	}
	public String getMainPurpsCd() {
		return mainPurpsCd;
	}
	public void setMainPurpsCd(String mainPurpsCd) {
		this.mainPurpsCd = mainPurpsCd;
	}
	public String getEtcStrct() {
		return etcStrct;
	}
	public void setEtcStrct(String etcStrct) {
		this.etcStrct = etcStrct;
	}
	public String getEtcPurps() {
		return etcPurps;
	}
	public void setEtcPurps(String etcPurps) {
		this.etcPurps = etcPurps;
	}
	public String getCrtnDay() {
		return crtnDay;
	}
	public void setCrtnDay(String crtnDay) {
		this.crtnDay = crtnDay;
	}
	public String getPlatGbCd() {
		return platGbCd;
	}
	public void setPlatGbCd(String platGbCd) {
		this.platGbCd = platGbCd;
	}
	public String getStrctCd() {
		return strctCd;
	}
	public void setStrctCd(String strctCd) {
		this.strctCd = strctCd;
	}
	public String getMainAtchGbCd() {
		return mainAtchGbCd;
	}
	public void setMainAtchGbCd(String mainAtchGbCd) {
		this.mainAtchGbCd = mainAtchGbCd;
	}
	public Double getArea() {
		return area;
	}
	public void setArea(Double area) {
		this.area = area;
	}
	public Double getFlrNo() {
		return flrNo;
	}
	public void setFlrNo(Double flrNo) {
		this.flrNo = flrNo;
	}
	public Double getNaMainBun() {
		return naMainBun;
	}
	public void setNaMainBun(Double naMainBun) {
		this.naMainBun = naMainBun;
	}
	public Double getNaSubBun() {
		return naSubBun;
	}
	public void setNaSubBun(Double naSubBun) {
		this.naSubBun = naSubBun;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	public String getRegistedflg() {
		return registedflg;
	}
	public void setRegistedflg(String registedflg) {
		this.registedflg = registedflg;
	}
	
	
	
}
 