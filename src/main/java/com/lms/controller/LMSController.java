package com.lms.controller;

import com.lms.Entity.Instructor;
import com.lms.service.InstructorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class LMSController {

    @Autowired
    private InstructorService instructorService;


    @GetMapping("/")
    public String welcomePage() {


        return "home";
    }

    //fetch instructors from db
    @GetMapping("/instructors")
    public String welcomePage(Model model) {
        List<Instructor> instructors = instructorService.getInstructors();
        System.out.println("checking git hub");
        System.out.println("feature branch checking");
        String s = instructors.isEmpty() ? "yes it is empty" : "yes  isn't empty";

        System.out.println(s);

        model.addAttribute("instructors", instructors);
        return "instructorPage";

    }

    //add instructors from ui & data binding from ui to model attribute

    @GetMapping("/addInstructor")
    public String addInstructor(@ModelAttribute("instructor") Instructor instructor) {

        // instructorService.addInstructor(instructor);
        return "addInstructorPage";
    }
// add instructor to database

    @PostMapping("/instructor/save")
    public String saveInstructor(Instructor instructor) {

        instructorService.addInstructor(instructor);

        return "redirect:/instructors";

    }

    //    search instructor by instructor id from database
    @GetMapping("instructor/search")
    public String findInstructorById(@RequestParam(name = "id") int id, Model model) {

        System.out.println("inside sear id method");
        Instructor instructorById = instructorService.findInstructorById(id);

        List<Instructor> instructors = new ArrayList<>();
        instructors.add(instructorById);

        model.addAttribute("instructors", instructors);

        return "instructorPage";

    }

    //    deleteByID
    @GetMapping("deleteByID/{id}")
    public String deleteById(@PathVariable("id") int id) {
        instructorService.deleteById(id);
        return "redirect:/instructors";
    }
}
