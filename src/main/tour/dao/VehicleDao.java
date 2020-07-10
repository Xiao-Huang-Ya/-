package main.tour.dao;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import main.tour.entity.Vehicle;
import main.tour.mapper.GenenalMapper;
import main.tour.mapper.VehicleMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;
//dao层
@Repository
public class VehicleDao {
        @Autowired
        GenenalMapper genenalMapper;

        public void setGenenalMapper(GenenalMapper genenalMapper) {
            this.genenalMapper = genenalMapper;
        }

        //分页查找
        public Page queryVehiclesByPage(int currentPage, int pageSize) throws IOException {

            SqlSession session = genenalMapper.useSqlSession();
            VehicleMapper gm = genenalMapper.getMapper(session, VehicleMapper.class);
            Page<Object> page = PageHelper.startPage(currentPage, pageSize);

            List<Vehicle> list = gm.queryVehicles();

            return page;
        }

        //判断存在
        public boolean isExit(Object obj) {
            boolean flag = false;
            try {
                SqlSession session = genenalMapper.useSqlSession();
                VehicleMapper gm = genenalMapper.getMapper(session, VehicleMapper.class);
                flag = queryVehicleByVid((String) obj) == null ? false : true;
                System.out.println("isEixt():" + flag);
            } catch (Exception e) {
                System.out.println("isExit错误");
                return flag;
            }
            return flag;
        }

        //通过主键查询
        public Vehicle queryVehicleByVid(String vid) throws IOException {

            SqlSession session = genenalMapper.useSqlSession();
            VehicleMapper gm = genenalMapper.getMapper(session, VehicleMapper.class);
            Vehicle vehicle = gm.queryVehicleByVid(vid);
            return vehicle;
        }

        //    查询全部
        public List<Vehicle> queryVehicles() throws IOException {

            SqlSession session = genenalMapper.useSqlSession();
            VehicleMapper gm = genenalMapper.getMapper(session, VehicleMapper.class);
            List<Vehicle> vehicles = gm.queryVehicles();
            return vehicles;
        }

        // 添加
        public boolean insertVehicle(Vehicle vehicle) {
            boolean result = false;
            try {
                SqlSession session = genenalMapper.useSqlSession();
                VehicleMapper gm = genenalMapper.getMapper(session, VehicleMapper.class);
                result = gm.insertVehicle(vehicle);
            } catch (Exception e) {
                System.out.println("插入错误");
                return false;
            }

            return result;
        }


        //删除
        public boolean deleteVehicleByVid(String vid) {
            boolean result = false;
            try {
                SqlSession session = genenalMapper.useSqlSession();
                VehicleMapper fm = genenalMapper.getMapper(session, VehicleMapper.class);
                result = fm.deleteVehicleByVid(vid);
            } catch (Exception e) {
                System.out.println("删除错误");
                return false;
            }

            return result;
        }

        //删除
        public boolean updateVehicleByVid(String vid) {
            boolean result = false;
            try {
                SqlSession session = genenalMapper.useSqlSession();
                VehicleMapper fm = genenalMapper.getMapper(session, VehicleMapper.class);
                result = fm.updateVehicleByVid(vid);
            } catch (Exception e) {
                System.out.println("更新错误");
                return false;
            }

            return result;
        }


    }
