Config                  = {}
Config.Locale           = GetConvar('esx:locale', 'fr')

-- [Config.EnableCommands]
-- Enables Commands Such As /char and /chardel
Config.EnableCommands   = ESX.GetConfig().EnableDebug

Config.UseDeferrals     = false -- EXPERIMENTAL Character Registration Method.


-- These values are for the second input validation in server/main.lua
Config.MaxNameLength    = 20
Config.MinHeight        = 120
Config.MaxHeight        = 220
Config.LowestYear       = 1900
Config.HighestYear      = 2021

Config.FullCharDelete   = true
Config.EnableDebugging  = ESX.GetConfig().EnableDebug
