package com.zx.sys.service.impl;

import com.zx.entity.model.News;
import com.zx.entity.model.Notes;
import com.zx.sys.repository.NewsRepository;
import com.zx.sys.repository.NotesRepository;
import com.zx.sys.service.NewsService;
import com.zx.sys.service.NotesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lance
 * on 2017/4/15.
 */
@Service("notesService")
public class NotesServiceImpl extends BaseServiceImpl<Notes,Long,NotesRepository> implements NotesService {

    @Autowired
    @Override
    public void setEntityRepository(NotesRepository notesRepository) {
        this.repository = notesRepository;
    }
}
