package main.tour.dao;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import main.tour.entity.Sight;
import main.tour.mapper.GenenalMapper;
import main.tour.mapper.SightMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;

//dao层
@Repository
public class SightDao {
        @Autowired
        GenenalMapper genenalMapper;

        public void setGenenalMapper(GenenalMapper genenalMapper) {
            this.genenalMapper = genenalMapper;
        }

        //分页查找
        public Page querySightsByPage(int currentPage, int pageSize) throws IOException {

            SqlSession session = genenalMapper.useSqlSession();
            SightMapper gm = genenalMapper.getMapper(session, SightMapper.class);
            Page<Object> page = PageHelper.startPage(currentPage, pageSize);

            List<Sight> list = gm.querySights();

            return page;
        }

        //判断存在
        public boolean isExit(Object obj) {
            boolean flag = false;
            try {
                SqlSession session = genenalMapper.useSqlSession();
                SightMapper gm = genenalMapper.getMapper(session, SightMapper.class);
                flag = querySightBySname((String) obj) == null ? false : true;
                System.out.println("isEixt():" + flag);
            } catch (Exception e) {
                System.out.println("isExit错误");
                return flag;
            }
            return flag;
        }

        //通过主键查询
        public Sight querySightBySname(String sname) throws IOException {

            SqlSession session = genenalMapper.useSqlSession();
            SightMapper gm = genenalMapper.getMapper(session, SightMapper.class);
            Sight Sight = gm.querySightBySname(sname);
            return Sight;
        }

        //    查询全部
        public List<Sight> querySights() throws IOException {

            SqlSession session = genenalMapper.useSqlSession();
            SightMapper gm = genenalMapper.getMapper(session, SightMapper.class);
            List<Sight> Sights = gm.querySights();
            return Sights;
        }

        // 添加
        public boolean insertSight(Sight Sight) {
            boolean result = false;
            try {
                SqlSession session = genenalMapper.useSqlSession();
                SightMapper gm = genenalMapper.getMapper(session, SightMapper.class);
                result = gm.insertSight(Sight);
            } catch (Exception e) {
                System.out.println("插入错误");
                return false;
            }

            return result;
        }


        //删除
        public boolean deleteSightBySname(String sname) {
            boolean result = false;
            try {
                SqlSession session = genenalMapper.useSqlSession();
                SightMapper fm = genenalMapper.getMapper(session, SightMapper.class);
                result = fm.deleteSightBySname(sname);
            } catch (Exception e) {
                System.out.println("删除错误");
                return false;
            }

            return result;
        }

        //删除
        public boolean updateSightBySname(String sname) {
            boolean result = false;
            try {
                SqlSession session = genenalMapper.useSqlSession();
                SightMapper fm = genenalMapper.getMapper(session, SightMapper.class);
                result = fm.updateSightBySname(sname);
            } catch (Exception e) {
                System.out.println("更新错误");
                return false;
            }

            return result;
        }


    }
