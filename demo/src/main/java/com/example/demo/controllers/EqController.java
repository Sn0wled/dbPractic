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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
    @Autowired
    EqTypeDao eqTypeDao;
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

    @GetMapping("/editor")
    public String editor(Model model, Integer eqId){
        model.addAttribute("types",eqTypeDao.getAll());
        model.addAttribute("eqId", eqId);
        return "editors/eqEditor.html";
    }

    @GetMapping("/test")
    public ModelAndView testRedirect(ModelMap model){
        model.addAttribute("eqId", 9);
        return new ModelAndView("redirect:/eq/editor", model);
    }

    @DeleteMapping()
    public void delEq(int eqId){
        eqService.del(eqId);
    }

    @PostMapping("/editor")
    public ModelAndView addEq(ModelMap model, int typeId, int invNum, String note){
        model.addAttribute("eqId", eqService.create(typeId, invNum, note));
        return new ModelAndView("redirect: ", model);
    }
}
