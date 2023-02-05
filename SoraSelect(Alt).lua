local Settings = 0x446D06
local OptionA = false
local OptionB = false
local OptionC = false
function _OnInit()
	if GAME_ID == 0x431219CC and ENGINE_TYPE == "BACKEND" then --PC
		OnPC = true
		ConsolePrint("Settings Test: Loaded")
		--Sys3 = 0x2A59DB0 - 0x56450E
		Sys3 = ReadLong(0x02A0DC58 - 0x56454E), true
end
end

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
	--Gameplay Models: Regular
	WriteString(Obj0+0x13F0, 'P_EX101\0', true)
	WriteString(Obj0+0x1450, 'P_EX101_BTLF\0', true)
	WriteString(Obj0+0x14B0, 'P_EX101_MAGF\0', true)
	WriteString(Obj0+0x1510, 'P_EX101_TRIF\0', true)
	WriteString(Obj0+0x1570, 'P_EX101_ULTF\0', true)
	WriteString(Obj0+0x15D0, 'P_EX101_HTLF\0', true)
	WriteString(Obj0+0x291D0, 'P_EX101_KH1F\0', true)

	--Gameplay Models: HALLOWEEN TOWN
	WriteString(Obj0+0x9370, 'P_EX101_NM\0', true)
	WriteString(Obj0+0xDC30, 'P_EX101_NM_BTLF\0', true)
	WriteString(Obj0+0xDC90, 'P_EX101_NM_MAGF\0', true)
	WriteString(Obj0+0xDCF0, 'P_EX101_NM_TRIF\0', true)
	WriteString(Obj0+0xDD50, 'P_EX101_NM_ULTF\0', true)
	WriteString(Obj0+0xDDB0, 'P_EX101_NM_HTLF\0', true)
	WriteString(Obj0+0x29230, 'P_EX101_NM_KH1F\0', true)

	--Gameplay Models: CHRISTMAS TOWN (Unused)
	--WriteString(Obj0+0x28ED0, 'P_EX101_XM\0', true)
	--WriteString(Obj0+0x28F30, 'P_EX101_XM_BTLF\0', true)
	--WriteString(Obj0+0x28F90, 'P_EX101_XM_MAGF\0', true)
	--WriteString(Obj0+0x28FF0, 'P_EX101_XM_TRIF\0', true)
	--WriteString(Obj0+0x29050, 'P_EX101_XM_ULTF\0', true)
	--WriteString(Obj0+0x290B0, 'P_EX101_XM_HTLF\0', true)
	--WriteString(Obj0+0x29290, 'P_EX101_XM_KH1F\0', true)

	--Gameplay Models: SPACE PARANOIDS (Unused)
	--WriteString(Obj0+0x18850, 'P_EX101_TR\0', true)
	--WriteString(Obj0+0x18F10, 'P_EX101_TR_BTLF\0', true)
	--WriteString(Obj0+0x18FD0, 'P_EX101_TR_MAGF\0', true)
	--WriteString(Obj0+0x19090, 'P_EX101_TR_TRIF\0', true)
	--WriteString(Obj0+0x19150, 'P_EX101_TR_ULTF\0', true)
	--WriteString(Obj0+0x19210, 'P_EX101_TR_HTLF\0', true)
	--WriteString(Obj0+0x292F0, 'P_EX101_TR_KH1F\0', true)
	
	--Gameplay Models: TIMELESS RIVER (Unused)
	--WriteString(Obj0+0x188B0, 'P_EX101_WI\0', true)
	--WriteString(Obj0+0x18F70, 'P_EX101_WI_BTLF\0', true)
	--WriteString(Obj0+0x19030, 'P_EX101_WI_MAGF\0', true)
	--WriteString(Obj0+0x190F0, 'P_EX101_WI_TRIF\0', true)
	--WriteString(Obj0+0x191B0, 'P_EX101_WI_ULTF\0', true)
	--WriteString(Obj0+0x19270, 'P_EX101_WI_HTLF\0', true)
	--WriteString(Obj0+0x29350, 'P_EX101_WI_KH1F\0', true)

	--Cutscene Models: Regular. Uncomment this out if you have cutscene models for H_EX501.
