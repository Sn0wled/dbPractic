package com.example.demo.controllers;

import com.example.demo.dao.EqTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/eqTypes")
public class EqTypeController {
    @Autowired
    EqTypeDao eqTypeDao;
    @GetMapping("/all")
    public String getAll(Model model){
        model.addAttribute("eqTypes", eqTypeDao.getAll());
        return "eqTypeRows.html";
    }
    @GetMapping()
    public String get(Model model, Integer typeId){
        model.addAttribute("types", eqTypeDao.getAll());
        model.addAttribute("typeId", typeId);
        return "/tables/eqType.html";
    }
}
