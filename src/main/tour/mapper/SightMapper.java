package main.tour.mapper;

import main.tour.entity.Guide;
import main.tour.entity.Sight;

import java.util.List;

/**
 * GuideMapper（接口名） == namespace
 * queryGuideByFid(方法名)  ==id
 * 两者唯一确定一个sql
 */
//mybatis约定(动态代理),
public interface SightMapper {

    Sight querySightBySname(String sname);

    List<Sight> querySights();

    boolean insertSight(Sight sight);

    boolean deleteSightBySname(String sname);

    boolean updateSightBySname(String sname);

}
