package com.mirajdev.springboot.myfirstwebappusingspringboot.welcome;

import org.apache.catalina.authenticator.SpnegoAuthenticator.AuthenticateAction;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("username")
public class WelcomeController {
    @RequestMapping(value = "/", method = RequestMethod.GET)

    public String gotoLoginPage(ModelMap model) {
        String username = getLoggedInUserName();
        model.put("username", username);
        return "welcome";
    }

    public String getLoggedInUserName() {

        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

}
