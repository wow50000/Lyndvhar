/datum/advclass/sister
	name = "Psydonian Nun"
	tutorial = "A Mute Nun of the Valorian Silent Sisterhood, your sole presence nullifies magiks and brings suffering to the Witch, Heretic, and Wizard."
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_RESPECTED_UP
	outfit = /datum/outfit/job/roguetown/sister
	category_tags = list(CTAG_INQUISITION)

/datum/outfit/job/roguetown/sister/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		has_loadout = TRUE
		neck = /obj/item/clothing/neck/roguetown/psicross/silver
		pants = /obj/item/clothing/under/roguetown/chainlegs
		wrists = /obj/item/clothing/wrists/roguetown/bracers
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		belt = /obj/item/storage/belt/rogue/leather/black
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		id = /obj/item/clothing/ring/silver
		backl = /obj/item/storage/backpack/rogue/satchel
		head = /obj/item/clothing/head/roguetown/helmet/nun
		cloak = /obj/item/clothing/cloak/battlenun
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
		backpack_contents = list(/obj/item/storage/keyring/orthodoxist = 1)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 1)
		H.change_stat("perception", 2)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_INQUISITION, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_MUTE, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_ANTIMAGIC, TRAIT_GENERIC)

/datum/outfit/job/roguetown/sister/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Mace", "Spear")
	var/weapon_choice = input(H,"Choose your PSYDON weapon.", "TAKE UP PSYDON'S ARMS") as anything in weapons
	switch(weapon_choice)
		if("Mace")
			H.put_in_hands(new /obj/item/rogueweapon/mace/goden/psymace(H), TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 4, TRUE)
		if("Spear")
			H.put_in_hands(new /obj/item/rogueweapon/spear/psyspear(H), TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 4, TRUE)
