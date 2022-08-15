package com.onegateafrica.security.services;

import com.onegateafrica.entity.Users;


public class UserFactory {
  public static UserDetailsImpl build(Users user){

    return new UserDetailsImpl(user.getId(),user.getEmail(), user.getPassword());
  }
}
