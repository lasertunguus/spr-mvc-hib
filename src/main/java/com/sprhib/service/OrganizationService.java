package com.sprhib.service;

import java.util.List;

import com.sprhib.model.Organization;

public interface OrganizationService {
	
	public void addOrganization(Organization org);
	public void updateOrganization(Organization org);
	public Organization getOrganization(int id);
	public void deleteOrganization(int id);
	public List<Organization> getOrganizations();

}
