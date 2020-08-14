package service.impl;

import dao.impl.examPolicyDaoImpl;
import domain.examPolicy;
import service.examPolicyService;

import java.util.ArrayList;

public class examPolicyServiceImpl implements examPolicyService {

    @Override
    public ArrayList<examPolicy> queryAllPolicy() {
        ArrayList<examPolicy> ae = new ArrayList<examPolicy>();
        try{
            examPolicyDaoImpl e = new examPolicyDaoImpl();
            ae = e.queryAllPolicy();
            /*for (int i = 0;i < ae.size();i++){
                System.out.println(ae.get(i).getTime());
            }*/
            return ae;
        }catch (Exception e){
            e.printStackTrace();
        }
        return ae;
    }

    @Override
    public boolean addNewPolicy(String title, String content) {
        Boolean flag = false;
        try{
            examPolicyDaoImpl e = new examPolicyDaoImpl();
            flag = e.addNewPolicy(title,content);
            if (flag == true) {
                return flag;
            }else{
                return flag;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updatePolicy(int id, String title, String content) {
        Boolean flag = false;
        try{
            examPolicyDaoImpl e = new examPolicyDaoImpl();
            flag = e.updatePolicy(id,title,content);
            if (flag == true) {
                return flag;
            }else{
                return flag;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }


    public static void main(String[] args){
        examPolicyServiceImpl epl = new examPolicyServiceImpl();
        epl.queryAllPolicy();
    }
}
