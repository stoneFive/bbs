package com.zx.sys.service.impl;

import com.zx.entity.model.Device;
import com.zx.sys.repository.DeviceRepository;
import com.zx.sys.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lance
 * on 2017/4/8.
 */
@Service("deviceService")
public class DeviceServiceImpl extends BaseServiceImpl<Device,Long,DeviceRepository> implements DeviceService {

    @Autowired
    @Override
    public void setEntityRepository(DeviceRepository deviceRepository) {
        this.repository = deviceRepository;
    }
}
