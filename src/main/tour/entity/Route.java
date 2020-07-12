package main.tour.entity;

public class Route {
    private String rid; //路线编号
    private String name;//路线名称
    private String endPoint;//目的地
    private String sight;//路线中的景点
    private int number;//景点数
    private int vehicleNumber;//车辆数

    public Route(String rid, int vehicleNumber) {
        this.rid = rid;
        this.vehicleNumber = vehicleNumber;
    }

    public int getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(int vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public Route() {
    }

    public Route(String rid, String name, String endPoint, String sight, int number) {
        this.rid = rid;
        this.name = name;
        this.endPoint = endPoint;
        this.sight = sight;
        this.number = number;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEndPoint() {
        return endPoint;
    }

    public void setEndPoint(String endPoint) {
        this.endPoint = endPoint;
    }

    public String getSight() {
        return sight;
    }

    public void setSight(String sight) {
        this.sight = sight;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
