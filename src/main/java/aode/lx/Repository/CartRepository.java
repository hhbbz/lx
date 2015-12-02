package aode.lx.Repository;

import aode.lx.model.Cart;

/**
 * Created by 黄柏樟 on 2015/7/21.
 * @Explain:
 */

public interface CartRepository extends BaseJapRepository<Cart,Long> {
    Cart findOneByLoginName(String loginName);
}
