package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.Guide;
import main.tour.entity.Passenger;
import main.tour.entity.TourPage;
import main.tour.entity.Vehicle;
import main.tour.service.GuideService;
import main.tour.service.PassengerService;
import main.tour.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import java.io.*;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hello")
public class GuideServlet extends HttpServlet {
    @Autowired
    GuideService guideService;

    public void setGuideService(GuideService guideService) {
        this.guideService = guideService;
    }

    @Autowired
    PassengerService passengerService;

    public void setPassengerService(PassengerService passengerService) {
        this.passengerService = passengerService;
    }

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
        Page page = guideService.queryGuidesByPage(currentPage2, pageSize);
        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount);
        //        总页数
        int totalPage = page.getPages();
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Guide> list = page.getResult();
        tourPage.setList(list);
        map.put("tourPage", tourPage);
        return tourPage;
    }

    @RequestMapping("/returnMainPage")
    public String returnMainPage(Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        tourPage.setList(guideService.queryGuides());
        map.put("tourPage", tourPage);
        return "test";
    }

    //测试分页学生
    @RequestMapping(value = "/queryGuideByPageServlet/{currentPage}")
    public String queryGuideByPageServlet(@PathVariable("currentPage") int currentPage, Map<String, Object> map) throws IOException {

        TourPage tourPage = new TourPage();
        int pageSize = 5;
        tourPage.setPageSize(pageSize);
        currentPage = currentPage == 0 ? 1 : currentPage;
        tourPage.setCurrentPage(currentPage);
        //        总数居数量,注意数据
        Page page = guideService.queryGuidesByPage(currentPage, pageSize);

        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Guide> guides = page.getResult(); //数据
        tourPage.setList(guides);
        map.put("tourPage", tourPage);
//        System.out.println(tourPage);
        return "queryGuide";
    }

    @RequestMapping(value = "/addGuideServlet")
    public String addGuideServlet(@RequestParam(value = "id", required = false) String id, @RequestParam(value = "name", required = false) String name,
                                  @RequestParam(value = "gender", required = false) String gender, @RequestParam(value = "hours", required = false) Integer hours,
                                  @RequestParam(value = "salary", required = false) Double salary, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = false;
        try {
            Guide guide = new Guide(id, name, gender, hours, salary);

            flag = guideService.insertGuide(guide);
            tourPage = testModelAttribute("1", map);
            map.put("flag", flag);
            return "queryGuide";
        } catch (Exception e) {
            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            return "addGuide";
        }

    }

    @RequestMapping(value = "/deleteGuideServlet/{id}")
    public String deleteGuideServlet(@PathVariable("id") String id, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        try {
            boolean flag = guideService.deleteGuideById(id);
            map.put("flag", flag);

            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryGuide";
        } catch (Exception e) {
            map.put("flag", false);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryGuide";
        }

    }

    @RequestMapping(value = "/queryGuideByIdServlet/{id}")
    public String queryGuideByFidServlet(@PathVariable("id") String id, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        Guide Guide = guideService.queryGuideById(id);
        map.put("Guide", Guide);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "test";
    }

    //更新导游信息
    @RequestMapping(value = "/updateGuideByIdServlet")
    public String updateGuideByIdServlet(@RequestParam(value = "id2", required = false) String id, @RequestParam(value = "name2", required = false) String name,
                                         @RequestParam(value = "gender2", required = false) String gender, @RequestParam(value = "hours2", required = false) Integer hours,
                                         @RequestParam(value = "salary2", required = false) Double salary, @ModelAttribute("tourPage") TourPage tourPage, Map<String, Object> map) throws IOException {
        Guide guide = new Guide(id, name, gender, hours, salary);
//        map.put("Guide", Guide);
        boolean flag = guideService.updateGuideById(guide);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        map.put("updateGuideFlag", flag);
        return "queryGuide";
    }


    /**
     * 导游分配：
     * 1.输入行录入游客编号
     * 2.if pid.vid.id = true
     * 查找一个未在工作中的导游
     * 游客的导游编号设置成获取的id
     * id.state  = '工作'
     */
    //导游分配主页，查询所有状态为待分配的游客
    //测试分页学生
    @ModelAttribute
    public TourPage testModelAttribute2(String currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage2 = new TourPage();
        int pageSize = 5;
        tourPage2.setPageSize(pageSize);
        int currentPage2 = currentPage == null ? 1 : Integer.parseInt(currentPage);
        tourPage2.setCurrentPage(currentPage2);
        //        总数居数量,注意数据
        Page page = passengerService.queryPassengersByPage2(currentPage2, pageSize, "待分配");

        int totalCount = (int) page.getTotal();
        tourPage2.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage2.setTotalPage(totalPage);
        //当前页的数据集合
        List<Guide> guides = page.getResult(); //数据
        tourPage2.setList(guides);
        map.put("tourPage2", tourPage2);
        return tourPage2;
    }

    @RequestMapping(value = "/distrubutionGuideShowServlet/{currentPage}")
    public String distrubutionGuideShowServlet(@PathVariable(value = "currentPage", required = false) String currentPage, Map<String, Object> map) throws IOException {

        TourPage tourPage = new TourPage();
        int pageSize = 5;
        tourPage.setPageSize(pageSize);
        int currentPage2 = currentPage == null ? 1 : Integer.parseInt(currentPage);
        tourPage.setCurrentPage(currentPage2);
        //        总数居数量,注意数据
        Page page = passengerService.queryPassengersByPage2(currentPage2, pageSize, "待分配");

        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Guide> guides = page.getResult(); //数据
        tourPage.setList(guides);
        map.put("tourPage", tourPage);

        return "distributionGuide";
    }

    /**
     *分配导游
     *  1.  if (pid.vid ).id  != null
     *         then pid.id = vid.id
     *      else
     *        gid =( id.state = '未工作' )
     *        pid.id = gid
     *        vid.id =gid
     *
     *
     *
     * @param pid
     * @param map
     * @param tourPage
     * @return
     * @throws IOException
     */
    @RequestMapping("/distrubutionGuideServlet/{pid}")
    public String test(@PathVariable(value = "pid", required = false) String pid, Map<String, Object> map, @ModelAttribute("tourPage2") TourPage tourPage) throws IOException {
        //在旅客表中根据pid，查询vid
        boolean flag = false;
        boolean updatePassengerState = false;
        boolean updateGuideState = false;
        Passenger passenger = new Passenger();
        Passenger passenger2 = new Passenger();
        try {
            String vid = passengerService.queryVidOnPassengerByPid(pid);
            if (vid != null && vid != "") {
                //根据vid 获取 id
                String id = vehicleService.queryIdOnVehicleByVid(vid);
                if (id != null && id != "") {
                    //将游客的导游编号 pid.id = vid.id
                    passenger.setPid(pid);
                    passenger.setId(id);
                    flag = passengerService.updatePassengerIdById(passenger);
                    passenger2.setPid(pid);
                    passenger2.setState("已分配");
                    updatePassengerState = passengerService.updatePassengerStateByPid(passenger2);
                    if (flag && updatePassengerState) {
                        map.put("flag", true);
                        tourPage = testModelAttribute2("1", map);
                        map.put("tourPage", tourPage);
                        return "distributionGuide";
                    } else {
                        //rollback
                        Passenger passenger3 = new Passenger();
                        passenger3.setPid(pid);
                        passenger3.setId("");
                        passengerService.updatePassengerIdById(passenger3);

                        passenger3.setPid(pid);
                        passenger3.setState("待分配");
                        passengerService.updatePassengerStateByPid(passenger3);

                        map.put("flag", false);
                        tourPage = testModelAttribute2("1", map);
                        map.put("tourPage", tourPage);
                        return "distributionGuide";
                    }
                } else {
                    //查询，并获得一个未在工作导游
                    List<Guide> guides = guideService.queryGuideUnWorked("否");
                    if (guides != null && guides.size() > 0) {
                        String gid = guides.get(0).getId();
                        passenger.setPid(pid);
                        passenger.setId(gid);
                        flag = passengerService.updatePassengerIdById(passenger);
                        updateGuideState = guideService.updateGuideState(new Guide(gid, "是"));
                        passenger2.setPid(pid);
                        passenger2.setState("已分配");
                        updatePassengerState = passengerService.updatePassengerStateByPid(passenger2);
                        if (flag && updateGuideState && updatePassengerState) {
                            Vehicle vehicle = new Vehicle();
                            map.put("flag", true);
                            //将该车辆表 vid.id = gid
                            vehicle.setId(gid);
                            vehicle.setVid(vid);
                            vehicleService.updateIdOnVehicle(vehicle);
                            tourPage = testModelAttribute2("1", map);
                            map.put("tourPage", tourPage);
                            return "distributionGuide";
                        } else {
                            //rollback
                            Passenger passenger4 = new Passenger();
                            passenger4.setPid(pid);
                            passenger4.setId("");
                            passengerService.updatePassengerIdById(passenger4);

                            guideService.updateGuideState(new Guide(gid, "否"));

                            passenger2.setPid(pid);
                            passenger2.setState("待分配");
                            passengerService.updatePassengerStateByPid(passenger2);

                            map.put("flag", false);
                            tourPage = testModelAttribute2("1", map);
                            map.put("tourPage", tourPage);
                            return "distributionGuide";
                        }

                    } else {
                        map.put("judge", "AllWorkGuides");
                        tourPage = testModelAttribute2("1", map);
                        map.put("tourPage", tourPage);
                        return "distributionGuide";
                    }
                }

            }
            map.put("flag", flag);
            tourPage = testModelAttribute2("1", map);
            map.put("tourPage", tourPage);
            return "distributionGuide";
        } catch (Exception e) {
            map.put("flag", flag);
            tourPage = testModelAttribute2("1", map);
            map.put("tourPage", tourPage);
            return "distributionGuide";
        }
    }
}