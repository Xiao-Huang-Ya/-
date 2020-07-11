package main.tour.mapper;

import main.tour.entity.Passenger;

import java.util.List;

/**
 * GuideMapper（接口名） == namespace
 * queryGuideByFid(方法名)  ==id
 * 两者唯一确定一个sql
 */
//mybatis约定(动态代理),
public interface PassengerMapper {

    Passenger queryPassengerByPid(String pid);

    int judgeIsExit(String pid);
    int judgeIsExitByUsername(String username);

    String queryPassengerStateByUsername(String username);

    List<Passenger> queryPassengers();

    boolean insertPassenger(Passenger passenger);

    boolean insertPassenger2(Passenger passenger);

    boolean deletePassengerByPid(String pid);

    boolean updatePassengerByPid(String pid);

    boolean updatePassengerStateByUsername(Passenger passenger);

}
