package service;

import domain.examPolicy;
import domain.highSchool;

import java.util.ArrayList;

public interface examPolicyService {
    public ArrayList<examPolicy> queryAllPolicy();
    public boolean addNewPolicy(String title, String content);
    public boolean updatePolicy(int id, String title, String content);
}
