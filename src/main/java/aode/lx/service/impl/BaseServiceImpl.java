/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package aode.lx.service.impl;

import aode.lx.Repository.BaseJapRepository;
import aode.lx.persistence.DynamicSpecifications;
import aode.lx.persistence.SearchFilter;
import aode.lx.service.BaseService;
import aode.lx.utils.PageRequestBulider;
import aode.lx.utils.Reflections;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * 抽象service层基类 提供一些简便方法
 * <p/>
 * <p>
 * 泛型 ： T 表示实体类型；ID表示主键类型
 * <p/>
 * <p>
 * User:
 * <p>
 * Date: 13-1-12 下午4:43
 * <p>
 * Version: 1.0
 */
public abstract class BaseServiceImpl<T, ID extends Serializable> implements BaseService<T,ID> {


    protected Class<T> entityClass = Reflections.getClassGenricType(getClass());

    public abstract BaseJapRepository<T, ID> getRepository();

    /**
     * 保存单个实体
     *
     *            实体
     * @return 返回保存的实体
     */
    @Override
    public T save(T entity) {

        return getRepository().save(entity);
    }
    @Override
    public List<T> save(List<T> entity) {
        return getRepository().save(entity);
    }
    @Override
    public T saveAndFlush(T entity) {
        return getRepository().saveAndFlush(entity);
    }

    /**
     * 根据主键删除相应实体
     *
     * @param id
     *            主键
     */
    @Override
    public void delete(ID id) {
        getRepository().delete(id);
    }

    /**
     * 根据ID删除
     *
     *            实体
     */
    @Override
    public void delete(ID[] ids) {
        for (ID id : ids) {
            getRepository().delete(id);
        }
    }

    /**
     * 根据ID删除
     *
     *            实体
     */
    @Override
    public void delete(Iterable<ID> ids) {
        for (ID id : ids) {
            getRepository().delete(id);
        }
    }

    /**
     * 删除实体
     *
     *            实体
     */
    @Override
    public void delete(T entity) {
        getRepository().delete(entity);
    }

    /**
     * 根据主键删除相应实体
     *
     *            实体
     */
    @Override
    public void deleteInBatch(Iterable<T> entities) {
        getRepository().deleteInBatch(entities);
    }

    /**
     * 按照主键查询
     *
     * @param id
     *            主键
     * @return 返回id对应的实体
     */
    @Override
    public T findOne(ID id) {
        return getRepository().findOne(id);
    }

    /**
     * 实体是否存在
     *
     * @param id
     *            主键
     * @return 存在 返回true，否则false
     */
    @Override
    public boolean exists(ID id) {
        return getRepository().exists(id);
    }

    /**
     * 统计实体总数
     *
     * @return 实体总数
     */
    @Override
    public long count() {
        return getRepository().count();
    }

    /**
     * 查询所有实体
     *
     * @return
     */
    @Override
    public List<T> findAll() {
        return getRepository().findAll();
    }

    /**
     * 按照顺序查询所有实体
     *
     * @param sort
     * @return
     */
    @Override
    public List<T> findAll(Sort sort) {
        return getRepository().findAll(sort);
    }

    /**
     * 分页及排序查询实体
     *
     *            分页及排序数据
     * @return
     */
    @Override
    public Page<T> findAllPaginated() {
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
        PageRequest pageRequest = PageRequestBulider.getPageRequest(request);
        return getRepository().findAll(pageRequest);
    }


    /**
     * 按页面传来的查询条件查询.
     */
    @Override
    public List<T> search(Map<String, SearchFilter> additionalFilters,Sort sort) {
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
        Map<String, SearchFilter> filters = SearchFilter.parse(request);
        addAdditionalFilters(filters, additionalFilters);
        Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), this.entityClass);
        List<T> list = this.getRepository().findAll(spec, sort);
        return list;
    }
    @Override
    public List<T> search(Map<String, SearchFilter> additionalFilters,Pageable pageable) {
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
        Map<String, SearchFilter> filters = SearchFilter.parse(request);
        addAdditionalFilters(filters, additionalFilters);
        Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(), this.entityClass);
        List<T> list = this.getRepository().findAll(spec, pageable).getContent();
        return list;
    }
    @Override
    public List<T> search(Pageable pageable) {
        List<T> list = search(null, pageable);
        return list;
    }
    @Override
    public List<T> search(Sort sort) {
        return search(null,sort);
    }
    @Override
    public List<T> search() {
        return  this.getRepository().findAll();
    }
    @Override
    public List<T> search(Map<String, SearchFilter> additionalFilters) {
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
        Map<String, SearchFilter> filters = SearchFilter.parse(request);
        addAdditionalFilters(filters, additionalFilters);
        Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(),this.entityClass);
        List<T> list = this.getRepository().findAll(spec);
        return list;
    }
    @Override
    public Long searchCount(Map<String, SearchFilter> additionalFilters) {
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
        Map<String, SearchFilter> filters = SearchFilter.parse(request);
        addAdditionalFilters(filters, additionalFilters);
        Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(),this.entityClass);
        long list = this.getRepository().count(spec);
        return list;
    }
    @Override
    public Long searchCount() {
        return searchCount(null);
    }

    /**
     * Returns a single entity matching the given {@link Specification}.
     *
     * @param spec
     * @return
     */
    @Override
    public T findOne(Specification<T> spec) {
        return this.getRepository().findOne(spec);
    }



    protected void addAdditionalFilters(Map<String, SearchFilter> primaryFilters, Map<String, SearchFilter> additionalFilters) {
        if (additionalFilters != null) {
            for (String k : additionalFilters.keySet()) {
                if (!primaryFilters.containsKey(k)) {
                    primaryFilters.put(k, additionalFilters.get(k));
                }
            }
        }
    }
    @Override
    public Page<T> searchPaginated(Map<String, SearchFilter> additionalFilters) {
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
        PageRequest pageRequest = PageRequestBulider.getPageRequest(request);
        Map<String, SearchFilter> filters = SearchFilter.parse(request);
        addAdditionalFilters(filters, additionalFilters);
        Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(),this.entityClass);
        Page<T> page = null;
        page = this.getRepository().findAll(spec, pageRequest);
        return page;
    }
    @Override
    public Page<T> searchPaginated(Map<String, SearchFilter> additionalFilters,Pageable pageable){
        RequestAttributes ar = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) ar).getRequest();
        Map<String, SearchFilter> filters = SearchFilter.parse(request);
        addAdditionalFilters(filters, additionalFilters);
        Specification<T> spec = DynamicSpecifications.bySearchFilter(filters.values(),this.entityClass);
        Page<T> page = null;
        page = this.getRepository().findAll(spec, pageable);
        return page;
    }
    @Override
    public Page<T> searchPaginated() {
        return this.searchPaginated(null);
    }
}
