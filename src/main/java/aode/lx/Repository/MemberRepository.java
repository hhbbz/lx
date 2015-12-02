package aode.lx.Repository;

import aode.lx.model.Member;

/**
 * Created by 黄柏樟 on 2015/11/17.
 * @Explain:
 */
public interface MemberRepository extends BaseJapRepository<Member, Long> {
    Member findOneByLoginNameAndPassword(String loginName, String password);
}