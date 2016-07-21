package com.sprhib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sprhib.dao.TeamMemberDAO;
import com.sprhib.model.TeamMember;

@Service
@Transactional
public class TeamMemberServiceImpl implements TeamMemberService {
	
	@Autowired
	private TeamMemberDAO teamMemberDAO;

	@Override
	public void addTeamMember(TeamMember teamMember) {
		teamMemberDAO.addTeamMember(teamMember);
	}

	@Override
	public void updateTeamMember(TeamMember teamMember) {
		teamMemberDAO.updateTeamMember(teamMember);
	}

	@Override
	public TeamMember getTeamMember(int id) {
		return teamMemberDAO.getTeamMember(id);
	}

	@Override
	public void deleteTeamMember(int id) {
		teamMemberDAO.deleteTeamMember(id);
	}

	@Override
	public List<TeamMember> getTeamMembers() {
		return teamMemberDAO.getTeamMembers();
	}

}
