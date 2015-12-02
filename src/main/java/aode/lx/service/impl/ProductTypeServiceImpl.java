package aode.lx.service.impl;

import aode.lx.Repository.BaseJapRepository;
import aode.lx.Repository.ProductTypeRepository;
import aode.lx.model.ProductType;
import aode.lx.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by admin on 2015/6/19.
 */
@Service("productTypeService")
public class ProductTypeServiceImpl  extends BaseServiceImpl<ProductType,Long> implements ProductTypeService {
    @Autowired
    private ProductTypeRepository productTypeRepository;
    public BaseJapRepository<ProductType, Long> getRepository() {
        return productTypeRepository;
    }
}
