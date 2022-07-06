local connection = exports.fv_engine:getConnection(getThisResource());
local tick = 0;


function test()
    dbQuery(function(qh)
        local res = dbPoll(qh,0);
        for k,v in pairs(res) do 
            for i,l in pairs(getElementsByType("player")) do 
                if getElementData(l,"acc >> id") == v.ownerid then 
                    exports.fv_inventory:givePlayerItem(l,v.itemid,v.count,v.value,100,0)
                    dbExec(connection,"DELETE FROM discorditemconsole WHERE ownerid=?",v.ownerid);
                end
            end
        end 
    end,connection,"SELECT * FROM discorditemconsole")

    
end

setTimer(test,2000,0)

end



function cc()
    local allResources = getResources()
	-- for each one of them,
	for index, res in ipairs(allResources) do
		-- if it's running,
		outputChatBox(getResourceName(res))
	end


end
addCommandHandler("cc",cc)