package com.example.demo.controllers;

import com.example.demo.dao.EqDao;
import com.example.demo.dao.EqTypeDao;
import com.example.demo.dto.EqDto;
import com.example.demo.models.Eq;
import com.example.demo.services.ClassService;
import com.example.demo.services.EqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/eq")
public class EqController {
    @Autowired
    ClassService classService;
    @Autowired
    EqService  eqService;
    @GetMapping("/byPlace")
    public String getByPlaceId(int placeId, Model model){
        model.addAttribute("equipments", eqService.getByPlaceId(placeId));
        return "rows/eqRows.html";
    }
    @GetMapping()
    public String getAll(Model model){
        List<EqDto> result = eqService.getAll();
        model.addAttribute("equipments", result);
        model.addAttribute("hideClassAndPlace", false);
        return "tables/Equipments.html";
    }

    @GetMapping("lp-eq")
    public String getLpEq(Model model){
        model.addAttribute("classes", classService.getAll());
        return "tables/lpEquipments.html";
    }
    @DeleteMapping()
    @ResponseBody
    public void delEq(int eqId){
        eqService.del(eqId);
    }
}
