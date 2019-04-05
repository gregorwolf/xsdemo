delete from "s0001142741trial.xsdemo.hello.data::sensors";
delete from "s0001142741trial.xsdemo.hello.data::measurements";

SELECT 
	"id",
	"storedAt",
	"sensorId",
	"value",
	"unit",
	"measuredAt"
FROM "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::measurements" 
order by "storedAt" desc
LIMIT 1000

UPDATE "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::sensors"
SET "inactive" = '1'
where "device" LIKE 'Fish%1';

UPDATE "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::sensors"
SET "inactive" = '0'
where "lastMeasurement" > 577368;

SELECT TOP 1000 
	"id",
	"device",
	"type",
	"lastMeasurement",
	"description",
	"userName",
	"inactive"
FROM "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::sensors"
where "device" LIKE 'Fish%1';