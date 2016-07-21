package com.sprhib.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Service;

import com.sprhib.model.Team;
import com.sprhib.service.TeamService;

@Service("teamConverter")
public class StringToTeamConverter implements Converter<String, Team> {
	
	@Autowired
	TeamService teamService;

	@Override
	public Team convert(String arg) {
		int id = Integer.parseInt(arg);
		return teamService.getTeam(id);
	}

}
