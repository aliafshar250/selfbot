local function history(extra, suc, result)
for i=1, #result do
delete_msg(result[i].id, ok_cb, false)
end
if tonumber(extra.con) == #result then
send_msg(extra.chatid, 'ℹ "'..#result..'" تمامی پیام های اخریا سوپر گروه حذف شدند', ok_cb, false)
else
send_msg(extra.chatid, 'ℹ️تمامی پیام های اخریا سوپر گروه حذف شدند', ok_cb, false)
end
end
local function allhistory(extra, suc, result)
for i=1, #result do
delete_msg(result[i].id, ok_cb, false)
end
if #result == 1000 then
get_history(msg.to.peer_id, 1000, allhistory , {chatid = msg.to.peer_id})
else
send_msg(extra.chatid, 'ℹتمامی پیام های اخریا سوپر گروه حذف شدند ', ok_cb, false)
end
end
local function run(msg, matches)
if matches[1] == 'rmmsg' then
    if permissions(msg.from.id, msg.to.id, "settings") then
        if msg.to.type == 'channel' then
            if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
            return '🚫 Wrong Number,Range Is [1-1000]'
        end
        delete_msg(msg.id, ok_cb, false)
            get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
        else
        return '🚫 '..lang_text(msg.to.id, 'onlychannel')
        end
else
return '🚫 '..lang_text(msg.to.id, 'require_mod')
end
elseif matches[1] == 'clean' then
if matches[2] == 'msgs' then
    if permissions(msg.from.id, msg.to.id, "settings") then
        if msg.to.type == 'channel' then
           delete_msg(msg.id, ok_cb, false)
            get_history(msg.to.peer_id, 1000, allhistory , {chatid = msg.to.peer_id})
        else
                         return '🚫 '..lang_text(msg.to.id, 'onlychannel')
        end
else
return '🚫 '..lang_text(msg.to.id, 'require_mod')
end
end
end
end
return {
    patterns = {
        '^[!/#](rmmsg) (%d*)$',
        '^[!/#](clean) (msgs)$'
    },
    run = run
}
