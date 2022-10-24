package com.koreait.dao;

import com.koreait.dto.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public boolean join(UserDTO newUser) {



        return false;
    }
}
