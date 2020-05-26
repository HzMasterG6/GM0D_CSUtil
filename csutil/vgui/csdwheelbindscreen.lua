if not IsValid(annoyingbindtest) then
    annoyingbindtest = vgui.Create("CSDWheelBindSelect")
else
    annoyingbindtest:Remove()
end

local PANEL = {}
PANEL.MaxSlots = 9
PANEL.Slots = {}
--CSDWheelBindButton
function PANEL:Init()
    self:SetSize(400,400)
    self:Center()
    for i=0,(self.MaxSlots-1) do 
        self.Slots[i] = vgui.Create("CSDWheelBindButton",self)
        local divisor = math.ceil(self.MaxSlots)/4
        local mul = 128
        local offset = 16
        if i<=2 then
            self.Slots[i]:SetPos(mul*i+offset,12)
        elseif i>= 3 and i<=5 then
            self.Slots[i]:SetPos(mul*(i-3)+offset,(16+(400/3)))
        elseif i>=6 then
            self.Slots[i]:SetPos(mul*(i-6)+offset,((24*6)+(400/3)))
        end
    end
end

function PANEL:Paint(w,h)
    draw.RoundedBoxEx(16,5,5,w-5,h-5,Color(0,0,0,45),true,true,true,false )
    draw.RoundedBoxEx(16,0,0,w-5,h-5,Color(255,0,0,175),true,true,true,false )
end

function PANEL:Think()

end


vgui.Register("CSDWheelBindSelect",PANEL,"Panel")
