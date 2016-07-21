package com.sprhib.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.TeamMember;

@Repository
public class TeamMemberDAOImpl implements TeamMemberDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addTeamMember(TeamMember teamMember) {
		getCurrentSession().save(teamMember);
	}

	@Override
	public void updateTeamMember(TeamMember teamMember) {
		TeamMember teamMemberToUpdate = getTeamMember(teamMember.getId());
		teamMemberToUpdate.setFirstName(teamMember.getFirstName());
		teamMemberToUpdate.setLastName(teamMember.getLastName());
		teamMemberToUpdate.setTeams(teamMember.getTeams());
		getCurrentSession().update(teamMemberToUpdate);
	}

	@Override
	public TeamMember getTeamMember(int id) {
		TeamMember teamMember = (TeamMember) getCurrentSession().get(TeamMember.class, id);
		return teamMember;
	}

	@Override
	public void deleteTeamMember(int id) {
		TeamMember teamMember = getTeamMember(id);
		if (teamMember != null)
			getCurrentSession().delete(teamMember);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<TeamMember> getTeamMembers() {
		return getCurrentSession().createQuery("from TeamMember").list();
	}

}
