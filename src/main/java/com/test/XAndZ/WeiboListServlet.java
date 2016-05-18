package com.test.XAndZ;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

public class WeiboListServlet extends HttpServlet {
	public static final long serialVersionUID = 23443547658768L;	
	public static final String WEIBO_LIST_URL = "https://api.weibo.com/2/statuses/public_timeline.json?source=783190658";

    public WeiboListServlet() {  
        super();  
    }  
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        doPost(request, response);  
    } 
    
    // main method to request latest weibo list.
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {
    	String retData = "";
    	
    	HttpClient httpClient = HttpClientBuilder.create().build();
    	
    	try {
			HttpGet httpget = new HttpGet(WEIBO_LIST_URL);  
			// send request
			HttpResponse httpResponse = httpClient.execute(httpget);  
			// get response data  
			HttpEntity entity = httpResponse.getEntity();  
			retData = EntityUtils.toString(entity);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
    	
    	response.setContentType("text/html;charset=utf-8");  
    	  
        PrintWriter out = response.getWriter();  
  
        out.println(retData);  
        out.flush();  
        out.close();  
    }
  
    /** 
     * Destruction of the servlet. <br> 
     */  
    public void destroy() {  
        super.destroy(); // Just puts "destroy" string in log  
    }  
}
