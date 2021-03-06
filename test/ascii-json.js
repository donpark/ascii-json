// Generated by CoffeeScript 1.6.2
(function() {
  describe("ascii-json", function() {
    var asciiJSON;

    asciiJSON = require('../lib/ascii-json');
    it("should detect non-ASCII string", function() {
      asciiJSON.isAscii('this is all ASCII').should.be["true"];
      return asciiJSON.isAscii('this is not 에스키').should.be["false"];
    });
    it("should escape non-ASCII string to ASCII-only string", function() {
      var escaped;

      escaped = asciiJSON.escapeNonAsciis('this is not 에스키');
      return asciiJSON.isAscii(escaped).should.be["true"];
    });
    return it("should stringify objects with non-ASCII string into ASCII only JSON", function() {
      var asciiOnly, restored, troublemaker;

      troublemaker = {
        ascii: "hello world",
        nonascii: "안녕하세요"
      };
      asciiOnly = asciiJSON.stringify(troublemaker);
      asciiJSON.isAscii(asciiOnly).should.be["true"];
      restored = asciiJSON.parse(asciiOnly);
      return restored.should.eql(troublemaker);
    });
  });

}).call(this);
