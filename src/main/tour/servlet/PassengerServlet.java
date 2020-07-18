package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.TourPage;
import main.tour.entity.Passenger;
import main.tour.service.PassengerService;
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
public class PassengerServlet {
    @Autowired
    PassengerService passengerService;

    public void setPassengerService(PassengerService passengerService) {
        this.passengerService = passengerService;
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
        Page page = passengerService.queryPassengersByPage(currentPage2, pageSize);
        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount);
        //        总页数
        int totalPage = page.getPages();
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Passenger> list = page.getResult();
        tourPage.setList(list);
        map.put("tourPage", tourPage);
        return tourPage;
    }

    //测试分页学生
    @RequestMapping(value = "/queryPassengerByPageServlet/{currentPage}")
    public String queryPassengerByPageServlet(@PathVariable("currentPage") int currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        int pageSize = 5;
        tourPage.setPageSize(pageSize);
        currentPage = currentPage == 0 ? 1 : currentPage;
        tourPage.setCurrentPage(currentPage);
        //        总数居数量,注意数据
        Page page = passengerService.queryPassengersByPage(currentPage, pageSize);

        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Passenger> passengers = page.getResult(); //数据
        tourPage.setList(passengers);
        map.put("tourPage", tourPage);

        return "queryPassenger";
    }

    @RequestMapping(value = "/addPassengerServlet")
    public String addPassengerServlet(@RequestParam(value = "pid", required = false) String pid, @RequestParam(value = "pname", required = false) String pname,
                                      @RequestParam(value = "pgender", required = false) String pgender, @RequestParam(value = "iphone", required = false) String iphone,
                                      @RequestParam(value = "rid", required = false) String rid,
                                      Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = false;
        try {
//            System.out.println(Long.valueOf(id));
            Passenger passenger = new Passenger(pid, pname, pgender, iphone, rid);
            flag = passengerService.insertPassenger(passenger);
            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryPassenger";
        } catch (Exception e) {
            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryPassenger";
        }

    }

    @RequestMapping(value = "/deletePassengerServlet/{pid}")
    public String deletePassengerServlet(@PathVariable("pid") String pid, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = passengerService.deletePassengerByPid(pid);
        map.put("flag", flag);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "queryPassenger";
    }


    @RequestMapping(value = "/queryPassengerBypidServlet/{pid}")
    public String queryPassengerBypidServlet(@PathVariable("pid") String pid, Map<String, Object> map) throws IOException {
        Passenger Passenger = passengerService.queryPassengerByPid(pid);
        map.put("Passenger", Passenger);
        return "";
    }
}