package dingzhen.service.impl.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.common.base.BaseServiceImpl;
import dingzhen.dao.info.ArrangeDao;
import dingzhen.entity.info.Arrange;
import dingzhen.service.info.ArrangeService;

@Service
public class ArrangeServiceImpl extends BaseServiceImpl<Arrange> implements ArrangeService {

	@Autowired
	private ArrangeDao dao;
	
	@Override
	public int updatePrice(Arrange arrange) {
		return dao.updatePrice(arrange);
	}

	@Override
	public int updateStatus(Arrange arrange) {
		return dao.updateStatus(arrange);
	}

	@Override
	public int updateStatusByDateAndRoom(Arrange arrange) {
		return dao.updateStatusByDateAndRoom(arrange);
	}

}
