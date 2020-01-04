package service.impl;

import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import service.CategoryService;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 19:46
 * @Description:
 */
public class CategoryServiceImpl implements CategoryService {

    private CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public List<String> findAll() {
        return categoryDao.findAll();
    }
}
