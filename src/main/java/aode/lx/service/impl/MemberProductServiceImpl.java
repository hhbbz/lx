package aode.lx.service.impl;

import aode.lx.Repository.BaseJapRepository;
import aode.lx.Repository.MemberProductRepository;
import aode.lx.model.MemberProduct;
import aode.lx.service.MemberProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 黄柏樟 on 2015/7/22.
 * @Explain:
 */
@Service("memberProductService")
public class MemberProductServiceImpl extends  BaseServiceImpl<MemberProduct,String> implements MemberProductService{
    @Autowired
    private MemberProductRepository memberProductRepository;
    @Override
    public BaseJapRepository<MemberProduct, String> getRepository() {
        return memberProductRepository;
    }
}
