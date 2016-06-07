/*
***********************************************************************************
**
** NODE.JS utility for getting screenshoots from merchants' websites.
**
** INPUT:
**   1. Valid URL.
**   2. Name of the file to be generated with extension jpeg, jpg, png or pdf.
**
** OUTPUT:
**   0 for success
**   1 for screenshot generation failure
**   2 for missing arguments
**
***********************************************************************************
*/

var webshot = require('./lib/webshot');
var tab = "      ==NODE ";

if (process.argv.length != 4) {
    console.log(tab + 'Usage: node node_script_name merchant_url image_file_name');
    process.exitCode = 2;
} else { 
   var merchant_url = process.argv[2];
   var image_file_name = process.argv[3];
 
   console.log(tab + 'URL received: ' + merchant_url);
   console.log(tab + 'File: ' + image_file_name);
   
   webshot(merchant_url, image_file_name, function(err) {
      if(err) {
         console.log(tab + err);
         process.exitCode = 1;
      } else {
         console.log(tab + 'Webshot finishes with no errors.');
      }
   });
}
