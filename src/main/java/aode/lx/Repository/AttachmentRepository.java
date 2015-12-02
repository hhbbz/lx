package aode.lx.Repository;

import aode.lx.model.Attachment;

import java.util.List;

/**
*@author: 黄柏樟
*@date: 2015/6/20
*@explain:
*/
public interface AttachmentRepository extends BaseJapRepository<Attachment,String> {
    public List<Attachment> findByPid(String pid);
}
