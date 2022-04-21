package gu.warehouse;


public class BrTitleInfoVO  {
	
private String 
	  rserthqkDsgnApplyYn //   내진 설계 적용 여부
	, rserthqkAblty       //   내진 능력
	, regstrGbCd          //   대장구분코드
	, regstrKindCd        //   대장종류코드
	, naUgrndCd           //   새주소지상지하코드
	, regstrGbCdNm        //   대장구분코드명
	, regstrKindCdNm      //   대장종류코드명
	, bldNm               //   건물명
	, dongNm              //   동명칭
	, mainAtchGbCdNm      //   주부속구분코드명
	, strctCdNm           //   구조코드명
	, mainPurpsCdNm       //   주용도코드명
	, roofCdNm            //   지붕코드명
	, pmsnoKikCdNm        //   허가번호기관코드명
	, pmsnoGbCdNm         //   허가번호구분코드명
	, naRoadCd            //   새주소도로코드
	, roofCd              //   지붕코드
	, block               //   블록
	, lot                 //   로트
	, platPlc             //   대지위치
	, newPlatPlc          //   도로명대지위치
	, splotNm             //   특수지명
	, mgmBldrgstPk        //   관리건축물대장PK
	, bun                 //   번
	, ji                  //   지
	, pmsnoYear           //   허가번호년
	, pmsnoGbCd           //   허가번호구분코드
	, engrGrade           //   에너지효율등급
	, sigunguCd           //   시군구코드
	, bjdongCd            //   법정동코드
	, naBjdongCd          //   새주소법정동코드
	, mainPurpsCd         //   주용도코드
	, etcStrct            //   기타구조
	, etcPurps            //   기타용도
	, etcRoof             //   기타지붕
	, pmsDay              //   허가일
	, stcnsDay            //   착공일
	, useAprDay           //   사용승인일
	, crtnDay             //   생성일자
	, platGbCd            //   대지구분코드
	, mainAtchGbCd        //   주부속구분코드
	, strctCd             //   구조코드
	, gnBldGrade          //   친환경건축물등급
	, itgBldGrade         //   지능형건축물등급
	, pmsnoKikCd          //   허가번호기관코드
	, archGbCd          
	, registedflg         //   기존등록여부
	
	;


