Generates ASCII-only JSON with escaped non-ASCII chracters.

## Why

I wrote this to send UTF-8 JSON data as HTTP 1.x header value
which can only use ISO-8859-1 characters.

BASE-64 could've been used but result wouldn't be as readable.

## Install

        npm install ascii-json

## Examples

        var asciiJSON = require('ascii-json');

See if a string is all ASCII or not

        asciiJSON.isAscii("this is all ASCII"); // true
        asciiJSON.isAscii("this is not 에스키"); // false

Escape non-ASCII strings

        console.log(asciiJSON.escapeNonAsciis('this is not 에스키'));

        // output: this is not \uc5d0\uc2a4\ud0a4"

Ignore non-ASCII strings
        
        console.log(asciiJSON.ignoreNonAsciis('this is not 에스키'));

        // output: this is not 

Stringify object with non-ASCII property value

        troublemaker = {
          ascii: "hello world",
          nonascii: "안녕하세요"
        };
        asciiOnly = asciiJSON.stringify(troublemaker);
        console.log(asciiOnly);

        // output: {"ascii":"hello world","nonascii":"\uc548\ub155\ud558\uc138\uc694"}

Stringify object with non-ASCII property value (and ignore the non-ASCII's)

        troublemaker = {
          ascii: "hello world",
          nonascii: "안녕하세요"
        };
        asciiOnly = asciiJSON.stringify(troublemaker, true);
        console.log(asciiOnly);

        // output: {"ascii":"hello world","nonascii":"  \\ \n \t \""}