--	WriteString(Obj0+0x4270, 'H_EX501\0', true)
--	WriteString(Obj0+0x32B0, 'H_EX501_BTLF\0', true)
--	WriteString(Obj0+0x16D50, 'H_EX501_MAGF\0', true)
--	WriteString(Obj0+0x16DB0, 'H_EX501_TRIF\0', true)
--	WriteString(Obj0+0x161E0, 'H_EX501_ULTF\0', true)
--	WriteString(Obj0+0x29E90, 'H_EX501_KH1F\0', true)

--	local Field, Fight
--	for i = 0xB06C, 0x1086C, 0x40 do
--		for j = 0, 1 do
--			local Offset = Sys3 + i
--			Field = ReadShort(Offset)
--			Fight = ReadShort(Offset+2)
--			WriteByte(Offset, 1)
--			WriteByte(Offset, Fight+0x320)
--			WriteByte(Offset, Field+0x320)
--		end
--	end
	
--Swaps voices to load from "world0_char_win32.scd" to "world1_char_win32.scd"
	local Field, Fight
	for i = 0x84, 0x5884, 0x40 do
		for j = 0, 1 do
			local Offset = Sys3 + i
			Field = ReadShort(Offset)
			Fight = ReadShort(Offset+2)
			WriteByte(Offset, 1, true)
			--WriteByte(Offset, Fight+0x320)
			--WriteByte(Offset, Field+0x320)
		end
	end

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

	--Gameplay Models: HALLOWEEN TOWN
	WriteString(Obj0+0x9370, 'P_EX100_NM\0', true)
	WriteString(Obj0+0xDC30, 'P_EX100_NM_BTLF\0', true)
	WriteString(Obj0+0xDC90, 'P_EX100_NM_MAGF\0', true)
	WriteString(Obj0+0xDCF0, 'P_EX100_NM_TRIF\0', true)
	WriteString(Obj0+0xDD50, 'P_EX100_NM_ULTF\0', true)
	WriteString(Obj0+0xDDB0, 'P_EX100_NM_HTLF\0', true)
	WriteString(Obj0+0x29230, 'P_EX100_NM_KH1F\0', true)

	--Gameplay Models: CHRISTMAS TOWN 
	WriteString(Obj0+0x28ED0, 'P_EX100_XM\0', true)
	WriteString(Obj0+0x28F30, 'P_EX100_XM_BTLF\0', true)
	WriteString(Obj0+0x28F90, 'P_EX100_XM_MAGF\0', true)
	WriteString(Obj0+0x28FF0, 'P_EX100_XM_TRIF\0', true)
	WriteString(Obj0+0x29050, 'P_EX100_XM_ULTF\0', true)
	WriteString(Obj0+0x290B0, 'P_EX100_XM_HTLF\0', true)
	WriteString(Obj0+0x29290, 'P_EX109_XM_KH1F\0', true)

	--Gameplay Models: SPACE PARANOIDS 
	WriteString(Obj0+0x18850, 'P_EX100_TR\0', true)
	WriteString(Obj0+0x18F10, 'P_EX100_TR_BTLF\0', true)
	WriteString(Obj0+0x18FD0, 'P_EX100_TR_MAGF\0', true)
	WriteString(Obj0+0x19090, 'P_EX100_TR_TRIF\0', true)
	WriteString(Obj0+0x19150, 'P_EX100_TR_ULTF\0', true)
	WriteString(Obj0+0x19210, 'P_EX100_TR_HTLF\0', true)
	WriteString(Obj0+0x292F0, 'P_EX100_TR_KH1F\0', true)
	
	--Gameplay Models: TIMELESS RIVER 
	WriteString(Obj0+0x188B0, 'P_EX100_WI\0', true)
	WriteString(Obj0+0x18F70, 'P_EX100_WI_BTLF\0', true)
	WriteString(Obj0+0x19030, 'P_EX100_WI_MAGF\0', true)
	WriteString(Obj0+0x190F0, 'P_EX100_WI_TRIF\0', true)
	WriteString(Obj0+0x191B0, 'P_EX100_WI_ULTF\0', true)
	WriteString(Obj0+0x19270, 'P_EX100_WI_HTLF\0', true)
	WriteString(Obj0+0x29350, 'P_EX100_WI_KH1F\0', true)

	--Cutscene Models: Regular
	WriteString(Obj0+0x4270, 'H_EX500\0', true)
	WriteString(Obj0+0x32B0, 'H_EX500_BTLF\0', true)
	WriteString(Obj0+0x16D50, 'H_EX500_MAGF\0', true)
	WriteString(Obj0+0x16DB0, 'H_EX500_TRIF\0', true)
	WriteString(Obj0+0x161E0, 'H_EX500_ULTF\0', true)
	WriteString(Obj0+0x29E90, 'H_EX500_KH1F\0', true)

