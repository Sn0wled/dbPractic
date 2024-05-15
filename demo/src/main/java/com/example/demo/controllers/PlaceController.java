package com.example.demo.controllers;

import com.example.demo.dao.PlaceDao;
import com.example.demo.models.Place;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/place")
public class PlaceController {
    @Autowired
    PlaceDao placeDao;
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
    public String get(){
        return "/tables/places.html";
    }
}
