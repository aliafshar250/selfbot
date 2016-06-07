do

function run(msg, matches)
      if msg.reply_id and is_sudo (msg) then
      delete_msg(msg.id, ok_cb, false)
    delete_msg(msg.reply_id, ok_cb, true)
      else
    return 
    end
end

return {
    description = "", 
    usage = "",
    patterns = {
      "^[!#/]del$"
    }, 
    run = run 
}

end
