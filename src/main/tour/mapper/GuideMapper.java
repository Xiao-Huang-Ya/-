package main.tour.mapper;

import main.tour.entity.Guide;

import java.util.List;

/**
 * GuideMapper（接口名） == namespace
 * queryGuideByFid(方法名)  ==id
 * 两者唯一确定一个sql
 */
//mybatis约定(动态代理),
public interface GuideMapper {

    //    通过id查询花
    Guide queryGuideById(Long id);
    //   查询全部花
    List<Guide> queryGuides();
    //    添加花
    boolean insertGuide(Guide guide);

    //    删除花
    boolean deleteGuideById(String id);

}
