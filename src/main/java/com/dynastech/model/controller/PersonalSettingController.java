package com.dynastech.model.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * Created by ganlu on 2017/9/15.
 */

@Controller
@RequestMapping("/system/personal-settings")
public class PersonalSettingController {

/*
    private static Logger logger = Logger.getLogger(PersonalSettingController.class);


    @Autowired
    private ITAbilityService itAbilityService;


    //@RequiresPermissions("dic:view")
    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/model/myAbility");
        return mv;
    }


   // @RequiresPermissions("dic:view")
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> list(HttpServletRequest request,
                             @RequestParam(value = "page", defaultValue = "1", required = false) int page,
                             @RequestParam(value = "size", defaultValue = "20", required = false) int size,
                             @RequestParam(value = "searchText", required = false) String searchText) {

        PageHelper.startPage(page, size);

        Map<String, Object> data = new HashMap<String, Object>();



        List<TAbility> tAbilityList = itAbilityService.getAbilityByUserId("00");
        // 取分页信息
        PageInfo<TAbility> pageInfo = new PageInfo<TAbility>(tAbilityList);
        data.put("rows", tAbilityList);
        data.put("total", pageInfo.getTotal());

        return data;
    }*/

}
