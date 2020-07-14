package main.tour.entity;

public class Vehicle {
    private String vid;//车辆编号
    private String rid;//路线编号
    private String state;//车辆状态（是否分配）
    private String id;//导游编号
    private String pnumber;//旅客身份证
    private double vehiclecost;//车辆日费用
    public Vehicle(){}

    public Vehicle(String vid, String rid, String state, String id, String pnumber, double vehiclecost) {
        this.vid = vid;
        this.rid = rid;
        this.state = state;
        this.id = id;
        this.pnumber = pnumber;
        this.vehiclecost = vehiclecost;
    }

    public Vehicle(String vid, String rid, String state, String id , String pnumber) {
        this.vid = vid;
        this.rid = rid;
        this.state = state;
        this.id = id;
        this.pnumber = pnumber;
    }

    public Vehicle( String vid,String state) {
        this.vid =vid;
        this.state =state;
    }

    public Vehicle(String vid, String state, double vehiclecost) {
        this.vid = vid;
        this.state = state;
        this.vehiclecost = vehiclecost;
    }

    public double getVehiclecost() {
        return vehiclecost;
    }

    public void setVehiclecost(double vehiclecost) {
        this.vehiclecost = vehiclecost;
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

    public String getPnumber() {
        return pnumber;
    }

    public void setPnumber(String pnumber) {
        this.pnumber = pnumber;
    }
}
