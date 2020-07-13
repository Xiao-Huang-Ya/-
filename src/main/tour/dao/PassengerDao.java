package main.tour.dao;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import main.tour.entity.Passenger;
import main.tour.mapper.GenenalMapper;
import main.tour.mapper.PassengerMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;

//dao层
@Repository
public class PassengerDao {
    @Autowired
    GenenalMapper genenalMapper;

    public void setGenenalMapper(GenenalMapper genenalMapper) {
        this.genenalMapper = genenalMapper;
    }

    //分页查找
    public Page queryPassengersByPage(int currentPage, int pageSize) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
        Page<Object> page = PageHelper.startPage(currentPage, pageSize);

        List<Passenger> list = gm.queryPassengers();

        return page;
    }

    //判断存在
    public boolean isExit(Object obj) {
        boolean flag = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
            return gm.judgeIsExit((String) obj) > 0 ? true : false;
        } catch (Exception e) {
            System.out.println("isExit错误");
            return false;
        }

    }

    public boolean usernameIsExit(Object obj) {
        boolean flag = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);

            return gm.judgeIsExitByUsername((String) obj) > 0 ? true : false;
        } catch (Exception e) {
            System.out.println("isExit错误");
            return false;
        }

    }

    //通过主键查询
    public Passenger queryPassengerByPid(String pid) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
        Passenger passenger = gm.queryPassengerByPid(pid);
        return passenger;
    }

    //    查询全部
    public List<Passenger> queryPassengers() throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
        List<Passenger> Passengers = gm.queryPassengers();
        return Passengers;
    }

    // 添加
    public boolean insertPassenger(Passenger Passenger) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
            result = gm.insertPassenger(Passenger);
        } catch (Exception e) {
            System.out.println("插入错误");
            return false;
        }

        return result;
    }

    // 添加
    public boolean insertPassenger2(Passenger Passenger) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
            result = gm.insertPassenger2(Passenger);
        } catch (Exception e) {
            System.out.println("插入错误");
            return false;
        }

        return result;
    }

    //删除
    public boolean deletePassengerByPid(String pid) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper fm = genenalMapper.getMapper(session, PassengerMapper.class);
            result = fm.deletePassengerByPid(pid);
        } catch (Exception e) {
            System.out.println("删除错误");
            return false;
        }

        return result;
    }

    //更新
    public boolean updatePassengerByPid(String pid) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper fm = genenalMapper.getMapper(session, PassengerMapper.class);
            result = fm.updatePassengerByPid(pid);
        } catch (Exception e) {
            System.out.println("更新错误");
            return false;
        }

        return result;
    }

    //更新
    public boolean updatePassengerVidByVid(Passenger passenger) {

        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper fm = genenalMapper.getMapper(session, PassengerMapper.class);
            return fm.updatePassengerVidByVid(passenger);
        } catch (Exception e) {
            System.out.println("车辆调度：更新旅客Video错误");
            return false;
        }


    }
//用户报名

    //查询
    public String queryPassengerStateByUsername(String username) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
        return gm.queryPassengerStateByUsername(username);

    }

    //更新
    public boolean updatePassengerStateByUsername(Passenger passenger) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper fm = genenalMapper.getMapper(session, PassengerMapper.class);
            result = fm.updatePassengerStateByUsername(passenger);
        } catch (Exception e) {
            System.out.println("更新旅客状态错误");
            return false;
        }

        return result;
    }

    //
//车辆调度，通过pid查找rid
    public String queryRidByPid(String pid) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
            return gm.queryRidByPid(pid);
        } catch (Exception e) {
            System.out.println("车辆调度查询Rid错误");
            return null;
        }

    }

    public String queryVidOnPassengerByPid(String pid) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
            return gm.queryVidOnPassengerByPid(pid);
        } catch (Exception e) {
            System.out.println("车辆调度查询Vid错误");
            return null;
        }

    }

    public boolean updatePassengerStateByPid(Passenger passenger) {

        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper fm = genenalMapper.getMapper(session, PassengerMapper.class);
            return fm.updatePassengerStateByPid(passenger);
        } catch (Exception e) {
            System.out.println("更新旅客状态错误");
            return false;
        }


    }

    //查询所有旅客状态的旅客信息
    public Page queryPassengersByPage2(int currentPage, int pageSize, String state) throws IOException {
        SqlSession session = genenalMapper.useSqlSession();
        PassengerMapper gm = genenalMapper.getMapper(session, PassengerMapper.class);
        Page<Object> page = PageHelper.startPage(currentPage, pageSize);

        List<Passenger> list = gm.queryPassengersOnlyWorked(state);

        return page;
    }

    public boolean updatePassengerIdById(Passenger passenger) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            PassengerMapper fm = genenalMapper.getMapper(session, PassengerMapper.class);
            return fm.updatePassengerIdById( passenger);
        } catch (Exception e) {
            System.out.println("分配导游：更新旅客的导游编号错误");
            return false;
        }
    }
}
