package main.tour.mapper;

import main.tour.entity.Vehicle;

import java.util.List;

/**
 * GuideMapper（接口名） == namespace
 * queryGuideByFid(方法名)  ==id
 * 两者唯一确定一个sql
 */
//mybatis约定(动态代理),
public interface VehicleMapper {

    Vehicle queryVehicleByVid(String vid);

    List<Vehicle> queryVehicles();

    boolean insertVehicle(Vehicle vehicle);

    boolean deleteVehicleByVid(String vid);

    boolean updateVehicleByVid(String vid);

    boolean updateVehicleStateByPid(Vehicle vehicle);

    String queryVidByRid(String pid);

    String queryIdOnVehicleByVid(String vid);

    List<Vehicle> queryVehicleByVehicleState();

    //    boolean updateVehiclePnumber(Vehicle vehicle);
    boolean functionToUpdatePnumberOnVehicle(String vid);

    boolean updateVehicleRidByVid(Vehicle vehicle);

    boolean updateIdOnVehicle(Vehicle vehicle);
}

