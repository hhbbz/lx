package aode.lx.service;

import aode.lx.Repository.BaseJapRepository;
import aode.lx.persistence.SearchFilter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by 黄柏樟 on 2015/6/2.
 */
public interface BaseService<T, ID extends Serializable> {
    public abstract BaseJapRepository<T, ID> getRepository();

    /**
     * 保存单个实体
     *
     *            实体
     * @return 返回保存的实体
     */
    public T save(T entity) ;

    public List<T> save(List<T> entity) ;

    public T saveAndFlush(T entity);

    /**
     * 根据主键删除相应实体
     *
     * @param id
     *            主键
     */
    public void delete(ID id);

    /**
     * 根据ID删除
     *
     *            实体
     */
    public void delete(ID[] ids);

    /**
     * 根据ID删除
     *
     *            实体
     */
    public void delete(Iterable<ID> ids);

    /**
     * 删除实体
     *
     *            实体
     */
    public void delete(T entity);

    /**
     * 根据主键删除相应实体
     *
     *            实体
     */
    public void deleteInBatch(Iterable<T> entities);

    /**
     * 按照主键查询
     *
     * @param id
     *            主键
     * @return 返回id对应的实体
     */
    public T findOne(ID id);

    /**
     * 实体是否存在
     *
     * @param id
     *            主键
     * @return 存在 返回true，否则false
     */
    public boolean exists(ID id);

    /**
     * 统计实体总数
     *
     * @return 实体总数
     */
    public long count();

    /**
     * 查询所有实体
     *
     * @return
     */
    public List<T> findAll();

    /**
     * 按照顺序查询所有实体
     *
     * @param sort
     * @return
     */
    public List<T> findAll(Sort sort);

    /**
     * 分页及排序查询实体
     *
     *            分页及排序数据
     * @return
     */
    public Page<T> findAllPaginated() ;


    /**
     * 按页面传来的查询条件查询.
     */
    public List<T> search(Map<String, SearchFilter> additionalFilters, Sort sort);
    public List<T> search(Map<String, SearchFilter> additionalFilters, Pageable pageable);
    public List<T> search(Pageable pageable);
    public List<T> search(Sort sort);
    public List<T> search();
    public List<T> search(Map<String, SearchFilter> additionalFilters);
    public Long searchCount(Map<String, SearchFilter> additionalFilters) ;
    public Long searchCount();

    /**
     * Returns a single entity matching the given {@link Specification}.
     *
     * @param spec
     * @return
     */
    public T findOne(Specification<T> spec);


    public Page<T> searchPaginated(Map<String, SearchFilter> additionalFilters, Pageable pageable);
    public Page<T> searchPaginated(Map<String, SearchFilter> additionalFilters);
    public Page<T> searchPaginated();
}
