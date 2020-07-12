package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.*;
import main.tour.service.PassengerService;
import main.tour.service.RouteService;
import main.tour.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hello")
public class VehicleServlet {
    @Autowired
    VehicleService vehicleService;

    public void setVehicleService(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
    }

    @Autowired
    PassengerService passengerService;

    public void setPassengerService(PassengerService passengerService) {
        this.passengerService = passengerService;
    }

    @Autowired
    RouteService routeService;

    public void setRouteService(RouteService routeService) {
        this.routeService = routeService;
    }

    @ModelAttribute
    public TourPage testModelAttribute(String currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        System.out.println(currentPage);
        //当前页
        int currentPage2 = currentPage == null ? 1 : Integer.parseInt(currentPage);
        tourPage.setCurrentPage(currentPage2);

        String display = "5";
        int pageSize = Integer.parseInt(display);
        System.out.println("the PageSize is" + pageSize);
        tourPage.setPageSize(pageSize);
        //        总数居数量,注意数据
        Page page = vehicleService.queryVehiclesByPage(currentPage2, pageSize);
        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount);
        //        总页数
        int totalPage = page.getPages();
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Vehicle> list = page.getResult();
        tourPage.setList(list);
        map.put("tourPage", tourPage);
        return tourPage;
    }

    @ModelAttribute
    public TourPage testModelAttribute2(String currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage2 = new TourPage();
        System.out.println(currentPage);
        //当前页
        int currentPage2 = currentPage == null ? 1 : Integer.parseInt(currentPage);
        tourPage2.setCurrentPage(currentPage2);

        String display = "5";
        int pageSize = Integer.parseInt(display);

        tourPage2.setPageSize(pageSize);
        //        总数居数量,注意数据
        Page page = passengerService.queryPassengersByPage2(currentPage2, 5);
        int totalCount = (int) page.getTotal();
        tourPage2.setTotalCount(totalCount);
        //        总页数
        int totalPage = page.getPages();
        tourPage2.setTotalPage(totalPage);
        //当前页的数据集合
        List<Passenger> passengers = page.getResult();

        tourPage2.setList(passengers);
        map.put("tourPage2", tourPage2);
        return tourPage2;
    }

    //车辆调度分页
    @RequestMapping(value = "/queryPassengerByPageServlet2/{currentPage}")
    public String queryPassengerByPageServlet2(@PathVariable("currentPage") int currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        int pageSize = 5;
        tourPage.setPageSize(pageSize);
        currentPage = currentPage == 0 ? 1 : currentPage;
        tourPage.setCurrentPage(currentPage);
        //        总数居数量,注意数据
        Page page = passengerService.queryPassengersByPage2(currentPage, pageSize);

        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Passenger> passengers = page.getResult(); //数据
        tourPage.setList(passengers);
        map.put("tourPage", tourPage);
        return "distributionVehicle";
    }

    //测试分页学生
    @RequestMapping(value = "/queryVehicleByPageServlet/{currentPage}")
    public String queryVehicleByPageServlet(@PathVariable("currentPage") int currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        int pageSize = 5;
        tourPage.setPageSize(pageSize);
        currentPage = currentPage == 0 ? 1 : currentPage;
        tourPage.setCurrentPage(currentPage);
        //        总数居数量,注意数据
        Page page = vehicleService.queryVehiclesByPage(currentPage, pageSize);

        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Vehicle> Vehicles = page.getResult(); //数据
        tourPage.setList(Vehicles);
        map.put("tourPage", tourPage);
        System.out.println(tourPage.getTotalCount());
        return "queryVehicle";
    }

    @RequestMapping(value = "/addVehicleServlet")
    public String addVehicleServlet(@RequestParam(value = "vid", required = false) String vid,
                                    @RequestParam(value = "state", required = false) String state,
                                    Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = false;
        try {
            Vehicle vehicle = new Vehicle(vid, state);
            flag = vehicleService.insertVehicle(vehicle);
            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryVehicle";
        } catch (Exception e) {
            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryVehicle";
        }

    }

    @RequestMapping(value = "/deleteVehicleServlet/{vid}")
    public String deleteVehicleServlet(@PathVariable("vid") String vid, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = vehicleService.deleteVehicleByVid(vid);
        map.put("flag", flag);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "queryVehicle";
    }


    @RequestMapping(value = "/queryVehicleByVidServlet/{vid}")
    public String queryVehicleByVidServlet(@PathVariable("vid") String vid, Map<String, Object> map) throws IOException {
        Vehicle vehicle = vehicleService.queryVehicleByVid(vid);
        map.put("vehicle", vehicle);
        return "";
    }

    /**
     * 车辆调度
     * 1.输入游客编号
     * 2.根据pid获取旅游路线rid
     * 3. if(rid.vid  > 0 ) :  pid.vid = vid ,vid.state = '是'
     */
    @RequestMapping(value = "/distributionServlet/{pid}")
    public String distributionServlet(@PathVariable("pid") String pid, Map<String, Object> map, @ModelAttribute("tourPage2") TourPage tourPage) throws IOException {
        String rid = passengerService.queryRidByPid(pid);
        Passenger p = new Passenger();
        String result = "";
        if (rid != null && rid != "") {
            int vehicleNumber = routeService.queryVehicleNumberByRid(rid);
            if (vehicleNumber > 0) {
                String vid =vehicleService.queryVidByRid(rid);
                boolean flag = passengerService.updatePassengerVidByVid(new Passenger(pid, vid));
                boolean vehicleStateFlag = vehicleService.updateVehicleStateByPid(new Vehicle(vid, "是"));
                if (flag && vehicleStateFlag) {
                    result = "distributionSuccess";//分配成功
                    p.setPid(pid);
                    p.setState("待分配");//已分配车辆，还未分配导游
                    passengerService.updatePassengerStateByPid(p);
                    map.put("result", result);
                    tourPage = testModelAttribute2("1", map);
                    map.put("tourPage", tourPage);
                    return "distributionVehicle";
                } else {
                    result = "distributionError";//分配错误
                    map.put("result", result);
                    tourPage = testModelAttribute2("1", map);
                    map.put("tourPage", tourPage);
                    return "distributionVehicle";
                }
            } else {
                //查询车辆状态未在工作中的状态
                List<Vehicle> vehicles = vehicleService.queryVehicleByVehicleState();
                if (vehicles != null && vehicles.size() > 0) {
                    String vid2 = vehicles.get(0).getVid();
//                    String rid2 = vehicles.get(0).getRid();
                    int vehicleNumber2 = routeService.queryVehicleNumberByRid(rid) + 1;
                    boolean updateVehicleNumber = routeService.updateVehicleNumber(new Route(rid, vehicleNumber2));
                    boolean flag2 = passengerService.updatePassengerVidByVid(new Passenger(pid, vid2));
                    boolean vehicleStateFlag2 = vehicleService.updateVehicleStateByPid(new Vehicle(vid2, "是"));
                    if (updateVehicleNumber && flag2 && vehicleStateFlag2) {
                        result = "distributionSuccess";//分配成功
                        p.setPid(pid);
                        p.setState("待分配");//已分配车辆，还未分配导游
                        passengerService.updatePassengerStateByPid(p);
                        map.put("result", result);
                        tourPage = testModelAttribute2("1", map);
                        map.put("tourPage", tourPage);
                        return "distributionVehicle";
                    } else {
                        result = "distributionError";//分配错误
                        map.put("result", result);
                        tourPage = testModelAttribute2("1", map);
                        map.put("tourPage", tourPage);
                        return "distributionVehicle";
                    }

                } else {
                    result = "distributionError";//分配错误
                    map.put("result", result);
                    tourPage = testModelAttribute2("1", map);
                    map.put("tourPage", tourPage);
                    return "distributionVehicle";
                }
            }
        }
        result = "distributionError";//分配错误
        map.put("result", result);
        tourPage = testModelAttribute2("1", map);
        map.put("tourPage", tourPage);
        return "distributionVehicle";
    }


}