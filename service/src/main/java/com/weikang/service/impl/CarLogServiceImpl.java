package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.CarDao;
import com.weikang.dao.CarIntoDao;
import com.weikang.dao.CarLogDao;
import com.weikang.service.CarLogService;
import com.weikang.vo.CarInto;
import com.weikang.vo.CarLog;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class CarLogServiceImpl implements CarLogService {
    @Autowired
    CarLogDao dao;
    @Autowired
    CarDao carDao;
    @Override
    public PageVo<CarLog> fenYe(CarLog car, int page, int rows) {
        PageVo<CarLog> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        List<CarLog> list = new ArrayList<>();
        List<CarLog> list1=dao.queryGroupByCarId();

        for (int j=0;j<list1.size();j++){
            List<CarLog> list2=dao.queryByCarId(list1.get(j).getCarId());
            CarLog carLog=new CarLog();
            double sumtime =0;
            double sum=0;
            for (int i = 0; i < list2.size(); i++) {
                carLog.setCarIntoId(list2.get(i).getCarIntoId());
                carLog.setCarId(list2.get(i).getCarId());
                //时间
                Calendar c = Calendar.getInstance();
                c.setTime(list2.get(i).getCarInto().getTime());
                long l1 = c.getTimeInMillis();
                c.setTime(list2.get(i).getCarInto().getCarOut().getTime());
                long l2 = c.getTimeInMillis();
                double time = (double) (l1 - l2) / (double) (1000 * 60 * 60);
                sumtime+=time;
                //租车金额
                sum+=list2.get(i).getCarInto().getCarOut().getCar().getRent() * Math.ceil(time / 24);
            }
            carLog.setTime(sumtime);
            carLog.setSum(sum);
            //车辆使用了多少次
            carLog.setCount(dao.count(carLog.getCarId()));
            carLog.setName(carDao.queryById(carLog.getCarId()).getName());
            list.add(j,carLog);
        }

        /*for (int i=0;i<list.size();i++) {
            CarLog carLog=list.get(i);*/

            //List<Integer> carIds=new ArrayList<>();

            //如果是同一辆车
            //for (int j=0;j<carIds.size();j++){
                //if (carLog.getCarId()==carIds.get(j)){
                   /* //算出租车时间
                    Calendar c = Calendar.getInstance();
                    c.setTime(carLog.getCarInto().getTime());
                    long l1 = c.getTimeInMillis();
                    c.setTime(carLog.getCarInto().getCarOut().getTime());
                    long l2 = c.getTimeInMillis();
                    double time = (double) (l1 - l2) / (double) (1000 * 60 * 60);

                    CarLog carLog1=dao.queryByCarId(carLog.getCarId());
                    //在list中查出来
                    for (int k=0;k<list.size();k++){
                        CarLog carLog2= list.get(k);
                        if (carLog2.getId()==carLog1.getId()){
                            //时间
                            carLog2.setTime(time+carLog2.getTime());
                            //租车金额
                            carLog2.setSum(carLog2.getSum()+carLog.getCarInto().getCarOut().getCar().getRent() * Math.ceil(time / 24));
                            //车辆使用了多少次
                            carLog2.setCount(dao.count(carLog.getCarId()));
                        }
                    }*/
                //}else {
                    /*//车名
                    carLog.setName(carLog.getCarInto().getCarOut().getCar().getName());
                    //算出租车时间
                    Calendar c = Calendar.getInstance();
                    c.setTime(carLog.getCarInto().getTime());
                    long l1 = c.getTimeInMillis();
                    c.setTime(carLog.getCarInto().getCarOut().getTime());
                    long l2 = c.getTimeInMillis();
                    double time = (double) (l1 - l2) / (double) (1000 * 60 * 60);
                    carLog.setTime(time);
                    //租车金额
                    carLog.setSum(carLog.getCarInto().getCarOut().getCar().getRent() * Math.ceil(time / 24));
                    //车辆使用了多少次
                    carLog.setCount(dao.count(carLog.getCarId()));*/
               // }
            //}

            //carIds.add(carLog.getCarId());
       // }

        pageVo.setRows(list);
        pageVo.setTotal(dao.fenYeCount(car));

        return pageVo;
    }

    @Override
    public List<CarLog> queryAll() {
        return dao.queryAll();
    }

    @Override
    public CarLog queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int add(CarLog car) {
        return dao.add(car);
    }

    @Override
    public int update(CarLog car) {
        return dao.update(car);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }
}
