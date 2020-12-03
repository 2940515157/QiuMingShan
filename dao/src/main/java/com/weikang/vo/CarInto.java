package com.weikang.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class CarInto {
    private Integer id;
    private Integer carOutId;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm")
    @JSONField(format = "yyyy-MM-dd hh:mm")
    private Date time;
    private Integer status;
    private CarOut carOut;

    public CarInto() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCarOutId() {
        return carOutId;
    }

    public void setCarOutId(Integer carOutId) {
        this.carOutId = carOutId;
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

    public CarOut getCarOut() {
        return carOut;
    }

    public void setCarOut(CarOut carOut) {
        this.carOut = carOut;
    }

    @Override
    public String toString() {
        return "CarInto{" +
                "id=" + id +
                ", carOutId=" + carOutId +
                ", time=" + time +
                ", status=" + status +
                ", carOut=" + carOut +
                '}';
    }
}
