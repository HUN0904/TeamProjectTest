package utils;

/*
 * 현재 페이지와 관련된 정보 저장
 * - 현재 페이지 번호
 * - 페이지당 게시글의 수
 */
public class Criteria {
	private int pageNum;	// 현재 페이지 번호
	private int rowsPerPage;	// 페이지당 게시글의 수
	
	// 생성자
	// 기본값: 페이지번호=1, 게시글의수=10
	public Criteria() {
		
		this(1, 10);
	}		
	
	public Criteria(int pageNum, int rowsPerPage) {
		this.pageNum = pageNum;
		this.rowsPerPage = rowsPerPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	// 페이지 번호는 0 이상이어야 함.
	public void setPageNum(int pageNum) {
		if (pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	// 페이지 당 게시글의 수는 5~20 사이로 한정
	public void setRowsPerPage(int rowsPerPage) {
		if (rowsPerPage <= 5) {
			this.rowsPerPage = 5;
		} else if (rowsPerPage > 20) {
			this.rowsPerPage = 20;
		} else {
			this.rowsPerPage = rowsPerPage;
		}
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", rowsPerPage=" + rowsPerPage + "]";
	}

}
