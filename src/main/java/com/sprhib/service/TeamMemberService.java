package com.sprhib.service;

import java.util.List;

import com.sprhib.model.TeamMember;

public interface TeamMemberService {
	
	public void addTeamMember(TeamMember teamMember);
	public void updateTeamMember(TeamMember teamMember);
	public TeamMember getTeamMember(int id);
	public void deleteTeamMember(int id);
	public List<TeamMember> getTeamMembers();

}
