package member;

import java.util.ArrayList;

public class HMemberService {
	private HMemberDao dao;
	public final static String path = "C:\\Users\\Hi there\\Desktop\\webProgramming\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\HmemberImg\\";
	
	public HMemberService() {
		dao = new HMemberDao();
	}
	
	public void join(HMemberVo vo) {
		dao.insert(vo);
	}
	
	public HMemberVo getHMember(String memberId) {
		return dao.selectById(memberId);
	}
	
	public HMemberVo getHMemberByPhone(String phone) {
		return dao.selectByPhone(phone);
	}
	
	public HMemberVo getHMemberByNickname(String nickname) {
		return dao.selectByNickname(nickname);
	}
	
	public ArrayList<HMemberVo> getAll(){
		return dao.selectAll();
	}
	
	public void editInfo(HMemberVo vo) {
		dao.update(vo);
	}
	
	public void delete(String memberId) {
		dao.delete(memberId);
	}
}
