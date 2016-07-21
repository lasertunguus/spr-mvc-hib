DROP TABLE IF EXISTS hibnatedb.team_members;
DROP TABLE IF EXISTS hibnatedb.teams;
DROP TABLE IF EXISTS hibnatedb.team_team_member;
DROP TABLE IF EXISTS hibnatedb.organizations;

CREATE TABLE hibnatedb.organizations (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE hibnatedb.teams (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) not null,
    rating DOUBLE not null,
    organization_fk BIGINT,
    FOREIGN KEY (organization_fk) REFERENCES organizations(id),
    PRIMARY KEY (id)
);

CREATE TABLE hibnatedb.team_members (
    id BIGINT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) not null,
    last_name VARCHAR(255) not null,
    position VARCHAR(255) not null,
    team_fk BIGINT,
    FOREIGN KEY (team_fk) REFERENCES teams(id),
    PRIMARY KEY (id)
);

CREATE TABLE hibnatedb.team_team_member (
	team_member_id BIGINT,
	team_id BIGINT,
	FOREIGN KEY (team_member_id) REFERENCES team_members(id),
	FOREIGN KEY (team_id) REFERENCES teams(id)
);

INSERT INTO organizations (name) VALUES ('Selts');
INSERT INTO organizations (name) VALUES ('Klubi');

INSERT INTO teams (name, rating, organization_fk) VALUES ('A-team', 5, (SELECT id FROM organizations WHERE name = 'Selts'));
INSERT INTO teams (name, rating, organization_fk) VALUES ('B-team', 3, (SELECT id FROM organizations WHERE name = 'Klubi'));

INSERT INTO team_members (first_name, last_name, position, team_fk) VALUES ('Jaak', 'Jaam', 'Regional Manager', (SELECT id FROM teams WHERE name = 'A-team'));
INSERT INTO team_members (first_name, last_name, position, team_fk) VALUES ('Piret', 'Pill', 'Assistant to the Regional Manager', (SELECT id FROM teams WHERE name = 'A-team'));

