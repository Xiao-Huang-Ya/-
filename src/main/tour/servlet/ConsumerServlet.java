package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.*;
import main.tour.service.ConsumerService;
import main.tour.service.ManagerService;
import main.tour.service.PassengerService;
import main.tour.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.annotation.ApplicationScope;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hello")
public class ConsumerServlet {

    @Autowired
    ConsumerService consumerService;

    public void setConsumerService(ConsumerService consumerService) {
        this.consumerService = consumerService;
    }

    @Autowired
    RouteService routeService;

    public void setRouteService(RouteService routeService) {
        this.routeService = routeService;
    }

    @Autowired
    PassengerService passengerService;

    public void setPassengerService(PassengerService passengerService) {
        this.passengerService = passengerService;
    }


    @RequestMapping("/consumerLoginServlet")
    public String consumerLoginServlet(@RequestParam(value = "name") String name, @RequestParam("pwd") String pwd, Map<String, Object> map) throws IOException {
        Consumer consumer = null;

        String judge = "";
        boolean flag = false;
        consumer = consumerService.queryConsumerByUsername(new Consumer(name, pwd));
        if (consumer == null) {
            judge = "needRegister";
            map.put("judge", judge);
        } else {

            judge = "loginSuccess";
            map.put("judge", judge);
            map.put("username", name);
            map.put("password", pwd);

//            Page page = routeService.queryRoutesByPage2(1, 5);
//            TourPage tourPage = new TourPage();
//            tourPage.setList(page.getResult());
//            tourPage.setCurrentPage(1);
//            tourPage.setTotalCount((int) page.getTotal());
//            tourPage.setPageSize(5);
//            map.put("tourPage", tourPage);
            return "consumerShow";
        }
        return "login";
    }

    //路线查询
    @RequestMapping("/consumerQueryRouteServlet/{username}/{password}")
    public String consumerQueryRouteServlet(@PathVariable(value = "username") String name, @PathVariable("password") String pwd, Map<String, Object> map) throws IOException {
//        Consumer consumer = null;
//
//        String judge = "";
//        boolean flag = false;
//        consumer = consumerService.queryConsumerByUsername(new Consumer(name, pwd));
//        if (consumer == null) {
//            judge = "needRegister";
//            map.put("judge", judge);
//        } else {
//
//            judge = "loginSuccess";
//            map.put("judge", judge);
//            map.put("username", name);

        Page page = routeService.queryRoutesByPage2(1, 5);
        TourPage tourPage = new TourPage();
        tourPage.setList(page.getResult());
        tourPage.setCurrentPage(1);
        tourPage.setTotalCount((int) page.getTotal());
        tourPage.setPageSize(5);
        map.put("tourPage", tourPage);
        map.put("username", name);
        map.put("password", pwd);
        return "consumer";
//        }
//        return "login";
    }

    //注册
    @RequestMapping(value = "/registerServlet")
    public String addPassengerServlet(@RequestParam(value = "pid", required = false) String pid, @RequestParam(value = "pname", required = false) String pname,
                                      @RequestParam(value = "pgender", required = false) String pgender, @RequestParam(value = "iphone", required = false) String iphone, @RequestParam(value = "rid", required = false) String rid,
                                      @RequestParam(value = "vid", required = false) String vid, @RequestParam(value = "id", required = false) String id,
                                      @RequestParam(value = "state", required = false) String state, @RequestParam(value = "username", required = false) String username,
                                      @RequestParam(value = "password", required = false) String password,
                                      Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {


        boolean flag2 = consumerService.insertConsumer(new Consumer(username, password));
        boolean flag = false;
        String judge = "";
//        TourPage tourPage = new TourPage();
//            if(pid=="" || )
        if (flag2 == true) {
            Passenger passenger = new Passenger(pid, pname, pgender, iphone, rid, vid, id, state, username);
            flag = passengerService.insertPassenger2(passenger);
        } else {
            judge = "registerError";
            consumerService.deleteConsumerByUsername(username);
        }
        if (flag == true) {
            judge = "registerSuccess";
        } else {
            judge = "registerError";
        }
        map.put("judge", judge);
        return "login";
    }


    //公用模块，查询用户能看到的路线
    @ModelAttribute
    public TourPage testModelAttribute(String currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        Page page = routeService.queryRoutesByPage(1, 5);
        tourPage.setPageSize(5);
        tourPage.setTotalCount((int) page.getTotal());
        tourPage.setCurrentPage(1);
        tourPage.setList(page.getResult());
        tourPage.setTotalPage(page.getPages());
        map.put("tourPage", tourPage);
        return tourPage;
    }
    //退订

    @RequestMapping("/signDownServlet/{username}/{rid}")
    public String signDownServlet(@PathVariable("username") String username, @PathVariable("rid") String rid, Map<String, Object> map,
                                  @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        Consumer consumer = null;
        Passenger passenger = null;
        String judge = "";
        boolean signDownflag = false;
        String state = passengerService.queryPassengerStateByUsername(username);
        if (state == null || state == "") {
            judge = "signDownError";//退订失败失败
        } else {
            switch (state) {
                case "已报名":
                    signDownflag = passengerService.updatePassengerStateByUsername(new Passenger(username, "已注册", ""));
                    break;
                case "申请退订":
                    judge = "unsubscribe2";
                    break;
                case "待分配":
                    signDownflag = passengerService.updatePassengerStateByUsername(new Passenger(username, "已注册", ""));
                    break;
                case "已分配":
                    signDownflag = passengerService.updatePassengerStateByUsername(new Passenger(username, "已注册", ""));
                    break;
                case "已注册":
                    judge = "registered";
                    break;
                default:
                    judge = "noAction";
                    break;
            }
        }
        map.put("signDownflag", signDownflag);
        map.put("judge", judge);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "consumer";
    }

    //报名
    @RequestMapping("/signUpServlet/{username}/{rid}")
    public String signUpServlet(@PathVariable("username") String username, @PathVariable("rid") String rid, Map<String, Object> map,
                                @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        Consumer consumer = null;
        Passenger passenger = null;
        String judge = "";
        boolean flag = false;
        String state = passengerService.queryPassengerStateByUsername(username);
        if (state == null || state == "") {
            judge = "signUpError";//报名失败
        } else {
            switch (state) {
                case "已报名":
                    judge = "signedUp";
                    break;
                case "申请退订":
                    judge = "unsubscribe";
                    break;
                case "待分配":
                    judge = "waitAssigned";
                    break;
                case "已分配":
                    judge = "successAssigned";
                    break;
                case "已注册":
                    flag = passengerService.updatePassengerStateByUsername(new Passenger(username, "已报名", rid));
                    break;
                default:
                    judge = "noAction";
                    break;
            }
        }
        map.put("flag", flag);
        map.put("judge", judge);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "consumer";
    }

}