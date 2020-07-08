package main.tour.mapper;

import main.tour.entity.Route;

import java.util.List;

public interface RouteMapper {

    //通过主键查询
    Route queryRouteByRid(Object obj);

    //通过主键查询
    List<Route> fuzzyQueries(Object obj);

    //查询全部
    List<Route> queryRoutes();

    //添加
    boolean insertRoute(Route Route);

    //删除
    boolean deleteRouteByRid(String rid);

    //更新
    boolean updateRouteByRid(Route route);

}
