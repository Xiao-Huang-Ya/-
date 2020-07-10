package main.tour.entity;

public class Manager {
    private String account;
    private String password;

    public String getAccount() {
        return account;
    }

    public Manager() {
    }

    public Manager(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
