-- CSUTIL
-- CS Utils
-- Add some concommands that not is added by default in gmod.
csutil = {}
-- wait_ <num> <xstring>
-- > Call a next string after X seconds
function csutil.wait(ply,cmd,args,argStr)

end

csutil.plusminus_ = false
function csutil.toggleplusminus_(bl)
	if csutil.plusminus_ then 
		local csdermautil = vgui.Create()
		hook.Add("DrawOverlay","csutil_csdwheel", function()
			
		end)
	else
		hook.Remove("DrawOverlay","csutil_csdwheel")
	end
end
