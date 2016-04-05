# Description
#   A hubot script that does the things
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Jony Vesterman Cohen <cohenjo@hpe.com>

module.exports = (robot) ->
  states = {}
  robot.brain.set 'states', states

  format = (n, todo) -> "(#{n}) #{todo}"

  hello = (res) ->
    userId = res.message.user.id
    userState = states[userId] ? []
    userState.push 'test'
    states[userId] = userState
    res.robot.brain.save()
    res.send format(userState.length, 'test')

  problem = (res) ->
    problem = res.match[1]
    res.reply "Did you try turning " + problem + " on and off again?"

  robot.respond /hello/, hello
  robot.respond /.*problem (.+)$/, problem
#  robot.respond /hello/, (res) ->
#    res.reply "hello! "
#    res.reply "hello! "+ res.message.user.id + " name: " + res.message.user.name 

  robot.hear /orly/, ->
    res.send "yarly"
