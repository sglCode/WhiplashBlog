package com.sgl.dao;

import com.sgl.pojo.User;

import java.util.List;

/**
 * Created by sgl on 2020/5/6.
 */
public interface UserMapper {

    void addUser(User user);

    void delUser(int id);

    void updateUser(User user);

    User findUser(Integer id);

    User findUserByUsername(String username);

    int ifUserExist(User user);

    List<User> userList();
}
