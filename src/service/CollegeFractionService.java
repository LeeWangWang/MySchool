package service;

import domain.CollegeFraction;

import java.util.List;

public interface CollegeFractionService {
    public List<CollegeFraction> selectCollegeFractionByCollegeId(int collegeId);
}
