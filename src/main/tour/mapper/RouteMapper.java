package main.tour.mapper;

import main.tour.entity.Route;

import java.util.List;

public interface RouteMapper {

    //通过主键查询
    Route queryRouteByRid(Object obj);

    //通过主键查询
    List<Route> fuzzyQueries(Route route);

    //查询全部
    List<Route> queryRoutes();

    //添加
    boolean insertRoute(Route Route);

    //删除
    boolean deleteRouteByRid(String rid);

    //更新
    boolean updateRouteByRid(Route route);

    int queryVehicleNumberByRid(String rid);

   boolean updateVehicleNumber(Route route);
}
