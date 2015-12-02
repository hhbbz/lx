package aode.lx.service.impl;

import aode.lx.Repository.AttachmentRepository;
import aode.lx.Repository.BaseJapRepository;
import aode.lx.model.Attachment;
import aode.lx.service.AttachmentService;
import aode.lx.utils.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
*@author: 黄柏樟
*@date: 2015/6/20
*@explain:
*/
@Service("attachmentService")
public class AttachmentServiceImpl extends BaseServiceImpl<Attachment,String> implements AttachmentService {
    @Autowired
    private AttachmentRepository attachmentRepository;
    public BaseJapRepository<Attachment, String> getRepository(){
        return this.attachmentRepository;
    }
    public List<Attachment> findByPid(String pid){
        return this.attachmentRepository.findByPid(pid);
    }
    @Override
    public void delete(String id){
        this.attachmentRepository.delete(id);
    }
    @Override
    public void delete(Attachment attachment){
        this.attachmentRepository.delete(attachment.getFileName());
    }

    @Override
    public void clear(String realPath) {
        List<Attachment> attachments= findByPid(null);
        if (attachments!=null){
            for (Attachment attachment:attachments){
                FileUploadUtil.deleteFile(realPath,FileUploadUtil.ATTACHMENT_PATH,attachment.getFileName());
                delete(attachment);
            }
        }
    }
}
