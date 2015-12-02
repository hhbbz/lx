package aode.lx.service.impl;

import aode.lx.Repository.*;
import aode.lx.model.Cart;
import aode.lx.model.MemberProduct;
import aode.lx.model.MemberProductOrders;
import aode.lx.model.Orders;
import aode.lx.persistence.SearchFilter;
import aode.lx.service.OrdersService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
*@author: 黄柏樟
*@date: 2015/6/29
*@explain:
*/
@Service("orderService")
public class OrdersServiceImpl extends BaseServiceImpl<Orders,Long> implements OrdersService {
    @Autowired
    private OrdersRepository orderRepository;
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private MemberProductRepository memberProductRepository;
    @Autowired
    private MemberProductOrdersRepository memberProductOrdersRepository;
    @Override
    public BaseJapRepository<Orders, Long> getRepository() {
        return orderRepository;
    }

    @Override
    public Map dataTable(String searchText, int sEcho) {
        Map<String, SearchFilter> searchFilterMap= new HashMap<String,SearchFilter>();
        searchFilterMap.put("ORLIKE_name",new SearchFilter("name", SearchFilter.Operator.ORLIKE,searchText));
        searchFilterMap.put("ORLIKE_address",new SearchFilter("address", SearchFilter.Operator.ORLIKE,searchText));
        searchFilterMap.put("ORLIKE_money",new SearchFilter("money", SearchFilter.Operator.ORLIKE,searchText));
        searchFilterMap.put("ORLIKE_mark",new SearchFilter("mark", SearchFilter.Operator.ORLIKE,searchText));
        Page<Orders> pageBean=this.searchPaginated(searchFilterMap);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", this.count());//当前总数据条数
        map.put("iTotalDisplayRecords", pageBean.getTotalElements());//查询结果的总条数
        map.put("aaData", pageBean.getContent());
        for(int i = 0; i < pageBean.getContent().size();i++){
            System.out.println(pageBean.getContent().get(i).getMemberProductOrders());
        }
        return map;
    }

    @Override
    public void addOrders(String loginName,String name, String address, String mark , String number[] , String total) {
        Cart cart = this.cartRepository.findOneByLoginName(loginName);
        List<MemberProduct> memberProducts = cart.getMemberProduct();
        String ids[] = new String[memberProducts.size()];
        Orders orders = new Orders();
        orders.setName(name);
        orders.setDate(new Date());
        orders.setAddress(address);
        orders.setMark(mark);
        orders.setMoney(total);
        this.orderRepository.save(orders);
        for(int i = 0 ; i < memberProducts.size() ; i++){
            ids[i] = memberProducts.get(i).getId();
            MemberProductOrders memberProductOrders = new MemberProductOrders();
            memberProductOrders.setId(ids[i]);
            memberProductOrders.setName(memberProducts.get(i).getName());
            memberProductOrders.setDate(memberProducts.get(i).getDate());
            memberProductOrders.setMoney(memberProducts.get(i).getMoney());
            memberProductOrders.setNumber(number[i]);
            memberProductOrders.setTotal(memberProducts.get(i).getTotal());
            memberProductOrders.setOrders(orders);
            this.memberProductOrdersRepository.save(memberProductOrders);
        }

        this.memberProductRepository.deleteIds(ids);
    }
}
