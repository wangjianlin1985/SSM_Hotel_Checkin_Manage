package dingzhen.dao.info;

import org.springframework.stereotype.Repository;

import dingzhen.common.base.BaseDao;
import dingzhen.entity.info.Arrange;

@Repository
public interface ArrangeDao extends BaseDao<Arrange>{

	public int updatePrice(Arrange arrange);
	
	public int updateStatus(Arrange arrange);
	public int updateStatusByDateAndRoom(Arrange arrange);
}
