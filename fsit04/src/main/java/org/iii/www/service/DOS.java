package org.iii.www.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("DOS")
@Transactional
public class DOS implements IDOS{
    
private String meta;
private String icon;    
private String title;
private String style;    
private String js;    
private String header;
private String content;
private String footer;    
    
public String getMeta(){
    return "";
}
    
public String getIcon(){
    return "";
}

public String getTitle(){
    return "";
}
    
public String getStyle(){
    return "";
}   
    
public String getJs(){
    return "";
}    
    
public String getHeader(){
    return "";
}
    
public String getContent(){//main,container
	
    return "HELLO WORLD<br><button>123456</button>";
}
    
public String getFooter(){
    return "";
}



}