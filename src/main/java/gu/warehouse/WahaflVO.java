package gu.warehouse;
import java.math.BigDecimal;
import java.util.List;

public class WahaflVO {

    private String   
    			  lsfnow  , //  입주시기(즉시)
                  lsfrom  , //  입주시기from
                  lstmto  , //  입주시기to
                  infday  , //  정보 업데이트일
                  status  , //  상태
                  delflg  , //  삭제 Flag
                  whflnm  , //  층명칭
                  whfuse  , //  용도(창고/사무실/하역장/램프/차량통로/공용면적)
                  whtemp  , //  온도(상온/냉장/냉동)
                  lsusr1  , //  입주업체1
                  lsusr2  , //  입주업체2
                  lsusr3  , //  입주업체3
                  cadf01  , //  도면01
                  cadf02  , //  도면02
                  cadf03  , //  도면03
                  avif01  , //  동영상01
                  avif02  , //  동영상02
                  avif03  , //  동영상03
                  dealty  , //  거래형태
                  whfudn  , //  지상지하
                  bapkcd  , //  인허가코드
                  brpkcd  , //  건축물대장코드
                  trdock  , //  접안형태
                  creusr  , //  등록자
                  updusr  , //  수정자
                  delusr  , //  삭제자
                  etcstr  , //  특이사항
                  fllmyn  , //  임대면적(협의)        
                  pricyn  , //  평단가(협의)        
                  credat  , //  등록일시                  
                  upddat   //  수정일시
   ; 
    
    private Integer
    			 whcode  , //  건물번호
    			 whfseq  ,  // 층고유번호    
    			 whflcd  ,  // 층번호
                 docknu  ,  // Dock수
                 flmpay  ,  // 임대료
                 admpay  ,  // 관리비
                 pprice  ,  // 평단가
                 lsdiva     // 최소분할면적
    ;
    
    private double 
                 flhegt  ,   // 유효층고
                 flweit  ,   // 적재하중
                 flarea  ,   // 층면적(바닥)
                 fllmsz  ,   // 층면적(임대)
                 
                 flszwa  ,   // (바닥면적)창고
                 flszof  ,   // (바닥면적)사무실
                 flszdo  ,   // (바닥면적)하역장
                 flszmz  ,   // (바닥면적)공용
                 flslwa  ,   // (임대면적)창고
                 flslof  ,   // (임대면적)사무실
                 flsldo  ,   // (임대면적)하역장
                 flslmz  ,   // (임대면적)공용                  
                 
                 flsewa  ,   // (공실면적)창고
                 flsedo  ,   // (공실면적)사무실
                 flseof  ,   // (공실면적)하역장
                 flsemz  ,   // (공실면적)공용
                 flsesz      // (공실면적)전체
    ;

	public String getLsfrom() {
		return lsfrom;
	}

	public void setLsfrom(String lsfrom) {
		this.lsfrom = lsfrom;
	}

	public String getLstmto() {
		return lstmto;
	}

	public void setLstmto(String lstmto) {
		this.lstmto = lstmto;
	}

	public String getInfday() {
		return infday;
	}

