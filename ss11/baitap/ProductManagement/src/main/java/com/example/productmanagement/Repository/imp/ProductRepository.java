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
        productList.add(new Product(1 , "Sasung" , 30000));
        productList.add(new Product(1 , "Samung" , 30000));
        productList.add(new Product(1 , "Nokia" , 30000));
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
    public List<Product> findId(String id) {
        List<Product> productList1 = new ArrayList<>();
        for (Product element: productList) {
            if(element.getName().equals(id)){
                productList1.add(element);
                return productList1;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if(productList.get(i).getId() == id ){
                productList.set(i , product);
                break;
            }
        }
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if(productList.get(i).getId() == id ){
                productList.remove(i);
                break;
            }
        }
    }
}
