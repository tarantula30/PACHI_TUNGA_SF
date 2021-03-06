--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest skill78 begin
	state start begin
		when 50514.use begin
			say_title(item_name(50514))
			if pc.get_skill_group() == 0 then
				say("Hen�z bir e�itim'e ba�lamad�n.")
				say("")
				return
			end
			
			if pc.getf("servis","muhur") - get_time() > 0 then
				say("Becerilerin m�h�rl� oldu�u i�in bu i�lemi ger�ekle�tiremezsin.")
				say("")
				return
			end
			
			local mKontrol = 0
			local m_skill_list = {221, 222, 223, 224, 225, 226, 227, 228, 229}
			for i = 1, table.getn(m_skill_list) do
				skill_vnum = m_skill_list[i]
				if pc.get_skill_level(skill_vnum) > 0 then
					mKontrol = 1
				end
			end
			
			if mKontrol == 0 then
				say("�nce misilleme berisini geli�tirmeniz gerekli.")
				say("")
				return
			end			
			
			local check_learned = 0
			local help_skill_list = {
										{{236}, {240},},
										{{237}, {241},},
										{{238}, {242},},
										{{239}, {243},},
										{{244}, {244},},
			}
			
			local skill_list = help_skill_list[pc.get_job() + 1][pc.get_skill_group()]
			for i = 1, table.getn(skill_list) do
				skill_vnum = skill_list[i]
				if pc.get_skill_level(skill_vnum) > 0 then
					check_learned = 1
				end
			end
			
			if check_learned == 1 then
				say("Zaten h�zland�rma skillerini ��rendin.")
				say("")
				return
			end
			
			
			help_skill_list_name = {
								[236] = "K�l�� �evirme H�zland�rma",
								[237] = "Kamuflaj H�zland�rma",
								[238] = "Parmak Darbesi H�zland�rma",
								[239] = "Ejderha At��� H�zland�rma",
								[240] = "Ruh Vuru�u H�zland�rma",
								[241] = "Ate�li Ok H�zland�rma",
								[242] = "Karanl�k Vuru� H�zland�rma",
								[243] = "�im�ek �a��rma H�zland�rma",
								[244] = "Kurt Nefesi H�zland�rma"
			}
			
			local skill_vnum_list = {}
			local skill_name_list = {}
			for i = 1, table.getn(skill_list) do
				skill_vnum = skill_list[i]
				if pc.get_skill_level(skill_vnum) < 1 then
					table.insert(skill_vnum_list, skill_vnum)
					table.insert(skill_name_list, help_skill_list_name[skill_vnum])
				end
			end
			
			if table.getn(skill_vnum_list) == 0 then
				say("Hi�bir h�zland�rma becerisi yok.")
				say("")
				return
			end
			
			table.insert(skill_name_list, "Iptal")
			say("Bu antik kitap �ok g��l� gibi g�r�n�yor!")
			say("Muazzam becerilerin anahtar�! ama �nce")
			say("Ama �nce yapman�z gereken tek bir beceri se�ebilirsin.")
			say("Ak�ll�ca se�im yap!")
			local i = select_table(skill_name_list)
			if i == table.getn(skill_name_list)then
				return
			end
			
			local name = skill_name_list[i]
			local vnum = skill_vnum_list[i]
			say_title(item_name(50514))
			say("")
			say(string.format("��renmek i�in bunu se�tin %s.", name))
			say("Bunun i�ini�in emin misin?")
			local confirm = select("Evet", "Hay�r")
			if confirm == 1 then
				pc.remove_item(item.get_vnum(), 1)
				pc.set_skill_level(vnum, 20)
				return
			end
			
			return
		end
		
		when 50515.use begin
			say_title(item_name(50515))
			say("")
			if pc.get_skill_group() == 0 then
				say("Hen�z bir e�itim'e ba�lamad�n.")
				return
			end
			
			if pc.getf("servis","muhur") - get_time() > 0 then
				say("Becerilerin m�h�rl� oldu�u i�in bu i�lemi ger�ekle�tiremezsin.")
				say("")
				return
			end
			
			local check_learned = 0
			local anti_skill_list = {221, 222, 223, 224, 225, 226, 227, 228, 229}
			for i = 1, table.getn(anti_skill_list) do
				skill_vnum = anti_skill_list[i]
				if pc.get_skill_level(skill_vnum) > 0 then
					check_learned = 1
				end
			end
			
			if check_learned == 1 then
				say("Sen zaten bir skill ��rendin.")
				return
			end
			
			anti_skill_list_name = {
								[221] = "K�l�� �evirme Korunma",
								[222] = "Kamuflaj Korunma",
								[223] = "Parmak Darbesi Korunma",
								[224] = "Ejderha At��� Korunma",
								[225] = "Ruh Vuru�u Korunma",
								[226] = "Ate�li Ok Korunma",
								[227] = "Karanl�k Vuru� Korunma",
								[228] = "�im�ek �a��rma Korunma",
								[229] = "Kurt Nefesi Korunma"
			}
			
			local skill_vnum_list = {}
			local skill_name_list = {}
			local skill_vnum_list2 = {}
			local skill_name_list2 = {}
			for i = 1, table.getn(anti_skill_list) do
				skill_vnum = anti_skill_list[i]
				if pc.get_skill_level(skill_vnum) < 1 then
					if i<5 then
						table.insert(skill_vnum_list, skill_vnum)
						table.insert(skill_name_list, anti_skill_list_name[skill_vnum])
					else
						table.insert(skill_vnum_list2, skill_vnum)
						table.insert(skill_name_list2, anti_skill_list_name[skill_vnum])
					end
				end
			end
			table.insert(skill_vnum_list, 4)
			table.insert(skill_name_list, "Di�er Skiller")
			
			
			if table.getn(skill_vnum_list) == 0 then
				say("Herhangi bir korunma becerin yok.")
				return
			end
			
			table.insert(skill_name_list2, "Iptal")
			say("Bu antik kitap �ok g��l� gibi g�r�n�yor!")
			say("Muazzam becerilerin anahtar�! ama �nce")
			say("Ama �nce yapman�z gereken tek bir beceri se�ebilirsin.")
			say("Ak�ll�ca se�im yap!")
			local i = select_table(skill_name_list)
			local sTablo=1
			if i==5 then
				i = select_table(skill_name_list2)
				sTablo=2
			end
			if i==6 then return end
			--if i == table.getn(skill_name_list)then return end
			
			local name = skill_name_list[i]
			local vnum = skill_vnum_list[i]
			if sTablo==2 then
				name = skill_name_list2[i]
				vnum = skill_vnum_list2[i]
			end
			
			say_title(item_name(50515))
			say("")
			say(string.format("��renmek i�in bunu se�tin %s.", name))
			say("Bunun i�in emin misin?")
			local confirm = select("Evet", "Hay�r")
			if confirm == 1 then
				pc.remove_item(item.get_vnum(), 1)
				pc.set_skill_level(vnum, 20)
				return
			end
			
			return
		end
		
		when 50525.use begin
			say_title(item_name(50525))
			if pc.get_skill_group() == 0 then
				say("Hen�z bir e�itim'e ba�lamad�n.")
				say("")
				return
			end
			
			if get_time() < pc.getqf("next_time") then
				if not pc.is_skill_book_no_delay() then
					say("E�itim tamamland�ktan sonra yar�m g�n")
					say("dinlenmen gerekir.")
					say("")
					return
				end
			end
			
			GRAND_MASTER_SKILL_LEVEL = 30
			PERFECT_MASTER_SKILL_LEVEL = 40
			local check_learned = 0
			local new_skill_list = {221, 222, 223, 224, 225, 226, 227, 228, 229, 236, 237, 238, 239, 240, 241, 242, 243, 244}
			for i = 1, table.getn(new_skill_list) do
				skill_vnum = new_skill_list[i]
				if pc.get_skill_level(skill_vnum) >= GRAND_MASTER_SKILL_LEVEL and pc.get_skill_level(skill_vnum) < PERFECT_MASTER_SKILL_LEVEL then
					check_learned = 1
				end
			end
			
			if check_learned == 0 then
				say("Grand Master seviyesinde olan")
				say("bir becerin yok.")
				say("")
				return
			end
			
			new_skill_list_name = {
								[221] = "K�l�� �evirme Korunma",
								[222] = "Kamuflaj Korunma",
								[223] = "Parmak Darbesi Korunma",
								[224] = "Ejderha At��� Korunma",
								[225] = "Ruh Vuru�u Korunma",
								[226] = "Ate�li Ok Korunma",
								[227] = "Karanl�k Vuru� Korunma",
								[228] = "�im�ek �a��rma Korunma",
								[229] = "Kurt Nefesi Korunma",
								[236] = "K�l�� �evirme H�zland�rma",
								[237] = "Kamuflaj H�zland�rma",
								[238] = "Parmak Darbesi H�zland�rma",
								[239] = "Ejderha At��� H�zland�rma",
								[240] = "Ruh Vuru�u H�zland�rma",
								[241] = "Ate�li Ok H�zland�rma",
								[242] = "Karanl�k Vuru� H�zland�rma",
								[243] = "�im�ek �a��rma H�zland�rma",
								[244] = "Kurt Nefesi H�zland�rma"
			}
			
			local skill_vnum_list = {}
			local skill_name_list = {}
			for i = 1, table.getn(new_skill_list) do
				skill_vnum = new_skill_list[i]
				if pc.get_skill_level(skill_vnum) >= GRAND_MASTER_SKILL_LEVEL and pc.get_skill_level(skill_vnum) < PERFECT_MASTER_SKILL_LEVEL then
					table.insert(skill_vnum_list, skill_vnum)
					table.insert(skill_name_list, new_skill_list_name[skill_vnum])
				end
			end
			
			if table.getn(skill_vnum_list) == 0 then
				say("Hi� bir h�zland�rma ve ya korunma becerin yok.")
				return
			end
			
			say("Grand master seviyesi i�in")
			say("Devam etmek istiyor musun?")
			say("")
			local s = select("Evet", "Hay�r")	
			if s == 2 then
				return
			end
			
			say_title(item_name(50525))
			say("��renmek istedi�in beceriyi se�:")
			say("")
			table.insert(skill_name_list, "Iptal")
			local i = select_table(skill_name_list)
			if i == table.getn(skill_name_list)then
				return
			end
			
			local name = skill_name_list[i]
			local vnum = skill_vnum_list[i]
			local level = pc.get_skill_level(vnum)
			local cur_alignment = pc.get_real_alignment()
			local need_alignment = 1000 + 500 * (level - 30)
			
			say_title(item_name(50525))
			if cur_alignment <- 19000+need_alignment then
				say_reward("Grand master i�in")
				say_reward("Yeterli derece puan�n yok")
				say("")
				return
			end
			
			if get_time() < pc.getqf("next_time") then
				if pc.is_skill_book_no_delay() then
					pc.remove_skill_book_no_delay()
				else
					say("E�itim tamamland�ktan sonra dinlenmek i�in")
					say("12 ve ya 24 saat beklemen gerekir.")
				end
			end
			
			say(string.format("%s Skill'i ni se�tin.", name))
			say("Devam etmek istiyor musun?")
			local confirm = select("Evet", "Hay�r")
			if confirm == 1 then
				pc.setqf("next_time", get_time() + 60 * 60 * math.random(12, 24))
				
				say_title(item_name(50525))
				if pc.learn_grand_master_skill(vnum) then
					if pc.get_skill_level(vnum) == 40 then
						say("Tebrikler! ")
						say(string.format("%s perfect Master Oldu.", name))
						say("")
					else
						say("Tebrikler! ")
						say(string.format("Becerin y�kseltildi %s G%d.", name, level-30+1+1))
						say("")
					end
					
				else
					pc.change_alignment(-number(need_alignment / 3, need_alignment / 2))
					say("Becerini geli�tiremedin! ")
					say("Kendini �ansl� hissetti�inde tekrar dene!. ")
					say("")
				end
				
				pc.remove_item(item.get_vnum(), 1)
			end
			
			return
		end
		
		when 71000.use begin
			say_title(item_name(71000))
			if pc.get_skill_group() == 0 then
				say("Hen�z bir e�itim'e ba�lamad�n.")
				say("")
				return
			end
			
			local check_learned = 0
			local new_skill_list = {221, 222, 223, 224, 225, 226, 227, 228, 229, 236, 237, 238, 239, 240, 241, 242, 243, 244}
			for i = 1, table.getn(new_skill_list) do
				skill_vnum = new_skill_list[i]
				if pc.get_skill_level(skill_vnum) > 0 then
					check_learned = 1
				end
			end
			
			if check_learned == 0 then
				say("Herhangi bir korunma becerin yok.")
				say("")
				return
			end
			
			say("H�zland�rma ve korunma beceri bilgileri unutulacak! ")
			say("Kabul ediyor musun? ")
			say("")
			local confirm = select("Evet", "Hay�r")
			if confirm == 1 then
				for i = 1, table.getn(new_skill_list) do
					skill_vnum = new_skill_list[i]
					if pc.get_skill_level(skill_vnum) > 0 then
						pc.set_skill_level(skill_vnum, 0)
					end
				end
				
				pc.remove_item(item.get_vnum(), 1)
			end
			
			return
		end
		
		when 40002.use begin
			say_title(item_name(40002))
			if pc.get_skill_group() == 0 then
				say("Hen�z bir e�itim'e ba�lamad�n.")
				say("")
				return
			end
			
			say("")
			say_reward("Hangi becerini perfect master yapmak istiyorsun ?")
			local s = select("Korunma","G��lendirme","Vazge� ")
			if s == 1 then
				local check_learned = 0
				local new_skill_list = {221, 222, 223, 224, 225, 226, 227, 228, 229}
				for i = 1, table.getn(new_skill_list) do
					skill_vnum = new_skill_list[i]
					if pc.get_skill_level(skill_vnum) > 0 then
						check_learned = 1
					end
				end
				
				if check_learned == 0 then
					say("Herhangi bir korunma becerin yok.")
					say("")
					return
				end
				
				if pc.is_busy() == true then
					say("Me�gul durumdayken bunu ger�ekle�tiremezsin.")
					say("")
					return
				end
				
				if pc.is_dead() == true then
					say("�l� durumdayken bunu ger�ekle�tiremezsin.")
					say("")
					return
				end
				
				for i = 1, table.getn(new_skill_list) do
					skill_vnum = new_skill_list[i]
					if pc.get_skill_level(skill_vnum) > 0 then
						pc.set_skill_level(skill_vnum, 40)
					end
				end
				
				if item.get_count() > 1 then
					item.set_count(item.get_count()-1)
				else
					item.remove()
				end
			elseif s == 2 then
				local check_learned = 0
				local new_skill_list = {236, 237, 238, 239, 240, 241, 242, 243, 244}
				for i = 1, table.getn(new_skill_list) do
					skill_vnum = new_skill_list[i]
					if pc.get_skill_level(skill_vnum) > 0 then
						check_learned = 1
					end
				end
				
				if check_learned == 0 then
					say("Herhangi bir g��lendirme becerin yok.")
					say("")
					return
				end		

				if pc.is_busy() == true then
					say("Me�gul durumdayken bunu ger�ekle�tiremezsin.")
					say("")
					return
				end
				
				if pc.is_dead() == true then
					say("�l� durumdayken bunu ger�ekle�tiremezsin.")
					say("")
					return
				end
				
				for i = 1, table.getn(new_skill_list) do
					skill_vnum = new_skill_list[i]
					if pc.get_skill_level(skill_vnum) > 0 then
						pc.set_skill_level(skill_vnum, 40)
					end
				end
				
				if item.get_count() > 1 then
					item.set_count(item.get_count()-1)
				else
					item.remove()
				end
			else
			end
		end
    end
end