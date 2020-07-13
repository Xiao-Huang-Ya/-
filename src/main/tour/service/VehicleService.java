package main.tour.service;

import com.github.pagehelper.Page;
import main.tour.dao.VehicleDao;
import main.tour.entity.Passenger;
import main.tour.entity.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class VehicleService {
    @Autowired
    public VehicleDao vehicleDao;

    public void setVehicleDao(VehicleDao vehicleDao) {
        this.vehicleDao = vehicleDao;
    }

    //    分页查询
    public Page queryVehiclesByPage(int currentPage, int pageSize) throws IOException {
        return vehicleDao.queryVehiclesByPage(currentPage, pageSize);

    }

    //添加
    public boolean insertVehicle(Vehicle Vehicle) {
        if (!vehicleDao.isExit(Vehicle.getVid())) {
            return vehicleDao.insertVehicle(Vehicle);
        } else {
            System.out.println(Vehicle.getVid() + "已存在");
            return false;
        }

    }

    //删除
    public boolean deleteVehicleByVid(String vid) {
        if (vehicleDao.isExit(vid)) {
            System.out.println("进入！！");
            return vehicleDao.deleteVehicleByVid(vid);

        } else {
            return false;
        }
    }

    //通过主键查询
    public Vehicle queryVehicleByVid(String vid) throws IOException {
        return vehicleDao.queryVehicleByVid(vid);
    }

    //查询所有
    public List<Vehicle> queryVehicles() throws IOException {
        return vehicleDao.queryVehicles();
    }

    //更新
    public boolean updateVehicleByVid(String vid) {
        if (vehicleDao.isExit(vid)) {
            return vehicleDao.updateVehicleByVid(vid);

        } else {
            System.out.println("更新失败！！");
            return false;
        }
    }

//车辆调度：根据pid 获取 vid

    //通过主键查询
    public String queryVidByRid(String rid) {
        return vehicleDao.queryVidByRid(rid);
    }

    public boolean updateVehicleStateByPid(Vehicle vehicle) {
        if (vehicleDao.isExit(vehicle.getVid())) {
            boolean flag = vehicleDao.updateVehicleStateByPid(vehicle);
            return flag;
        } else {
            System.out.println("车辆调度：车辆不存在");
            return false;
        }
    }

    public List<Vehicle> queryVehicleByVehicleState() {
        return vehicleDao.queryVehicleByVehicleState();
    }

    //    导游分配
    public String queryIdOnVehicleByVid(String vid) {
        return vehicleDao.queryIdOnVehicleByVid(vid);
    }

    public boolean updateVehicleRidByVid(Vehicle vehicle) {
        if (vehicleDao.isExit(vehicle.getVid())) {
            boolean flag = vehicleDao.updateVehicleRidByVid(vehicle);
            return flag;
        } else {
            System.out.println("车辆调度：车辆不存在");
            return false;
        }
    }
  public   boolean functionToUpdatePnumberOnVehicle(String vid){
      if (vehicleDao.isExit(vid)) {
          boolean flag = vehicleDao.functionToUpdatePnumberOnVehicle(vid);
          return flag;
      } else {
          System.out.println("车辆调度：车辆不存在");
          return false;
      }
    }
}
