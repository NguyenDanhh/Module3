package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private static IUserRepository iUserRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public void create(User user) {
        iUserRepository.create(user);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(User user) {
        iUserRepository.update(user);
    }
}
