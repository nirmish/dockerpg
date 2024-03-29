package com.nirmish.pg.docker.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping ("/")
public class MyDemoController {

	@GetMapping("/hello")
	public String getMessage() {
		return "From : Nirmish Demo App -- Welcome!!!!";
	}
	@GetMapping("/bye")
	public String getBye() {
		return "From : Nirmish Demo App -- Bye Bye";
	}
}
