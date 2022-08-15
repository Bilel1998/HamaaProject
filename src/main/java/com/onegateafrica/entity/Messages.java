package com.onegateafrica.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
public class Messages {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idMsg;
    private Long idReciever;
    private Long idSender;
    private String field;
    @JsonFormat(pattern="EEE dd HH:mm")
    private Timestamp time;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "messages_id")
    private Users messages;

    public Users getMessages() {
        return messages;
    }

    public void setMessages(Users messages) {
        this.messages = messages;
    }



    public Messages(Long idReciever, Long idSender, String field, Timestamp time) {
        this.idReciever = idReciever;
        this.idSender = idSender;
        this.field = field;
        this.time = time;
    }

    public Messages() {

    }


    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Long getIdSender() {
        return idSender;
    }

    public void setIdSender(Long idSender) {
        this.idSender = idSender;
    }

    public Long getIdReciever() {
        return idReciever;
    }

    public void setIdReciever(Long idReciever) {
        this.idReciever = idReciever;
    }

    public Long getIdMsg() {
        return idMsg;
    }

    public void setIdMsg(Long idMsg) {
        this.idMsg = idMsg;
    }
}
