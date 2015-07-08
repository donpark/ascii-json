asciiJSON = require('../lib/ascii-json')

console.log asciiJSON.escapeNonAsciis('this is not 에스키')

console.log asciiJSON.ignoreNonAsciis('this is not 에스키')

troublemaker =
  ascii: "hello world"
  nonascii: "안녕하세요  \\ \n \t \""

asciiOnly = asciiJSON.stringify(troublemaker)
console.log asciiOnly

troublemaker =
  ascii: "hello world"
  nonascii: "안녕하세요  \\ \n \t \""

asciiOnly = asciiJSON.stringify(troublemaker, true)
console.log asciiOnly
