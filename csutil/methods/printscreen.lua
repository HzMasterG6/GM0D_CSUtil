csutil.echoConfig = {
	pos = {0,0}
	color = {255,0,0}
}
-- echoScreen <text>
-- > Will print in screen a text and will automatically remove on 4 seconds
-- > Max stacks: 3
function csutil.echoScreen(ply,cmd,args)
	local textdata = {
		font = "CloseCaption_Normal",
		pos = {30,30}
		color = Color(255,0,0)
	}
end
-- echoScreenAdv <text> <config>
-- > is a echo without require the config.
-- > <config> = Json | {x=0,y=0,color="ff0000",bg="00ff00",shadow=true}

-- echoError <text>
-- > Will show a error message used by system (Left Top Yellow Message)
-- echoConfig <stack> <x,y>
-- > config for echoScreen. 
-- > <x,y> = string (10,10)

-- notify <0~4> <text> <secs>
-- > Will show at right bottom made by GMOD 
function csutil.notify(ply,cmd,args,strg)
	local text = (#args == 1) and strg or args[2] 
	local type_ = (#args == 3) and args[1] or NOTIFY_HINT
	local secs = (#args == 3) and args[3] or 3
	notification.AddLegacy(text,type_,secs)
end

concommand.Add( "csutil_notify", csutil.notify, "Send a Notification for your client. showing in your screen")


