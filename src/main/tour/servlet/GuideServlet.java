package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.Guide;
import main.tour.entity.TourPage;
import main.tour.service.GuideService;
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
        System.out.println(currentPage);
//        if (currentPage == null) {//首先加载PageServlet，第一次查询为空（第一次指定第几页）
//            currentPage = "1";
//        }
//        tourPage = testModelAttribute(currentPage, map);
//        //当前页
//        int currentPage2 = Integer.parseInt(currentPage);
//        tourPage.setCurrentPage(currentPage2);
//
//        String display = "5";
//        int pageSize = Integer.parseInt(display);
//        tourPage.setPageSize(pageSize);
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
        System.out.println(tourPage);
        return "queryGuide";
    }

    @RequestMapping(value = "/addGuideServlet")
    public String addGuideServlet(@RequestParam("id2") Long id, @RequestParam("name") String name,
                                  @RequestParam("gender") String gender, @RequestParam("hours") int hours,
                                  @RequestParam("salary") double salary, Map<String, Object> map) throws IOException {
        boolean flag = false;
        Guide Guide = new Guide(id, name, gender, hours, salary);
        flag = guideService.insertGuide(Guide);
        map.put("flag", flag);
        return "addGuide";
    }

    @RequestMapping(value = "/deleteGuideServlet/{id}")
    public String deleteGuideServlet(@PathVariable("id") Long id, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = guideService.deleteGuideById(id);
        map.put("flag", flag);

        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "queryGuide";
    }

    @RequestMapping(value = "/queryGuideByIdServlet/{id}")
    public String queryGuideByFidServlet(@PathVariable("id") Long id, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        Guide Guide = guideService.queryGuideById(id);
        map.put("Guide", Guide);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "test";
    }
}