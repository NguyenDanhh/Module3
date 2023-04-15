package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    void create(User user);
    void delete(int id );
    void update(User user);
}
