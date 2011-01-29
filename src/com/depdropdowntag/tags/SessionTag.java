package com.depdropdowntag.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SessionTag extends SimpleTagSupport {
	
	private String name;
	private String var;
	
@Override
public void doTag() throws JspException, IOException {
	// TODO Auto-generated method stub
	super.doTag();
	getJspContext().setAttribute(var, ((PageContext)getJspContext()).getRequest().getAttribute(getName()));
	getJspBody().invoke(null);
}

public void setName(String name) {
	this.name = name;
}

public String getName() {
	return name;
}

public void setVar(String var) {
	this.var = var.toString();
}

public String getVar() {
	return var;
}
}
