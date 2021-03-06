--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest check_collect_reward begin
	state start begin
		when 20018.chat."Biyolo�un etkisiz re�eteleri" begin
			say_title("Baek-Go:")
			say("Selam! Nas�ls�n, sana nas�l yard�mc� olabilirim?")
			wait()
			say_pc_name()
			say("Biyolog Chaegirab'�n �d�llerinden s�z ediyorum.")
			say("Sana getirdi�im gizli re�eteyi hat�rl�yor musun?")
			say("��te, iksirlerden birinin bende etkisi olmad�.")
			wait()
			say_title("Baek-Go:")
			say("Hmm, ger�ekten de bu re�eteye eklenmesi")
			say("gerekenlerden biri eksik. Ama dert etme. Laz�m")
			say("olan her �ey i�te burada. Sana istedi�in etkiyi")
			say("g�sterece yeni bir iksiri hemen haz�rlar�m. Bir")
			say("dakika m�saade...")
			wait()
			local value = 1
			local a_ = pc.getf("bio", "30")
			local b_ = pc.getf("bio", "40")
			local c_ = pc.getf("bio", "50")
			local d_ = pc.getf("bio", "60")
			local e_ = pc.getf("bio", "70")
			local f_ = pc.getf("bio", "80")
			local g_ = pc.getf("bio", "85")
			local h_ = pc.getf("bio", "90")
			local i_ = pc.getf("bio", "92")
			local j_ = pc.getf("bio", "94")
			affect.remove_all_collect()
			if a_ == value then
				affect.add_collect(apply.MOV_SPEED, 10, 60*60*24*365*60)
			end
			if b_ == value then
				affect.add_collect(apply.ATT_SPEED,5,60*60*24*365*60)
			end
			if c_ == value then
				affect.add_collect(apply.DEF_GRADE_BONUS,60,60*60*24*365*60)
			end
			if d_ == value then
				affect.add_collect(apply.ATT_GRADE_BONUS,50,60*60*24*365*60)
			end
			if e_ == value then
				affect.remove_collect(apply.MOV_SPEED,10, 60*60*24*365*60)
				affect.add_collect(apply.MOV_SPEED,21,60*60*24*365*60)
				affect.add_collect_point(POINT_DEF_BONUS,10,60*60*24*365*60)
			end
			if f_ == value then
				affect.remove_collect(apply.ATT_SPEED,5, 60*60*24*365*60)
                affect.add_collect(apply.ATT_SPEED,11,60*60*24*365*60) --60Jahre
				affect.add_collect_point(POINT_ATT_BONUS,10,60*60*24*365*60) --60��
			end
			if g_ == value then
				affect.add_collect_point(POINT_RESIST_WARRIOR,10,60*60*24*365*60) --60��
				affect.add_collect_point(POINT_RESIST_ASSASSIN,10,60*60*24*365*60) --60��
				affect.add_collect_point(POINT_RESIST_SURA,10,60*60*24*365*60) --60��
				affect.add_collect_point(POINT_RESIST_SHAMAN,10,60*60*24*365*60) --60��
				affect.add_collect_point(139,10,60*60*24*365*60)
			end
			if h_ == value then
				affect.add_collect_point(POINT_ATTBONUS_WARRIOR,10,60*60*24*365*60) --60years
				affect.add_collect_point(POINT_ATTBONUS_ASSASSIN,10,60*60*24*365*60) --60years
				affect.add_collect_point(POINT_ATTBONUS_SURA,10,60*60*24*365*60) --60years
				affect.add_collect_point(POINT_ATTBONUS_SHAMAN,10,60*60*24*365*60) --60years
				affect.add_collect_point(138,10,60*60*24*365*60)
			end
			if i_ == value then
				local s = select ( "+1000 HP " , " Savunma De�eri +120 " , " Sald�r� De�eri +50 " )
				if s == 1 then
					affect.add_collect(apply.MAX_HP,1000,60*60*24*365*60)
					pc.setf("biyolog","92odul",1)
				elseif s == 2 then
					affect.remove_collect(apply.DEF_GRADE_BONUS,60, 60*60*24*365*60)
					affect.add_collect(apply.DEF_GRADE_BONUS,180,60*60*24*365*60)
					pc.setf("biyolog","92odul",2)
				elseif s == 3 then
					affect.remove_collect(apply.ATT_GRADE_BONUS,50, 60*60*24*365*60)
					affect.add_collect(apply.ATT_GRADE_BONUS,100,60*60*24*365*60)
					pc.setf("biyolog","92odul",3)
				end
			end
			if j_ == value then
				local s = select ( "+1100 HP " , " Savunma De�eri +140 " , " Sald�r� De�eri +60 " )
				if s == 1 then
					if pc.getf("biyolog","92odul") == 1 then
						affect.remove_collect(apply.MAX_HP,1000, 60*60*24*365*60)
						affect.add_collect(apply.MAX_HP,2100,60*60*24*365*60)
					else
						affect.add_collect(apply.MAX_HP,1100,60*60*24*365*60)
					end
				elseif s == 2 then
					if pc.getf("biyolog","92odul") == 2 then
						affect.remove_collect(apply.DEF_GRADE_BONUS,180,60*60*24*365*60)
						affect.add_collect(apply.DEF_GRADE_BONUS,320,60*60*24*365*60)
					else
						affect.add_collect(apply.DEF_GRADE_BONUS,140,60*60*24*365*60)
					end
				elseif s == 3 then
					if pc.getf("biyolog","92odul") == 3 then
						affect.remove_collect(apply.ATT_GRADE_BONUS,100,60*60*24*365*60)
						affect.add_collect(apply.ATT_GRADE_BONUS,160,60*60*24*365*60)
					else
						affect.add_collect(apply.ATT_GRADE_BONUS,60,60*60*24*365*60)
					end
				end	
			end
			say_title("Baek-Go:")
			say("Buyrun efendim. Derin bir nefese veee mideye! �ok")
			say("g�zel. Ben de Chaegirab'a u�ray�p O'na hatay� ")
			say("bildireyim bari. Sa�l�cakla kal, g�r��mek �zere!")
		end
	end
end
