package com.example.productmanagement.Repository.imp;

import com.example.productmanagement.Model.Product;
import com.example.productmanagement.Repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1 , "Bóng " , 120000));
        productList.add(new Product(1 , "Iphone " , 130000));
        productList.add(new Product(1 , "Sámung" , 30000));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void create(Product product) {
        productList.add(product);
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