	public void setInfday(String infday) {
		this.infday = infday;
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

	public String getWhflnm() {
		return whflnm;
	}

	public void setWhflnm(String whflnm) {
		this.whflnm = whflnm;
	}

	public String getWhfuse() {
		return whfuse;
	}

	public void setWhfuse(String whfuse) {
		this.whfuse = whfuse;
	}

	public String getWhtemp() {
		return whtemp;
	}

	public void setWhtemp(String whtemp) {
		this.whtemp = whtemp;
	}

	public String getLsusr1() {
		return lsusr1;
	}

	public void setLsusr1(String lsusr1) {
		this.lsusr1 = lsusr1;
	}

	public String getLsusr2() {
		return lsusr2;
	}

	public void setLsusr2(String lsusr2) {
		this.lsusr2 = lsusr2;
	}

	public String getLsusr3() {
		return lsusr3;
	}

	public void setLsusr3(String lsusr3) {
		this.lsusr3 = lsusr3;
	}

	public String getCadf01() {
		return cadf01;
	}

	public void setCadf01(String cadf01) {
		this.cadf01 = cadf01;
	}

	public String getCadf02() {
		return cadf02;
	}

	public void setCadf02(String cadf02) {
		this.cadf02 = cadf02;
	}

	public String getCadf03() {
		return cadf03;
	}

	public void setCadf03(String cadf03) {
		this.cadf03 = cadf03;
	}

	public String getAvif01() {
		return avif01;
	}

	public void setAvif01(String avif01) {
		this.avif01 = avif01;
	}

	public String getAvif02() {
		return avif02;
	}

	public void setAvif02(String avif02) {
		this.avif02 = avif02;
	}

	public String getAvif03() {
		return avif03;
	}

	public void setAvif03(String avif03) {
		this.avif03 = avif03;
	}

	public String getDealty() {
		return dealty;
	}

	public void setDealty(String dealty) {
		this.dealty = dealty;
	}

	public String getWhfudn() {
		return whfudn;
	}

	public void setWhfudn(String whfudn) {
		this.whfudn = whfudn;
	}

	public String getBapkcd() {
		return bapkcd;
	}

	public void setBapkcd(String bapkcd) {
		this.bapkcd = bapkcd;
	}

	public String getBrpkcd() {
		return brpkcd;
	}

	public void setBrpkcd(String brpkcd) {
		this.brpkcd = brpkcd;
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

	public String getEtcstr() {
		return etcstr;
	}

	public void setEtcstr(String etcstr) {
		this.etcstr = etcstr;
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

	public Integer getWhcode() {
		return whcode;
	}

	public void setWhcode(Integer whcode) {
		this.whcode = whcode;
	}

	public Integer getWhfseq() {
		return whfseq;
	}

	public void setWhfseq(Integer whfseq) {
		this.whfseq = whfseq;
	}

	public Integer getWhflcd() {
		return whflcd;
	}

	public void setWhflcd(Integer whflcd) {
		this.whflcd = whflcd;
	}

	public Integer getDocknu() {
		return docknu;
	}

	public void setDocknu(Integer docknu) {
		this.docknu = docknu;
	}

	public Integer getFlmpay() {
		return flmpay;
	}

	public void setFlmpay(Integer flmpay) {
		this.flmpay = flmpay;
	}

	public Integer getAdmpay() {
		return admpay;
	}

	public void setAdmpay(Integer admpay) {
		this.admpay = admpay;
	}

	public Integer getPprice() {
		return pprice;
	}

	public void setPprice(Integer pprice) {
		this.pprice = pprice;
	}

	public Integer getLsdiva() {
		return lsdiva;
	}

	public void setLsdiva(Integer lsdiva) {
		this.lsdiva = lsdiva;
	}

	public double getFlhegt() {
		return flhegt;
	}

	public void setFlhegt(double flhegt) {
		this.flhegt = flhegt;
	}

	public double getFlweit() {
		return flweit;
	}

	public void setFlweit(double flweit) {
		this.flweit = flweit;
	}

	public double getFlarea() {
		return flarea;
	}

	public void setFlarea(double flarea) {
		this.flarea = flarea;
	}

	public double getFllmsz() {
		return fllmsz;
	}

	public void setFllmsz(double fllmsz) {
		this.fllmsz = fllmsz;
	}

	public double getFlszwa() {
		return flszwa;
	}

	public void setFlszwa(double flszwa) {
		this.flszwa = flszwa;
	}

	public double getFlszof() {
		return flszof;
	}

	public void setFlszof(double flszof) {
		this.flszof = flszof;
	}

	public double getFlszdo() {
		return flszdo;
	}

	public void setFlszdo(double flszdo) {
		this.flszdo = flszdo;
	}

	public double getFlszmz() {
		return flszmz;
	}

	public void setFlszmz(double flszmz) {
		this.flszmz = flszmz;
	}

	public double getFlslwa() {
		return flslwa;
	}

	public void setFlslwa(double flslwa) {
		this.flslwa = flslwa;
	}

	public double getFlslof() {
		return flslof;
	}

	public void setFlslof(double flslof) {
		this.flslof = flslof;
	}

	public double getFlsldo() {
		return flsldo;
	}

	public void setFlsldo(double flsldo) {
		this.flsldo = flsldo;
	}

	public double getFlslmz() {
		return flslmz;
	}

	public void setFlslmz(double flslmz) {
		this.flslmz = flslmz;
	}
    
	private List<WahaflVO> wahaflVOList;
	
	public List<WahaflVO> getWahaflVOList() {
		return wahaflVOList;
	}
	public void setWahaflVOList(List<WahaflVO> wahaflVOList) {
		this.wahaflVOList = wahaflVOList;
	}

	public String getTrdock() {
		return trdock;
	}

	public void setTrdock(String trdock) {
		this.trdock = trdock;
	}

	public String getLsfnow() {
		return lsfnow;
	}

	public void setLsfnow(String lsfnow) {
		this.lsfnow = lsfnow;
	}

	public String getFllmyn() {
		return fllmyn;
	}

	public void setFllmyn(String fllmyn) {
		this.fllmyn = fllmyn;
	}

	public String getPricyn() {
		return pricyn;
	}

	public void setPricyn(String pricyn) {
		this.pricyn = pricyn;
	}

	public double getFlsewa() {
		return flsewa;
	}

	public void setFlsewa(double flsewa) {
		this.flsewa = flsewa;
	}

	public double getFlsedo() {
		return flsedo;
	}

	public void setFlsedo(double flsedo) {
		this.flsedo = flsedo;
	}

	public double getFlseof() {
		return flseof;
	}

	public void setFlseof(double flseof) {
		this.flseof = flseof;
	}

	public double getFlsemz() {
		return flsemz;
	}

	public void setFlsemz(double flsemz) {
		this.flsemz = flsemz;
	}

	public double getFlsesz() {
		return flsesz;
	}

	public void setFlsesz(double flsesz) {
		this.flsesz = flsesz;
	}	
    
	
}
