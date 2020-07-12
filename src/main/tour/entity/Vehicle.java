package main.tour.entity;

public class Vehicle {
    private String vid;//车辆编号
    private String rid;//路线编号
    private String state;//车辆状态（是否分配）
    private String id;//导游编号
    private String pid;//旅客身份证
    public Vehicle(){}

    public Vehicle(String vid, String rid, String state, String id ,String pid) {
        this.vid = vid;
        this.rid = rid;
        this.state = state;
        this.id = id;
        this.pid = pid;
    }

    public Vehicle( String vid,String state) {
        this.vid =vid;
        this.state =state;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}
