package main.tour.service;

import com.github.pagehelper.Page;
import main.tour.dao.SightDao;
import main.tour.entity.Sight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class SightService {

    @Autowired
    public SightDao sightDao;

    public void setSightDao(SightDao sightDao) {
        this.sightDao = sightDao;
    }

    //    分页查询
    public Page querySightsByPage(int currentPage, int pageSize) throws IOException {
        return sightDao.querySightsByPage(currentPage, pageSize);

    }

    //添加花
    public boolean insertSight(Sight sight) {
        if (!sightDao.isExit(sight.getSname())) {
            return sightDao.insertSight(sight);
        } else {
            System.out.println(sight.getSname() + "已存在");
            return false;
        }

    }

    //    删除花
    public boolean deleteSightBySname(String sname) {
        if (sightDao.isExit(sname)) {
            System.out.println("进入！！");
            return sightDao.deleteSightBySname(sname);

        } else {
            return false;
        }
    }


    //    根据fid查询花
    public Sight querySightBySname(String sname) throws IOException {
        return sightDao.querySightBySname(sname);
    }

    public List<Sight> querySights() throws IOException {
        return sightDao.querySights();
    }

    public boolean updateSightBySname(String sname) {
        if (sightDao.isExit(sname)) {

            return sightDao.updateSightBySname(sname);

        } else {
            System.out.println("更新失败！！");
            return false;
        }
    }
}
