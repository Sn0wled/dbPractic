package com.example.demo.controllers;

import com.example.demo.dao.ServiceDao;
import com.example.demo.services.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/serv")
public class ServiceController {
    @Autowired
    ServiceDao serviceDao;
    @Autowired
    ClassService classService;

    @GetMapping()
    public String journal(Integer classId, Model model){
        model.addAttribute("classes", classService.getClassesWithPlaces());
            model.addAttribute("classId", classId);
        return "tables/serv.html";
    }

    @GetMapping("/by-place-id")
    public String getByPlaceId(int placeId, Model model){
        model.addAttribute("servs", serviceDao.getByPlaceId(placeId));
        return "rows/servRows.html";
    }
}
