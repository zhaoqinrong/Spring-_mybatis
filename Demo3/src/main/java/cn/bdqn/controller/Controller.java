package cn.bdqn.controller;

import cn.bdqn.entity.User;
import cn.bdqn.service.serviceImpl.UserServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.omg.CORBA.UserException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
@RequestMapping("/user")
public class Controller {
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/getAll")
    public ModelAndView getAll() {
        ModelAndView modelAndView = new ModelAndView("list");
        List<User> all = userService.getAll();
        System.out.println(all);
        modelAndView.addObject("allUser", all);
        return modelAndView;
    }

    @RequestMapping("/getuserIf")
    public ModelAndView getUserIf(User user) {
        ModelAndView modelAndView = new ModelAndView("if");
        List<User> userIf = null;
        if (user.getUsername() != null && user.getUsername().trim() != null) {
            userIf = userService.getUserIf(user.getUsername().trim());

        } else {
            userIf = userService.getAll();
        }
        modelAndView.addObject("userif", userIf);
        return modelAndView;
    }

    @RequestMapping("/getUserPage")
    public ModelAndView getUserPage(@RequestParam(value = "pagenum", defaultValue = "1") Integer pagenum,@RequestParam(value = "pagesize",defaultValue = "3") Integer pagesize) {
        //放在查询之前
        Page<Object> page = PageHelper.startPage(pagenum, pagesize,true);//开始分页
        List<User> users = userService.getAll();
        List<Object> result = page.getResult();
        PageInfo<Object> info = new PageInfo<>(result,3);

        ModelAndView mv=new ModelAndView("listUsers");
        mv.addObject("users", result);
        mv.addObject("info", info);


        return mv;
    }
    @RequestMapping("/getUserPageIf")
    public ModelAndView getUserPageIf(Integer pagenum,User user){
        Integer pagesize=3;//定义每页显示的数量
        Integer navigatePages=3;//定义导航显示多少个导航数
        Page<User> page = PageHelper.startPage(pagenum, pagesize);//开始分页
        List<User> userIf = userService.getUserIf(user.getUsername());
        PageInfo pageInfo=new PageInfo(userIf,navigatePages);
        List<User> result = page.getResult();
        ModelAndView modelAndView=new ModelAndView("listPagesIf");
        modelAndView.addObject("info",pageInfo);
        modelAndView.addObject("users",result);
        return modelAndView;


    }
    @RequestMapping("/getUserCustIf")
    public ModelAndView getUserCustIf(Integer pagenum,User user){
        Integer pagesize=3;
        Integer navigatePages=3;
        Page<User> page = PageHelper.startPage(pagenum, pagesize);
        List<User> userCustIf = userService.getUserCustIf(user);
        PageInfo<User> info = new PageInfo<>(userCustIf,navigatePages);
        List<User> result = page.getResult();
        ModelAndView modelAndView = new ModelAndView("listUsersCustIf");
        modelAndView.addObject("info",info);
        modelAndView.addObject("users",result);

        return modelAndView;

    }
}