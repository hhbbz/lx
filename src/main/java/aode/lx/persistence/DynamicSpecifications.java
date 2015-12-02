/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package aode.lx.persistence;

import aode.lx.utils.Collections3;
import aode.lx.utils.EnumUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.ejb.criteria.CriteriaBuilderImpl;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.*;
import java.util.Collection;
import java.util.List;
public class DynamicSpecifications {

	public static <T> Specification<T> bySearchFilter(final Collection<SearchFilter> filters, final Class<T> entityClazz) {
		return new Specification<T>() {
			@Override
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				if (Collections3.isNotEmpty(filters)) {

					List<Predicate> predicates = Lists.newArrayList();
					List<Predicate> ORpredicates = Lists.newArrayList();

					for (SearchFilter filter : filters) {
						// nested path translate, 如Task的名为"user.name"的filedName, 转换为Task.user.name属性
						String[] names = StringUtils.split(filter.fieldName, ".");
						Path expression = root.get(names[0]);
						for (int i = 1; i < names.length; i++) {
							expression = expression.get(names[i]);
						}
						
						Object value=filter.value;
						
                                                if(expression.getJavaType().isEnum()){
                                                    value= EnumUtils.valueOf(expression.getJavaType(), filter.value.toString());
                                                    predicates.add(builder.equal(expression, value));
                                                }else{
                                    // logic operator
                                    switch (filter.operator) {
                                        case EQ:
                                            predicates.add(builder.equal(expression, filter.value));
                                            break;
                                        case LIKE:
                                            predicates.add(builder.like(expression, "%" + filter.value + "%"));
                                            break;
                                        case GT:
                                            predicates.add(builder.greaterThan(expression, (Comparable) filter.value));
                                            break;
                                        case LT:
                                            predicates.add(builder.lessThan(expression, (Comparable) filter.value));
                                            break;
                                        case GTE:
                                            predicates.add(builder.greaterThanOrEqualTo(expression, (Comparable) filter.value));
                                            break;
                                        case LTE:
                                            predicates.add(builder.lessThanOrEqualTo(expression, (Comparable) filter.value));
                                            break;
                                        case NEQ:
                                            predicates.add(builder.notEqual(expression, filter.value));
                                            break;
                                        case NOTNULL:
                                            predicates.add(builder.isNotNull(expression));
                                            break;
                                        case ISNULL:
                                            predicates.add(builder.isNull(expression));
                                            break;
                                        case OREQ:
                                            ORpredicates.add(builder.equal(expression, filter.value));
                                            break;
                                        case ORLIKE:
                                            ORpredicates.add(builder.like(expression, "%" + filter.value + "%"));
                                            break;
                                        case ORGT:
                                            ORpredicates.add(builder.greaterThan(expression, (Comparable) filter.value));
                                            break;
                                        case ORLT:
                                            ORpredicates.add(builder.lessThan(expression, (Comparable) filter.value));
                                            break;
                                        case ORGTE:
                                            ORpredicates.add(builder.greaterThanOrEqualTo(expression, (Comparable) filter.value));
                                            break;
                                        case ORLTE:
                                            ORpredicates.add(builder.lessThanOrEqualTo(expression, (Comparable) filter.value));
                                            break;
                                        case ORNEQ:
                                            ORpredicates.add(builder.notEqual(expression, filter.value));
                                            break;
                                        case ORNOTNULL:
                                            ORpredicates.add(builder.isNotNull(expression));
                                            break;
                                        case ORISNULL:
                                            ORpredicates.add(builder.isNull(expression));
                                            break;
                                    }
                                                }
						
						
					}

					// 将所有条件用 and 联合起来
                    if (!predicates.isEmpty()&&!ORpredicates.isEmpty()) {
                        return builder.and(builder.and(predicates.toArray(new Predicate[predicates.size()])),builder.or(ORpredicates.toArray(new Predicate[ORpredicates.size()])));
                    }
					if (!predicates.isEmpty()) {
						return builder.and(predicates.toArray(new Predicate[predicates.size()]));
					}
                    if (!ORpredicates.isEmpty()){
                        return builder.or(ORpredicates.toArray(new Predicate[ORpredicates.size()]));
                    }
				}
				return builder.conjunction();
			}
		};
	}
}
