return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['keys'] = {
		label = 'Clés',
	},


	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},
	['radios'] = {
		label = 'Radio',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},


	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Mastercard',
		stack = false,
		weight = 10,
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},


    -- Papier Identité
	['carteidentite'] = {
		label = 'Passeport',
		weight = 80,
	},

	['ppa'] = {
		label = 'Permis PA',
		weight = 80,
	},

	['drive'] = {
		label = 'Permis de Conduire',
		weight = 80,
	},

	['cartebancaire'] = {
		label = 'Carte Bancaire',
		weight = 80,
	},
	

	-- 24/7 LTD

	['wallet'] = {
		label = 'Portefeuille',
		weight = 80,
	},

	['paperbag'] = {
		label = 'Petit Sac',
		weight = 80,
	},

	['stockagebag'] = {
		label = 'Grand Sac',
		weight = 80,
	},
     -- Boissons
	['drpepper'] = {
		label = 'Dr Pepper',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},

	['nestea'] = {
		label = 'Nestea',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['pepsi'] = {
		label = 'Pepsi',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['sprite'] = {
		label = 'Sprite',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['7up'] = {
		label = '7up',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['apple_juice'] = {
		label = 'Apple Juice',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['arizona_punch'] = {
		label = 'Arizona Punch',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['aw'] = {
		label = 'A&W Rootbeer',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['big_blue'] = {
		label = 'Big Blue',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['big_red'] = {
		label = 'Big Red',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['brisk_pink'] = {
		label = 'Brisk Pink',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['canada_dry'] = {
		label = 'Canada Dry',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
	['capri_sun'] = {
		label = 'Capri Sun',
		weight = 20,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola.'
		}
	},
    -- Food

	['cheetos'] = {
		label = 'Cheetos',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious bag of Cheetos.'
		},
	},
	['cheetos_hot'] = {
		label = 'Hot Cheetos',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious bag of Hot Cheetos.'
		},
	},
	['doritos_cr'] = {
		label = 'Doritos',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious bag of Cool Ranch Doritos.'
		},
	},
	['doritos_nc'] = {
		label = 'Doritos',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious bag of Nacho Cheese Doritos.'
		},
	},
	['lays'] = {
		label = 'Lays',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious bag of Lays.'
		},
	},
	['lays_baked'] = {
		label = 'Lays Baked',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious bag of Lays Baked.'
		},
	},
	['sunchips'] = {
		label = 'Sun Chips',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious bag of Sun Chips.'
		},
	},
	['goldfish'] = {
		label = 'Goldfish',
		description = 'The snack that smiles back.',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious bag of Cheddar Goldfish.'
		},
	},	
	['honeybun'] = {
		label = 'Honey Bun',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Honey Bun.'
		},
	},

	['cheez_its'] = {
		label = 'Cheez-its',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'chips',
			usetime = 2500,
			notification = 'You ate a delicious Cheez Its.'
		},
	},
	['chips_ahoy'] = {
		label = 'Chips Ahoy',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Chips Ahoy.'
		},
	},
	['cup_of_noodles'] = {
		label = 'Cup Of Noodles',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Cup Of Noodles.'
		},
	},
	['fritos'] = {
		label = 'Fritos',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Fritos.'
		},
	},
	['fruit_snacks'] = {
		label = 'Fruit Snacks',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Fruit Snacks.'
		},
	},
	['funyuns'] = {
		label = 'Funyuns',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Funyuns.'
		},
	},
	
	['gushers'] = {
		label = 'Gushers',
		weight = 220,
		client = {
			status = { hunger = 150000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Gushers.'
		},
	},
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},
	
	['garbage'] = {
		label = 'Garbage',
	},




	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},


	['cannabis'] = { -- idea: use for player to hype up
        label = 'Amnesia Haze',
        consume = 0.267,
        weight = 15,
        description = "Oh man, what a dingus, just Look at em",
        client = {
            anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c', flag = 49 },
            prop = { model = 'bzzz_cigarpack_cig003', 
            pos = vec3(-0.01, 0.0, 0.0), rot = vec3(0.0, 180.0, 0.0), bone = 28422 },
            disable = { move = false, car = false, combat = true },
            usetime = 16000,
        }
    },

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},


	['cannabis1'] = {
		label = 'cannabis',
		weight = 80,
	},
	['pooch_weed'] = {
		label = 'Pochon de Weed',
		weight = 80,
	},
	 -- Papier Identité
	 ['carteidentite'] = {
		label = 'Passeport',
		weight = 80,
	},

	['ppa'] = {
		label = 'Permis PA',
		weight = 80,
	},

	['drive'] = {
		label = 'Permis de Conduire',
		weight = 80,
	},

	['cartebancaire'] = {
		label = 'Carte Bancaire',
		weight = 80,
	},

	['carkey'] = {
		label = 'Clé de voiture',
		weight = 300,
		stack = false
},

	['torso'] = {
		label = 'Torso',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.torso'
		}
	},

	['pants'] = {
		label = 'Pants',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.pants'
		}
	},

	['shoes'] = {
		label = 'shoes',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.shoes'
		}
	},

	['mask'] = {
		label = 'Mask',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.mask'
		}
	},

	['ears'] = {
		label = 'Ears Accessories',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.ears'
		}
	},

	['chain'] = {
		label = 'Chain',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.chain'
		}
	},

	['glasses'] = {
		label = 'Glasses',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.glasses'
		}
	},

	['vest'] = {
		label = 'Vest',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.vest'
		}
	},

	['helmet'] = {
		label = 'Helmet',
		weight = 50,
		stack = false,
		client = {
			export = 'ox_menuf5.helmet'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},


	


	["medikit"] = {
		label = "Medikit",
		weight = 2,
		stack = true,
		close = true,
	},
}