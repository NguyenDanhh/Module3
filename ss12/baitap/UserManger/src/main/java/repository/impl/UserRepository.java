package repository.impl;

import model.User;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static repository.impl.BaseConnection.getConnection;

public class UserRepository implements IUserRepository {
    private static final String SELECT_ALL_USER = "select * from users";
    private static final String SAVE_USER = "insert into users(name,email,country) value(?,?,?)";
    private static final String UPDATE_USER_BY_ID = "update users set name = ?, email = ?, country = ? where id = ?;";

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
            BaseConnection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public void create(User user) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SAVE_USER)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(User user) {
       try(Connection connection = getConnection() ; PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_BY_ID)){
           preparedStatement.setInt(1, user.getId());
           preparedStatement.setString(2, user.getName());
           preparedStatement.setString(3, user.getEmail());
           preparedStatement.setString(4, user.getCountry());
           preparedStatement.executeUpdate();
       } catch (SQLException e) {
           throw new RuntimeException(e);
       }
    }
}
