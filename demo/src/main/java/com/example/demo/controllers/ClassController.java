package com.example.demo.controllers;

import com.example.demo.dao.ClassDao;
import com.example.demo.models.Class;
import com.example.demo.services.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/classes")
public class ClassController {
    @Autowired
    ClassDao classDao;
    @Autowired
    ClassService classService;
    @GetMapping("/byCaf")
    public String getByCafid(int cafId, Model model){
        List<Class> classes = classDao.getByCafId((cafId));
        model.addAttribute("classes", classes);
        return "classRows.html";
    }

    @GetMapping("/cafs")
    public String getCafs(Model model){
        model.addAttribute("cafs", classDao.getCafs());
        return "cafsOpts.html";
    }

    @GetMapping("/addresses")
    public String getAddresses(Model model){
        List<Class> classes = classDao.getAll();
        model.addAttribute("classes", classes);
        return  "classOpts.html";
    }

    @GetMapping()
    public  String getAll(Model model){
        model.addAttribute("classes", classService.getAll());
        return "classRows.html";
    }
    @ResponseBody
    @GetMapping("/asd")
    public List<Class> get(){
        return classService.getAll();
    }
}