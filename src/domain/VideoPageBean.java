package domain;

import java.util.List;

public class VideoPageBean<T> {
    private int totalCount;//总记录数
    private int tatalPage;//总页码
    private List<T> list;
    private int currentPage;//当前页码
    private int rows;//每页条数

    public VideoPageBean(int totalCount, int tatalPage, List<T> list, int currentPage, int rows) {
        this.totalCount = totalCount;
        this.tatalPage = tatalPage;
        this.list = list;
        this.currentPage = currentPage;
        this.rows = rows;
    }
    public VideoPageBean() {

    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTatalPage() {
        return tatalPage;
    }

    public void setTatalPage(int tatalPage) {
        this.tatalPage = tatalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", tatalPage=" + tatalPage +
                ", list=" + list +
                ", currentPage=" + currentPage +
                ", rows=" + rows +
                '}';
    }
}
