package com.netease.seckill.service;

import com.netease.seckill.entity.User;

/**
 * Created by come on 2017/3/2.
 */
public interface UserService {
    public User CheckLogin(String username, String password);
}
