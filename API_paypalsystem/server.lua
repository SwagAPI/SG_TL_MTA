local connection = exports.fv_engine:getConnection(getThisResource())

addEvent("paypal.register",true)

function paypalregister(player,email,password)
	if not email or not password then outputChatBox("not defined") end
	if not string.find(email , "@gmail.com") then return outputChatBox("Please Enter a valid email") end
	local check = dbPoll ( dbQuery ( connection, "SELECT `email` ,`password` FROM `paypalaccounts` WHERE `email`=?", email) , -1);
	if ( #check == 0 ) then 
		setElementData(player , "paypal.email" , email)
		setElementData(player,"haspaypal",true)
		dbExec ( connection, "INSERT INTO `paypalaccounts` (`email`,`password` ) VALUES ( ?, ?  )", email, password); -- if not creating 
	end
	if (#check > 0) then 
	outputChatBox("Email Already Exist")
	end
	
end
addEventHandler("paypal.register",root,paypalregister)




addEvent("paypal.login",true)
function paypallogin(player,email,password)
	local check = dbPoll ( dbQuery ( connection, "SELECT * FROM `paypalaccounts` WHERE `email`=?", email), -1 ); -- checking if exist row 
	for i ,v in pairs (check) do
	if not getElementData(player,"paypal.logged") then
	if v.online == 1 then
	exports.fv_infobox:addNotification(player,"error","Account already in use")
	return;
	end
		
		if #check > 0 then
		if password == v.password and email then		
		setElementData(player,"paypal.logged",true)
		setElementData(player,"paypal.balance",v.value)
		setElementData(player,"paypal.email",email)
		setElementData(player,"loginpanel",false)
		dbExec(connection,"UPDATE `paypalaccounts` SET `online`=1 WHERE `email`=?",email);
		exports.fv_infobox:addNotification(player,"success","Successfuly Logged In")
		else
			exports.fv_infobox:addNotification(player,"error","Incorrect Email or Password")
			return;
		end
		
		end
	
	else
		outputChatBox("you are already logged in")
		end
	end
end
addEventHandler("paypal.login",root,paypallogin)

addEvent("paypal.logout",true)
function logout(player)
	
setElementData(player,"paypal.logged",false)
		dbExec(connection,"UPDATE `paypalaccounts` SET `online`=0 WHERE `email`=?",getElementData(player,"paypal.email"));
		outputChatBox("logged out")
		setTimer(function()
		
		setElementData(player , "paypal.email","")
		end , 100,1)
end



addEventHandler("paypal.logout",root,logout)






function checkhasaccount()
	
		
		setElementData(source,"paypal.balance",0)
	
end
addEventHandler("onPlayerSpawn" , root ,checkhasaccount)

function checkpayp(player)

setElementData(player,"paypal.balance",getElementData(player,"paypal.balance") + 30)
dbExec ( connection, "UPDATE `paypalaccounts` SET `value`=? WHERE `email`=?", getElementData(player , "paypal.balance"), getElementData(player , "paypal.email"));
outputChatBox("you have accoount")

	outputChatBox(getElementData(player ,"paypal.balance") or 0)

end
addCommandHandler("checkpayp",checkpayp)



--[[
function setbalance(player,cmd,email,value)



	

	setTimer(function()
	local check = dbPoll ( dbQuery ( connection, "SELECT * FROM `paypalaccounts` WHERE `email`=?", email), -1 ); -- checking if exist row 
	
	for i ,v in pairs (check) do
		setElementData(player,"paypal.balance",v.value)
	
	end
	end , 100 , 0)


end
addCommandHandler("setvalue",setbalance)
]]--




----- check players email and balance every 1s
function setall()

	for k ,v in pairs(getElementsByType("player")) do 
		if getElementData(v,"paypal.logged") then 
		local check = dbPoll ( dbQuery ( connection, "SELECT * FROM `paypalaccounts` WHERE `email`=?", getElementData(v,"paypal.email")), -1 ); -- checking if exist row 
		for i,s in pairs(check) do 
			setElementData(v,"paypal.balance",s.value)
		end
		end
	
	end

end
setTimer(setall,100,0)







function setss(player)

setElementData(player,"paypal.balance",getElementData(player,"paypal.balance") + 30)
dbExec ( connection, "UPDATE `paypalaccounts` SET `value`=? WHERE `email`=?", getElementData(player , "paypal.balance"), getElementData(player , "paypal.email"));


end
addCommandHandler("setss",setss)






