package dao;

import domain.CollegeFraction;

import java.util.List;

public interface CollegeFractionDao {
    List<CollegeFraction> selectCollegeFractionByCollegeId(int collegeId) throws Exception;
}
