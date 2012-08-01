# Description:
#   Display links to images of http status codes represented by cat images
#
# Dependencies:
#   NONE
#
# Configuration:
#   NONE
#
# Commands:
#   hubot http status [http status code] - specific image of the http status code given, or
#       a random one if none is given
#
# Author:
#   bwillis

module.exports = (robot) ->
  robot.respond /http\sstatus\s?(.*)/i, (msg) ->
    http_codes = [100, 101, 200, 201, 202, 204, 206, 207, 300, 301, 303, 304, 305, 307, 400, 401, 402, 403, 404, 405, 406, 408, 409, 410, 411, 413, 414, 416, 417, 418, 422, 423, 424, 425, 426, 429, 431, 444, 450, 500, 502, 503, 506, 507, 508, 509, 599]
    http_code = parseInt(msg.match[1],10)
    if isNaN(http_code) or http_codes.indexOf(http_code) < 0
      http_code = http_codes[Math.floor((Math.random()*http_codes.length))]
    msg.send "http://httpcats.herokuapp.com/#{http_code}.jpg"
