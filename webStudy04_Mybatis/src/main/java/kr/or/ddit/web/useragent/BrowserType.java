package kr.or.ddit.web.useragent;

public enum BrowserType {
	CHROME("크롬"), FIREFOX("파이어폭스"), TRIDENT("익스플로러"), OTHER("기타");
	private String browserName;
	BrowserType(String browserName){
		this.browserName = browserName;
	}
	
	public String getBrowserName() {
		return browserName;
	}
	
	public static BrowserType getBrowserType(String userAgent){
		BrowserType result = BrowserType.OTHER;
		BrowserType[] types = values();
		for(BrowserType tmp : types) {
			if(userAgent.toUpperCase().contains(tmp.name())) {
				result = tmp;
				break;
			}
		}
		return result;
	}
}
