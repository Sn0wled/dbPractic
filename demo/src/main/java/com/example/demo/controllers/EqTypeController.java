package com.example.demo.controllers;

import com.example.demo.dao.EqTypeDao;
import com.example.demo.models.EqType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/json/by-id")
    @ResponseBody
    public EqType getById(int typeId){
        return eqTypeDao.getById(typeId);
    }

    @DeleteMapping()
    @ResponseBody()
    public void delete(int eqTypeId){
        eqTypeDao.delete(eqTypeId);
    }

    @GetMapping("/editor")
    public String editor() {
        return "/editors/eqTypeEditor";
    }

    @PutMapping("/editor")
    @ResponseBody
    public void update(int id, String category, String name, String characteristic){
        eqTypeDao.update(id, category, name, characteristic);
    }

    @PostMapping("/editor")
    @ResponseBody
    public Integer create(String category, String name, String characteristic){
        return eqTypeDao.create(category, name, characteristic);
    }
}
