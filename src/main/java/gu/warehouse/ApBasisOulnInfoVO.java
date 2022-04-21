package gu.warehouse;


public class ApBasisOulnInfoVO  {
	
private String 
		bldNm              // 건물명
		, jimokCdNm        // 지목코드명
		, jiyukCdNm        // 지역코드명
		, jiguCdNm         // 지구코드명
		, guyukCdNm        // 구역코드명
		, archGbCd         // 건축구분코드명
		, mainPurpsCdNm    // 주용도코드명
		, jimokCd          // 지목코드
		, block            // 블록
		, lot              // 로트
		, platPlc          // 대지위치
		, splotNm          // 특수지명
		, mgmPmsrgstPk     // 관리허가대장PK
		, bun              // 번
		, ji               // 지
		, archGbCdNm       // 건축구분코드
		, sigunguCd        // 시군구코드
		, bjdongCd         // 법정동코드
		, mainPurpsCd      // 주용도코드
		, jiyukCd          // 지역코드
		, jiguCd           // 지구코드
		, guyukCd          // 구역코드
		, stcnsSchedDay    // 착공예정일
		, stcnsDelayDay    // 착공연기일
		, realStcnsDay     // 실제착공일
		, archPmsDay       // 건축허가일
		, useAprDay        // 사용승인일
		, crtnDay          // 생성일자
		, platGbCd         // 대지구분코드
		, registedflg      //   기존등록여부	

;


		private Double	platArea         ; // 대지면적(㎡)
		private Double	archArea         ; // 건축면적(㎡)
		private Double	bcRat            ; // 건폐율(%)
		private Double	totArea          ; // 연면적(㎡)
		private Double	vlRatEstmTotArea ; // 용적률산정연면적(㎡)
		private Double	vlRat            ; // 용적률(%)
		private Integer	mainBldCnt       ; // 주건축물수
		private Integer	atchBldDongCnt   ; // 부속건축물동수
		private Integer	hhldCnt          ; // 세대수(세대)
		private Integer	hoCnt            ; // 호수(호)
		private Integer	fmlyCnt          ; // 가구수(가구)
		private Integer	totPkngCnt       ; // 총주차수
		private Integer	rnum             ; // 순번
		public String getBldNm() {
			return bldNm;
		}
		public void setBldNm(String bldNm) {
			this.bldNm = bldNm;
		}
		public String getJimokCdNm() {
			return jimokCdNm;
		}
		public void setJimokCdNm(String jimokCdNm) {
			this.jimokCdNm = jimokCdNm;
		}
		public String getJiyukCdNm() {
			return jiyukCdNm;
		}
		public void setJiyukCdNm(String jiyukCdNm) {
			this.jiyukCdNm = jiyukCdNm;
		}
		public String getJiguCdNm() {
			return jiguCdNm;
		}
		public void setJiguCdNm(String jiguCdNm) {
			this.jiguCdNm = jiguCdNm;
		}
		public String getGuyukCdNm() {
			return guyukCdNm;
		}
		public void setGuyukCdNm(String guyukCdNm) {
			this.guyukCdNm = guyukCdNm;
		}
		public String getArchGbCd() {
			return archGbCd;
		}
		public void setArchGbCd(String archGbCd) {
			this.archGbCd = archGbCd;
		}
		public String getMainPurpsCdNm() {
			return mainPurpsCdNm;
		}
		public void setMainPurpsCdNm(String mainPurpsCdNm) {
			this.mainPurpsCdNm = mainPurpsCdNm;
		}
		public String getJimokCd() {
			return jimokCd;
		}
		public void setJimokCd(String jimokCd) {
			this.jimokCd = jimokCd;
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
		public String getSplotNm() {
			return splotNm;
		}
		public void setSplotNm(String splotNm) {
			this.splotNm = splotNm;
		}
		public String getMgmPmsrgstPk() {
			return mgmPmsrgstPk;
		}
		public void setMgmPmsrgstPk(String mgmPmsrgstPk) {
			this.mgmPmsrgstPk = mgmPmsrgstPk;
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
		public String getArchGbCdNm() {
			return archGbCdNm;
		}
		public void setArchGbCdNm(String archGbCdNm) {
			this.archGbCdNm = archGbCdNm;
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
		public String getMainPurpsCd() {
			return mainPurpsCd;
		}
		public void setMainPurpsCd(String mainPurpsCd) {
			this.mainPurpsCd = mainPurpsCd;
		}
		public String getJiyukCd() {
			return jiyukCd;
		}
		public void setJiyukCd(String jiyukCd) {
			this.jiyukCd = jiyukCd;
		}
		public String getJiguCd() {
			return jiguCd;
		}
		public void setJiguCd(String jiguCd) {
			this.jiguCd = jiguCd;
		}
		public String getGuyukCd() {
			return guyukCd;
		}
		public void setGuyukCd(String guyukCd) {
			this.guyukCd = guyukCd;
		}
		public String getStcnsSchedDay() {
			return stcnsSchedDay;
		}
		public void setStcnsSchedDay(String stcnsSchedDay) {
			this.stcnsSchedDay = stcnsSchedDay;
		}
		public String getStcnsDelayDay() {
			return stcnsDelayDay;
		}
		public void setStcnsDelayDay(String stcnsDelayDay) {
			this.stcnsDelayDay = stcnsDelayDay;
		}
		public String getRealStcnsDay() {
			return realStcnsDay;
		}
		public void setRealStcnsDay(String realStcnsDay) {
			this.realStcnsDay = realStcnsDay;
		}
		public String getArchPmsDay() {
			return archPmsDay;
		}
		public void setArchPmsDay(String archPmsDay) {
			this.archPmsDay = archPmsDay;
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
		public Integer getMainBldCnt() {
			return mainBldCnt;
		}
		public void setMainBldCnt(Integer mainBldCnt) {
			this.mainBldCnt = mainBldCnt;
		}
		public Integer getAtchBldDongCnt() {
			return atchBldDongCnt;
		}
		public void setAtchBldDongCnt(Integer atchBldDongCnt) {
			this.atchBldDongCnt = atchBldDongCnt;
		}
		public Integer getHhldCnt() {
			return hhldCnt;
		}
		public void setHhldCnt(Integer hhldCnt) {
			this.hhldCnt = hhldCnt;
		}
		public Integer getHoCnt() {
			return hoCnt;
		}
		public void setHoCnt(Integer hoCnt) {
			this.hoCnt = hoCnt;
		}
		public Integer getFmlyCnt() {
			return fmlyCnt;
		}
		public void setFmlyCnt(Integer fmlyCnt) {
			this.fmlyCnt = fmlyCnt;
		}
		public Integer getTotPkngCnt() {
			return totPkngCnt;
		}
		public void setTotPkngCnt(Integer totPkngCnt) {
			this.totPkngCnt = totPkngCnt;
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
 