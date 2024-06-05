package com.example.demo.controllers;

import com.example.demo.dao.AddressDao;
import com.example.demo.dao.ClassDao;
import com.example.demo.models.Address;
import com.example.demo.models.Class;
import com.example.demo.services.ClassService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
@RequestMapping("/classes")
public class ClassController {
    @Autowired
    ClassDao classDao;
    @Autowired
    ClassService classService;
    @Autowired
    AddressDao addressDao;
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

    @GetMapping("/editor")
    public String editor(){
        return "editors/classEditor";
    }

    @GetMapping("/json")
    @ResponseBody
    public Class getById(int id) {
        return classService.getById(id);
    }

    @PutMapping("/editor")
    @ResponseBody
    public void update(int id, int cafId, int maxPlaces, String note, String pref, String street, String house, String place, String phoneNumber){
        if (note.isEmpty()) note = null;
        if (phoneNumber.isEmpty()) phoneNumber = null;
        classDao.update(id, cafId, maxPlaces, note, pref, street, house, place, phoneNumber);
    }

    @PostMapping("/editor")
    @ResponseBody
    public Integer create(int cafId, int maxPlaces, String note, String pref, String street, String house, String place, String phoneNumber){
        if (note.isEmpty()) note = null;
        if (phoneNumber.isEmpty()) phoneNumber = null;
        return  classDao.create(cafId, maxPlaces, note, pref, street, house, place, phoneNumber);
    }
}
