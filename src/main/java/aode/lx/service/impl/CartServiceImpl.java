package aode.lx.service.impl;

import aode.lx.Repository.BaseJapRepository;
import aode.lx.Repository.CartRepository;
import aode.lx.model.Cart;
import aode.lx.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 黄柏樟 on 2015/7/21.
 * @Explain:
 */
@Service("cartService")
public class CartServiceImpl extends BaseServiceImpl<Cart,Long> implements CartService{
    @Autowired
    private CartRepository cartRepository;
    @Override
    public BaseJapRepository<Cart, Long> getRepository() {
        return cartRepository;
    }

    @Override
    public Cart findOneByLoginName(String loginName) {
        return this.cartRepository.findOneByLoginName(loginName);
    }
}
