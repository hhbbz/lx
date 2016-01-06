package aode.lx.Repository;

import aode.lx.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.QueryHints;

import javax.persistence.QueryHint;


/**
*@author: 黄柏樟
*@date: 2015/6/19
*@explain:
*/
public interface ProductRepository extends BaseJapRepository<Product,String> {

    /**
     * 设置缓存
     * @param spec
     * @param pageable
     * @return
     */
    @QueryHints({@QueryHint(name=org.hibernate.ejb.QueryHints.HINT_CACHEABLE,value="true")})
    Page<Product> findAll(Specification<Product> spec, Pageable pageable);
}
