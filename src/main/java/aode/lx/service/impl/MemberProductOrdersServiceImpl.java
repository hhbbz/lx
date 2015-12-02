package aode.lx.service.impl;

import aode.lx.Repository.BaseJapRepository;
import aode.lx.Repository.MemberProductOrdersRepository;
import aode.lx.model.MemberProductOrders;
import aode.lx.service.MemberProductOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 黄柏樟 on 2015/7/30.
 * @Explain:
 */
@Service("memberProductOrdersService")
public class MemberProductOrdersServiceImpl extends BaseServiceImpl<MemberProductOrders,String> implements MemberProductOrdersService{
    @Autowired
    private MemberProductOrdersRepository memberProductOrdersRepository;
    @Override
    public BaseJapRepository<MemberProductOrders, String> getRepository() {
        return memberProductOrdersRepository;
    }
}
