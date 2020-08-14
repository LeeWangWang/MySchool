package dao;


import domain.User;

/**
 * 用户操作的DAO
 */
public interface UserDao {
    public User findUserByUsernameAndPassword(String username, String password);
}
