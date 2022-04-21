package gu.warehouse;

import org.springframework.web.multipart.MultipartFile;

public class WahamaVO {

	private String   
              cate01, //카테고리1
              cate02, //카테고리2
              cate03, //카테고리3
              ifarea, //용도지역
              iftype, //주용도시설
              ifstrt, //건축물구조
              ifsize, //규모
              mpsggc, //시군구코드
              mpdngc, //법정동코드
              mpabun, //번
              mpadji, //지
              status, //상태
              delflg, //삭제 Flag
              whname, //건물명
              whnama, //건물명_약칭
              cofine, //투자사
              cooper, //운용사
              img001, //조감도1
              img002, //조감도2
              img003, //조감도3
              avi001, //동영상1
              avi002, //동영상2
              etcstr, //특이사항
              mpicif, //인근IC
              trcoty, //접안방식
              trtrck, //차량(일반/화물/대형화물)
              trdock, //접안가능층수
              bacode, //인허가코드
              brcode, //건축물대장코드
              creusr, //등록자
              updusr, //수정자
              delusr, //삭제자
              mpadrs, //대지위치
              mpadro, //대지위치_도로명
              prprdy, //허가일
              prstdy, //착공일
              prusdy, //사용승인일
              credat, //등록일시
              upddat, //수정일시
              goompx, //구글_경도
              goompy, //구글_위도
              navmpx, //네이버_경도
              navmpy, //네이버_위도
              kkompx, //카카오_경도
              kkompy, //카카오_위도           
              lmprtf, //Rent Free 
              lmpadd,  //추가 조건
              lmppay, //임대료	
              lmpinc, //임대료포함면적	
              lmpdps, //보증금	
              lmpwhc, //관리비(창고)
              lmpdcc, //관리비(하역장)
              lmpofc, //관리비(사무실)
              lmppbc, //관리비(공용)
              lmpwtc, //수도광열비	
              lmpupp, //임대료인상율	              
              cdvown, //(개발정보)소유자'	              
              cdvsih, //(개발정보)시행사'	              
              cdvsig, //(개발정보)시공사'	              
              cdvgam, //(개발정보)감리사'	              
              cdvsul, //(개발정보)설계사'	              
              lmvown, //(임대문의)소유자'	              
              lmvamc, //(임대문의)amc'	              
              lmvcom, //(임대문의)임대회사'	              
              lmvetc, //(임대문의)기타' 	              
              catnam, //(담당자)성함'  	              
              catpos, //(담당자)직급'  	              
              cattel, //(담당자)tel' 	              
              cathpg, //(담당자)hp'  	              
              cateml, //(담당자)이메일' 	              
              catcad, //(담당자)명함등록'	              
              regflg  //등록된 창고여부 	              
              ;  
	
	
    private Integer
    		 whcode, //건물번호
             stflnu, //층수_지상
             stblnu, //층수_지하
             stpknu, //총주차면수
             stmanu, //주건축물수
             stetnu, //부속건축물수
             stmeln, //승용기수
             stheln, //승강기수
             lmpsif, //인근임대료시세(from)	
             lmpsit //인근임대료시세(to)	

    ;
    
    private double
             szposi, //대지면적
             szstrt, //건축면적
             szarea, //연면적
             sbcret, //건폐_율(%)
             svlret, //용적_률(%)
             sbcvlt //용적_률_산정_연면적(㎡)

    ;
    

	public String getCate01() {
		return cate01;
	}

	public void setCate01(String cate01) {
		this.cate01 = cate01;
	}

	public String getCate02() {
		return cate02;
	}

	public void setCate02(String cate02) {
		this.cate02 = cate02;
	}

	public String getCate03() {
		return cate03;
	}

	public void setCate03(String cate03) {
		this.cate03 = cate03;
	}

	public String getIfarea() {
		return ifarea;
	}

	public void setIfarea(String ifarea) {
		this.ifarea = ifarea;
	}

	public String getIftype() {
		return iftype;
	}

