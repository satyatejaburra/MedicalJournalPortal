package com.crossword.medicaljournalportal.web.controller;

import java.util.List;

/*import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wang.michael.online_shop.exception.SettingNotFound;
import com.wang.michael.online_shop.model.Category;
import com.wang.michael.online_shop.model.Link;
import com.wang.michael.online_shop.model.News;
import com.wang.michael.online_shop.service.CategoryService;
import com.wang.michael.online_shop.service.LinkService;
import com.wang.michael.online_shop.service.NewsService;
import com.wang.michael.online_shop.service.SettingService;
*/
public class BaseController {

   /* @Autowired
    private CategoryService categoryService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private LinkService linkService;

    @Autowired
    private SettingService settingService;

    @ModelAttribute("categoryList")
    public List<Category> getCategoryList() {
        return this.categoryService.findAllTopCategory();
    }

    @ModelAttribute("topTenNewsList")
    public String getNewsList() {
        List<News> newsList = this.newsService.findTopTenNews();
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(newsList);
        } catch (JsonProcessingException e) {
            return "[]";
        }
    }

    @ModelAttribute("linkList")
    public List<Link> getLinkList() {
        return this.linkService.findAll();
    }

    @ModelAttribute("pageTitlePrefix")
    public String getPageTitlePrefix() {
        try {
            return this.settingService.findByKey("page_title_prefix").getValue();
        } catch (SettingNotFound e) {
            return "Page_title_prefix is not configured";
        }
    }

    @ModelAttribute("homePageSubtitle")
    public String getHomePageSubtitle() {
        try {
            return this.settingService.findByKey("home_page_subtitle").getValue();
        } catch (SettingNotFound e) {
            return "home_page_subtitle is not configured";
        }
    }

    @ModelAttribute("copyRightInfo")
    public String getCopyRightInfo() {
        try {
            return this.settingService.findByKey("copy_right_info").getValue();
        } catch (SettingNotFound e) {
            return "copy_right_info is not configured";
        }
    }

    @Value("${resize.resolution}")
    private String resizeResolution;

    @ModelAttribute("resizeResolution")
    public String getResizeResolution() {
        try {
            return this.settingService.findByKey("resize_resolution").getValue();
        } catch (SettingNotFound e) {
            if (StringUtils.isNotBlank(resizeResolution)) {
                return resizeResolution;
            } else {
                return "204x115";
            }
        }
    }

    @Value("${file.uri.root}")
    private String fileURIRoot;

    @ModelAttribute("fileURIRoot")
    public String defaultFileURIRoot() {
        return fileURIRoot;
    }

    protected void preparePaginationData(ModelAndView mav, String pageObjectName, Page<?> pageObjec, int page, int pageSize) {
        mav.addObject(pageObjectName, pageObjec);
        mav.addObject("totalPages", pageObjec.getTotalPages());
        mav.addObject("previousPage", page - 1 > 1 ? page - 1 : 1);
        mav.addObject("currentPage", page);
        mav.addObject("nextPage", page + 1 < pageObjec.getTotalPages() ? page + 1 : pageObjec.getTotalPages());
        mav.addObject("pageSize", pageSize);
    }*/
}