--Swaps voices to load from "world0_char_win32.scd" to "world1_char_win32.scd"
	local Field, Fight
	for i = 0x84, 0x5884, 0x40 do
		for j = 0, 1 do
			local Offset = Sys3 + i
			Field = ReadShort(Offset)
			Fight = ReadShort(Offset+2)
			WriteByte(Offset, 0, true)
			--WriteByte(Offset, Fight+0x320)
			--WriteByte(Offset, Field+0x320)
		end
	end

end
if OptionC == true and StringCheck ~= 'P_EX103' and roomtransition ~= 1 then
	ConsolePrint("KH3 Sora: Loaded")
	--Gameplay Models: Regular
	WriteString(Obj0+0x13F0, 'P_EX103\0', true)
	WriteString(Obj0+0x1450, 'P_EX103_BTLF\0', true)
	WriteString(Obj0+0x14B0, 'P_EX103_MAGF\0', true)
	WriteString(Obj0+0x1510, 'P_EX103_TRIF\0', true)
	WriteString(Obj0+0x1570, 'P_EX103_ULTF\0', true)
	WriteString(Obj0+0x15D0, 'P_EX103_HTLF\0', true)
	WriteString(Obj0+0x291D0, 'P_EX103_KH1F\0', true)

	--Gameplay Models: HALLOWEEN TOWN (Unused)
	--WriteString(Obj0+0x9370, 'P_EX103_NM\0', true)
	--WriteString(Obj0+0xDC30, 'P_EX103_NM_BTLF\0', true)
	--WriteString(Obj0+0xDC90, 'P_EX103_NM_MAGF\0', true)
	--WriteString(Obj0+0xDCF0, 'P_EX103_NM_TRIF\0', true)
	--WriteString(Obj0+0xDD50, 'P_EX103_NM_ULTF\0', true)
	--WriteString(Obj0+0xDDB0, 'P_EX103_NM_HTLF\0', true)
	--WriteString(Obj0+0x29230, 'P_EX103_NM_KH1F\0', true)

	--Gameplay Models: CHRISTMAS TOWN (Unused)
	--WriteString(Obj0+0x28ED0, 'P_EX103_XM\0', true)
	--WriteString(Obj0+0x28F30, 'P_EX103_XM_BTLF\0', true)
	--WriteString(Obj0+0x28F90, 'P_EX103_XM_MAGF\0', true)
	--WriteString(Obj0+0x28FF0, 'P_EX103_XM_TRIF\0', true)
	--WriteString(Obj0+0x29050, 'P_EX103_XM_ULTF\0', true)
	--WriteString(Obj0+0x290B0, 'P_EX103_XM_HTLF\0', true)
	--WriteString(Obj0+0x29290, 'P_EX103_XM_KH1F\0', true)

	--Gameplay Models: SPACE PARANOIDS (Unused)
	--WriteString(Obj0+0x18850, 'P_EX103_TR\0', true)
	--WriteString(Obj0+0x18F10, 'P_EX103_TR_BTLF\0', true)
	--WriteString(Obj0+0x18FD0, 'P_EX103_TR_MAGF\0', true)
	--WriteString(Obj0+0x19090, 'P_EX103_TR_TRIF\0', true)
	--WriteString(Obj0+0x19150, 'P_EX103_TR_ULTF\0', true)
	--WriteString(Obj0+0x19210, 'P_EX103_TR_HTLF\0', true)
	--WriteString(Obj0+0x292F0, 'P_EX103_TR_KH1F\0', true)
	
	--Gameplay Models: TIMELESS RIVER (Unused)
	--WriteString(Obj0+0x188B0, 'P_EX103_WI\0', true)
	--WriteString(Obj0+0x18F70, 'P_EX103_WI_BTLF\0', true)
	--WriteString(Obj0+0x19030, 'P_EX103_WI_MAGF\0', true)
	--WriteString(Obj0+0x190F0, 'P_EX103_WI_TRIF\0', true)
	--WriteString(Obj0+0x191B0, 'P_EX103_WI_ULTF\0', true)
	--WriteString(Obj0+0x19270, 'P_EX103_WI_HTLF\0', true)
	--WriteString(Obj0+0x29350, 'P_EX103_WI_KH1F\0', true)

	--Cutscene Models: Regular
	WriteString(Obj0+0x4270, 'H_EX503\0', true)
	WriteString(Obj0+0x32B0, 'H_EX503_BTLF\0', true)
	WriteString(Obj0+0x16D50, 'H_EX503_MAGF\0', true)
	WriteString(Obj0+0x16DB0, 'H_EX503_TRIF\0', true)
	WriteString(Obj0+0x161E0, 'H_EX503_ULTF\0', true)
	WriteString(Obj0+0x29E90, 'H_EX503_KH1F\0', true)

