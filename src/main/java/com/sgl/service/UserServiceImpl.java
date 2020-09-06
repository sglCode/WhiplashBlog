package com.sgl.service;

import com.sgl.dao.UserMapper;
import com.sgl.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by sgl on 2020/5/6.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {

        this.userMapper = userMapper;
    }

    public void addUser(User user) {
        userMapper.addUser(user);
    }

    public void delUser(int id) {
        userMapper.delUser(id);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    public User findUser(Integer id) {
        return userMapper.findUser(id);
    }

    @Override
    public User findUserByUsername(String username) {
        return userMapper.findUserByUsername(username);
    }

    public int ifUserExist(User user){
        User a= userMapper.findUserByUsername(user.getUsername());
        if (a!=null&&a.getUsername().equals(user.getUsername())&&a.getPassword().equals(user.getPassword())){
            return 1;
        }else {
            return 0;
        }
    }

    @Override
    public List<User> userList() {
        return userMapper.userList();
    }

}
