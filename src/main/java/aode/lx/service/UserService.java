package aode.lx.service;

import aode.lx.model.User;

import java.util.Map;

/**
 * Created by 黄柏樟 on 2015/6/2.
 */
public interface UserService extends BaseService<User,Long>{
    public Map dataTable(String searchText, int sEcho);
    public User login(User user);
}
