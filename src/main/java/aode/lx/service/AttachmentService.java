package aode.lx.service;

import aode.lx.model.Attachment;

import java.util.List;

/**
 * Created by 黄柏樟 on 2015/11/17.
 * @Explain:
 */
public interface AttachmentService extends BaseService<Attachment,String> {
    public List<Attachment> findByPid(String pid);
    public void clear(String realPath);
}
