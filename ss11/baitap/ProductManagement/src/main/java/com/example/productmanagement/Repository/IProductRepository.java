package com.example.productmanagement.Repository;

import com.example.productmanagement.Model.Product;
import com.example.productmanagement.Repository.imp.ProductRepository;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void create(Product product);
    List<Product> findId(String id);
    void update(int id , Product product);
    void remove(int id);
}
