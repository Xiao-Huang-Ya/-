package main.tour.entity;

//导游
public class Guide {
    private String id;//导游编号
    private String name;//导游姓名
    private String gender;//导游性别
    private int hours;//日工作量
    private double salary;//时薪
    private String state;//导游是否工作

    public Guide() {
    }

    public Guide(String id, String name, String gender, int hours, double salary) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.hours = hours;
        this.salary = salary;
    }

    public Guide(String id, String name, int hours, double salary) {
        this.id = id;
        this.name = name;
        this.hours = hours;
        this.salary = salary;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Guide(String id, String state) {
        this.id = id ;
        this.state = state;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
}