	private Double platArea            ;     // 대지면적(㎡)
	private Double archArea            ;     // 건축면적(㎡)
	private Double bcRat               ;     // 건폐율(%)
	private Double totArea             ;     // 연면적(㎡)
	private Double vlRatEstmTotArea    ;     // 용적률산정연면적(㎡)
	private Double vlRat               ;     // 용적률(%)
	private Double heit                ;     // 높이(m)
	private Double atchBldArea         ;     // 부속건축물면적(㎡)
	private Double totDongTotArea      ;     // 총동연면적(㎡)
	private Double indrMechArea        ;     // 옥내기계식면적(㎡)
	private Double oudrMechArea        ;     // 옥외기계식면적(㎡)
	private Double indrAutoArea        ;     // 옥내자주식면적(㎡)
	private Double oudrAutoArea        ;     // 옥외자주식면적(㎡)
	private Double engrRat             ;     // 에너지절감율
	private Integer bylotCnt            ;     // 외필지수
	private Double naMainBun           ;     // 새주소본번
	private Double naSubBun            ;     // 새주소부번
	private Integer hhldCnt             ;     // 세대수(세대)
	private Integer fmlyCnt             ;     // 가구수(가구)
	private Integer grndFlrCnt          ;     // 지상층수
	private Integer ugrndFlrCnt         ;     // 지하층수
	private Integer rideUseElvtCnt      ;     // 승용승강기수
	private Integer emgenUseElvtCnt     ;     // 비상용승강기수
	private Integer atchBldCnt          ;     // 부속건축물수
	private Integer hoCnt               ;     // 호수(호)
	private Integer engrEpi             ;     // EPI점수
	private Integer gnBldCert           ;     // 친환경건축물인증점수
	private Integer itgBldCert          ;     // 지능형건축물인증점수
	private Integer indrMechUtcnt       ;     // 옥내기계식대수(대)
	private Integer oudrMechUtcnt       ;     // 옥외기계식대수(대)
	private Integer indrAutoUtcnt       ;     // 옥내자주식대수(대)
	private Integer oudrAutoUtcnt       ;     // 옥외자주식대수(대)
	private Integer rnum                ;     // 순번
	public String getRserthqkDsgnApplyYn() {
		return rserthqkDsgnApplyYn;
	}
	public void setRserthqkDsgnApplyYn(String rserthqkDsgnApplyYn) {
		this.rserthqkDsgnApplyYn = rserthqkDsgnApplyYn;
	}
	public String getRserthqkAblty() {
		return rserthqkAblty;
	}
	public void setRserthqkAblty(String rserthqkAblty) {
		this.rserthqkAblty = rserthqkAblty;
	}
	public String getRegstrGbCd() {
		return regstrGbCd;
	}
	public void setRegstrGbCd(String regstrGbCd) {
		this.regstrGbCd = regstrGbCd;
	}
	public String getRegstrKindCd() {
		return regstrKindCd;
	}
	public void setRegstrKindCd(String regstrKindCd) {
		this.regstrKindCd = regstrKindCd;
	}
	public String getNaUgrndCd() {
		return naUgrndCd;
	}
	public void setNaUgrndCd(String naUgrndCd) {
		this.naUgrndCd = naUgrndCd;
	}
	public String getRegstrGbCdNm() {
		return regstrGbCdNm;
	}
	public void setRegstrGbCdNm(String regstrGbCdNm) {
		this.regstrGbCdNm = regstrGbCdNm;
	}
	public String getRegstrKindCdNm() {
		return regstrKindCdNm;
	}
	public void setRegstrKindCdNm(String regstrKindCdNm) {
		this.regstrKindCdNm = regstrKindCdNm;
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
	public String getMainAtchGbCdNm() {
		return mainAtchGbCdNm;
	}
	public void setMainAtchGbCdNm(String mainAtchGbCdNm) {
		this.mainAtchGbCdNm = mainAtchGbCdNm;
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
	public String getRoofCdNm() {
		return roofCdNm;
	}
	public void setRoofCdNm(String roofCdNm) {
		this.roofCdNm = roofCdNm;
	}
	public String getPmsnoKikCdNm() {
		return pmsnoKikCdNm;
	}
	public void setPmsnoKikCdNm(String pmsnoKikCdNm) {
		this.pmsnoKikCdNm = pmsnoKikCdNm;
	}
	public String getPmsnoGbCdNm() {
		return pmsnoGbCdNm;
	}
	public void setPmsnoGbCdNm(String pmsnoGbCdNm) {
		this.pmsnoGbCdNm = pmsnoGbCdNm;
	}
	public String getNaRoadCd() {
		return naRoadCd;
	}
	public void setNaRoadCd(String naRoadCd) {
		this.naRoadCd = naRoadCd;
	}
	public String getRoofCd() {
		return roofCd;
	}
	public void setRoofCd(String roofCd) {
		this.roofCd = roofCd;
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
	public String getPmsnoYear() {
		return pmsnoYear;
	}
	public void setPmsnoYear(String pmsnoYear) {
		this.pmsnoYear = pmsnoYear;
	}
	public String getPmsnoGbCd() {
		return pmsnoGbCd;
	}
	public void setPmsnoGbCd(String pmsnoGbCd) {
		this.pmsnoGbCd = pmsnoGbCd;
	}
	public String getEngrGrade() {
		return engrGrade;
	}
	public void setEngrGrade(String engrGrade) {
		this.engrGrade = engrGrade;
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
	public String getEtcRoof() {
		return etcRoof;
	}
	public void setEtcRoof(String etcRoof) {
		this.etcRoof = etcRoof;
	}
	public String getPmsDay() {
		return pmsDay;
	}
	public void setPmsDay(String pmsDay) {
		this.pmsDay = pmsDay;
	}
	public String getStcnsDay() {
		return stcnsDay;
	}
	public void setStcnsDay(String stcnsDay) {
		this.stcnsDay = stcnsDay;
	}
	public String getUseAprDay() {
		return useAprDay;
	}
	public void setUseAprDay(String useAprDay) {
		this.useAprDay = useAprDay;
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
	public String getMainAtchGbCd() {
		return mainAtchGbCd;
	}
	public void setMainAtchGbCd(String mainAtchGbCd) {
		this.mainAtchGbCd = mainAtchGbCd;
	}
	public String getStrctCd() {
		return strctCd;
	}
	public void setStrctCd(String strctCd) {
		this.strctCd = strctCd;
	}
	public String getGnBldGrade() {
		return gnBldGrade;
	}
	public void setGnBldGrade(String gnBldGrade) {
		this.gnBldGrade = gnBldGrade;
	}
	public String getItgBldGrade() {
		return itgBldGrade;
	}
	public void setItgBldGrade(String itgBldGrade) {
		this.itgBldGrade = itgBldGrade;
	}
	public String getPmsnoKikCd() {
		return pmsnoKikCd;
	}
	public void setPmsnoKikCd(String pmsnoKikCd) {
		this.pmsnoKikCd = pmsnoKikCd;
	}
	public Double getPlatArea() {
		return platArea;
	}
	public void setPlatArea(Double platArea) {
		this.platArea = platArea;
	}
	public Double getArchArea() {
		return archArea;
	}
	public void setArchArea(Double archArea) {
		this.archArea = archArea;
	}
	public Double getBcRat() {
		return bcRat;
	}
	public void setBcRat(Double bcRat) {
		this.bcRat = bcRat;
	}
	public Double getTotArea() {
		return totArea;
	}
	public void setTotArea(Double totArea) {
		this.totArea = totArea;
	}
	public Double getVlRatEstmTotArea() {
		return vlRatEstmTotArea;
	}
	public void setVlRatEstmTotArea(Double vlRatEstmTotArea) {
		this.vlRatEstmTotArea = vlRatEstmTotArea;
	}
	public Double getVlRat() {
		return vlRat;
	}
	public void setVlRat(Double vlRat) {
		this.vlRat = vlRat;
	}
	public Double getHeit() {
		return heit;
	}
	public void setHeit(Double heit) {
		this.heit = heit;
	}
	public Double getAtchBldArea() {
		return atchBldArea;
	}
	public void setAtchBldArea(Double atchBldArea) {
		this.atchBldArea = atchBldArea;
	}
	public Double getTotDongTotArea() {
		return totDongTotArea;
	}
	public void setTotDongTotArea(Double totDongTotArea) {
		this.totDongTotArea = totDongTotArea;
	}
	public Double getIndrMechArea() {
		return indrMechArea;
	}
	public void setIndrMechArea(Double indrMechArea) {
		this.indrMechArea = indrMechArea;
	}
	public Double getOudrMechArea() {
		return oudrMechArea;
	}
	public void setOudrMechArea(Double oudrMechArea) {
		this.oudrMechArea = oudrMechArea;
	}
	public Double getIndrAutoArea() {
		return indrAutoArea;
	}
	public void setIndrAutoArea(Double indrAutoArea) {
		this.indrAutoArea = indrAutoArea;
	}
	public Double getOudrAutoArea() {
		return oudrAutoArea;
	}
	public void setOudrAutoArea(Double oudrAutoArea) {
		this.oudrAutoArea = oudrAutoArea;
	}
	public Double getEngrRat() {
		return engrRat;
	}
	public void setEngrRat(Double engrRat) {
		this.engrRat = engrRat;
	}
	public Integer getBylotCnt() {
		return bylotCnt;
	}
	public void setBylotCnt(Integer bylotCnt) {
		this.bylotCnt = bylotCnt;
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
	public Integer getHhldCnt() {
		return hhldCnt;
	}
	public void setHhldCnt(Integer hhldCnt) {
		this.hhldCnt = hhldCnt;
	}
	public Integer getFmlyCnt() {
		return fmlyCnt;
	}
	public void setFmlyCnt(Integer fmlyCnt) {
		this.fmlyCnt = fmlyCnt;
	}
	public Integer getGrndFlrCnt() {
		return grndFlrCnt;
	}
	public void setGrndFlrCnt(Integer grndFlrCnt) {
		this.grndFlrCnt = grndFlrCnt;
	}
	public Integer getUgrndFlrCnt() {
		return ugrndFlrCnt;
	}
	public void setUgrndFlrCnt(Integer ugrndFlrCnt) {
		this.ugrndFlrCnt = ugrndFlrCnt;
	}
	public Integer getRideUseElvtCnt() {
		return rideUseElvtCnt;
	}
	public void setRideUseElvtCnt(Integer rideUseElvtCnt) {
		this.rideUseElvtCnt = rideUseElvtCnt;
	}
	public Integer getEmgenUseElvtCnt() {
		return emgenUseElvtCnt;
	}
	public void setEmgenUseElvtCnt(Integer emgenUseElvtCnt) {
		this.emgenUseElvtCnt = emgenUseElvtCnt;
	}
	public Integer getAtchBldCnt() {
		return atchBldCnt;
	}
	public void setAtchBldCnt(Integer atchBldCnt) {
		this.atchBldCnt = atchBldCnt;
	}
	public Integer getHoCnt() {
		return hoCnt;
	}
	public void setHoCnt(Integer hoCnt) {
		this.hoCnt = hoCnt;
	}
	public Integer getEngrEpi() {
		return engrEpi;
	}
	public void setEngrEpi(Integer engrEpi) {
		this.engrEpi = engrEpi;
	}
	public Integer getGnBldCert() {
		return gnBldCert;
	}
	public void setGnBldCert(Integer gnBldCert) {
		this.gnBldCert = gnBldCert;
	}
	public Integer getItgBldCert() {
		return itgBldCert;
	}
	public void setItgBldCert(Integer itgBldCert) {
		this.itgBldCert = itgBldCert;
	}
	public Integer getIndrMechUtcnt() {
		return indrMechUtcnt;
	}
	public void setIndrMechUtcnt(Integer indrMechUtcnt) {
		this.indrMechUtcnt = indrMechUtcnt;
	}
	public Integer getOudrMechUtcnt() {
		return oudrMechUtcnt;
	}
	public void setOudrMechUtcnt(Integer oudrMechUtcnt) {
		this.oudrMechUtcnt = oudrMechUtcnt;
	}
	public Integer getIndrAutoUtcnt() {
		return indrAutoUtcnt;
	}
	public void setIndrAutoUtcnt(Integer indrAutoUtcnt) {
		this.indrAutoUtcnt = indrAutoUtcnt;
	}
	public Integer getOudrAutoUtcnt() {
		return oudrAutoUtcnt;
	}
	public void setOudrAutoUtcnt(Integer oudrAutoUtcnt) {
		this.oudrAutoUtcnt = oudrAutoUtcnt;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	public String getArchGbCd() {
		return archGbCd;
	}
	public void setArchGbCd(String archGbCd) {
		this.archGbCd = archGbCd;
	}
	public String getRegistedflg() {
		return registedflg;
	}
	public void setRegistedflg(String registedflg) {
		this.registedflg = registedflg;
	}
	
	
}
 