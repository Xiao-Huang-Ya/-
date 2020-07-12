package main.tour.mapper;

import main.tour.entity.Consumer;
import main.tour.entity.Manager;

/**
 * GuideMapper（接口名） == namespace
 * queryGuideByFid(方法名)  ==id
 * 两者唯一确定一个sql
 */
//mybatis约定(动态代理),
public interface ConsumerMapper {

    Consumer queryConsumerByUsername(Consumer consumer);

    boolean insertConsumer(Consumer consumer);

    boolean updateConsumerByUsername(String username);

    boolean deleteConsumerByUsername(String username);
}
