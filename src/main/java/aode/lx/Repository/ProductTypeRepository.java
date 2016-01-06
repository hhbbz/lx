package aode.lx.Repository;

import aode.lx.model.ProductType;
import org.springframework.data.jpa.repository.QueryHints;

import javax.persistence.QueryHint;
import java.util.List;

/**
*@author: 黄柏樟
*@date: 2015/6/19
*@explain:
*/
public interface ProductTypeRepository extends BaseJapRepository<ProductType,Long> {

    /**
     * 产品类型设置缓存
     * @return List
     */
    @QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
    List<ProductType> findAll();

}
