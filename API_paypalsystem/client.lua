function register(cmd,email,password)
	if string.find(email,"@")then 
	triggerServerEvent("paypal.register",localPlayer,localPlayer,email,password)
	else
	outputChatBox("email problem")
	end
	

end
addCommandHandler("reg",register)


function login(cmd,email,password)
	
	triggerServerEvent("paypal.login",localPlayer,localPlayer,email,password)
	
	

end
addCommandHandler("log",login)