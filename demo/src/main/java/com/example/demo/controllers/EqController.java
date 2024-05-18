package com.example.demo.controllers;

import com.example.demo.dao.EqDao;
import com.example.demo.dao.EqTypeDao;
import com.example.demo.dto.EqDto;
import com.example.demo.models.Eq;
import com.example.demo.services.ClassService;
import com.example.demo.services.EqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
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
    public String getAll(Model model, Integer eqId){
        List<EqDto> result = eqService.getAll();
        model.addAttribute("equipments", result);
        model.addAttribute("hideClassAndPlace", false);
        model.addAttribute("eqId", eqId);
        return "tables/Equipments.html";
    }

    @GetMapping("lp-eq")
    public String getLpEq(Model model){
        model.addAttribute("classes", classService.getAll());
        model.addAttribute("equipments", eqService.getDtoList(eqService.getNotInstalled()));
        return "tables/lpEquipments.html";
    }

    @GetMapping("/editor")
    public String editor(Model model, Integer eqId){
        model.addAttribute("types",eqTypeDao.getAll());
        model.addAttribute("eqId", eqId);
        return "editors/eqEditor.html";
    }

    @DeleteMapping()
    @ResponseBody
    public void delEq(int eqId){
        eqService.del(eqId);
    }

    @ResponseBody
    @GetMapping("/by-id")
    public Eq getById(Integer id){
        if (id == null) throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Неверно указан id оборудования");
        return eqService.getById(id);
    }

    @PostMapping("/editor")
    @ResponseBody
    public int addEq(ModelMap model, int typeId, int invNum, String note){
        return eqService.create(typeId, invNum, note);
    }

    @PutMapping("/editor")
    @ResponseBody
    public void updateEq(int id, int typeId, int invNum, String note){
        try {
            eqService.update(id, typeId, invNum, note);
        } catch (DataAccessException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, ex.getMessage());
        }
    }

    @PutMapping("/install")
    @ResponseBody
    public void installEq(int eqId, int placeId){
        eqService.install(eqId, placeId);
    }

    @PutMapping("/uninstall")
    @ResponseBody
    public void uninstallEq(int eqId){
        eqService.uninstall(eqId);
    }

    @GetMapping("/notInstalled")
    public String notInstalledRows(Model model){
        model.addAttribute("equipments", eqService.getDtoList(eqService.getNotInstalled()));
        return "rows/eqRows";
    }
}
