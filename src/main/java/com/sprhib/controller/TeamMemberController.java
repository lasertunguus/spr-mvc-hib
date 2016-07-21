package com.sprhib.controller;

import java.io.NotSerializableException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sprhib.converter.StringToTeamConverter;
import com.sprhib.model.Team;
import com.sprhib.model.TeamMember;
import com.sprhib.service.TeamMemberService;
import com.sprhib.service.TeamService;

@Controller
@RequestMapping(value = "/team_member")
public class TeamMemberController {

	Logger logger = LoggerFactory.getLogger(TeamMemberController.class);

	@Autowired
	private TeamMemberService teamMemberService;
	@Autowired
	private TeamService teamService;

	@Autowired
	private StringToTeamConverter teamConverter;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addTeamMemberPage() {
		ModelAndView modelAndView = new ModelAndView("add-team-member-form");
		modelAndView.addObject("teamMember", new TeamMember());
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView addingTeamMember(@ModelAttribute TeamMember teamMember) {

		ModelAndView modelAndView = new ModelAndView("home");
		teamMemberService.addTeamMember(teamMember);

		String message = "Team member was successfully added.";
		modelAndView.addObject("message", message);

		return modelAndView;
	}

	@RequestMapping(value = "/list")
	public ModelAndView listOfTeamMembers() {
		ModelAndView modelAndView = new ModelAndView("list-of-team-members");

		List<TeamMember> teamMembers = teamMemberService.getTeamMembers();
		modelAndView.addObject("teamMembers", teamMembers);

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editTeamPage(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("edit-team-member-form");
		TeamMember teamMember = teamMemberService.getTeamMember(id);
		modelAndView.addObject("teamMember", teamMember);

		List<Team> availableTeams = teamService.getTeams();
		Set<Team> selectedTeams = teamMember.getTeams();
		List<Team> notSelectedTeams = new ArrayList<>();
		if (selectedTeams.isEmpty())
			notSelectedTeams = availableTeams;
		for (Team available : availableTeams) {
			for (Team selected : selectedTeams) {
				if (!selected.getId().equals(available.getId())) {
					notSelectedTeams.add(available);
				}
			}
		}
		modelAndView.addObject("teams", notSelectedTeams);
		return modelAndView;
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView editingTeam(@ModelAttribute TeamMember teamMember, @PathVariable Integer id,
			@RequestParam("teamId") String selectedTeamIds) {

		ModelAndView modelAndView = new ModelAndView("home");
		
		Set<Team> teams = new HashSet<>();
		for (String selectedTeamId : selectedTeamIds.split(",")) {
			Team team = teamConverter.convert(selectedTeamId);
			logger.info("setting team {} for member", team.getId() + " " + team.getName());
			teams.add(team);
		}
		teamMember.setTeams(teams);

		teamMemberService.updateTeamMember(teamMember);

		String message = "Team member was successfully edited.";
		modelAndView.addObject("message", message);

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteTeam(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("home");
		teamMemberService.deleteTeamMember(id);
		String message = "Team member was successfully deleted.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}

}
