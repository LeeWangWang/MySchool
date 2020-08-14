package service;

import domain.CousesVideo;
import domain.VideoPageBean;

/**
 * 用户管理的业务接口
 */
public interface CousesVideoService {

    /**
     * 查询所有用户信息
     * @return
     */

    public Boolean addVideo(CousesVideo cousesVideo);
    public VideoPageBean findVideoByPage(String rows, String currentPage);
}
