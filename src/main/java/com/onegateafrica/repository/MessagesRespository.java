package com.onegateafrica.repository;

import com.onegateafrica.entity.Messages;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MessagesRespository extends JpaRepository<Messages, Long> {
}
