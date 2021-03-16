package nado.controls;

import java.util.Map;

import nado.annotation.Component;
import nado.bind.DataBinding;
import nado.dao.UserDao;

@Component("/user/more.do")
public class FollowingUserMoreListController implements Controller, DataBinding {
	/* DI(Dependency Injection)으로 변경한 이유
	 * 1) 클래스간의 의존성을 낮추기 위해
	 * 2) MemberDao 인터페이스를 선언하고 상속구현함으로써 
	 *    다른 DBMS로의 전환을 용이하게 하려고
	 * 3) 나중에 변경할 자동화 작업에 사용하려고
	 * */
	
	UserDao userDao = null;
	
	public FollowingUserMoreListController setUserDao(UserDao userDao) {
		this.userDao = userDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		model.put("users", userDao.selectList());
		String uid = (String)model.get("uid");
 
		
		return "/jsp/user/FollowingUserMoreList.jsp";
	}

	@Override
	public Object[] getDataBinders() {
		// key값 이름, 자동으로 생성해야 할 클래스 타입
		return new Object[] {
			"uid", String.class
		};
	}
	
} // class end

