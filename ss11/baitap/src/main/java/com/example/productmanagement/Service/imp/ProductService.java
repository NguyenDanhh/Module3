package ss11.baitap.src.main.java.com.example.productmanagement.Service.imp;

import ss11.baitap.src.main.java.com.example.productmanagement.Model.Product;
import ss11.baitap.src.main.java.com.example.productmanagement.Repository.IProductRepository;
import ss11.baitap.src.main.java.com.example.productmanagement.Repository.imp.ProductRepository;
import ss11.baitap.src.main.java.com.example.productmanagement.Service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return iProductRepository.findAll();
    }

    @Override
    public void create(Product product) {
        iProductRepository.create(product);
    }

    @Override
    public List<Product> findId(String id) {
        return iProductRepository.findId(id);
    }

    @Override
    public void update(int id, Product product) {
        iProductRepository.update(id , product);
    }

    @Override
    public void remove(int id) {
        iProductRepository.remove(id);
    }


}
