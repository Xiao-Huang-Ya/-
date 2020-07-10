package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.Sight;
import main.tour.entity.TourPage;
import main.tour.service.SightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hello")
public class SightServlet {

    @Autowired
    SightService sightService;

    public void setSightService(SightService sightService) {
        this.sightService = sightService;
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
        Page page = sightService.querySightsByPage(currentPage2, pageSize);
        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount);
        //        总页数
        int totalPage = page.getPages();
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Sight> list = page.getResult();
        tourPage.setList(list);
        map.put("tourPage", tourPage);
        return tourPage;
    }

//    @RequestMapping("/returnMainSightPage")
//    public String returnMainPage(Map<String, Object> map) throws IOException {
//        TourPage tourPage = new TourPage();
//        tourPage.setList(sightService.querySights());
//        map.put("tourPage", tourPage);
//        return "test";
//    }

    //测试分页学生
    @RequestMapping(value = "/querySightByPageServlet/{currentPage}")
    public String querySightByPageServlet(@PathVariable("currentPage") int currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        int pageSize = 5;
        tourPage.setPageSize(pageSize);
        currentPage = currentPage == 0 ? 1 : currentPage;
        tourPage.setCurrentPage(currentPage);
        //        总数居数量,注意数据
        Page page = sightService.querySightsByPage(currentPage, pageSize);

        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Sight> Sights = page.getResult(); //数据
        tourPage.setList(Sights);
        map.put("tourPage", tourPage);
        System.out.println(tourPage.getTotalCount());
        return "querySight";
    }

    @RequestMapping(value = "/addSightServlet")
    public String addSightServlet(@RequestParam(value = "sname", required = false) String sname, @RequestParam(value = "location", required = false) String location, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = false;
        try {
            Sight sight = new Sight(sname, location);
            flag = sightService.insertSight(sight);
            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "querySight";
        } catch (Exception e) {
            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "querySight";
        }

    }

    @RequestMapping(value = "/deleteSightServlet/{sname}")
    public String deleteSightServlet(@PathVariable("sname") String sname, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = sightService.deleteSightBySname(sname);
        map.put("flag", flag);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "querySight";
    }

    //用户界面
//测试分页学生
    @RequestMapping(value = "/querySightByPageServlet2/{currentPage}")
    public String querySightByPageServlet2(@PathVariable("currentPage") int currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        int pageSize = 5;
        tourPage.setPageSize(pageSize);
        currentPage = currentPage == 0 ? 1 : currentPage;
        tourPage.setCurrentPage(currentPage);
        //        总数居数量,注意数据
        Page page = sightService.querySightsByPage(currentPage, pageSize);

        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Sight> Sights = page.getResult(); //数据
        tourPage.setList(Sights);
        map.put("tourPage", tourPage);
        System.out.println(tourPage.getTotalCount());
        return "consumer";
    }

}