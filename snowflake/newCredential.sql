-- create user with password and default role
CREATE OR REPLACE USER userToUse 
    PASSWORD= DEFAULT_ROLE=roleToUse 
    DEFAULT_WAREHOUSE=zomato_etl 
    DEFAULT_NAMESPACE = analytics.schemaToUse;

-- create role
CREATE OR REPLACE ROLE roleToUse;

-- grant database to role; then grant select to role
GRANT USAGE ON WAREHOUSE zomato_etl TO ROLE roleToUse;
GRANT USAGE ON DATABASE analytics TO ROLE roleToUse;
GRANT USAGE ON SCHEMA schemaToUse TO ROLE roleToUse;
GRANT SELECT ON ALL VIEWS IN SCHEMA analytics.schemaToUse TO ROLE roleToUse;

-- finally grant role to user
GRANT ROLE roleToUse TO USER userToUse;