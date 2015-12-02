package aode.lx.service;

import aode.lx.model.Member;

import java.util.Map;

/**
 * Created by 黄柏樟 on 2015/11/17.
 * @Explain:
 */
public interface MemberService extends BaseService<Member,Long>{
    public Map dataTable(String searchText, int sEcho);
    public Member login(Member member);
}
