package domain;

public class User {
    private static int role = 0;
    private static String UserID;
    private static String pass;
    public static void setUser(String cur_userID, String cur_pass,int cur_role){
        UserID = cur_userID;
        pass = cur_pass;
        role = cur_role;
    }
    public static int getRole(){
        return role;
    }
    public static String getUserID(){
        return UserID;
    }
    public static String getPass(){
        return pass;
    }
}
