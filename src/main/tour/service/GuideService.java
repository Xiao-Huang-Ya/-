package main.tour.service;

import com.github.pagehelper.Page;


import main.tour.dao.GuideDao;
import main.tour.entity.Guide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GuideService {

    @Autowired
    public GuideDao guideDao;

    public void setGuideDao(GuideDao guideDao) {
        this.guideDao = guideDao;
    }

    //    分页查询
    public Page queryGuidesByPage(int currentPage, int pageSize) throws IOException {
        return guideDao.queryGuidesByPage(currentPage, pageSize);

    }

    //添加花
    public boolean insertGuide(Guide guide) {
        if (!guideDao.isExit(guide.getId())) {
            return guideDao.insertGuide(guide);
        } else {
            System.out.println(guide.getName() + "已存在");
            return false;
        }

    }

    //    删除花
    public boolean deleteGuideById(String id) {
        if (guideDao.isExit(id)) {
            System.out.println("进入！！");
            return guideDao.deleteGuideById(id);

        } else {
            return false;
        }
    }


    //    根据fid查询花
    public Guide queryGuideById(String id) throws IOException {
        return guideDao.queryGuideById(id);
    }

    public List<Guide> queryGuides() throws IOException {
        return guideDao.queryGuides();
    }

    //分配导游
    public List<Guide> queryGuideUnWorked(String state) {
        return guideDao.queryGuideUnWorked(state);
    }

    public boolean  updateGuideState(Guide guide) {
        if (guideDao.isExit(guide.getId())) {
            return guideDao.updateGuideStateById(guide);
        } else {
            System.out.println("更新的游客不存在");
            return false;
        }
    }
    public boolean  updateGuideById(Guide guide) {
        if (guideDao.isExit(guide.getId())) {
            return guideDao.updateGuideById(guide);
        } else {
            System.out.println("更新的游客不存在");
            return false;
        }
    }
}
