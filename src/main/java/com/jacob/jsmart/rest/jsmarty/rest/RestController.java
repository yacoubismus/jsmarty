package com.jacob.jsmart.rest.jsmarty.rest;

import com.jacob.jsmart.rest.jsmarty.adapter.Adapter;
import com.jacob.jsmart.rest.jsmarty.service.SpringService;

import com.jsmartframework.web.annotation.RequestPath;
import com.jsmartframework.web.manager.WebContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.bind.JAXBException;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestPath("/home/v1/*")
public class RestController {

    @Autowired
    private SpringService springService;

    @ResponseBody
    @RequestMapping(value="/test", method = RequestMethod.POST)
    public void doPost() throws IOException, JAXBException {

        // You can map query parameters and adapter via SpringMVC annotation on
        // method parameters, and also we provide an alternative way of getting
        // the query parameters and payload convertion as following

        Adapter adapter = WebContext.getContentFromJson(Adapter.class);
        System.out.println("JSON converted into class: " + adapter);

        Map<String, String> queryParams = WebContext.getQueryParams();
        System.out.println("Query parameters: " + queryParams);

        // Alternative way of writing a response as XML
        // WebContext.writeResponseAsXml(adapter);

        // Writing response as JSON
        WebContext.writeResponseAsJson(adapter);
    }
}