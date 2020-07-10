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
    public boolean insertPassenger(Passenger Passenger) {
        if (!passengerDao.isExit(Passenger.getVid())) {
            return passengerDao.insertPassenger(Passenger);
        } else {
            System.out.println(Passenger.getVid() + "已存在");
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
            return passengerDao.deletePassengerByPid(pid);

        } else {
            System.out.println("更新失败！！");
            return false;
        }
    }
}
