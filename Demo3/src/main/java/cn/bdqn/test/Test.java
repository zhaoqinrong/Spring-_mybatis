package cn.bdqn.test;

import cn.bdqn.entity.User;
import cn.bdqn.service.serviceImpl.UserServiceImpl;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test {

    public void test(){
        UserServiceImpl userService = (UserServiceImpl) new ClassPathXmlApplicationContext("bean.xml").getBean("userService");
        List<User> all = userService.getAll();
        System.out.println(all);

    }
}
