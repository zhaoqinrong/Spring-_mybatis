package cn.bdqn.service.serviceImpl;

import cn.bdqn.dao.UserDao;
import cn.bdqn.entity.User;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Override
    public List<User> getAll() {
        return userDao.getAll();
    }

    @Override
    public List<User> getUserIf(String name) {
      return userDao.getUserIf(name);
    }


}
