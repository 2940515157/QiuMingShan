package com.weikang.vo;

public class CarLog {
    private Integer id;
    private Integer carIntoId;
    private Integer carId;
    private String name;
    private Double sum;
    private Double time;
    private int count;
    private CarInto carInto;

    public CarLog() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCarIntoId() {
        return carIntoId;
    }

    public void setCarIntoId(Integer carIntoId) {
        this.carIntoId = carIntoId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public Double getTime() {
        return time;
    }

    public void setTime(Double time) {
        this.time = time;
    }

    public CarInto getCarInto() {
        return carInto;
    }

    public void setCarInto(CarInto carInto) {
        this.carInto = carInto;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }
}
