-- Drop tables
DROP TABLE IF EXISTS agents CASCADE;
DROP TABLE IF EXISTS regions CASCADE;


-- Create a table of agents
CREATE TABLE agents (
    agent_id INT PRIMARY KEY
  , first_name VARCHAR NOT NULL
  , last_name VARCHAR NOT NULL
);

-- Create a table of regions
CREATE TABLE regions(
    region_id INT NOT NULL PRIMARY KEY
  , region_name VARCHAR NOT NULL
);

DROP TABLE IF EXISTS agent_region_junction CASCADE;

-- Create a junction table.
CREATE TABLE agent_region_junction(
    agent_id INT NOT NULL
  , FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
  , region_id INTEGER NOT NULL
  , FOREIGN KEY (region_id) REFERENCES regions(region_id)
  , PRIMARY KEY (agent_id, region_id)
);

SELECT * FROM agent_region_junction

SELECT *
FROM agents 
LEFT JOIN agent_region_junction  ON agents.agent_id = agent_region_junction.agent_id
LEFT JOIN regions  ON agent_region_junction.region_id = regions.region_id;

