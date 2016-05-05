package com.crossword.medicaljournalportal.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
/*import org.springframework.web.bind.annotation.RestController;*/
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/")
public class RootController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(RootController.class);

	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}*/

	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView indexPage(Model model) {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("homePageCarousel", settingService.getHomePageCarousel());
        try {
            mav.addObject("homePageCarouselResizeResolution", settingService.findByKey("home_page_resize_resolution").getValue());
        } catch (SettingNotFound e) {
            mav.addObject("homePageCarouselResizeResolution", "400x300");
        }
        try {
            mav.addObject("homePageCarouselPlaySpeed", settingService.findByKey("home_page_carousel_play_speed").getValue());
        } catch (SettingNotFound e) {
            mav.addObject("homePageCarouselPlaySpeed", "2000");
        }
        mav.addObject("currentNavButton", "home");
        mav.addObject("pageTitle", "page.footer.home");
        return mav;
    }

    @ModelAttribute("captchaScript")
    public String getCaptchaScript() {
        Properties options = new Properties();
        options.put("theme", "clean");
        return reCaptcha.createRecaptchaHtml("error message", options);
    }

    @RequestMapping(value = "/about_us", method = RequestMethod.GET)
    public ModelAndView aboutUsPage() {
        ModelAndView mav = new ModelAndView("about_us");
        String aboutUs = null;
        try {
            aboutUs = settingService.findByKey("about_us").getValue();
        } catch (SettingNotFound e) {
            aboutUs = "Default about us message. Please add about_us settings instead.";
        }
        mav.addObject("currentNavButton", "about_us");
        mav.addObject("aboutUs", aboutUs);
        mav.addObject("pageTitle", "page.footer.about");
        return mav;
    }

    @RequestMapping(value = "/contact_us", method = RequestMethod.GET)
    public ModelAndView newContactUsMessagePage(@RequestParam(value = "subject", required = false) String subject) {
        ContactUsMessage contactUsMessage = new ContactUsMessage();
        contactUsMessage.setSubject(subject);
        ModelAndView mav = new ModelAndView("contact_us", "contactUsMessage", contactUsMessage);
        String contactUs = null;
        try {
            contactUs = settingService.findByKey("contact_us").getValue();
        } catch (SettingNotFound e) {
            contactUs = "Default contact us message. Please add contact_us settings instead.";
        }
        mav.addObject("currentNavButton", "contact_us");
        mav.addObject("contactUs", contactUs);
        mav.addObject("pageTitle", "page.footer.contact");
        return mav;
    }

    @RequestMapping(value = "/contact_us", method = RequestMethod.POST)
    public ModelAndView saveContactUsMessage(@Valid ContactUsMessage contactUsMessage, BindingResult bindingResult, HttpServletRequest request,
            final RedirectAttributes redirectAttributes) {
        ReCaptchaResponse captchaResponse = reCaptcha.checkAnswer(request.getRemoteAddr(), request.getParameter("recaptcha_challenge_field"),
                request.getParameter("recaptcha_response_field"));
        if (!captchaResponse.isValid()) {
            return new ModelAndView("contact_us", "message", "recaptcha.code.error");
        }

        if (bindingResult.hasErrors()) {
            return new ModelAndView("contact_us");
        }
        ModelAndView mav = new ModelAndView("redirect:/contact_us");
        contactUsMessageService.save(contactUsMessage);
        redirectAttributes.addFlashAttribute("message", "contact.us.message.successfully.accepted");
        return mav;
    }

    @RequestMapping(value = "/strayed_pigeons", method = RequestMethod.GET)
    public ModelAndView strayedPigeonsPage() {
        ModelAndView mav = new ModelAndView("strayed_pigeons");
        String strayedPigeons = null;
        try {
            strayedPigeons = settingService.findByKey("strayed_pigeons").getValue();
        } catch (SettingNotFound e) {
            strayedPigeons = "Default about us message. Please add strayed_pigeons settings instead.";
        }
        mav.addObject("currentNavButton", "strayed_pigeons");
        mav.addObject("strayedPigeons", strayedPigeons);
        mav.addObject("pageTitle", "page.nav.found.strayed.pigeons");
        return mav;
    }

    @RequestMapping(value = "/how_to_order", method = RequestMethod.GET)
    public ModelAndView howToOrderPage() {
        ModelAndView mav = new ModelAndView("how_to_order");
        String howToOrder = null;
        try {
            howToOrder = settingService.findByKey("how_to_order").getValue();
        } catch (SettingNotFound e) {
            howToOrder = "Default how to order message. Please add how_to_order settings instead.";
        }
        mav.addObject("currentNavButton", "how_to_order");
        mav.addObject("howToOrder", howToOrder);
        mav.addObject("pageTitle", "page.nav.how.to.order");
        return mav;
    }

}