--Swaps voices to load from "world0_char_win32.scd" to "world1_char_win32.scd"
	local Field, Fight
	for i = 0x84, 0x5884, 0x40 do
		for j = 0, 1 do
			local Offset = Sys3 + i
			Field = ReadShort(Offset)
			Fight = ReadShort(Offset+2)
			WriteByte(Offset, 3, true)
			--WriteByte(Offset, Fight+0x320)
			--WriteByte(Offset, Field+0x320)
		end
	end

end


--OBJ0 BASE ADDRESS: 0x2A22BD0
--NM SORA:
--NM sora is 0x7F80 away from Base Sora 		(Obj0+0x9370)
--BTLF NM is 0xC840 away from Base Sora 		(Obj0+0xDC30)
--MAGF NM is 0xC840+0x60 away					(Obj0+0xDC90)
--TRIF NM is 0xC840+0x60+0x60 away				(Obj0+0xDCF0)
--ULTF NM is 0xC840+0x60+0x60+0x60 away			(Obj0+0xDD50)
--HTLF NM is 0xC840+0x60+0x60+0x60+0x60 away	(Obj0+0xDDB0)
--KH1F NM is 0x27E40 away from Base Sora		(Obj0+0x29230)

--XM SORA:
--XM Base: 	0x2A4BAA0	(Obj0+0x28ED0
--BTLF 		0x2A4BB00	(Obj0+0x28F30
--MAGF 		0x2A4BB60	(Obj0+0x28F90
--TRIF 		0x2A4BBC0	(Obj0+0x28FF0
--ULTF 		0x2A4BC20	(Obj0+0x29050
--HTLF 		0x2A4BC80	(Obj0+0x290B0
--KH1F 		0x2A4BE60	(Obj0+0x29290

--TR SORA:
--TR BASE:	0x2A3B420	(Obj0+0x18850
--TR BTLF:	0x2A3BAE0	(Obj0+0x18F10
--TR MAGF:	0x2A3BBA0	(Obj0+0x18FD0
--TR TRIF:	0x2A3BC60	(Obj0+0x19090
--TR ULTF:	0x2A3BD20	(Obj0+0x19150
--TR HTLF:	0x2A3BDE0	(Obj0+0x19210
--TR KH1F:	0x2A4BEC0	(Obj0+0x292F0

--WI SORA:
--WI BASE:	0x2A3B480	(Obj0+0x188B0
--WI BTLF:	0x2A3BB40	(Obj0+0x18F70
--WI MAGF:	0x2A3BC00	(Obj0+0x19030
--WI TRIF:	0x2A3BCC0	(Obj0+0x190F0
--WI ULTF:	0x2A3BD80	(Obj0+0x191B0
--WI HTLF:	0x2A3BE40	(Obj0+0x19270
--WI KH1F:	0x2A4BF20	(Obj0+0x29350


--HIGH POLY SORA:
--BTLF High Poly is 2A25E80			Obj0+0x32B0
--Base is 2A26E40					Obj0+0x4270
--MAGF is 0x2A39920					Obj0+0x16D50
--TRIF is 0x2A39980					Obj0+0x16DB0
--ULTF is 0x2A399E0					Obj0+0x161E0
--KH1F is 0x2A4CA60					Obj0+0x29E90

end
