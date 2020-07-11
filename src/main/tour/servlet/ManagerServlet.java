package main.tour.servlet;

import main.tour.entity.Manager;
import main.tour.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/hello")
public class ManagerServlet {

    @Autowired
    ManagerService managerService;

    public void setManagerService(ManagerService managerService) {
        this.managerService = managerService;
    }

    @RequestMapping("/managerLoginServlet")
    public String loginServlet(@RequestParam("name") String name, @RequestParam("pwd") String pwd, Map<String, Object> map) throws IOException {
        Manager manager = null;

        String judge = "";
        boolean flag = false;
        manager = managerService.queryManagerByAccount(new Manager(name, pwd));
        if (manager == null) {
            judge = "loginError";
            map.put("judge", judge);
        } else {
            judge = "loginSuccess";

            map.put("judge", judge);
            return "manager";
        }
        return "login";
    }


}