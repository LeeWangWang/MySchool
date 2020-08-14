package dao;

import domain.examPolicy;

import java.util.ArrayList;

public interface examPolicyDao {
    public ArrayList<examPolicy> queryAllPolicy() throws Exception;
    public boolean addNewPolicy(String title, String content) throws Exception;
    public boolean updatePolicy(int id, String title, String content) throws Exception;
}
