local PANEL = {}
PANEL.Highlight = false
PANEL.CurrentSlotConCommand = "act zombie"
PANEL.BindButtonText = "Do Zombie Moan"
PANEL.ShouldRemoveBase = false

function PANEL:Init()
    self:SetSize( 100,100 )
    self:Center()
end

-- DrawOverlay
function PANEL:Paint( w, h )
    local rofl = GetConVar("cl_playercolor")
	   local blucolor = string.Split(rofl:GetString()," ")
    local rgb = {blucolor[1]*255,blucolor[2]*255,blucolor[3]*255}
    local yeahcolor = Color(rgb[1],rgb[2],rgb[3],128)
	   ColorAct = yeahcolor
    if self.Highlight then 
    	   ColorAct = yeahcolor
    else
	   	   ColorAct = Color(117, 117, 117, 128)
    end
    draw.RoundedBox( w/6, 0, 0, w, h, ColorAct or Color(171, 171, 171,128) )
    draw.SimpleText(self.BindButtonText,"DermaDefault",w/2,h/2,Color( 255, 255, 255, 255 ),
    TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
end

function PANEL:OnCursorEntered()   self.Highlight = true end
function PANEL:OnCursorExited()   self.Highlight = false end

function PANEL:OnMousePressed(keyCode) 
    local varargs = string.Split(self.CurrentSlotConCommand," ")
    local concommand_name = varargs[1]
    local args = varargs
    table.remove(args,1)
    RunConsoleCommand( concommand_name, unpack(args) )
    self.ShouldRemoveBase = true
    local parent = self:GetParent()
    if IsValid(parent) then
    	parent:Remove()
    end
end
vgui.Register( "CSDWheelBindButton", PANEL, "Panel" )

