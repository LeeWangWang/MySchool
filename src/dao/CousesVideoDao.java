package dao;

import domain.CousesVideo;

import java.util.List;

/**
 * 用户管理的业务接口
 */
public interface CousesVideoDao {

    /**
     * 查询所有用户信息
     * @return
     */

    public Boolean addVideo(CousesVideo cousesVideo);
    public int findTotalCount();

    public List<CousesVideo> findByPage(int start, int rows);

}
