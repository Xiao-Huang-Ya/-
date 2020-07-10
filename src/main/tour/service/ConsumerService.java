package main.tour.service;

import com.github.pagehelper.Page;
import main.tour.dao.ConsumerDao;
import main.tour.entity.Consumer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class ConsumerService {

    @Autowired
    public ConsumerDao consumerDao;

    public void setConsumerDao(ConsumerDao consumerDao) {
        this.consumerDao = consumerDao;
    }



    //添加花
    public boolean insertConsumer(Consumer consumer) {
        if (!consumerDao.isExit(consumer.getUsername())) {
            return consumerDao.insertConsumer(consumer);
        } else {
            System.out.println(consumer.getUsername() + "已存在");
            return false;
        }

    }

    //    根据fid查询花
    public Consumer queryConsumerByUsername(Consumer consumer) throws IOException {
        return consumerDao.queryConsumerByUsername(consumer);
    }

    public boolean updateConsumerByUsername(String username) {
        if (consumerDao.isExit(username)) {

            return consumerDao.updateConsumerByUsername(username);

        } else {
            System.out.println("更新失败！！");
            return false;
        }
    }
}
