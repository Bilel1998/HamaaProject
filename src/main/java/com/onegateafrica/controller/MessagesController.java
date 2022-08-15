package com.onegateafrica.controller;

import com.onegateafrica.entity.Messages;
import com.onegateafrica.entity.Users;
import com.onegateafrica.repository.MessagesRespository;
import com.onegateafrica.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.*;

@RequestMapping("/oauth")
@RestController
public class MessagesController {

    @Autowired
    private UsersRepository usersRepository;


    @Autowired
    private MessagesRespository messagesRespository;

    @GetMapping("/checkMessages/{id}")
    public List<Messages> check(@PathVariable(value = "id") Long id ) {

        Users user =usersRepository.findById(id).get();
        return user.getMsg();
    }

    @GetMapping("/checkMessagesbetweentwo/{idsender}/{idreciever}")
    public List<Messages> checkbetweentwo(@PathVariable(value = "idsender") Long idsender,@PathVariable(value = "idreciever") Long idreciever  ) {
        Users user =usersRepository.findById(idreciever).get();
        List<Messages> messages =user.getMsg();
        List<Messages> test= new ArrayList<Messages>() ;

        for(Messages item : messages) {
            if ((item.getIdSender() == idsender && item.getIdReciever()==idreciever)||((item.getIdSender()==idreciever) &&
            item.getIdReciever()==idsender)) {
                test.add(item);
            }
        }
        return test;
    }
    @GetMapping("/lastmessage/{idsender}/{idreciever}")
    public Messages lastmessage(@PathVariable(value = "idsender") Long idsender,@PathVariable(value = "idreciever") Long idreciever  ) {
        Users user =usersRepository.findById(idreciever).get();
        List<Messages> messages =user.getMsg();
        List<Messages> test= new ArrayList<Messages>() ;
        for(Messages item : messages) {
            if ((item.getIdSender() == idsender && item.getIdReciever()==idreciever)||((item.getIdSender()==idreciever) &&
                    item.getIdReciever()==idsender)) {
                    test.add(item);
            }
        }
        Messages lastMessage= test.get(test.size()-1);
        return lastMessage;
    }

      @DeleteMapping("/deletemsg/{idmsg}")
      public void deletemessage(@PathVariable(value="idmsg") Long idmsg)
      {
          System.err.println(idmsg);
          messagesRespository.findById(idmsg).get().setMessages(null);
          messagesRespository.deleteById(idmsg);
      }



    @GetMapping("/allsenders/{idreciever}")
    public HashMap<Long,String> checksender(@PathVariable(value = "idreciever") Long idreciever  ) {
        Users user =usersRepository.findById(idreciever).get();
        List<Messages> messages =user.getMsg();
        Set<Long> setListofSenders = new HashSet<Long>();
        Map<Long, String> map = new HashMap<>();
        for(Messages item : messages) {
            if (item.getIdReciever() == idreciever){

                setListofSenders.add(item.getIdSender());}
        }
        for (Long sender:setListofSenders){
            String user2= usersRepository.findById(sender).get().getEmail();
            map.put(sender,user2);
        }
        return (HashMap<Long, String>) map;
    }






    @PostMapping("/senddata")
    public Messages sendData (@RequestBody Messages messages ){
        Users user = usersRepository.findById(messages.getIdReciever()).get();
        System.err.println(messages.getIdReciever());
        Users user1 = usersRepository.findById(messages.getIdSender()).get();
        System.err.println(messages.getIdSender());
        Messages msg = new Messages(messages.getIdReciever(),messages.getIdSender(),messages.getField(),new Timestamp(System.currentTimeMillis()));
        List<Messages> Listofhistory= user.getMsg();
        Messages msg1 = new Messages(messages.getIdReciever(),messages.getIdSender(),messages.getField(),new Timestamp(System.currentTimeMillis()));

        List<Messages>Listofmyhistory=user1.getMsg();
        Listofhistory.add(msg);
        Listofmyhistory.add(msg1);
        user1.setMsg(Listofmyhistory);
        user.setMsg(Listofhistory);
        //addtosenderto
        return messagesRespository.save(msg);
    }







}
