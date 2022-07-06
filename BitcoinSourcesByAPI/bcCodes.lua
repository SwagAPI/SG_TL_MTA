--[[
This script was creaded by Swag
Copyright 2022 by Swag.
You can use this for your server. You are not allowed to sell this or make money in any other way with this!
If you use something from this script, please don't forget me in the credits.
Have fun!
]]--


function panel()
    local alpha3 = 100;
    dxDrawImage ( sx/2-400, sy/2-200, 1000, 500, 'windows.png', 0, -120 )
    dxDrawImage(sx/2-395,sy/2-180,50,50,"bitcoin.png");
    dxDrawImage(sx/2-395,sy/2+253,35,35,"logo.png");
    --dxDrawImage(sx/2-395,sy/2+255,35,35,"logo.png");
    dxDrawText ("BC-Miner", sx/2-395, sy/2-130, sx, sy, tocolor ( 255, 255, 255, 255 ), 1, font3 )
    if e:isInSlot(sx/2+570,sy/2-200,30,30) then
        alpha3 = 160;
    end
    dxDrawRectangle(sx/2+570,sy/2-200,30,30,tocolor(201,51,51 , alpha3));
    dxDrawText ( "X", sx/2+575, sy/2-200, sx, sy, tocolor ( 255, 255, 255, 255 ), 1, "bankgothic" )
       --dxDrawRectangle ( sx/3.8, sy/3.8, sx/2.02, sy/2, tocolor ( 0, 0, 0, 150 ) ) 
end
local bitcoin = 0.0001;
function panel2()
    local alpha = 100;
    local alpha1 = 100;
    if e:isInSlot(sx/2+319,sy/2-150,30,30) then
        alpha = 160;
    end
    
    dxDrawRectangle(sx/2-50,sy/2-150,400,400,tocolor(255,255,255,100));
    dxDrawRectangle(sx/2-50,sy/2-150,400,30,tocolor(255,255,255,50));
    dxDrawRectangle(sx/2-45,sy/2-100,390,30,tocolor(255,255,255,100));
    dxDrawRectangle(sx/2+319,sy/2-150,30,30,tocolor(201,51,51 , alpha));
    if e:isInSlot(sx/2+85,sy/2+170,110,33) then
        alpha1 = 160;
    end
    dxDrawText ( "X", sx/2+323, sy/2-150, sx, sy, tocolor ( 255, 255, 255, 255 ), 1, "bankgothic" )
    if getElementData(localPlayer,"bitcoinbalance") <= 0 then 
    dxDrawText ( "Miner - Current Bitcoin : 0.0000", sx/2-45, sy/2-145, sx, sy, tocolor ( 255, 255, 255, 255 ), 1, font2 ) 
    else
        dxDrawText ( "Miner - Current Bitcoin : "..getElementData(localPlayer ,"bitcoinbalance"), sx/2-45, sy/2-145, sx, sy, tocolor ( 255, 255, 255, 255 ), 1, font2 ) 
    end
    dxDrawText ("Code : "..number, sx/2+85, sy/2-30, sx, sy, tocolor ( 255, 255, 255, 255 ), 1, font3 )
    dxDrawRectangle(sx/2+85,sy/2+170,110,33,tocolor(0,255,255,alpha1));
    dxDrawText ("Start Mining ", sx/2+85,sy/2+170, sx, sy, tocolor ( 255, 255, 255, 255 ), 1, font3 )
end

addEventHandler("onClientKey",root,function(button,state)
    if button == "backspace" and state then
        exports.fv_dx:dxDestroyEdit("bc.coin") 
        setElementData(localPlayer ,"panelshow" , false)
        removeEventHandler("onClientRender" , root , panel)
        removeEventHandler("onClientRender" , root , panel2)
        showCursor(false) 
        removeEventHandler("onClientRender" , root ,render)
        load = -1;
    end
    if getKeyState("mouse1") then
        if not getElementData(localPlayer ,"loading") then 
            if not getElementData(localPlayer ,"panelshow2") then 
        if e:isInSlot(sx/2+570,sy/2-200,30,30) then
            exports.fv_dx:dxDestroyEdit("bc.coin") 
        setElementData(localPlayer ,"panelshow" , false)
        
        removeEventHandler("onClientRender" , root , panel)
        removeEventHandler("onClientRender" , root , panel2)
        showCursor(false) 
        removeEventHandler("onClientRender" , root ,render)

        load = -1;
        end
    end
    end
    end
end)


addEventHandler("onClientClick",root,function(button,state)
    if button == "left" and state == "down" then
        if clickTick+1000 > getTickCount() then return end;
        
        if getElementData(localPlayer ,"togHUD") then         
                    if e:isInSlot(sx/2-395,sy/2-180,50,50) then
                        if not getElementData(localPlayer ,"panelshow2") then
                        exports.fv_dx:dxDestroyEdit("bc.coin")
                        if getElementData(localPlayer ,"panelshow") then 
                        number = ("bc"..math.random(1111,9999)..math.random(11,99)) 
                    if clickTick+1000 > getTickCount() then return end;
                    addEventHandler("onClientRender" , root , panel2)
                    setElementData(localPlayer ,"panelshow2" , true)
                    local bcoin = exports.fv_dx:dxCreateEdit("bc.coin" , "" , "Enter Code Here",sx/2+70,sy/2+120,130,30);
                    clickTick = getTickCount();
                    end
                end
                    end
                    if e:isInSlot(sx/2+319,sy/2-150,30,30) then
                        if not getElementData(localPlayer,"loading")  then 
                        
                        setElementData(localPlayer ,"panelshow2" , false)
                        removeEventHandler("onClientRender" , root , panel2)
                        exports.fv_dx:dxDestroyEdit("bc.coin")
                        removeEventHandler("onClientRender" , root ,render)
                        load = -1;
                        setElementData(localPlayer ,"loading" ,false)
                        
                    end
                end
                    if getElementData(localPlayer ,"panelshow2") then
                    if e:isInSlot(sx/2+85,sy/2+170,110,33) then
                        if not getElementData(localPlayer,"loading") then
                        local bitcoinBorden = exports.fv_dx:dxGetEditText("bc.coin")
                        if bitcoinBorden == number then
                            if clickTick+1000 > getTickCount() then return end;
                            exports.fv_infobox:addNotification("success" , "Code found !")
                            clickTick = getTickCount();
                            setElementData(localPlayer , "loading" , true)
                            luck = math.random(1,20)
                            outputChatBox(luck)
                            addEventHandler("onClientRender" , root ,render)
                            setTimer(function()
                                removeEventHandler("onClientRender" , root ,render)
                                number = ("bc"..math.random(1111,9999)..math.random(11,99))
                                load = -1;
                                if getElementData(localPlayer ,"loading") then 
                                if luck > 10 then
                                setElementData(localPlayer , "loading" , false)
                                exports.fv_infobox:addNotification("success" , "We found 1 BC , Added to your account !")
                                --setElementData(localPlayer ,"bitcoinbalance" , getElementData(localPlayer,"bitcoinbalance")+1)
                                setElementData(localPlayer,"bitcoinbalance", getElementData(localPlayer ,"bitcoinbalance")+1)
                                else
                                    
                                    exports.fv_infobox:addNotification("error" , "We dont found BC , Code Expired Try again!")
                                    setElementData(localPlayer , "loading" , false)
                                end    
                            end 
                            end , 80000,1)
                        end
                        if bitcoinBorden ~= number then 
                            exports.fv_infobox:addNotification("error" , "Code expired or not found !")
                            clickTick = getTickCount();
                        end
                        end
                    end
                    end         
        end
    end
    
end)


