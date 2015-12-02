package aode.lx.service.impl;

import aode.lx.persistence.SearchFilter;
import aode.lx.Repository.BaseJapRepository;
import aode.lx.Repository.UserRepository;
import aode.lx.model.User;
import aode.lx.service.UserService;
import aode.lx.utils.Encrypt;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 黄柏樟 on 2015/5/20.
 */
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User,Long> implements UserService {
    @Autowired
    private UserRepository userRepository;

    public BaseJapRepository<User, Long> getRepository(){
        return userRepository;
    }
    /**
     * datetable 处理
     * @return
     */
    public Map dataTable(String searchText,int sEcho){
        Map<String, SearchFilter> searchFilterMap= new HashMap<String,SearchFilter>();
        searchFilterMap.put("ORLIKE_name",new SearchFilter("name", SearchFilter.Operator.ORLIKE, searchText));
        searchFilterMap.put("ORLIKE_email",new SearchFilter("email", SearchFilter.Operator.ORLIKE,searchText));
        searchFilterMap.put("ORLIKE_phoneNumber", new SearchFilter("phoneNumber", SearchFilter.Operator.ORLIKE, searchText));
        Page<User> pageBean=this.searchPaginated(searchFilterMap);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", this.count());//当前总数据条数
        map.put("iTotalDisplayRecords", pageBean.getTotalElements());//查询结果的总条数
        map.put("aaData", pageBean.getContent());
        return map;
    }
    @Override
    public User save(User user){
        Assert.hasText(user.getLoginName());
        Assert.hasText(user.getPassword());
        user.setPassword(Encrypt.e(user.getPassword()));
        return super.save(user);
    }
    @Override
    public User login(User user){
        Assert.hasText(user.getLoginName());
        Assert.hasText(user.getPassword());
        user.setPassword(Encrypt.e(user.getPassword()));
        return this.userRepository.findOneByLoginNameAndPassword(user.getLoginName(), user.getPassword());
    }
}
