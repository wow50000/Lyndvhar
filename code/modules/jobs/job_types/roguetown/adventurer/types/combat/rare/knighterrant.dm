/datum/advclass/knighterrant
	var/name = "Knight Errant"
	var/outfit = /datum/outfit/job/roguetown/advclass/knighterrant
	var/tutorial = "Choose me!"
	var/list/allowed_sexes = list(MALE, FEMALE)
	var/list/allowed_races = RACES_ALL_KINDS
	var/pickprob = 10
	var/maximum_possible_slots = 1
/datum/outfit/job/roguetown/advclass/knighterrant
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	gloves = /obj/item/clothing/gloves/roguetown/chain
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/stabard
	neck = /obj/item/clothing/neck/roguetown/bevor
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	belt = /obj/item/storage/belt/rogue/leather/steel
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/flashlight/flare/torch/lantern
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", 1)
	var/weapons = list("Bastard Sword","Mace + Shield","Flail + Shield","Billhook")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
	    if("Bastard Sword")
	        H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	        beltr = /obj/item/rogueweapon/sword/long
	    if("Mace + Shield")
	        H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	        H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	        beltr = /obj/item/rogueweapon/mace
	        backr = /obj/item/rogueweapon/shield/tower/metal
	    if("Flail + Shield")
            H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
        	H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	        beltr = /obj/item/rogueweapon/flail
	        backr = /obj/item/rogueweapon/shield/tower/metal
	    if("Billhook")
	        H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	        r_hand = /obj/item/rogueweapon/spear/billhook
	        backr = /obj/item/gwstrap
	var/turf/TU = get_turf(H)
		if(TU)
			new /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled(TU)
	
