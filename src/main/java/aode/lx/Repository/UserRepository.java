package aode.lx.Repository;

import aode.lx.model.User;

/**
 * Created by 黄柏樟 on 2015/6/4.
 */
public interface UserRepository extends BaseJapRepository<User, Long> {
    User findOneByLoginNameAndPassword(String loginName, String password);

}