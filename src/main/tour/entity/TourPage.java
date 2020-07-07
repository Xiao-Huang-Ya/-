package main.tour.entity;

import java.util.List;

public class TourPage {
    private int currentPage;//当前页
    private int pageSize;//页面大小
    private int totalCount;//总数据
    private int totalPage;//总页数
    private List<? extends Object> list;//当前页的数据集合

    public TourPage(int currentPage, int pageSize, int totalCount, int totalPage, List<? extends Object> list) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.list = list;
        this.totalCount = totalCount;
        this.totalPage = totalPage;
    }

    public TourPage() {

    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<? extends Object> getList() {
        return list;
    }

    public void setList(List<? extends Object> list) {
        this.list = list;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

}
