package com.example.productmanagement.Service.imp;

import com.example.productmanagement.Model.Product;
import com.example.productmanagement.Repository.IProductRepository;
import com.example.productmanagement.Repository.imp.ProductRepository;
import com.example.productmanagement.Service.IProductService;

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
    public Product findId(int id) {
        return null;
    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public void remove(int id) {

    }


}
