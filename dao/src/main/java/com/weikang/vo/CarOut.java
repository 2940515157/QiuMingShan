package com.weikang.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class CarOut {
    private Integer id;
    private Integer carId;
    private Integer userId;
    private Integer shopId;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm")
    @JSONField(format = "yyyy-MM-dd hh:mm")
    private Date time;
    private Integer status;
    private Integer back;

    private Car car;
    private User user;
    private Shop shop;

    public CarOut() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Shop getShop() {
        return shop;
    }

    public void setShop(Shop shop) {
        this.shop = shop;
    }

    public Integer getBack() {
        return back;
    }

    public void setBack(Integer back) {
        this.back = back;
    }

    @Override
    public String toString() {
        return "CarOut{" +
                "id=" + id +
                ", carId=" + carId +
                ", userId=" + userId +
                ", shopId=" + shopId +
                ", time=" + time +
                ", status=" + status +
                ", car=" + car +
                ", user=" + user +
                ", shop=" + shop +
                '}';
    }
}