	public void setIftype(String iftype) {
		this.iftype = iftype;
	}

	public String getIfstrt() {
		return ifstrt;
	}

	public void setIfstrt(String ifstrt) {
		this.ifstrt = ifstrt;
	}

	public String getIfsize() {
		return ifsize;
	}

	public void setIfsize(String ifsize) {
		this.ifsize = ifsize;
	}

	public String getMpsggc() {
		return mpsggc;
	}

	public void setMpsggc(String mpsggc) {
		this.mpsggc = mpsggc;
	}

	public String getMpdngc() {
		return mpdngc;
	}

	public void setMpdngc(String mpdngc) {
		this.mpdngc = mpdngc;
	}

	public String getMpabun() {
		return mpabun;
	}

	public void setMpabun(String mpabun) {
		this.mpabun = mpabun;
	}

	public String getMpadji() {
		return mpadji;
	}

	public void setMpadji(String mpadji) {
		this.mpadji = mpadji;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDelflg() {
		return delflg;
	}

	public void setDelflg(String delflg) {
		this.delflg = delflg;
	}

	public String getWhname() {
		return whname;
	}

	public void setWhname(String whname) {
		this.whname = whname;
	}

	public String getWhnama() {
		return whnama;
	}

	public void setWhnama(String whnama) {
		this.whnama = whnama;
	}

	public String getCofine() {
		return cofine;
	}

	public void setCofine(String cofine) {
		this.cofine = cofine;
	}

	public String getCooper() {
		return cooper;
	}

	public void setCooper(String cooper) {
		this.cooper = cooper;
	}

	public String getImg001() {
		return img001;
	}

	public void setImg001(String img001) {
		this.img001 = img001;
	}

	public String getImg002() {
		return img002;
	}

	public void setImg002(String img002) {
		this.img002 = img002;
	}

	public String getImg003() {
		return img003;
	}

	public void setImg003(String img003) {
		this.img003 = img003;
	}

	public String getAvi001() {
		return avi001;
	}

	public void setAvi001(String avi001) {
		this.avi001 = avi001;
	}

	public String getAvi002() {
		return avi002;
	}

	public void setAvi002(String avi002) {
		this.avi002 = avi002;
	}

	public String getEtcstr() {
		return etcstr;
	}

	public void setEtcstr(String etcstr) {
		this.etcstr = etcstr;
	}

	public String getMpicif() {
		return mpicif;
	}

	public void setMpicif(String mpicif) {
		this.mpicif = mpicif;
	}

	public String getTrcoty() {
		return trcoty;
	}

	public void setTrcoty(String trcoty) {
		this.trcoty = trcoty;
	}

	public String getTrtrck() {
		return trtrck;
	}

	public void setTrtrck(String trtrck) {
		this.trtrck = trtrck;
	}

	public String getTrdock() {
		return trdock;
	}

	public void setTrdock(String trdock) {
		this.trdock = trdock;
	}

	public String getBacode() {
		return bacode;
	}

	public void setBacode(String bacode) {
		this.bacode = bacode;
	}

	public String getBrcode() {
		return brcode;
	}

	public void setBrcode(String brcode) {
		this.brcode = brcode;
	}

	public String getCreusr() {
		return creusr;
	}

	public void setCreusr(String creusr) {
		this.creusr = creusr;
	}

	public String getUpdusr() {
		return updusr;
	}

	public void setUpdusr(String updusr) {
		this.updusr = updusr;
	}

	public String getDelusr() {
		return delusr;
	}

	public void setDelusr(String delusr) {
		this.delusr = delusr;
	}

	public String getMpadrs() {
		return mpadrs;
	}

	public void setMpadrs(String mpadrs) {
		this.mpadrs = mpadrs;
	}

	public String getMpadro() {
		return mpadro;
	}

	public void setMpadro(String mpadro) {
		this.mpadro = mpadro;
	}

	public String getPrprdy() {
		return prprdy;
	}

	public void setPrprdy(String prprdy) {
		this.prprdy = prprdy;
	}

	public String getPrstdy() {
		return prstdy;
	}

	public void setPrstdy(String prstdy) {
		this.prstdy = prstdy;
	}

	public String getPrusdy() {
		return prusdy;
	}

	public void setPrusdy(String prusdy) {
		this.prusdy = prusdy;
	}

	public String getCredat() {
		return credat;
	}

	public void setCredat(String credat) {
		this.credat = credat;
	}

	public String getUpddat() {
		return upddat;
	}

	public void setUpddat(String upddat) {
		this.upddat = upddat;
	}

	public String getGoompx() {
		return goompx;
	}

	public void setGoompx(String goompx) {
		this.goompx = goompx;
	}

	public String getGoompy() {
		return goompy;
	}

	public void setGoompy(String goompy) {
		this.goompy = goompy;
	}

	public String getNavmpx() {
		return navmpx;
	}

	public void setNavmpx(String navmpx) {
		this.navmpx = navmpx;
	}

	public String getNavmpy() {
		return navmpy;
	}

	public void setNavmpy(String navmpy) {
		this.navmpy = navmpy;
	}

	public String getKkompx() {
		return kkompx;
	}

	public void setKkompx(String kkompx) {
		this.kkompx = kkompx;
	}

	public String getKkompy() {
		return kkompy;
	}

	public void setKkompy(String kkompy) {
		this.kkompy = kkompy;
	}

	public Integer getWhcode() {
		return whcode;
	}

	public void setWhcode(Integer whcode) {
		this.whcode = whcode;
	}

	public Integer getStflnu() {
		return stflnu;
	}

	public void setStflnu(Integer stflnu) {
		this.stflnu = stflnu;
	}

	public Integer getStblnu() {
		return stblnu;
	}

	public void setStblnu(Integer stblnu) {
		this.stblnu = stblnu;
	}

	public Integer getStpknu() {
		return stpknu;
	}

	public void setStpknu(Integer stpknu) {
		this.stpknu = stpknu;
	}

	public Integer getStmanu() {
		return stmanu;
	}

	public void setStmanu(Integer stmanu) {
		this.stmanu = stmanu;
	}

	public Integer getStetnu() {
		return stetnu;
	}

	public void setStetnu(Integer stetnu) {
		this.stetnu = stetnu;
	}

	public Integer getStmeln() {
		return stmeln;
	}

	public void setStmeln(Integer stmeln) {
		this.stmeln = stmeln;
	}

	public Integer getStheln() {
		return stheln;
	}

	public void setStheln(Integer stheln) {
		this.stheln = stheln;
	}

	public double getSzposi() {
		return szposi;
	}

	public void setSzposi(double szposi) {
		this.szposi = szposi;
	}

	public double getSzstrt() {
		return szstrt;
	}

	public void setSzstrt(double szstrt) {
		this.szstrt = szstrt;
	}

	public double getSzarea() {
		return szarea;
	}

	public void setSzarea(double szarea) {
		this.szarea = szarea;
	}

	public double getSbcret() {
		return sbcret;
	}

	public void setSbcret(double sbcret) {
		this.sbcret = sbcret;
	}

	public double getSvlret() {
		return svlret;
	}

	public void setSvlret(double svlret) {
		this.svlret = svlret;
	}

	public double getSbcvlt() {
		return sbcvlt;
	}

	public void setSbcvlt(double sbcvlt) {
		this.sbcvlt = sbcvlt;
	}

	public String getLmprtf() {
		return lmprtf;
	}

	public void setLmprtf(String lmprtf) {
		this.lmprtf = lmprtf;
	}

	public String getLmpadd() {
		return lmpadd;
	}

	public void setLmpadd(String lmpadd) {
		this.lmpadd = lmpadd;
	}

	public String getLmppay() {
		return lmppay;
	}

	public void setLmppay(String lmppay) {
		this.lmppay = lmppay;
	}

	public String getLmpinc() {
		return lmpinc;
	}

	public void setLmpinc(String lmpinc) {
		this.lmpinc = lmpinc;
	}

	public String getLmpdps() {
		return lmpdps;
	}

	public void setLmpdps(String lmpdps) {
		this.lmpdps = lmpdps;
	}

	public String getLmpwhc() {
		return lmpwhc;
	}

	public void setLmpwhc(String lmpwhc) {
		this.lmpwhc = lmpwhc;
	}

	public String getLmpdcc() {
		return lmpdcc;
	}

	public void setLmpdcc(String lmpdcc) {
		this.lmpdcc = lmpdcc;
	}

	public String getLmpofc() {
		return lmpofc;
	}

	public void setLmpofc(String lmpofc) {
		this.lmpofc = lmpofc;
	}

	public String getLmppbc() {
		return lmppbc;
	}

	public void setLmppbc(String lmppbc) {
		this.lmppbc = lmppbc;
	}

	public String getLmpwtc() {
		return lmpwtc;
	}

	public void setLmpwtc(String lmpwtc) {
		this.lmpwtc = lmpwtc;
	}

	public String getLmpupp() {
		return lmpupp;
	}

	public void setLmpupp(String lmpupp) {
		this.lmpupp = lmpupp;
	}

	public Integer getLmpsif() {
		return lmpsif;
	}

	public void setLmpsif(Integer lmpsif) {
		this.lmpsif = lmpsif;
	}

	public Integer getLmpsit() {
		return lmpsit;
	}

	public void setLmpsit(Integer lmpsit) {
		this.lmpsit = lmpsit;
	}

	public String getCdvown() {
		return cdvown;
	}

	public void setCdvown(String cdvown) {
		this.cdvown = cdvown;
	}

	public String getCdvsih() {
		return cdvsih;
	}

	public void setCdvsih(String cdvsih) {
		this.cdvsih = cdvsih;
	}

	public String getCdvsig() {
		return cdvsig;
	}

	public void setCdvsig(String cdvsig) {
		this.cdvsig = cdvsig;
	}

	public String getCdvgam() {
		return cdvgam;
	}

	public void setCdvgam(String cdvgam) {
		this.cdvgam = cdvgam;
	}

	public String getCdvsul() {
		return cdvsul;
	}

	public void setCdvsul(String cdvsul) {
		this.cdvsul = cdvsul;
	}

	public String getLmvown() {
		return lmvown;
	}

	public void setLmvown(String lmvown) {
		this.lmvown = lmvown;
	}

	public String getLmvamc() {
		return lmvamc;
	}

	public void setLmvamc(String lmvamc) {
		this.lmvamc = lmvamc;
	}

	public String getLmvcom() {
		return lmvcom;
	}

	public void setLmvcom(String lmvcom) {
		this.lmvcom = lmvcom;
	}

	public String getLmvetc() {
		return lmvetc;
	}

	public void setLmvetc(String lmvetc) {
		this.lmvetc = lmvetc;
	}

	public String getCatnam() {
		return catnam;
	}

	public void setCatnam(String catnam) {
		this.catnam = catnam;
	}

	public String getCatpos() {
		return catpos;
	}

	public void setCatpos(String catpos) {
		this.catpos = catpos;
	}

	public String getCattel() {
		return cattel;
	}

	public void setCattel(String cattel) {
		this.cattel = cattel;
	}

	public String getCathpg() {
		return cathpg;
	}

	public void setCathpg(String cathpg) {
		this.cathpg = cathpg;
	}

	public String getCateml() {
		return cateml;
	}

	public void setCateml(String cateml) {
		this.cateml = cateml;
	}

	public String getCatcad() {
		return catcad;
	}

	public void setCatcad(String catcad) {
		this.catcad = catcad;
	}

	public String getRegflg() {
		return regflg;
	}

	public void setRegflg(String regflg) {
		this.regflg = regflg;
	}



}
