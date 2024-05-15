package com.example.demo.controllers;

import com.example.demo.dao.ClassDao;
import com.example.demo.models.Class;
import com.example.demo.services.ClassService;
import org.apache.catalina.connector.Response;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

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
        return "rows/classRows.html";
    }

    @GetMapping("/cafs")
    public String getCafs(Model model){
        model.addAttribute("cafs", classDao.getCafs());
        return "opts/cafsOpts.html";
    }

    @GetMapping("/addresses")
    public String getAddresses(Model model){
        List<Class> classes = classDao.getAll();
        model.addAttribute("classes", classes);
        return  "opts/classOpts.html";
    }

    @GetMapping()
    public  String classes(Model model){
        model.addAttribute("cafs", classService.getCafs());
        return "tables/classes.html";
    }
    @ResponseBody
    @GetMapping("/asd")
    public List<Class> get(){
        return classService.getAll();
    }

    @ExceptionHandler(DataAccessException.class)
    public void handleException(DataAccessException ex){
        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, ex.getMessage());
    }
}
