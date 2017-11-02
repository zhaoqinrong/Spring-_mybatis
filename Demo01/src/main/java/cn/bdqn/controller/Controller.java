package cn.bdqn.controller;

import cn.bdqn.entity.User;
import cn.bdqn.service.serviceImpl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@org.springframework.stereotype.Controller
@RequestMapping("/user")
public class Controller {
    @Autowired
    private UserServiceImpl userService;
    @RequestMapping("/getAll")
    public ModelAndView getAll(){
        ModelAndView modelAndView = new ModelAndView("list");
        List<User> all = userService.getAll();
        System.out.println(all);
        modelAndView.addObject("allUser",all);
        return modelAndView;
    }
    @RequestMapping("/getuserIf")
    public ModelAndView getUserIf(User user){
        ModelAndView modelAndView=new ModelAndView("if");
        if(user.getUsername()!=null&&user.getUsername().trim()!=null){
            List<User> userIf = userService.getUserIf(user.getUsername().trim());
            modelAndView.addObject("userif",userIf);
        }
        return modelAndView;
    }
}
