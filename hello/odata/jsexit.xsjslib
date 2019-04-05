/** 
@param {connection} Connection  - The SQL connection used in the OData request 
@param {beforeTableName} String - The name of a temporary table with the single entry before the operation (UPDATE and DELETE events only) 
@param {afterTableName}  String - The name of a temporary table with the single entry after the operation (CREATE and UPDATE events only) 
 */  
function insert_sensor(param) {
  $.trace.debug("entered function");
  // let before = param.beforeTableName;
  let after  = param.afterTableName;
  
  // Get next Sensor ID
  let pStmt = param.connection.prepareStatement('SELECT "s0001142741trial.xsdemo.hello.data::SensorID".NEXTVAL FROM dummy');
  var rs = pStmt.executeQuery();
  var SensorId = '';
  while (rs.next()) {
    SensorId = rs.getString(1);
  }
  pStmt.close();
  // Read from temporary table
  pStmt = param.connection.prepareStatement('SELECT * FROM "'+after+'"');
  pStmt.executeQuery();
  rs = pStmt.executeQuery();
  if (rs.next()) {
    // Insert into DB
    pStmt = param.connection.prepareStatement('INSERT INTO "s0001142741trial.xsdemo.hello.data::sensors" VALUES( ?, ?, ?, ?, ?, ?, ?)');  
    pStmt.setString(1, SensorId);  
    pStmt.setString(2, rs.getString(2)); // Device
    pStmt.setString(3, rs.getString(3)); // Type
    pStmt.setInt(4, 0); // last measurement
    pStmt.setString(5, rs.getString(5));  // Description
    pStmt.setString(6, $.session.getUsername() );  // Username
    pStmt.setString(7, "0" );  // Inactive
    pStmt.execute();
    pStmt.close();
    // Update table provided in the interface to return the generated ID in the returned data of the OData call
    pStmt = param.connection.prepareStatement('UPDATE "' + after  
      + '" set "id"        = ?,' +   
      '  "device"          = ?,' +  
      '  "type"            = ?,' +  
      '  "description"     = ?,' +
      '  "userName"        = ?');  
    pStmt.setString(1, SensorId);  
    pStmt.setString(2, rs.getString(2)); // Device
    pStmt.setString(3, rs.getString(3)); // Type
    pStmt.setString(4, rs.getString(5));  // Description
    pStmt.setString(5, $.session.getUsername() );  // Username
    pStmt.execute();
    pStmt.close();
  }
  rs.close();
}

function query_sensor(param) {
    
}