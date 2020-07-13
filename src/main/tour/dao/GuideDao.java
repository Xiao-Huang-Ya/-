package main.tour.dao;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import main.tour.entity.Guide;
import main.tour.mapper.GenenalMapper;
import main.tour.mapper.GuideMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;
import java.util.Map;

//dao层
@Repository
public class GuideDao {
    @Autowired
    GenenalMapper genenalMapper;

    public void setGenenalMapper(GenenalMapper genenalMapper) {
        this.genenalMapper = genenalMapper;
    }

    //    分页查找
    public Page queryGuidesByPage(int currentPage, int pageSize) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        GuideMapper gm = genenalMapper.getMapper(session, GuideMapper.class);
        Page<Object> page = PageHelper.startPage(currentPage, pageSize);

        List<Guide> list = gm.queryGuides();

        return page;
    }

    //查询花是否存在
    public boolean isExit(Object obj) {
        boolean flag = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            GuideMapper gm = genenalMapper.getMapper(session, GuideMapper.class);
            flag = queryGuideById((String) obj) == null ? false : true;
            System.out.println("isEixt():" + flag);
        } catch (Exception e) {
            System.out.println("isExit错误");
            return flag;
        }
        return flag;
    }

    //通过fid查询花是否存在
    public Guide queryGuideById(String number) throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        GuideMapper gm = genenalMapper.getMapper(session, GuideMapper.class);
        Guide guide = gm.queryGuideById(number);
        return guide;
    }

    //    查询所有花
    public List<Guide> queryGuides() throws IOException {

        SqlSession session = genenalMapper.useSqlSession();
        GuideMapper gm = genenalMapper.getMapper(session, GuideMapper.class);
        List<Guide> guides = gm.queryGuides();
        return guides;
    }

    //    添加花
    public boolean insertGuide(Guide guide) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            GuideMapper gm = genenalMapper.getMapper(session, GuideMapper.class);
            result = gm.insertGuide(guide);
        } catch (Exception e) {
            System.out.println("插入错误");
            return false;
        }

        return result;
    }


    //删除花
    public boolean deleteGuideById(String id) {
        boolean result = false;
        try {
            SqlSession session = genenalMapper.useSqlSession();
            GuideMapper fm = genenalMapper.getMapper(session, GuideMapper.class);
            result = fm.deleteGuideById(id);
        } catch (Exception e) {
            System.out.println("删除错误");
            return false;
        }

        return result;
    }

    //    导游分配
    public String queryGuideStateById(String id) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            GuideMapper gm = genenalMapper.getMapper(session, GuideMapper.class);
            return gm.queryGuideStateById(id);

        } catch (Exception e) {
            System.out.println("导游分配：查询导游状态出错");
            return null;
        }

    }

    public boolean updateGuideStateById(Guide guide) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            GuideMapper fm = genenalMapper.getMapper(session, GuideMapper.class);
            return fm.updateGuideStateById(guide);
        } catch (Exception e) {
            System.out.println("导游分配：更新导游状态出错");
            return false;
        }
    }
    public boolean updateGuideById(Guide guide) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            GuideMapper fm = genenalMapper.getMapper(session, GuideMapper.class);
            return fm.updateGuideById(guide);
        } catch (Exception e) {
            System.out.println("更新出错");
            return false;
        }
    }

    public List<Guide> queryGuideUnWorked(String state) {
        try {
            SqlSession session = genenalMapper.useSqlSession();
            GuideMapper gm = genenalMapper.getMapper(session, GuideMapper.class);
            List<Guide> guides = gm.queryGuideUnWorked(state);
            return guides;
        } catch (Exception e) {
            System.out.println("分配导游： 所有导游均分配");
            return null;
        }
    }


}
