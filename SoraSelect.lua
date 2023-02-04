local Settings = 0x446D06
local OptionA = false
local OptionB = false
local OptionC = false
function _OnInit()
	if GAME_ID == 0x431219CC and ENGINE_TYPE == "BACKEND" then --PC
		OnPC = true
		ConsolePrint("Settings Test: Loaded")
end
end

--So, goal;
function _OnFrame()
roomtransition = ReadByte(0x715568-0x56454E)
Obj0 = ReadLong(0x02A22730-0x56454E), true
StringCheck = ReadString(Obj0+0x13F0, 7, true)
--if StringCheck == 'P_EX100'
if ReadShort(Settings) & 0x400 ~= 0x400 and ReadShort(Settings) & 0x200 ~= 0x200 then
	--ConsolePrint("TEST! Summon is OFF")
	OptionA = true
	OptionB = false
	OptionC = false
elseif ReadShort(Settings) & 0x200 == 0x200 then
	--ConsolePrint("TEST! Summon is FULL")
	OptionA = false
	OptionB = true
	OptionC = false
elseif ReadShort(Settings) & 0x400 == 0x400 then
	--ConsolePrint("TSET: Summons is AUTO")
	OptionA = false
	OptionB = false
	OptionC = true
end

if OptionA == true and StringCheck ~= 'P_EX101' and roomtransition ~= 1 then
	ConsolePrint("KH1 Sora: Loaded")
	WriteString(Obj0+0x13F0, 'P_EX101\0', true)
	WriteString(Obj0+0x1450, 'P_EX101_BTLF\0', true)
	WriteString(Obj0+0x14B0, 'P_EX101_MAGF\0', true)
	WriteString(Obj0+0x1510, 'P_EX101_TRIF\0', true)
	WriteString(Obj0+0x1570, 'P_EX101_ULTF\0', true)
	WriteString(Obj0+0x15D0, 'P_EX101_HTLF\0', true)
	WriteString(Obj0+0x291D0, 'P_EX101_KH1F\0', true)
	WriteString(Obj0+0x9370, 'P_EX101_NM\0', true)
	WriteString(Obj0+0xDC30, 'P_EX101_NM_BTLF\0', true)
	WriteString(Obj0+0xDC90, 'P_EX101_NM_MAGF\0', true)
	WriteString(Obj0+0xDCF0, 'P_EX101_NM_TRIF\0', true)
	WriteString(Obj0+0xDD50, 'P_EX101_NM_ULTF\0', true)
	WriteString(Obj0+0xDDB0, 'P_EX101_NM_HTLF\0', true)
	WriteString(Obj0+0x29230, 'P_EX101_NM_KH1F\0', true)
end
if OptionB == true and StringCheck ~= 'P_EX100' and roomtransition ~= 1 then
	ConsolePrint("KH2 Sora: Loaded")
	WriteString(Obj0+0x13F0, 'P_EX100\0', true)
	WriteString(Obj0+0x1450, 'P_EX100_BTLF\0', true)
	WriteString(Obj0+0x14B0, 'P_EX100_MAGF\0', true)
	WriteString(Obj0+0x1510, 'P_EX100_TRIF\0', true)
	WriteString(Obj0+0x1570, 'P_EX100_ULTF\0', true)
	WriteString(Obj0+0x15D0, 'P_EX100_HTLF\0', true)
	WriteString(Obj0+0x291D0, 'P_EX100_KH1F\0', true)
	WriteString(Obj0+0x9370, 'P_EX100_NM\0', true)
	WriteString(Obj0+0xDC30, 'P_EX100_NM_BTLF\0', true)
	WriteString(Obj0+0xDC90, 'P_EX100_NM_MAGF\0', true)
	WriteString(Obj0+0xDCF0, 'P_EX100_NM_TRIF\0', true)
	WriteString(Obj0+0xDD50, 'P_EX100_NM_ULTF\0', true)
	WriteString(Obj0+0xDDB0, 'P_EX100_NM_HTLF\0', true)
	WriteString(Obj0+0x29230, 'P_EX100_NM_KH1F\0', true)
end
if OptionC == true and StringCheck ~= 'P_EX103' and roomtransition ~= 1 then
	ConsolePrint("KH3 Sora: Loaded")
	WriteString(Obj0+0x13F0, 'P_EX103\0', true)
	WriteString(Obj0+0x1450, 'P_EX103_BTLF\0', true)
	WriteString(Obj0+0x14B0, 'P_EX103_MAGF\0', true)
	WriteString(Obj0+0x1510, 'P_EX103_TRIF\0', true)
	WriteString(Obj0+0x1570, 'P_EX103_ULTF\0', true)
	WriteString(Obj0+0x15D0, 'P_EX103_HTLF\0', true)
	WriteString(Obj0+0x291D0, 'P_EX103_KH1F\0', true)
end

--NM sora is 0x7F80 away from Base Sora 		(Obj0+0x9370)
--BTLF NM is 0xC840 away from Base Sora 		(Obj0+0xDC30)
--MAGF NM is 0xC840+0x60 away					(Obj0+0xDC90)
--TRIF NM is 0xC840+0x60+0x60 away				(Obj0+0xDCF0)
--ULTF NM is 0xC840+0x60+0x60+0x60 away			(Obj0+0xDD50)
--HTLF NM is 0xC840+0x60+0x60+0x60+0x60 away	(Obj0+0xDDB0)
--KH1F NM is 0x27E40 away from Base Sora		(Obj0+0x29230)
end
