package main.tour.dao;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import main.tour.entity.Consumer;
import main.tour.mapper.GenenalMapper;
import main.tour.mapper.ConsumerMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;

//dao层
@Repository
public class ConsumerDao {
    @Autowired
    GenenalMapper genenalMapper;

    public void setGenenalMapper(GenenalMapper genenalMapper) {
        this.genenalMapper = genenalMapper;
    }

    //判断存在
    public boolean isExit(Object obj) {
        boolean flag = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            ConsumerMapper gm = genenalMapper.getMapper(session, ConsumerMapper.class);
            flag = gm.queryConsumerByUsername((Consumer) obj) == null ? false : true;
            System.out.println("isEixt():" + flag);
        } catch (Exception e) {
            System.out.println("isExit错误");
            return flag;
        }
        return flag;
    }

    //通过主键查询
    public Consumer queryConsumerByUsername(Consumer consumer) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        ConsumerMapper gm = genenalMapper.getMapper(session, ConsumerMapper.class);
         consumer = gm.queryConsumerByUsername(consumer);
        return consumer;
    }
    // 添加
    public boolean insertConsumer(Consumer Consumer) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            ConsumerMapper gm = genenalMapper.getMapper(session, ConsumerMapper.class);
            result = gm.insertConsumer(Consumer);
        } catch (Exception e) {
            System.out.println("插入错误");
            return false;
        }

        return result;
    }
    //更新
    public boolean updateConsumerByUsername(Consumer consumer) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            ConsumerMapper fm = genenalMapper.getMapper(session, ConsumerMapper.class);
            result = fm.updateConsumerByUsername(consumer);
        } catch (Exception e) {
            System.out.println("更新错误");
            return false;
        }

        return result;
    }
    public boolean judgeConsumerByUsername(Consumer consumer){
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            ConsumerMapper fm = genenalMapper.getMapper(session, ConsumerMapper.class);
            result = fm.judgeConsumerByUsername(consumer) > 0 ? true :false;
        } catch (Exception e) {
            System.out.println("更新错误");
            return false;
        }

        return result;
    }


    public boolean deleteConsumerByUsername(Consumer consumer) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            ConsumerMapper fm = genenalMapper.getMapper(session, ConsumerMapper.class);
           return fm.deleteConsumerByUsername(consumer);
        } catch (Exception e) {
            System.out.println("更新错误");
            return false;
        }


    }
}
