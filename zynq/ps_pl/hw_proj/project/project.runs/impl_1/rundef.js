//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "D:/xilink_sdx/SDx/2016.4/SDK/bin;D:/xilink_sdx/SDx/2016.4/Vivado/ids_lite/ISE/bin/nt64;D:/xilink_sdx/SDx/2016.4/Vivado/ids_lite/ISE/lib/nt64;D:/xilink_sdx/SDx/2016.4/Vivado/bin;";
} else {
  PathVal = "D:/xilink_sdx/SDx/2016.4/SDK/bin;D:/xilink_sdx/SDx/2016.4/Vivado/ids_lite/ISE/bin/nt64;D:/xilink_sdx/SDx/2016.4/Vivado/ids_lite/ISE/lib/nt64;D:/xilink_sdx/SDx/2016.4/Vivado/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


// pre-commands:
ISETouchFile( "write_bitstream", "begin" );
ISEStep( "vivado",
         "-log system_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source system_wrapper.tcl -notrace" );





function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
