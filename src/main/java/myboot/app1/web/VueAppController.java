package myboot.app1.web;

import myboot.app1.dao.CurriculumVitaeRepository;
import myboot.app1.dao.PersonRepository;
import myboot.app1.model.CurriculumVitae;
import myboot.app1.model.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller()
public class VueAppController {

    @Autowired
    CurriculumVitaeRepository curriculumVitaeRepository;

    @Autowired
    PersonRepository personRepository;

    @RequestMapping(value = "/app")
    private ModelAndView hello() {
        return new ModelAndView("app");
    }

    @RequestMapping(value = "/login")
    private ModelAndView login() {
        return new ModelAndView("login");
    }



    @RequestMapping(value = "/profile")
    //@PreAuthorize("hasAuthority('USER')")
    private ModelAndView profile() {
        var res = new ModelAndView("profile");
        return res;
    }

    @RequestMapping(value = "/edit")
    //@PreAuthorize("hasAuthority('USER')")
    private ModelAndView editCV() {
        var res = new ModelAndView("edit-cv");
        return res;
    }

    @RequestMapping(value = "/activities")
    private ModelAndView activities() {
        var res = new ModelAndView("activities");
        return res;
    }

    @RequestMapping(value = "/create-cv")
    private ModelAndView createCV() {
        var res = new ModelAndView("create-cv");
        return res;
    }
    ArrayList<CurriculumVitae> cvCache;
    @RequestMapping(value = "/cvList")
    private ModelAndView cvList(@RequestParam(required = false) Optional<Integer> page) {
        int part = 0;
        int pageSize = 10;
        if(page.isPresent()) {
            part = page.get();
            if(part < 0) part = 0;
        }
        if(cvCache == null) cvCache = new ArrayList<CurriculumVitae>(curriculumVitaeRepository.findAll());
        ArrayList<CurriculumVitae> cvList = cvCache;

        int firstIndex = part*pageSize;
        int lastIndex = Math.min(part * pageSize + pageSize, cvList.size());
        var res = new ModelAndView("curriculumVitaeList", "cvList", cvList.subList(firstIndex,lastIndex));
        return res;
    }

    @RequestMapping(value = "/result/find")
    private ModelAndView searchCV(@RequestParam("name") String name) {
        var cvs = curriculumVitaeRepository.getCurriculumVitaeByName(name);
        var fullName = personRepository.getPersonByFirstName("%" + name + "%");
        fullName.addAll(personRepository.getPersonByLastName("%" + name + "%"));
        ModelAndView modelAndView = null;
        if (!cvs.isEmpty()) {
            modelAndView = new ModelAndView("resultSearch", "cvResult", cvs);

        }
        if (!fullName.isEmpty()) {
            modelAndView = new ModelAndView("resultSearch", "personResult", fullName);
            return modelAndView;

        }
        return modelAndView;
    }
    @RequestMapping(value = "/createPerson")
    private ModelAndView createPerson() {
        var res = new ModelAndView("createPerson");
        return res;
    }




}
