package main.tour.service;

import com.github.pagehelper.Page;
import main.tour.dao.PassengerDao;
import main.tour.entity.Passenger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class PassengerService {
    @Autowired
    public PassengerDao passengerDao;

    public void setPassengerDao(PassengerDao passengerDao) {
        this.passengerDao = passengerDao;
    }

    //    分页查询
    public Page queryPassengersByPage(int currentPage, int pageSize) throws IOException {
        return passengerDao.queryPassengersByPage(currentPage, pageSize);

    }

    //添加
    public boolean insertPassenger(Passenger passenger) {
        if (!passengerDao.isExit(passenger.getVid())) {
            return passengerDao.insertPassenger(passenger);
        } else {
            System.out.println(passenger.getVid() + "已存在");
            return false;
        }

    }
    //添加
    public boolean insertPassenger2(Passenger passenger) {
        if (!passengerDao.isExit(passenger.getVid())) {
            return passengerDao.insertPassenger2(passenger);
        } else {
            System.out.println(passenger.getVid() + "已存在");
            return false;
        }

    }
    //删除
    public boolean deletePassengerByPid(String pid) {
        if (passengerDao.isExit(pid)) {
            System.out.println("进入！！");
            return passengerDao.deletePassengerByPid(pid);

        } else {
            return false;
        }
    }

    //通过主键查询
    public Passenger queryPassengerByPid(String pid) throws IOException {
        return passengerDao.queryPassengerByPid(pid);
    }

    //查询所有
    public List<Passenger> queryPassengers() throws IOException {
        return passengerDao.queryPassengers();
    }

    //更新
    public boolean updatePassengerByPid(String pid) {
        if (passengerDao.isExit(pid)) {
            return passengerDao.updatePassengerByPid(pid);

        } else {
            System.out.println("更新失败！！");
            return false;
        }
    }

    //用户报名操作

    //通过主键查询
    public String queryPassengerStateByUsername(String username) throws IOException {
        return passengerDao.queryPassengerStateByUsername(username);
    }

    //更新
    public boolean updatePassengerStateByUsername(Passenger passenger) {
        if (passengerDao.usernameIsExit(passenger.getUsername())) {
            return passengerDao.updatePassengerStateByUsername(passenger);

        } else {
            System.out.println("失败！！");
            return false;
        }
    }
}
