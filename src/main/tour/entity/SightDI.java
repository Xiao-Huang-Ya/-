package main.tour.entity;

public class SightDI {
    private String name;//旅游路线的名称
    private int number;//对应旅游路线的人数

    public SightDI() {
    }

    public SightDI(String name, int number) {
        this.name = name;
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
