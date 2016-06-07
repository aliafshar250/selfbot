do

function run(msg, matches)
    return "SELF_BOT The robot is made by the team #BLACK TEAM For more information, visit our channel address our channel: @BLACKTEAMS"
end 
return {
  patterns = {
    "^#version$",
    "^#bot$",
    "^#selfbot$"
  },
  run = run
}
end
