package service.impl;

import dao.CousesVideoDao;
import dao.impl.CousesVideoDaoImpl;
import domain.CousesVideo;
import domain.VideoPageBean;
import service.CousesVideoService;

import java.util.List;


public class CousesVideoServiceImpl implements CousesVideoService {
    private CousesVideoDao dao = new CousesVideoDaoImpl();
    @Override
    public Boolean addVideo(CousesVideo cousesVideo) {
        return dao.addVideo(cousesVideo);
    }

    public VideoPageBean findVideoByPage(String _rows, String _currentPage) {
        int rows = Integer.parseInt(_rows);
        int currentPage = Integer.parseInt(_currentPage);
        int totalCount = dao.findTotalCount();
        int tatalPage = (totalCount % rows==0)?(totalCount / rows):(totalCount / rows+1);
        if (currentPage<1){
            currentPage=1;
        }
        if (currentPage>tatalPage){
            currentPage=tatalPage;
        }
        int start = (currentPage-1)*rows;
        List<CousesVideo> list = dao.findByPage(start,rows);

        VideoPageBean videoPageBean = new VideoPageBean(totalCount,tatalPage,list,currentPage,rows);

        return videoPageBean;

    }
}
