package aode.lx.service;

import aode.lx.model.Product;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
*@author: 黄柏樟
*@date: 2015/6/19
*@explain:
*/

public interface ProductService extends BaseService<Product,String> {
    Map dataTable(String searchText, int sEcho);

    void add(Product product,MultipartFile picture);

    void update(Product product, MultipartFile picture);

}
