package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.Vehicle;
import main.tour.entity.TourPage;
import main.tour.service.VehicleService;
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
public class VehicleServlet {
    @Autowired
    VehicleService vehicleService;

    public void setVehicleService(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
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

//    @RequestMapping("/returnMainVehiclePage")
//    public String returnMainPage(Map<String, Object> map) throws IOException {
//        TourPage tourPage = new TourPage();
//        tourPage.setList(vehicleService.queryVehicles());
//        map.put("tourPage", tourPage);
//        return "test";
//    }

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
    public String addVehicleServlet(@RequestParam(value = "vid", required = false) String vid, @RequestParam(value = "rid", required = false) String rid,
                                    @RequestParam(value = "state", required = false) String state, @RequestParam(value = "id", required = false) String id,
                                    @RequestParam(value = "pid", required = false) String pid, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = false;
        try {
            Vehicle vehicle = new Vehicle(vid, rid, state, id, pid);
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
}