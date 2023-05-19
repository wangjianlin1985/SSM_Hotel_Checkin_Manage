package dingzhen.service.info;

import dingzhen.common.base.BaseService;
import dingzhen.entity.info.Arrange;

public interface ArrangeService extends BaseService<Arrange>{

	public int updatePrice(Arrange arrange);
	
	public int updateStatus(Arrange arrange);
	
	public int updateStatusByDateAndRoom(Arrange arrange);
	
}
