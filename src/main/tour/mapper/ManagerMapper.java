package main.tour.mapper;

import main.tour.entity.Manager;
import main.tour.entity.Sight;

import java.util.List;

/**
 * GuideMapper（接口名） == namespace
 * queryGuideByFid(方法名)  ==id
 * 两者唯一确定一个sql
 */
//mybatis约定(动态代理),
public interface ManagerMapper {

    Manager queryManagerByAccount(Manager manager);

    boolean updateManagerByAccount(String account);

}
