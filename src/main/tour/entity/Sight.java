package main.tour.entity;

public class Sight {
    private String sname;//景点名称
    private String location;//景点位置
    public Sight(){}

    public Sight(String sname, String location) {
        this.sname = sname;
        this.location = location;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
