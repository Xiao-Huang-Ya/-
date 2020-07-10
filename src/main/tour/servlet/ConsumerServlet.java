package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.Consumer;
import main.tour.entity.Manager;
import main.tour.entity.Passenger;
import main.tour.entity.TourPage;
import main.tour.service.ConsumerService;
import main.tour.service.ManagerService;
import main.tour.service.PassengerService;
import main.tour.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String loginServlet(@RequestParam("name") String name, @RequestParam("pwd") String pwd, Map<String, Object> map) throws IOException {
        Consumer consumer = null;

        String judge = "";
        boolean flag = false;
        consumer = consumerService.queryConsumerByUsername(new Consumer(name, pwd));
        if (consumer == null) {
            judge = "loginError";
            map.put("judge", judge);
        } else {

            judge = "loginSuccess";
            map.put("judge", judge);

           Page page = routeService.queryRoutesByPage2(1,5);
           TourPage tourPage  = new TourPage();
           tourPage.setList(page.getResult());
           tourPage.setCurrentPage(1);
           tourPage.setTotalCount((int) page.getTotal());
           tourPage.setPageSize(5);
           map.put("tourPage",tourPage);
            return  "consumer";
        }
        return "login";
    }
    //注册

    //注册
    @RequestMapping(value = "/registerServlet")
    public String addPassengerServlet(@RequestParam(value = "pid", required = false) String pid, @RequestParam(value = "pname", required = false) String pname,
                                      @RequestParam(value = "pgender", required = false) String pgender, @RequestParam(value = "iphone", required = false) String iphone, @RequestParam(value = "rid", required = false) String rid,
                                      @RequestParam(value = "vid", required = false) String vid, @RequestParam(value = "id", required = false)String id,
                                      @RequestParam(value = "state", required = false) String state,@RequestParam(value = "username",required = false) String username,
                                      @RequestParam(value = "password", required = false) String password,
                                      Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {


        boolean flag2 =  consumerService.insertConsumer(new Consumer(username,password));
        boolean flag = false;
        try {
            if(flag2 == true){
                Passenger passenger = new Passenger(pid, pname, pgender, iphone, rid, vid, id, state,username);
                flag = passengerService.insertPassenger(passenger);
            }
            if(flag == true){

            }

            map.put("flag", flag);

            map.put("tourPage", tourPage);
            return "queryPassenger";
        } catch (Exception e) {
            map.put("flag", flag);
//            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryPassenger";
        }

    }

}