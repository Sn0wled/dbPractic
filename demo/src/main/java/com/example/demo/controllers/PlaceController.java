package com.example.demo.controllers;

import com.example.demo.dao.ClassDao;
import com.example.demo.dao.PlaceDao;
import com.example.demo.models.Place;
import com.example.demo.services.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/place")
public class PlaceController {
    @Autowired
    PlaceDao placeDao;
    @Autowired
    ClassDao classDao;
    @GetMapping("/by-class")
    public String getByClassId(int classId, Model model) {
        model.addAttribute("places", placeDao.getByClassId(classId));
        return "rows/placeRows.html";
    }

    @GetMapping("/opts/by-class")
    public String getOptsByClassId(Integer placeId, int classId, Model model) {
        model.addAttribute("places", placeDao.getByClassId(classId));
        model.addAttribute("placeId", placeId);
        return "opts/placeOpts.html";
    }

    @ResponseBody
    @GetMapping("/by-class/json")
    public List<Place> optsByClassId(int classId){
         return placeDao.getByClassId(classId);
    }

    @GetMapping("/by-id/json")
    @ResponseBody
    public Place getJsonById(int id){
        return placeDao.getById(id);
    }

    @GetMapping()
    public String get(Model model){
        model.addAttribute("classes", classDao.getAll());
        return "/tables/places.html";
    }

    @DeleteMapping()
    @ResponseBody
    public void del(int placeId){
        placeDao.del(placeId);
    }

    @GetMapping("/editor")
    public String editor(Model model){
        model.addAttribute("classes", classDao.getAll());
        return "/editors/placeEditor.html";
    }

    @PutMapping("/editor")
    @ResponseBody
    public void update(int id, int classId, String placeNum, String placeName, String placeIP, String placeNote){
        placeDao.update(id, classId, placeNum, placeName, placeIP, placeNote);
    }

    @PostMapping("/editor")
    @ResponseBody
    public void create(int classId, String placeNum, String placeName, String placeIP, String placeNote){
        placeDao.create(classId, placeNum, placeName, placeIP, placeNote);
    }
}
