crypto = require('crypto')

asciiJSON = exports

# Lazy man's ASCII check
asciiJSON.isAscii = (text) -> /^[\x00-\x7F]*$/.test(text)


# Returns given string with non-ASCII characters escaped
asciiJSON.escapeNonAsciis = (text) ->
  chars = []
  i = 0
  while i < text.length
    code = text.charCodeAt(i)
    if code < 128
      chars.push text[i]
    else
      chars.push '\\u'
      chars.push code.toString(16)
    i++
  chars.join('')


# a dummy is a unique string that will be replaced with
# an escaped non-ASCII value later.
makeDummy = -> crypto.randomBytes(16).toString('hex')

# Kinda inefficient but does a shallow walk through the object's
# properties and replaces non-ASCII string values with random hex string
# so they can be swapped after `JSON.stringify` with real but escaped values.
asciiJSON.stringify = (object) ->
  escapees = 0
  dummies = {}
  prison = {} # Disclaimer: No objects were harmed during stringification.
  for own name, value of object
    if typeof value isnt 'string' or asciiJSON.isAscii(value)
      prison[name] = value
    else
      escapees++
      dummy = makeDummy()
      prison[name] = dummy
      dummies[dummy] = asciiJSON.escapeNonAsciis(value)
  if escapees is 0
    JSON.stringify(object)
  else
    escaped = JSON.stringify(prison)
    for own dummy, escapee of dummies
      escaped = escaped.replace(dummy, escapee)
    escaped

# Use JSON.parse which will take care of restoring non-ASCII
# unicode characters into their full glory.
asciiJSON.parse = JSON.parse
