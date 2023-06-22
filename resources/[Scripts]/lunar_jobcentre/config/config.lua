Config = {}
Config.RenderDistance = 30.0
Config.Target = 'ox_target' --['ox_target'/'qtarget']

Config.Blip = {
	Text = 'Job Centre',
	Sprite = 498,
	Size = 0.5,
	Color = 26,
	Display = 4
}

Config.Locations = {
	{
		Ped = `a_f_y_business_01`,
		Coords = vector4(-232.26989746094,-915.31304931641,32.310848236084, 341.61),
	}
}

--Optional fontawesome icons for jobs.
Config.JobIcons = {
	['unemployed'] = 'fa-solid fa-user',
	['taxi'] = 'fa-solid fa-taxi',
	['trucker'] = 'fa-solid fa-truck',
}

Config.Licenses = {
	{
		Item = 'carteidentite',
		Label = 'Carte d\'identité',
		Icon = 'fa-solid fa-id-card',
		LicenseNeeded = false, --['license'/false] verify license ownership through esx_license
		Price = 100
	},
	{
		Item = 'cartebancaire',
		Label = 'Carte Bancaire',
		Icon = 'fa-solid fa-id-card',
		LicenseNeeded = false, --['license'/false] verify license ownership through esx_license
		Price = 100
	},
	{
		Item = 'drive',
		Label = 'Permis de conduire',
		Icon = 'fa-solid fa-car',
		LicenseNeeded = 'drive', --['license'/false] verify license ownership through esx_license
		Price = 500
	},
	{
		Item = 'ppa',
		Label = 'Permis PPA',
		Icon = 'fa-solid fa-gun',
		LicenseNeeded = 'weapon', --['license'/false] verify license ownership through esx_license
		Price = 4000
	},
	

}
