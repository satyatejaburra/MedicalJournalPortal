package com.crossword.medicaljournalportal.web.controller;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController extends BaseController {

    @Autowired
    private ReCaptcha reCaptcha;

    @ModelAttribute("pageTitle")
    public String defaultPageTitle() {
        return "Login";
    }

    @ModelAttribute("captchaScript")
    public String getCaptchaScript() {
        Properties options = new Properties();
        options.put("theme", "clean");
        return reCaptcha.createRecaptchaHtml("error message", options);
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(value = "username", required = true) String email,
            @RequestParam(value = "password", required = true) String password, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        ReCaptchaResponse captchaResponse = reCaptcha.checkAnswer(request.getRemoteAddr(), request.getParameter("recaptcha_challenge_field"),
                request.getParameter("recaptcha_response_field"));
        if (!captchaResponse.isValid()) {
            request.setAttribute("message", "recaptcha.code.error");
            return "login";
        }

        Subject curUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(email, password);
        token.setRememberMe(true);
        try {
            curUser.login(token);
            WebUtils.redirectToSavedRequest(request, response, "/");
            return null;
        } catch (AuthenticationException e) {
            token.clear();
            return "redirect:/";
        }
    }

   /* @RequestMapping(value = "/logout")
    public String logout(User user, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        SecurityUtils.getSubject().logout();
        WebUtils.redirectToSavedRequest(request, response, "/");
        return null;
    }*/

}
