package aode.lx.service.impl;

import aode.lx.Repository.BaseJapRepository;
import aode.lx.Repository.MemberRepository;
import aode.lx.model.Member;
import aode.lx.persistence.SearchFilter;
import aode.lx.service.MemberService;
import aode.lx.utils.Encrypt;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 黄柏樟 on 2015/11/17.
 * @Explain:
 */
@Service("memberService")
public class MemberServiceImpl extends BaseServiceImpl<Member,Long> implements MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public BaseJapRepository<Member, Long> getRepository(){
        return memberRepository;
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
        Page<Member> pageBean=this.searchPaginated(searchFilterMap);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", this.count());//当前总数据条数
        map.put("iTotalDisplayRecords", pageBean.getTotalElements());//查询结果的总条数
        map.put("aaData", pageBean.getContent());
        return map;
    }
    @Override
    public Member save(Member member){
        Assert.hasText(member.getLoginName());
        Assert.hasText(member.getPassword());
        member.setPassword(Encrypt.e(member.getPassword()));
        return super.save(member);
    }
    @Override
    public Member login(Member member){
        Assert.hasText(member.getLoginName());
        Assert.hasText(member.getPassword());
        member.setPassword(Encrypt.e(member.getPassword()));
        return this.memberRepository.findOneByLoginNameAndPassword(member.getLoginName(),member.getPassword());
    }
}
