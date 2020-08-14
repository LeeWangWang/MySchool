package service.impl;


import dao.impl.UserDaoImpl;
import dao.UserDao;

import domain.User;
import service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDaoImpl();

    @Override
    public User login(User user){
        return dao.findUserByUsernameAndPassword(user.getAccount(),user.getPassword());
    }


}
