package main.tour.servlet;

import com.github.pagehelper.Page;
import main.tour.entity.Route;
import main.tour.entity.TourPage;
import main.tour.service.RouteService;
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
public class RouteServlet {
    @Autowired
    RouteService routeService;

    public void setRouteService(RouteService routeService) {
        this.routeService = routeService;
    }

    @ModelAttribute
    public TourPage testModelAttribute(String currentPage, Map<String, Object> map) throws IOException {
        TourPage tourPage = new TourPage();
        //当前页
        int currentPage2 = currentPage == null ? 1 : Integer.parseInt(currentPage);
        tourPage.setCurrentPage(currentPage2);

        String display = "5";
        int pageSize = Integer.parseInt(display);
        tourPage.setPageSize(pageSize);
        //        总数居数量,注意数据
        Page page = routeService.queryRoutesByPage(currentPage2, pageSize);
        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount);
        //        总页数
        int totalPage = page.getPages();
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Route> list = page.getResult();
        tourPage.setList(list);
        map.put("tourPage", tourPage);
        return tourPage;
    }

    @RequestMapping("/returnMainPage2")
    public String returnMainPage2(Map<String, Object> map) throws IOException {

        TourPage tourPage = new TourPage();

        tourPage.setList(routeService.queryRoutes());
        map.put("tourPage", tourPage);

        return "test";
    }

    //测试分页学生
    @RequestMapping(value = "/queryRouteByPageServlet/{currentPage}")
    public String queryRouteByPageServlet(@PathVariable("currentPage") int currentPage, Map<String, Object> map) throws IOException {

        TourPage tourPage = new TourPage();

        int pageSize = 5;
        tourPage.setPageSize(pageSize);
        currentPage = currentPage == 0 ? 1 : currentPage;
        tourPage.setCurrentPage(currentPage);
        //        总数居数量,注意数据
        Page page = routeService.queryRoutesByPage(currentPage, pageSize);

        int totalCount = (int) page.getTotal();
        tourPage.setTotalCount(totalCount); //数据总数
        //        总页数
        int totalPage = page.getPages(); //总页数
        tourPage.setTotalPage(totalPage);
        //当前页的数据集合
        List<Route> Routes = page.getResult(); //数据
        tourPage.setList(Routes);
        map.put("tourPage", tourPage);

        return "queryRoute";
    }

    @RequestMapping(value = "/addRouteServlet")
    public String addRouteServlet(@RequestParam(value = "rid", required = false) String rid, @RequestParam(value = "name", required = false) String name,
                                  @RequestParam(value = "endPoint", required = false) String endPoint, @RequestParam(value = "sight", required = false) String sight,
                                  @RequestParam(value = "number", required = false) Integer number, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = false;
        Route Route = null;
        try {
            Route = new Route(rid, name, endPoint, sight, number);
            flag = routeService.insertRoute(Route);
            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryRoute";
        } catch (Exception e) {

            map.put("flag", flag);
            tourPage = testModelAttribute("1", map);
            map.put("tourPage", tourPage);
            return "queryRoute";
        }

    }

    @RequestMapping(value = "/deleteRouteByRidServlet/{rid}")
    public String deleteRouteByRidServlet(@PathVariable("rid") String rid, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        boolean flag = routeService.deleteRouteByRid(rid);
        map.put("flag", flag);
        tourPage = testModelAttribute("1", map);
        map.put("tourPage", tourPage);
        return "queryRoute";
    }

    @RequestMapping(value = "/queryRouteByObjServlet")
    public String queryRouteByObjServlet(@RequestParam(value = "rid", required = false) String rid, @RequestParam(value = "name", required = false) String name,
                                         @RequestParam(value = "endPoint", required = false) String endPoint, @RequestParam(value = "sight", required = false) String sight,
                                         @RequestParam(value = "number", required = false) Integer number, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {

        List<Route> list = null;
        Route route = null;
        boolean flag = false;
        try {
            route = new Route(rid, name, endPoint, sight, number);
            list = routeService.fuzzyQueries(route);
            tourPage = testModelAttribute("1", map);
            tourPage.setList(list);
            map.put("tourPage", tourPage);
            map.put("flag", flag);
            return "queryRoute";
        } catch (Exception e) {
            map.put("flag", flag);
//            tourPage.setList(null);
            return "queryRoute";
        }


    }

    @RequestMapping(value = "/updateRouteByRidServlet")
    public String updateRouteByRidServlet(@RequestParam(value = "rid", required = false) String rid, @RequestParam(value = "name", required = false) String name,
                                          @RequestParam(value = "endPoint", required = false) String endPoint, @RequestParam(value = "sight", required = false) String sight,
                                          @RequestParam(value = "number", required = false) Integer number, Map<String, Object> map, @ModelAttribute("tourPage") TourPage tourPage) throws IOException {
        Route route = null;
        boolean flag = false;
        try {
            route = new Route(rid, name, endPoint, sight, number);
            flag = routeService.updateRouteByRid(route);
            map.put("flag", flag);
            tourPage = testModelAttribute("1",map);
            map.put("tourPage",tourPage);
            return "queryRoute";
        } catch (Exception e) {
            tourPage = testModelAttribute("1",map);
            map.put("tourPage",tourPage);
            map.put("flag", flag);
            return "queryRoute";
        }

    }

    @RequestMapping(value = "/updateReturnRouteServlet/{rid}")
    public String updateRouteByRidServlet(@PathVariable("rid") String rid, Map<String, Object> map) throws IOException {
        Route upRoute = routeService.queryRouteByRid(rid);
        map.put("upRoute", upRoute);
        return "updateRoute";
    }

}