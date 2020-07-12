package main.tour.service;

import com.github.pagehelper.Page;
import main.tour.dao.RouteDao;
import main.tour.entity.Route;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class RouteService {

    @Autowired
    public RouteDao routeDao;

    public void setRouteDao(RouteDao routeDao) {
        this.routeDao = routeDao;
    }

    //    分页查询
    public Page queryRoutesByPage(int currentPage, int pageSize) throws IOException {
        return routeDao.queryRoutesByPage(currentPage, pageSize);

    }

    public Page queryRoutesByPage2(int currentPage, int pageSize) throws IOException {
        return routeDao.queryRoutesByPage(currentPage, pageSize);

    }

    //添加花
    public boolean insertRoute(Route route) {
        if (!routeDao.isExit(route.getRid())) {
            return routeDao.insertRoute(route);
        } else {
            System.out.println(route.getName() + "已存在");
            return false;
        }

    }

    //    删除花
    public boolean deleteRouteByRid(String rid) {
        if (routeDao.isExit(rid)) {
            System.out.println("进入！！");
            return routeDao.deleteRouteByRid(rid);

        } else {
            return false;
        }
    }


    //    根据fid查询花
    public List<Route> fuzzyQueries(Route route) throws IOException {
        return routeDao.fuzzyQueries(route);
    }

    //    根据fid查询花
    public Route queryRouteByRid(Object route) throws IOException {
        return routeDao.queryRouteByRid(route);
    }

    public List<Route> queryRoutes() throws IOException {
        return routeDao.queryRoutes();
    }

    public boolean updateRouteByRid(Route route) {
        if (routeDao.isExit(route.getRid())) {

            return routeDao.updateRouteByRid(route);

        } else {
            System.out.println("更新失败！！");
            return false;
        }
    }

    //根据车辆调度，通过rid查询该路线车辆数量
    public int queryVehicleNumberByRid(String rid) {
        return  routeDao.queryVehicleNumberByRid(rid);
    }

    public boolean updateVehicleNumber(Route route) {
        if (routeDao.isExit(route.getRid())) {

            return routeDao.updateVehicleNumber(route);

        } else {
            System.out.println("车辆调度：路线不存在：");
            return false;
        }
    }

//    根据车辆调度，通过rid查询改路线的路线编号
}
