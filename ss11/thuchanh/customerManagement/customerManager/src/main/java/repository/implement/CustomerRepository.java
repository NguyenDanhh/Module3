package repository.implement;

import model.Customer;
import repository.ICustomerRepository;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer(1 , "Danh" , "danhnguyen@gmail.com" , "Đà Nẵng"));
        customerList.add(new Customer(2 , "Hưng" , "hungngo@gmail.com" , "Đà Nẵng"));
        customerList.add(new Customer(3 , "Huy" , "huynguyen@gmail.com" , "Quảng Nam"));
        customerList.add(new Customer(4 , "Trí" , "triphan@gmail.com" , "Huế"));
        customerList.add(new Customer(5 , "Hoàng" , "hoangnguyen@gmail.com" , "Quảng trị"));
    }

    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public void save(Customer customer) {

    }

    @Override
    public Customer findId(int id) {
        return null;
    }

    @Override
    public void update(int id, Customer customer) {

    }

    @Override
    public void remove(int id) {

    }
}
