package main.tour.service;

import main.tour.dao.ManagerDao;
import main.tour.entity.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class ManagerService {

    @Autowired
    public ManagerDao managerDao;

    public void setManagerDao(ManagerDao managerDao) {
        this.managerDao = managerDao;
    }


    //    根据fid查询花
    public Manager queryManagerByAccount(Manager manager) throws IOException {
        return managerDao.queryManagerByAccount(manager);
    }

    public boolean updateManagerByAccount(String username) {
        if (managerDao.isExit(username)) {

            return managerDao.updateManagerByAccount(username);

        } else {
            System.out.println("更新失败！！");
            return false;
        }
    }
}
