package com.panli.model;

public class Users {
    private String User_ID, Username,User_email, User_pwd;
    private int User_role;
    public Users(){
        super();
    }
    public Users(String user_ID, String username, String user_email, String user_pwd, int user_role){
        super();
        this.User_ID = user_ID;
        this.Username = username;
        this.User_email=user_email;
        this.User_pwd=user_pwd;
        this.User_role=user_role;
    }
    public Users(String user_ID,String username,String user_pwd, int user_role){
        super();
        this.User_ID = user_ID;
        this.Username = username;
        this.User_pwd=user_pwd;
        this.User_role=user_role;
    }
    public Users(String user_ID,String user_pwd){
        super();
        this.User_ID = user_ID;
        this.User_pwd=user_pwd;
    }
    public String getUser_ID(){
        return this.User_ID;
    }
    public  String getUsername(){
        return this.Username;
    }
    public String getUser_email(){
        return this.User_email;
    }
    public int getUser_role(){
        return this.User_role;
    }
   public String getUser_pwd(){
        return this.User_pwd;
    }
}
