package kr.or.ddit.web.modulize;

public enum ServiceType {
	GUGUDAN("/01/gugudanForm.html"),
	GUGUDANPROCESS("/gugudan.do"),
	LYRICS("/02/musicForm.jsp"), 
	CALENDAR("/04/calendar.jsp"), 
	IMAGE("/imageForm");
	
	private String servicePage;

	private ServiceType(String servicePage) {//alt+shift+s +밑에서 세번째
		this.servicePage = servicePage;
	}
	
	public String getServicePage() {
		return servicePage;
	}
	
}
