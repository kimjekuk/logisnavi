package gu.warehouse;
import org.springframework.web.multipart.MultipartFile;

public class WarehouseVO {

    private String    
					whcode, 
					whname, 
					mpadrs, 
					kkompx, 
					kkompy, 
					ifsize, 
					ifstrt, 
					trcoty, 
					prprdy, 
					prstdy, 
					prusdy, 
					img001,
					img002,
					img003,
					img004,
					img005,
					mpicif,
					etcstr,
					mgbdrgpk
					;
    private Integer szarea;
    private Integer szposi; 
    private Integer szstrt; 

    private MultipartFile photofile;

	public String getWhcode() {
		return whcode;
	}

	public void setWhcode(String whcode) {
		this.whcode = whcode;
	}

	public String getWhname() {
		return whname;
	}

	public void setWhname(String whname) {
		this.whname = whname;
	}

	public String getMpadrs() {
		return mpadrs;
	}

	public void setMpadrs(String mpadrs) {
		this.mpadrs = mpadrs;
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

	public String getIfsize() {
		return ifsize;
	}

	public void setIfsize(String ifsize) {
		this.ifsize = ifsize;
	}

	public String getIfstrt() {
		return ifstrt;
	}

	public void setIfstrt(String ifstrt) {
		this.ifstrt = ifstrt;
	}

	public String getTrcoty() {
		return trcoty;
	}

	public void setTrcoty(String trcoty) {
		this.trcoty = trcoty;
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

	public String getImg004() {
		return img004;
	}

	public void setImg004(String img004) {
		this.img004 = img004;
	}

	public String getImg005() {
		return img005;
	}

	public void setImg005(String img005) {
		this.img005 = img005;
	}

	public String getMpicif() {
		return mpicif;
	}

	public void setMpicif(String mpicif) {
		this.mpicif = mpicif;
	}

	public String getEtcstr() {
		return etcstr;
	}

	public void setEtcstr(String etcstr) {
		this.etcstr = etcstr;
	}

	public String getMgbdrgpk() {
		return mgbdrgpk;
	}

	public void setMgbdrgpk(String mgbdrgpk) {
		this.mgbdrgpk = mgbdrgpk;
	}

	public Integer getSzarea() {
		return szarea;
	}

	public void setSzarea(Integer szarea) {
		this.szarea = szarea;
	}

	public Integer getSzposi() {
		return szposi;
	}

	public void setSzposi(Integer szposi) {
		this.szposi = szposi;
	}

	public Integer getSzstrt() {
		return szstrt;
	}

	public void setSzstrt(Integer szstrt) {
		this.szstrt = szstrt;
	}

	public MultipartFile getPhotofile() {
		return photofile;
	}

	public void setPhotofile(MultipartFile photofile) {
		this.photofile = photofile;
	}

    
}
