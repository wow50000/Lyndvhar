/datum/advclass/noble
	name = "Noble"
	tutorial = "Traveling nobility from other regions of the world."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/noble
	traits_applied = list(TRAIT_OUTLANDER)
	category_tags = list(CTAG_ADVENTURER, CTAG_COURTAGENT)
	classes = list("Aristocrat" = "You are a traveling noble visiting foreign lands. With wealth, come the poor, ready to pilfer you of your hard earned (inherited) coin, so tread lightly unless you want to meet a grizzly end.",
				"Knight Errant" = "You are a knight from a distant land, a scion of a noble house visiting Lyndhardtia for one reason or another.",
				"Squire Errant" = "You are a squire who has traveled far in search of a master to train you and a lord to knight you.")

/datum/outfit/job/roguetown/adventurer/noble/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Aristocrat","Knight Errant","Squire Errant")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Aristocrat")
			to_chat(H, span_warning("You are a traveling noble visiting foreign lands. With wealth, come the poor, ready to pilfer you of your hard earned (inherited) coin, so tread lightly unless you want to meet a grizzly end."))
			shoes = /obj/item/clothing/shoes/roguetown/boots
			belt = /obj/item/storage/belt/rogue/leather/black
			beltr = /obj/item/flashlight/flare/torch/lantern
			backl = /obj/item/storage/backpack/rogue/satchel
			neck = /obj/item/storage/belt/rogue/pouch/coins/rich
			id = /obj/item/clothing/ring/silver
			beltl = /obj/item/rogueweapon/sword/sabre/dec
			if(H.pronouns == HE_HIM || H.pronouns == THEY_THEM || H.pronouns == IT_ITS)
				cloak = /obj/item/clothing/cloak/half/red
				shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/red
				pants = /obj/item/clothing/under/roguetown/tights/black
			if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
				shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
				pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/purple
				cloak = /obj/item/clothing/cloak/raincloak/purple
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
			var/turf/TU = get_turf(H)
			if(TU)
				new /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled(TU)
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
			H.change_stat("perception", 2)
			H.change_stat("intelligence", 2)
			H.set_blindness(0)
