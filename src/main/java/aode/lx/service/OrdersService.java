package aode.lx.service;

import aode.lx.model.Orders;

import java.util.Map;

/**
*@author: 黄柏樟
*@date: 2015/6/29
*@explain:
*/
public interface OrdersService extends BaseService<Orders,Long> {
    Map dataTable(String searchText, int sEcho);

    void addOrders(String loginName,String name, String address, String mark,String number[] , String total);
}
