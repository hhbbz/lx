package aode.lx.service;

import aode.lx.model.Cart;

/**
 * Created by 黄柏樟 on 2015/7/21.
 * @Explain:
 */
public interface CartService extends BaseService<Cart,Long>{
    Cart findOneByLoginName(String loginName);
}
