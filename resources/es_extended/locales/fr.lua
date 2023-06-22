Locales['fr'] = {
  -- Inventory
  ['inventory'] = 'inventaire %s / %s',
  ['use'] = 'utiliser',
  ['give'] = 'donner',
  ['remove'] = 'jeter',
  ['return'] = 'retour',
  ['give_to'] = 'donner à',
  ['amount'] = 'quantité',
  ['giveammo'] = 'donner munitions',
  ['amountammo'] = 'nombre de munitions',
  ['noammo'] = 'tu n\'as pas toutes ces munitions!',
  ['gave_item'] = 'vous avez donné %sx %s à %s',
  ['received_item'] = 'vous avez reçu %sx %s par %s',
  ['gave_weapon'] = 'vous avez donné 1x %s à %s',
  ['gave_weapon_ammo'] = 'vous avez donné ~o~%sx %s pour %s à %s',
  ['gave_weapon_withammo'] = 'vous avez donné 1x %s avec ~o~%sx %s à %s',
  ['gave_weapon_hasalready'] = '%s a déjà %s',
  ['gave_weapon_noweapon'] = '%s n\'a pas cette arme',
  ['received_weapon'] = 'vous recevez 1x %s de %s',
  ['received_weapon_ammo'] = 'vous avez reçu ~o~%sx %s pour votre %s de %s',
  ['received_weapon_withammo'] = 'vous avez reçu 1x %s avec ~o~%sx %s de %s',
  ['received_weapon_hasalready'] = '%s a tenté de vous donner %s, mais vous en aviez déjà un exemplaire',
  ['received_weapon_noweapon'] = '%s tente de vous donner des munitions pour %s, mais vous n\'en avez pas',
  ['gave_account_money'] = 'vous avez donné $%s (%s) à %s',
  ['received_account_money'] = 'vous avez reçu $%s (%s) par %s',
  ['amount_invalid'] = 'montant invalide',
  ['players_nearby'] = 'aucun joueur à proximité',
  ['ex_inv_lim'] = 'action impossible, depassement de la limite d\'inventaire pour %s',
  ['imp_invalid_quantity'] = 'action impossible, ~r~quantité invalide',
  ['imp_invalid_amount'] = 'action impossible, ~r~montant invalide',
  ['threw_standard'] = 'vous avez jeté %sx %s',
  ['threw_account'] = 'vous avez jeté $%s %s',
  ['threw_weapon'] = 'vous avez jeté 1x %s',
  ['threw_weapon_ammo'] = 'vous avez jeté 1x %s avec ~o~%sx %s',
  ['threw_weapon_already'] = 'vous portez déjà cette arme',
  ['threw_cannot_pickup'] = 'vous ne pouvez pas ramasser ça votre inventaire est plein !',
  ['threw_pickup_prompt'] = 'appuyez sur E pour ramasser',

  -- Key mapping
  ['keymap_showinventory'] = 'montrer l\'inventaire',

  -- Salary related
  ['received_salary'] = 'vous avez reçu votre salaire: $%s',
  ['received_help'] = 'vous avez reçu une aide de l\'état: $%s',
  ['company_nomoney'] = 'votre entreprise n\'a plus d\'argent pour vous payer!',
  ['received_paycheck'] = 'paiement reçu',
  ['bank'] = 'banque',
  ['account_bank'] = 'banque',
  ['account_black_money'] = 'argent sale',
  ['account_money'] = 'espèces',

  ['act_imp'] = 'action impossible',
  ['in_vehicle'] = 'Vous ne pouvez rien donner à quelqu\'un dans un véhicule',

  -- Commands
  ['command_bring'] = 'apportez le joueur à vous',
  ['command_car'] = 'faire appaitre un véhicule',
  ['command_car_car'] = 'nom ou hash du véhicule',
  ['command_cardel'] = 'supprimer le véhicule à proximité',
  ['command_cardel_radius'] = 'optionnel, supprime les véhicules dans un rayon spécifié',
  ['command_clear'] = 'vider le chat',
  ['command_clearall'] = 'vider le chat pour tous',
  ['command_clearinventory'] = 'vider l\'inventaire d\'un joueur',
  ['command_clearloadout'] = 'vider le loadout d\'un joueur',
  ['command_freeze'] = 'freeze un joueur',
  ['command_unfreeze'] = 'unfreeze un joueur',
  ['command_giveaccountmoney'] = 'donner de l\'argent sur un compte',
  ['command_giveaccountmoney_account'] = 'nom de compte valide',
  ['command_giveaccountmoney_amount'] = 'quantité à ajouter',
  ['command_giveaccountmoney_invalid'] = 'nom de compte invalide',
  ['command_giveitem'] = 'donner un objet à un joueur',
  ['command_giveitem_item'] = 'nom de l\'objet',
  ['command_giveitem_count'] = 'quantité de l\'objet',
  ['command_giveweapon'] = 'donner une arme à un joueur',
  ['command_giveweapon_weapon'] = 'nom de l\'arme',
  ['command_giveweapon_ammo'] = 'quantité de munitions',
  ['command_giveweapon_hasalready'] = 'le joueur a déjà cette arme',
  ['command_giveweaponcomponent'] = 'donner un accessoire d\'arme',
  ['command_giveweaponcomponent_component'] = 'nom de l\'accessoire',
  ['command_giveweaponcomponent_invalid'] = 'accessoire invalide',
  ['command_giveweaponcomponent_hasalready'] = 'le joueur a déjà cet accessoire',
  ['command_giveweaponcomponent_missingweapon'] = 'le joueur n\'a pas cette arme',
  ['command_goto'] = 'téléportez-vous vers un joueur',
  ['command_kill'] = 'tuer un joueur',
  ['command_save'] = 'sauvegarder un joueur dans la base de données',
  ['command_saveall'] = 'sauvegarder tous les joueurs dans la base de données',
  ['command_setaccountmoney'] = 'définir la somme d\'argent pour un joueur',
  ['command_setaccountmoney_amount'] = 'quantité d\'argent à définir',
  ['command_setcoords'] = 'se téléporter aux coordonnées',
  ['command_setcoords_x'] = 'axe X',
  ['command_setcoords_y'] = 'axe Y',
  ['command_setcoords_z'] = 'axe Z',
  ['command_setjob'] = 'assigner job à un joueur',
  ['command_setjob2'] = 'assigner job2 à un joueur',
  ['command_setjob_job'] = 'nom du job',
  ['command_setjob2_job'] = 'nom du job2',
  ['command_setjob_grade'] = 'grade du job',
  ['command_setjob2_grade'] = 'grade du job2',
  ['command_setjob_invalid'] = 'le job, le grade ou les deux sont invalides',
  ['command_setjob2_invalid'] = 'le job2, le grade ou les deux sont invalides',
  ['command_setgroup'] = 'assigner un groupe à un joueur',
  ['command_setgroup_group'] = 'nom du groupe',
  ['commanderror_argumentmismatch'] = 'argument count mismatch (passed %s, wanted %s)',
  ['commanderror_argumentmismatch_number'] = 'argument #%s type mismatch (passed string, wanted number)',
  ['commanderror_invaliditem'] = 'nom de l\'objet invalide',
  ['commanderror_invalidweapon'] = 'arme invalide',
  ['commanderror_console'] = 'cette commande ne peut pas être utilisée dans la console',
  ['commanderror_invalidcommand'] = '/%s n\'est pas une commande valide!',
  ['commanderror_invalidplayerid'] = 'il n\'ya aucun joueur avec cet ID en jeu',
  ['commandgeneric_playerid'] = 'id joueur',
  ['command_giveammo_noweapon_found'] = '%s n\'a pas cette arme',
  ['command_giveammo_weapon'] = 'nom de l\'arme',
  ['command_giveammo_ammo'] = 'quantité de munitions',
  ['tpm_nowaypoint'] = 'aucun point défini.',
  ['tpm_success'] = 'téléporté avec succès',
  
  ['noclip_message'] = 'noclip a été %s',
  ['enabled'] = '~g~activer~s~',
  ['disabled'] = '~r~desactiver~s~',
  
    -- Locale settings
    ['locale_digit_grouping_symbol'] = ',',
    ['locale_currency'] = '£%s',
  
    -- Weapons
  
    -- Melee
    ['weapon_dagger'] = 'Dagger',
    ['weapon_bat'] = 'Bat',
    ['weapon_battleaxe'] = 'Battle Axe',
    ['weapon_bottle'] = 'Bottle',
    ['weapon_crowbar'] = 'Crowbar',
    ['weapon_flashlight'] = 'Flashlight',
    ['weapon_golfclub'] = 'Golf Club',
    ['weapon_hammer'] = 'Hammer',
    ['weapon_hatchet'] = 'Hatchet',
    ['weapon_knife'] = 'Knife',
    ['weapon_knuckle'] = 'Knuckledusters',
    ['weapon_machete'] = 'Machete',
    ['weapon_nightstick'] = 'Nightstick',
    ['weapon_wrench'] = 'Pipe Wrench',
    ['weapon_poolcue'] = 'Pool Cue',
    ['weapon_stone_hatchet'] = 'Stone Hatchet',
    ['weapon_switchblade'] = 'Switchblade',
  
    -- Handguns
    ['weapon_appistol'] = 'AP Pistol',
    ['weapon_ceramicpistol'] = 'Ceramic Pistol',
    ['weapon_combatpistol'] = 'Combat Pistol',
    ['weapon_doubleaction'] = 'Double-Action Revolver',
    ['weapon_navyrevolver'] = 'Navy Revolver',
    ['weapon_flaregun'] = 'Flaregun',
    ['weapon_gadgetpistol'] = 'Gadget Pistol',
    ['weapon_heavypistol'] = 'Heavy Pistol',
    ['weapon_revolver'] = 'Heavy Revolver',
    ['weapon_revolver_mk2'] = 'Heavy Revolver MK2',
    ['weapon_marksmanpistol'] = 'Marksman Pistol',
    ['weapon_pistol'] = 'Pistol',
    ['weapon_pistol_mk2'] = 'Pistol MK2',
    ['weapon_pistol50'] = 'Pistol .50',
    ['weapon_snspistol'] = 'SNS Pistol',
    ['weapon_snspistol_mk2'] = 'SNS Pistol MK2',
    ['weapon_stungun'] = 'Taser',
    ['weapon_raypistol'] = 'Up-N-Atomizer',
    ['weapon_vintagepistol'] = 'Vintage Pistol',
  
    -- Shotguns
    ['weapon_assaultshotgun'] = 'Assault Shotgun',
    ['weapon_autoshotgun'] = 'Auto Shotgun',
    ['weapon_bullpupshotgun'] = 'Bullpup Shotgun',
    ['weapon_combatshotgun'] = 'Combat Shotgun',
    ['weapon_dbshotgun'] = 'Double Barrel Shotgun',
    ['weapon_heavyshotgun'] = 'Heavy Shotgun',
    ['weapon_musket'] = 'Musket',
    ['weapon_pumpshotgun'] = 'Pump Shotgun',
    ['weapon_pumpshotgun_mk2'] = 'Pump Shotgun MK2',
    ['weapon_sawnoffshotgun'] = 'Sawed Off Shotgun',
  
    -- SMG & LMG
    ['weapon_assaultsmg'] = 'Assault SMG',
    ['weapon_combatmg'] = 'Combat MG',
    ['weapon_combatmg_mk2'] = 'Combat MG MK2',
    ['weapon_combatpdw'] = 'Combat PDW',
    ['weapon_gusenberg'] = 'Gusenberg Sweeper',
    ['weapon_machinepistol'] = 'Machine Pistol',
    ['weapon_mg'] = 'MG',
    ['weapon_microsmg'] = 'Micro SMG',
    ['weapon_minismg'] = 'Mini SMG',
    ['weapon_smg'] = 'SMG',
    ['weapon_smg_mk2'] = 'SMG MK2',
    ['weapon_raycarbine'] = 'Unholy Hellbringer',
  
    -- Rifles
    ['weapon_advancedrifle'] = 'Advanced Rifle',
    ['weapon_assaultrifle'] = 'Assault Rifle',
    ['weapon_assaultrifle_mk2'] = 'Assault Rifle MK2',
    ['weapon_bullpuprifle'] = 'Bullpup Rifle',
    ['weapon_bullpuprifle_mk2'] = 'Bullpup Rifle MK2',
    ['weapon_carbinerifle'] = 'Carbine Rifle',
    ['weapon_carbinerifle_mk2'] = 'Carbine Rifle MK2',
    ['weapon_compactrifle'] = 'Compact Rifle',
    ['weapon_militaryrifle'] = 'Military Rifle',
    ['weapon_specialcarbine'] = 'Special Carbine',
    ['weapon_specialcarbine_mk2'] = 'Special Carbine MK2',
  
    -- Sniper
    ['weapon_heavysniper'] = 'Heavy Sniper',
    ['weapon_heavysniper_mk2'] = 'Heavy Sniper MK2',
    ['weapon_marksmanrifle'] = 'Marksman Rifle',
    ['weapon_marksmanrifle_mk2'] = 'Marksman Rifle MK2',
    ['weapon_sniperrifle'] = 'Sniper Rifle',
  
    -- Heavy / Launchers
    ['weapon_compactlauncher'] = 'Compact Launcher',
    ['weapon_firework'] = 'Firework Launcher',
    ['weapon_grenadelauncher'] = 'Grenade Launcher',
    ['weapon_hominglauncher'] = 'Homing Launcher',
    ['weapon_minigun'] = 'Minigun',
    ['weapon_railgun'] = 'Railgun',
    ['weapon_rpg'] = 'Rocket Launcher',
    ['weapon_rayminigun'] = 'Widowmaker',
  
    -- Criminal Enterprises DLC
    ['weapon_metaldetector'] = 'Metal Detector',
    ['weapon_precisionrifle'] = 'Precision Rifle',
    ['weapon_tactilerifle'] = 'Service Carbine',
  
    -- Thrown
    ['weapon_ball'] = 'Baseball',
    ['weapon_bzgas'] = 'BZ Gas',
    ['weapon_flare'] = 'Flare',
    ['weapon_grenade'] = 'Grenade',
    ['weapon_petrolcan'] = 'Jerrycan',
    ['weapon_hazardcan'] = 'Hazardous Jerrycan',
    ['weapon_molotov'] = 'Molotov Cocktail',
    ['weapon_proxmine'] = 'Proximity Mine',
    ['weapon_pipebomb'] = 'Pipe Bomb',
    ['weapon_snowball'] = 'Snowball',
    ['weapon_stickybomb'] = 'Sticky Bomb',
    ['weapon_smokegrenade'] = 'Tear Gas',
  
    -- Special
    ['weapon_fireextinguisher'] = 'Fire Extinguisher',
    ['weapon_digiscanner'] = 'Digital Scanner',
    ['weapon_garbagebag'] = 'Garbage Bag',
    ['weapon_handcuffs'] = 'Handcuffs',
    ['gadget_nightvision'] = 'Night Vision',
    ['gadget_parachute'] = 'parachute',
  
    -- Weapon Components
    ['component_knuckle_base'] = 'base Model',
    ['component_knuckle_pimp'] = 'the Pimp',
    ['component_knuckle_ballas'] = 'the Ballas',
    ['component_knuckle_dollar'] = 'the Hustler',
    ['component_knuckle_diamond'] = 'the Rock',
    ['component_knuckle_hate'] = 'the Hater',
    ['component_knuckle_love'] = 'the Lover',
    ['component_knuckle_player'] = 'the Player',
    ['component_knuckle_king'] = 'the King',
    ['component_knuckle_vagos'] = 'the Vagos',
  
    ['component_luxary_finish'] = 'luxary Weapon Finish',
  
    ['component_handle_default'] = 'default Handle',
    ['component_handle_vip'] = 'vIP Handle',
    ['component_handle_bodyguard'] = 'bodyguard Handle',
  
    ['component_vip_finish'] = 'vIP Finish',
    ['component_bodyguard_finish'] = 'bodyguard Finish',
  
    ['component_camo_finish'] = 'digital Camo',
    ['component_camo_finish2'] = 'brushstroke Camo',
    ['component_camo_finish3'] = 'woodland Camo',
    ['component_camo_finish4'] = 'skull Camo',
    ['component_camo_finish5'] = 'sessanta Nove Camo',
    ['component_camo_finish6'] = 'perseus Camo',
    ['component_camo_finish7'] = 'leopard Camo',
    ['component_camo_finish8'] = 'zebra Camo',
    ['component_camo_finish9'] = 'geometric Camo',
    ['component_camo_finish10'] = 'boom Camo',
    ['component_camo_finish11'] = 'patriotic Camo',
  
    ['component_camo_slide_finish'] = 'digital Slide Camo',
    ['component_camo_slide_finish2'] = 'brushstroke Slide Camo',
    ['component_camo_slide_finish3'] = 'woodland Slide Camo',
    ['component_camo_slide_finish4'] = 'skull Slide Camo',
    ['component_camo_slide_finish5'] = 'sessanta Nove Slide Camo',
    ['component_camo_slide_finish6'] = 'perseus Slide Camo',
    ['component_camo_slide_finish7'] = 'leopard Slide Camo',
    ['component_camo_slide_finish8'] = 'zebra Slide Camo',
    ['component_camo_slide_finish9'] = 'geometric Slide Camo',
    ['component_camo_slide_finish10'] = 'boom Slide Camo',
    ['component_camo_slide_finish11'] = 'patriotic Slide Camo',
  
    ['component_clip_default'] = 'default Magazine',
    ['component_clip_extended'] = 'extended Magazine',
    ['component_clip_drum'] = 'drum Magazine',
    ['component_clip_box'] = 'box Magazine',
  
    ['component_scope_holo'] = 'holographic Scope',
    ['component_scope_small'] = 'small Scope',
    ['component_scope_medium'] = 'medium Scope',
    ['component_scope_large'] = 'large Scope',
    ['component_scope'] = 'mounted Scope',
    ['component_scope_advanced'] = 'advanced Scope',
    ['component_ironsights'] = 'ironsights',
  
    ['component_suppressor'] = 'suppressor',
    ['component_compensator'] = 'compensator',
  
    ['component_muzzle_flat'] = 'flat Muzzle Brake',
    ['component_muzzle_tactical'] = 'tactical Muzzle Brake',
    ['component_muzzle_fat'] = 'fat-End Muzzle Brake',
    ['component_muzzle_precision'] = 'precision Muzzle Brake',
    ['component_muzzle_heavy'] = 'heavy Duty Muzzle Brake',
    ['component_muzzle_slanted'] = 'slanted Muzzle Brake',
    ['component_muzzle_split'] = 'split-End Muzzle Brake',
    ['component_muzzle_squared'] = 'squared Muzzle Brake',
  
    ['component_flashlight'] = 'flashlight',
    ['component_grip'] = 'grip',
  
    ['component_barrel_default'] = 'default Barrel',
    ['component_barrel_heavy'] = 'heavy Barrel',
  
    ['component_ammo_tracer'] = 'tracer Ammo',
    ['component_ammo_incendiary'] = 'incendiary Ammo',
    ['component_ammo_hollowpoint'] = 'hollowpoint Ammo',
    ['component_ammo_fmj'] = 'fMJ Ammo',
    ['component_ammo_armor'] = 'armor Piercing Ammo',
    ['component_ammo_explosive'] = 'armor Piercing Incendiary Ammo',
  
    ['component_shells_default'] = 'default Shells',
    ['component_shells_incendiary'] = 'dragons Breath Shells',
    ['component_shells_armor'] = 'steel Buckshot Shells',
    ['component_shells_hollowpoint'] = 'flechette Shells',
    ['component_shells_explosive'] = 'explosive Slug Shells',
  
    -- Weapon Ammo
    ['ammo_rounds'] = 'round(s)',
    ['ammo_shells'] = 'shell(s)',
    ['ammo_charge'] = 'charge',
    ['ammo_petrol'] = 'gallons of fuel',
    ['ammo_firework'] = 'firework(s)',
    ['ammo_rockets'] = 'rocket(s)',
    ['ammo_grenadelauncher'] = 'grenade(s)',
    ['ammo_grenade'] = 'grenade(s)',
    ['ammo_stickybomb'] = 'bomb(s)',
    ['ammo_pipebomb'] = 'bomb(s)',
    ['ammo_smokebomb'] = 'bomb(s)',
    ['ammo_molotov'] = 'cocktail(s)',
    ['ammo_proxmine'] = 'mine(s)',
    ['ammo_bzgas'] = 'can(s)',
    ['ammo_ball'] = 'ball(s)',
    ['ammo_snowball'] = 'snowball(s)',
    ['ammo_flare'] = 'flare(s)',
    ['ammo_flaregun'] = 'flare(s)',
  
    -- Weapon Tints
    ['tint_default'] = 'default skin',
    ['tint_green'] = 'green skin',
    ['tint_gold'] = 'gold skin',
    ['tint_pink'] = 'pink skin',
    ['tint_army'] = 'army skin',
    ['tint_lspd'] = 'blue skin',
    ['tint_orange'] = 'orange skin',
    ['tint_platinum'] = 'platinum skin',
  }