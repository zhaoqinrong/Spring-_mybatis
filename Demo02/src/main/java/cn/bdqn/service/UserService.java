package cn.bdqn.service;

import cn.bdqn.entity.User;

import java.util.List;

public interface UserService {
    List<User> getAll();
    List<User> getUserIf(String name);
}
