// Generated by CoffeeScript 1.6.2
(function() {
  var asciiJSON, asciiOnly, troublemaker;

  asciiJSON = require('../lib/ascii-json');

  console.log(asciiJSON.escapeNonAsciis('this is not 에스키'));

  troublemaker = {
    ascii: "hello world",
    nonascii: "안녕하세요  \\ \n \t \""
  };

  asciiOnly = asciiJSON.stringify(troublemaker);

  console.log(asciiOnly);

}).call(this);
