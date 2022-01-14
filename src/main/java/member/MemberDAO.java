package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	// member관련 데이터베이스 접근해서 작업하는 파일
	// 멤버변수
	Connection con =null;
	PreparedStatement pstmt=null;
	String sql=null;
	ResultSet rs=null;
	
	// 디비연결하는 1,2단계 메서드 정의
	public Connection getConnection() throws Exception{
		//예외처리를 getConnection()호출하는 곳에서 예외처리 하도록 함
		
		//1단계 설치한 JDBC 프로그램 불러오기
		//com폴더mysql폴더jdbc폴더 Driver.class
		Class.forName("com.mysql.jdbc.Driver");

		//2단계 디비연결(디비주소, 디비아이디,디비 비밀번호) => 연결정보저장
		String dbUrl="jdbc:mysql://localhost:3306/jspdb3";
		String dbUser="root";
		String dbPass="1234";
		con =DriverManager.getConnection(dbUrl, dbUser, dbPass);
		
		return con;
	}
	
	// 객체생성 => 기억장소 해제
	public void dbClose() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (Exception e2) {
				
			}
		}
		
		if(pstmt!=null) {
			try{
				pstmt.close();
			}catch(Exception e2) {
				
			}
		}
		
		if(con!=null) {
			try {
				con.close();
			} catch (Exception e2) {
				
			}
		}
	}
	
	
	// 리턴할형 없음  insertMember(데이터를 담은 주소을 저장하는 변수) 메서드 정의
	public void insertMember(MemberDTO memberDTO) {
		try {
			//1,2  디비연결
			con=getConnection();
			//3 sql
			sql="INSERT INTO member(id,pass,name,date,email,address,phone,mobile) VALUES(?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPass());
			pstmt.setString(3, memberDTO.getName());
			pstmt.setTimestamp(4, memberDTO.getDate());
			pstmt.setString(5, memberDTO.getEmail());
			pstmt.setString(6, memberDTO.getAddress());
			pstmt.setString(7, memberDTO.getPhone());
			pstmt.setString(8, memberDTO.getMobile());
			
			//4실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}//
	
	// 리턴할형 MemberDTO userCheck(String id,String pass) 메서드 정의 
	public MemberDTO userCheck(String id,String pass) {
		//초기값으로 null id,pass 틀리면 적용
		MemberDTO memberDTO=null;
		try {
			//1,2  디비연결
			con=getConnection();
			// 3 sql
			sql="SELECT * FROM member WHERE id=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			// 4 실행
			rs=pstmt.executeQuery();
			// 5
			if(rs.next()) {
				// true => 아이디 비밀번호 일치 => 열접근
				// 객체생성 기억장소 할당
				memberDTO=new MemberDTO();
				// set메서드 호출 열접근 => 멤버변수 저장
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setDate(rs.getTimestamp("date"));
				memberDTO.setEmail(rs.getString("email"));
				memberDTO.setAddress(rs.getString("address"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setMobile(rs.getString("mobile"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return memberDTO;
	}//
	
	// 리턴할형 MemberDTO  getMember(String id) 메서드 정의
	public MemberDTO getMember(String id) {
		MemberDTO memberDTO=null;
		try {
			//1,2  디비연결
			con=getConnection();
			// 3 sql
			sql="SELECT * FROM member WHERE id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4 실행
			rs=pstmt.executeQuery();
			// 5
			if(rs.next()) {
				// true => 아이디 비밀번호 일치 => 열접근
				// 객체생성 기억장소 할당
				memberDTO=new MemberDTO();
				// set메서드 호출 열접근 => 멤버변수 저장
				memberDTO.setId(rs.getString("id"));
				memberDTO.setPass(rs.getString("pass"));
				memberDTO.setName(rs.getString("name"));
				memberDTO.setDate(rs.getTimestamp("date"));
				memberDTO.setEmail(rs.getString("email"));
				memberDTO.setAddress(rs.getString("address"));
				memberDTO.setPhone(rs.getString("phone"));
				memberDTO.setMobile(rs.getString("mobile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return memberDTO;
	}//
	
//  리턴할형없음    updateMember(MemberDTO updateDTO)      메서드 정의 
	public void updateMember(MemberDTO updateDTO) {
		try {
			//1,2  디비연결
			con=getConnection();
			//3 sql
			sql="UPDATE member SET name=?,email=?,address=?,phone=?,mobile=? WHERE id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, updateDTO.getName());
			pstmt.setString(2, updateDTO.getEmail());
			pstmt.setString(3, updateDTO.getAddress());
			pstmt.setString(4, updateDTO.getPhone());
			pstmt.setString(5, updateDTO.getMobile());
			pstmt.setString(6, updateDTO.getId());
			
			//4실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
	}
	
	
}//클래스
