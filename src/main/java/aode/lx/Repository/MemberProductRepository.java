package aode.lx.Repository;

import aode.lx.model.MemberProduct;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * Created by 黄柏樟 on 2015/7/22.
 * @Explain:
 */
public interface MemberProductRepository extends BaseJapRepository<MemberProduct,String> {
    @Modifying
    @Query(value = "delete from MemberProduct m where m.id IN (:ids)")
    void deleteIds(@Param("ids") String[] ids);
}
