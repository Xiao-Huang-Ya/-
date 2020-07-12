package main.tour.dao;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import main.tour.entity.Route;
import main.tour.mapper.GenenalMapper;
import main.tour.mapper.RouteMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;
import java.util.Map;

//dao层
@Repository
public class RouteDao {
    @Autowired
    GenenalMapper genenalMapper;

    public void setGenenalMapper(GenenalMapper genenalMapper) {
        this.genenalMapper = genenalMapper;
    }

    //分页查找
    public Page queryRoutesByPage(int currentPage, int pageSize) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        RouteMapper gm = genenalMapper.getMapper(session, RouteMapper.class);
        Page<Object> page = PageHelper.startPage(currentPage, pageSize);
        List<Route> list = gm.queryRoutes();

        return page;
    }

    //判断存在
    public boolean isExit(Object obj) {
        boolean flag = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            RouteMapper gm = genenalMapper.getMapper(session, RouteMapper.class);
            flag = gm.queryRouteByRid((String) obj) == null ? false : true;
//            System.out.println("isEixt():" + flag);
        } catch (Exception e) {
            System.out.println("isExit错误");
            return flag;
        }
        return flag;
    }

    //通过主键查询
    public List<Route> fuzzyQueries(Route route) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        RouteMapper gm = genenalMapper.getMapper(session, RouteMapper.class);
        List<Route> routes = gm.fuzzyQueries(route);
        return routes;
    }

    //通过主键查询
    public Route queryRouteByRid(Object obj) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        RouteMapper gm = genenalMapper.getMapper(session, RouteMapper.class);
        Route route = gm.queryRouteByRid(obj);
        return route;
    }

    //    查询全部
    public List<Route> queryRoutes() throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        RouteMapper gm = genenalMapper.getMapper(session, RouteMapper.class);
        List<Route> Routes = gm.queryRoutes();
        return Routes;
    }

    // 添加
    public boolean insertRoute(Route Route) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            RouteMapper gm = genenalMapper.getMapper(session, RouteMapper.class);
            result = gm.insertRoute(Route);
        } catch (Exception e) {
            System.out.println("插入错误");
            return false;
        }

        return result;
    }


    //删除
    public boolean deleteRouteByRid(String id) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            RouteMapper fm = genenalMapper.getMapper(session, RouteMapper.class);
            result = fm.deleteRouteByRid(id);
        } catch (Exception e) {
            System.out.println("删除错误");
            return false;
        }

        return result;
    }

    //删除
    public boolean updateRouteByRid(Route route) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            RouteMapper fm = genenalMapper.getMapper(session, RouteMapper.class);
            result = fm.updateRouteByRid(route);
        } catch (Exception e) {
            System.out.println("更新错误");
            return false;
        }

        return result;
    }

    //车辆调度
//根据车辆调度，通过rid查询该路线车辆数量
    public int queryVehicleNumberByRid(String rid) {

        try {
            SqlSession session = genenalMapper.useSqlSession();
            RouteMapper gm = genenalMapper.getMapper(session, RouteMapper.class);
            return gm.queryVehicleNumberByRid(rid);

        } catch (Exception e) {
            System.out.println("车辆调度：查询vehicleNumber错误");
            return 0;
        }


    }

    public boolean updateVehicleNumber(Route route) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            RouteMapper fm = genenalMapper.getMapper(session, RouteMapper.class);
            return fm.updateVehicleNumber( route);
        } catch (Exception e) {
            System.out.println("车辆调度：更新路线的车辆数错误");
            return false;
        }
    }
}
