package main.tour.dao;

import main.tour.entity.Manager;
import main.tour.mapper.ManagerMapper;
import main.tour.mapper.GenenalMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;

//dao层
@Repository
public class ManagerDao {
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
            ManagerMapper gm = genenalMapper.getMapper(session, ManagerMapper.class);
            flag = queryManagerByAccount((Manager) obj) == null ? false : true;
            System.out.println("isEixt():" + flag);
        } catch (Exception e) {
            System.out.println("isExit错误");
            return flag;
        }
        return flag;
    }

    //通过主键查询
    public Manager queryManagerByAccount(Manager manager) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        ManagerMapper gm = genenalMapper.getMapper(session, ManagerMapper.class);
         manager = gm.queryManagerByAccount(manager);
        return manager;
    }
//    // 添加
//    public boolean insertManager(Manager manager) {
//        boolean result = false;
//        try {
//            SqlSession session = genenalMapper.useSqlSession();
//            ManagerMapper gm = genenalMapper.getMapper(session, ManagerMapper.class);
//            result = gm.insertManager(manager);
//        } catch (Exception e) {
//            System.out.println("插入错误");
//            return false;
//        }

    //        return result;
//    }
    //更新
    public boolean updateManagerByAccount(String account) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            ManagerMapper fm = genenalMapper.getMapper(session, ManagerMapper.class);
            result = fm.updateManagerByAccount(account);
        } catch (Exception e) {
            System.out.println("更新错误");
            return false;
        }

        return result;
    }


}
