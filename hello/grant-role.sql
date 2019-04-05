// Gregor gmail:
call "HCP"."HCP_GRANT_ROLE_TO_USER"('s0001142741trial.xsdemo.hello::model_access','S0001142741');
// Gregor web.de
call "HCP"."HCP_GRANT_ROLE_TO_USER"('s0001142741trial.xsdemo.hello::model_access','P598692');
// Martin
call "HCP"."HCP_GRANT_ROLE_TO_USER"('s0001142741trial.xsdemo.hello::model_access','P179836');
// Alex
call "HCP"."HCP_GRANT_ROLE_TO_USER"('s0001142741trial.xsdemo.hello::model_access','P1490151543');
// Gregor outlook.com
call "HCP"."HCP_GRANT_ROLE_TO_USER"('s0001142741trial.xsdemo.hello::model_access','P1941101763');


call "HCP"."HCP_GRANT_ACTIVATED_ROLE"('s0001142741trial.xsdemo.hello::model_access');
call "HCP"."HCP_GRANT_ACTIVATED_ROLE"('demo.epm.data::model_admin')

// Asign Sensor to User

UPDATE "s0001142741trial.xsdemo.hello.data::sensors"
SET "userName" = 'S0001142741';
UPDATE "s0001142741trial.xsdemo.hello.data::sensors"
SET "userName" = 'P1490151543'
WHERE "device" = 'Alex';
UPDATE "s0001142741trial.xsdemo.hello.data::sensors"
SET "userName" = 'P179836'
WHERE "device" = 'Martin';