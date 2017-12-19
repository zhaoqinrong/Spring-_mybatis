package cn.bdqn.dao;

import cn.bdqn.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("userDao")
public interface UserDao {
    List<User> getAll();
    List<User> getUserIf(String name);
    List<User> getUserCustIf(User user);
}
