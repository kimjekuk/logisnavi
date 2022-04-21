package gu.warehouse;

import org.springframework.web.multipart.MultipartFile;

public class UpfileVO {

    private MultipartFile File001; 
    private MultipartFile File002; 
    private MultipartFile File003; 

	public MultipartFile getFile001() {
		return File001;
	}

	public void setFile001(MultipartFile file001) {
		File001 = file001;
	}

	public MultipartFile getFile002() {
		return File002;
	}

	public void setFile002(MultipartFile file002) {
		File002 = file002;
	}

	public MultipartFile getFile003() {
		return File003;
	}

	public void setFile003(MultipartFile file003) {
		File003 = file003;
	}
   
}
