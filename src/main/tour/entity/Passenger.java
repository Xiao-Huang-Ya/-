package main.tour.entity;

public class Passenger {
    private String pid;//旅客编号
    private String pname;//旅客姓名
    private String pgender;//旅客性别
    private String iphone;//旅客电话
    private String rid;//路线编号
    private String vid;//分配车辆编号
    private String id;//分配导游编号
    private String state;//状态
    private String username;//用户名
    private Vehicle vehicle;//一对一查询

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public Passenger() {
    }

    public Passenger(String pid, String pname, String pgender, String iphone, String rid, String vid, String id, String state, String username) {
        this.pid = pid;
        this.pname = pname;
        this.pgender = pgender;
        this.iphone = iphone;
        this.rid = rid;
        this.vid = vid;
        this.id = id;
        this.state = state;
        this.username = username;

    }

    public Passenger(String pid, String pname, String pgender, String iphone, String rid, String vid, String id, String state) {
        this.pid = pid;
        this.pname = pname;
        this.pgender = pgender;
        this.iphone = iphone;
        this.rid = rid;
        this.vid = vid;
        this.id = id;
        this.state = state;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPgender() {
        return pgender;
    }

    public void setPgender(String pgender) {
        this.pgender = pgender;
    }

    public String getIphone() {
        return iphone;
    }

    public void setIphone(String iphone) {
        this.iphone = iphone;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
