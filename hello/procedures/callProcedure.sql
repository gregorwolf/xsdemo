SELECT CURRENT_USER "current user" FROM DUMMY;
SELECT SESSION_USER "session user" FROM DUMMY;

CREATE LOCAL TEMPORARY TABLE #sensor like "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::sensors";
CREATE LOCAL TEMPORARY TABLE #err like "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::error";
INSERT INTO #sensor VALUES('1','Fish Truck 1','Raspberry Pi', '1', 'Tuna Box');
CALL "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.procedures::insertSensor"(#sensor, ?);

insert into "s0001142741trial.xsdemo.hello.data::sensors"
  values ("s0001142741trial.xsdemo.hello.data::SensorID".NEXTVAL, 
	'Fish Truck 1','Raspberry Pi', '1', 'Tuna Box');

insert into "s0001142741trial.xsdemo.hello.data::sensors"
  values ("s0001142741trial.xsdemo.hello.data::SensorID".NEXTVAL, 
	'Martin','Tessel', '1', 'Salmon Humidity');

insert into "s0001142741trial.xsdemo.hello.data::sensors"
  values ("s0001142741trial.xsdemo.hello.data::SensorID".NEXTVAL, 
	'Alex','Tessel', '1', 'Salmon Humidity');

insert into "s0001142741trial.xsdemo.hello.data::sensors"
  values ("s0001142741trial.xsdemo.hello.data::SensorID".NEXTVAL, 
	'Heizungsanlage','ETA PC25', '1', 'Puffer Unten');

select * from "s0001142741trial.xsdemo.hello.data::sensors"
 order by "id" desc;


CREATE LOCAL TEMPORARY TABLE #measurement like "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::measurements";
CREATE LOCAL TEMPORARY TABLE #err like "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::error";
INSERT INTO #measurement VALUES('1','','9', '51.3', '°C',CURRENT_TIMESTAMP);
CALL "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.procedures::insertMeasurement"(#measurement, ?);

UPDATE "s0001142741trial.xsdemo.hello.data::sensors"
SET "device" = 'Fish Truck 3', "type" = 'ESP8266', "description" = 'European pilchard'
WHERE "id" = 11;

UPDATE "s0001142741trial.xsdemo.hello.data::sensors"
SET "device" = 'Fish Truck 1', "type" = 'Raspberry Pi', "description" = 'Tuna Box'
WHERE "id" = 17;

SELECT
    "measuredAt",
    "sensorId",
    "description",
    "value",
    "unit"
FROM "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::measurements"
LEFT JOIN "NEO_3KDKYA4JI7SBY1TZEVG6QA348"."s0001142741trial.xsdemo.hello.data::sensors"
  ON "s0001142741trial.xsdemo.hello.data::measurements"."sensorId" = "s0001142741trial.xsdemo.hello.data::sensors"."id"
WHERE "sensorId" IN ( 36, 38, 41 )
  AND "measuredAt" between '2015/04/30' and '2015/05/02'
ORDER BY "measuredAt";
