package com.onegateafrica.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.onegateafrica.service.AdminOGAService;
import com.onegateafrica.service.AgenceService;

@RestController
@RequestMapping("/api/")
@CrossOrigin(origins = "http://localhost:3000")
public class AdminOGAController {

  private final AdminOGAService adminOGAService;

  @Autowired
  public AdminOGAController(AdminOGAService adminOGAService) {
    this.adminOGAService = adminOGAService;
  }

}
