package aode.lx.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

import java.io.Serializable;

/**
 *Repository支持类
 * @param <T>实体
 * @param <ID> 实体id的数据类型
 */
@NoRepositoryBean
public interface BaseJapRepository<T, ID extends Serializable> extends
		JpaRepository<T, ID>, JpaSpecificationExecutor<T> {



}
