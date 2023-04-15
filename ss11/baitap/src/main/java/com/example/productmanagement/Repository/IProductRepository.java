package ss11.baitap.src.main.java.com.example.productmanagement.Repository;

import ss11.baitap.src.main.java.com.example.productmanagement.Model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void create(Product product);
    List<Product> findId(String id);
    void update(int id , Product product);
    void remove(int id);
}
