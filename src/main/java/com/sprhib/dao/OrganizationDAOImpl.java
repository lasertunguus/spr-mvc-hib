package com.sprhib.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.Organization;

@Repository
public class OrganizationDAOImpl implements OrganizationDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addOrganization(Organization org) {
		getCurrentSession().save(org);
	}

	@Override
	public void updateOrganization(Organization org) {
		Organization orgToUpdate = getOrganization(org.getId());
		orgToUpdate.setName(org.getName());
		getCurrentSession().update(orgToUpdate);
	}

	@Override
	public Organization getOrganization(int id) {
		Organization org = (Organization) getCurrentSession().get(Organization.class, id);
		return org;
	}

	@Override
	public void deleteOrganization(int id) {
		Organization org = getOrganization(id);
		if (org != null)
			getCurrentSession().delete(org);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Organization> getOrganizations() {
		return getCurrentSession().createQuery("from Organization").list();
	}

}
