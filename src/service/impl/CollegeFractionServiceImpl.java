package service.impl;

import dao.CollegeFractionDao;
import domain.CollegeFraction;
import service.CollegeFractionService;

import java.util.List;

public class CollegeFractionServiceImpl implements CollegeFractionService {
    private CollegeFractionDao collegeFractionDao;
    public CollegeFractionServiceImpl(CollegeFractionDao collegeFractionDao){
        this.collegeFractionDao = collegeFractionDao;
    }
    @Override
    public List<CollegeFraction> selectCollegeFractionByCollegeId(int collegeId) {
        try {
            return collegeFractionDao.selectCollegeFractionByCollegeId(collegeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
