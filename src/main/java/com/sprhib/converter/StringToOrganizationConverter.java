package com.sprhib.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.sprhib.model.Organization;
import com.sprhib.service.OrganizationService;

@Component("organizationConverter")
public class StringToOrganizationConverter implements Converter<String, Organization> {
	
	@Autowired
	OrganizationService orgService;

	@Override
	public Organization convert(String arg) {
		int id = Integer.parseInt(arg);
		return orgService.getOrganization(id);
	}

}
