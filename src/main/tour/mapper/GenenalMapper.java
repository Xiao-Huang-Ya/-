package main.tour.mapper;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.io.IOException;

//对SqlSession对象的创建，进行封装
//@Component
public class GenenalMapper extends SqlSessionDaoSupport {
//@Autowired
//@Qualifier("sqlSessionFactory")
    //自定义返回一个SqlSession对象，继承的父类SqlSessionDaoSupport，由getSqlSession()
    public SqlSession useSqlSession() throws IOException {

        return super.getSqlSession();
    }

    //自定义返回一个Mapper接口
    public static <T> T getMapper(SqlSession session, Class<T> T) throws IOException {
        return session.getMapper(T);
    }


}
