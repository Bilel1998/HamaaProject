package com.onegateafrica.controller;


import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.onegateafrica.dto.OTPSystemDTO;
import com.onegateafrica.entity.Users;
import com.onegateafrica.repository.UsersRepository;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@RestController
@RequestMapping("/oauth")

@CrossOrigin(origins = "http://localhost:19003")
public class OTPSystemRestController {

  private final UsersRepository usersRepository;
  private    Map<String, OTPSystemDTO> otpData = new HashMap<>();

  public final static String NOT_FOUND = "NOT_FOUND";
  public final static String FOUND = "FOUND";

  @Autowired
  public OTPSystemRestController(UsersRepository usersRepository, Map<String, OTPSystemDTO> otpData) {
    this.usersRepository = usersRepository;
    this.otpData = otpData;
  }



  private final static String ACCOUNT_SID = "AC2cc2e3df19d7c2778e912a32183ed658";
  private final static String AUTH_ID = "8ebbddde38577c3fbb996e84edace512";

  static {
    Twilio.init(ACCOUNT_SID, AUTH_ID);
  }

  @PostMapping("/mobilenumbers/otp")
  public ResponseEntity<Object> sendOTP(@RequestBody String mobilenumber) {

    Optional<Users> existingUser = usersRepository.findByEmail(mobilenumber);
    if (existingUser.isPresent()) {
      return new ResponseEntity<>(FOUND, HttpStatus.OK);
    }
    OTPSystemDTO otpSystem = new OTPSystemDTO();
    otpSystem.setMobilenumber(mobilenumber);

    otpSystem.setOtp(String.valueOf(((int) (Math.random() * (10000 - 1000))) + 1000));
    otpSystem.setExpiretime(System.currentTimeMillis() + 150000);

    otpData.put(mobilenumber, otpSystem);
    System.out.println(otpData.get(mobilenumber));


    Message.creator(new PhoneNumber("+21693029516"), new PhoneNumber("+13232104982"), "Your OTP is: " + otpSystem.getOtp()).create();
    return new ResponseEntity<>("OTP is send successufully", HttpStatus.OK);
  }


  @PutMapping("/mobilenumbers/otp")
  public ResponseEntity<Object> verifyOTP(@RequestBody OTPSystemDTO requestBodyOTPSystem) {

    if (requestBodyOTPSystem.getOtp() == null || requestBodyOTPSystem.getOtp().trim().length() <= 0) {
      return new ResponseEntity<>("Please provide OTP", HttpStatus.OK);
    }

    Map.Entry<String, OTPSystemDTO> entry = otpData.entrySet().iterator().next();
    String key = entry.getKey();
    String x = key.substring(0, 8);
//    System.out.println(x);
//    System.out.println(x.equals(requestBodyOTPSystem.getMobilenumber()));
 System.out.println(requestBodyOTPSystem.getMobilenumber());
    System.out.println(otpData.get(requestBodyOTPSystem.getMobilenumber()));


      OTPSystemDTO otpSystem = otpData.get(key);
    //  if(otpData.containsKey(requestBodyOTPSystem.getMobilenumber())){
      if (otpSystem != null) {
        if (otpSystem.getExpiretime() >= System.currentTimeMillis()) {
          if (requestBodyOTPSystem.getOtp().equals(otpSystem.getOtp())) {
            otpData.remove(requestBodyOTPSystem.getMobilenumber());
            return new ResponseEntity<>("OTP is verified Successfully", HttpStatus.OK);
          }
          return new ResponseEntity<>("Invalid OTP", HttpStatus.OK);
        }
        return new ResponseEntity<>("OTP is expired ", HttpStatus.OK);
      }
      return new ResponseEntity<>("Somthing went wrong .. !!", HttpStatus.OK);
    }
     // else
   // return new ResponseEntity<>("Mobile number not found", HttpStatus.OK);

  }
