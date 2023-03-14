package com.semi.learn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.semi.learn.service.ClsService;


@Controller
public class ClsController {
	
	@Autowired
	ClsService service;
	
}
