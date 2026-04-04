arch = gg.getTargetInfo()
target_process = "com.fingersoft.hcr2"
target_name = "Hill Climb Racing 2"
if gg.getTargetPackage() ~= target_process then
    gg.alert("This script was written for " .. target_name .. " (" .. target_process .. ") but you are attached to " .. arch.label .. " (" .. gg.getTargetPackage() .. "). Attach to the correct process and try again.")
end

-- Add these initializations
baseRegion = gg.REGION_C_ALLOC
baseGameStatus = {}
gg.setRanges(baseRegion)

function Start()
    local menu = gg.choice({
        "Vehicle Unlock",
        "Vehicle Price",
        "Exit"
    },0,"Script By Mikey-gg | Rayndra")
    if menu == nil then else
    if menu == 1 then unlockVehicles() end
    if menu == 2 then priceMenu() end
    if menu == 3 then exit() end
    end
end

vehiclesName = {
	[1] = {
		[1] = {
			"Scooter",
			"Bus",
			"Hill Climber Mk 2",
			"Tractor",
			"Motocross",
			"Dune Buggy",
			"Sports Car",
			"Monster Truck",
			"Rotator",
			"Super Diesel",
			"Chopper",
			"Tank",
			"Lowrider",
			"Snowmobile",
			"Monowheel",
			"Beast",
			"Rally Car",
			"Formula",
			"Muscle Car",
			"Racing Truck",
			"Hot Rod",
			"CC-EV",
			"Superbike",
			"Supercar",
			"Rock Bouncer",
			"Hoverbike",
			"Raider",
			"Bolt"
		},
		[2] = { 
			"h 0E 73 63 6F 6F 74 65 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 88 13 00 00",
			"h 06 62 75 73 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 58 1B 00 00",
			"h 12 73 75 70 65 72 6A 65 65 70 00 00 00 00 00 00 00 00 00 00 00 00 00 00 70 17 00 00",
			"h 0E 74 72 61 63 74 6F 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 98 3A 00 00",
			"h 12 6D 6F 74 6F 63 72 6F 73 73 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 4E 00 00",
			"h 12 64 75 6E 65 62 75 67 67 79 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 75 00 00",
			"h 12 73 70 6F 72 74 73 63 61 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00 28 23 00 00",
			"h 0E 6D 6F 6E 73 74 65 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 75 00 00",
			"h 14 75 70 73 69 64 65 64 6F 77 6E 00 00 00 00 00 00 00 00 00 00 00 00 00 60 EA 00 00",
			"h 18 70 69 63 6B 75 70 5F 74 72 75 63 6B 00 00 00 00 00 00 00 00 00 00 00 60 EA 00 00",
			"h 0E 63 68 6F 70 70 65 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 F8 24 01 00",
			"h 10 6D 69 6E 69 74 61 6E 6B 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 60 EA 00 00",
			"h 10 6C 6F 77 72 69 64 65 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 50 C3 00 00",
			"h 14 73 6E 6F 77 6D 6F 62 69 6C 65 00 00 00 00 00 00 00 00 00 00 00 00 00 70 11 01 00",
			"h 12 6D 6F 6E 6F 77 68 65 65 6C 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 75 00 00",
			"h 0A 62 65 61 73 74 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 70 11 01 00",
			"h 0A 72 61 6C 6C 79 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 A0 86 01 00",
			"h 0E 66 6F 72 6D 75 6C 61 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 90 5F 01 00",
			"h 12 6D 75 73 63 6C 65 63 61 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00 90 5F 01 00",
			"h 18 72 61 63 69 6E 67 5F 74 72 75 63 6B 00 00 00 00 00 00 00 00 00 00 00 90 5F 01 00",
			"h 0C 68 6F 74 72 6F 64 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 90 5F 01 00",
			"h 18 65 6C 65 63 74 72 69 63 5F 63 61 72 00 00 00 00 00 00 00 00 00 00 00 A0 86 01 00",
			"h 12 73 75 70 65 72 62 69 6B 65 00 00 00 00 00 00 00 00 00 00 00 00 00 00 F8 24 01 00",
			"h 0A 6C 61 6D 62 6F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 90 5F 01 00",
			"h 16 72 6F 63 6B 62 6F 75 6E 63 65 72 00 00 00 00 00 00 00 00 00 00 00 00 90 5F 01 00",
			"h 12 68 6F 76 65 72 62 69 6B 65 00 00 00 00 00 00 00 00 00 00 00 00 00 00 A0 86 01 00",
			"h 0C 72 61 69 64 65 72 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 A0 86 01 00",
			"h 0C 74 72 75 73 74 79 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 A0 86 01 00"
		}
	}
}

gameStatusVehicles = {
	[1] = {
		[1] = {
			"Hill Climber",
			"Scooter",
			"Bus",
			"Hill Climber Mk 2",
			"Tractor",
			"Motocross",
			"Dune Buggy",
			"Sports Car",
			"Monster Truck",
			"Rotator",
			"Super Diesel",
			"Chopper",
			"Tank",
			"Lowrider",
			"Snowmobile",
			"Monowheel",
			"Beast",
			"Rally Car",
			"Formula",
			"Muscle Car",
			"Racing Truck",
			"Hot Rod",
			"CC-EV",
			"Superbike",
			"Supercar",
			"Moonlander",
			"Rock Bouncer",
			"Hoverbike",
			"Raider",
			"Glider",
			"Bolt"
		},
		[2] = { 
			"jeep",
			"scooter",
			"bus",
			"superjeep",
			"tractor",
			"motocross",
			"dunebuggy",
			"sportscar",
			"monster",
			"upsidedown",
			"pickup_truck",
			"chopper",
			"tank",
			"lowrider",
			"snowmobile",
			"monowheel",
			"beast",
			"rally",
			"formula",
			"musclecar",
			"racing_truck",
			"hotrod",
			"electric_car",
			"superbike",
			"lambo",
			"moonlander",
			"rockbouncer",
			"hoverbike",
			"raider",
			"glider",
			"trusty"
		}
	}
}


function unlockVehicles()
	local functions = {
		unlockVehiclesNames,
		unlockVehiclesChoice,
		unlockVehiclesAll
	}
	local options = gg.choice({
		"Unlock Vehicles - By Names",
		"Unlock Vehicles - By Your Choice",
		"Unlock Vehicles - All",
		"Back"
	}, 0, "Vehicles Menu")
	if options ~= nil then
		if options == 4 then
			Start()
		else
			functions[options]()
		end
	else
		lastCall(unlockVehicles, true)
	end
end

function unlockVehiclesFunc(name)
	if name == nil then
		gg.alert("No Input", "", "", "")
		return
	end
	gg.setRanges(baseRegion)
	gg.clearResults()
	gg.searchNumber(":" .. name, 1)
	local getResults = gg.getResults(gg.getResultsCount())
	if #getResults > 0 then
		gg.refineNumber(getResults[1].value, 1)
		local getResults = gg.getResults(gg.getResultsCount())
		local resultsTable = {}
		if #getResults > 0 then
			for i, v in ipairs(getResults) do
				table.insert(resultsTable, {
					address = v.address + 0xEF,
					flags = 4
				})
			end
			if #resultsTable > 0 then
				gg.clearResults()
				gg.loadResults(resultsTable)
				gg.refineNumber("1~5", 4)
				local getResults = gg.getResults(gg.getResultsCount())
				gg.editAll("1", 4) 
				gg.clearResults()
				if #getResults > 0 then
					local localOffset = 0x4
					local editEdit = {}
					for _, v in ipairs(getResults) do
						table.insert(editEdit, {
							address = v.address + 0x38,
							flags = 4,
							value = 0
						})
						for i = 1, 13 do
							table.insert(editEdit, {
								address = v.address + localOffset,
								flags = 4,
								value = 0
							})
							localOffset = localOffset + 0x4
						end
					end
					gg.setValues(editEdit)
				end
			end
		end
	end
end

function unlockVehiclesNames()
	local prompt = gg.prompt({"Vehicle Name: "}, {}, {"text"})
	if prompt ~= nil then
		unlockVehiclesFunc(prompt[1])
		gg.toast("Done")
	else
		unlockVehicles()
	end
end

function unlockVehiclesChoice()
	local tables = {}
	local doLoop = 0
	for i = 1, (#gameStatusVehicles[1][1] - 1) do
		table.insert(tables, gameStatusVehicles[1][1][i+1])
	end
	table.insert(tables, "Back")
	local options = gg.multiChoice(tables, 0, "Select Vehicles")
	if type(options) ~= "table" then options = {} end
	for i, v in pairs(options) do
		if options[#tables] == true then
			unlockVehicles()
			break
		end
		if v == true then
			doLoop = doLoop + 1
		end
	end
	if doLoop ~= 0 then
		for i, v in pairs(options) do
			if v == true then
				local verifyStr = string.upper(gameStatusVehicles[1][1][i+1])
				if verifyStr == "HILL CLIMBER MK 2" then verifyStr = "HILL CLIMBER Mk2" end
				unlockVehiclesFunc(verifyStr)
				gg.toast(gameStatusVehicles[1][1][i+1] .. " Done")
			end
		end
	else
		lastCall(unlockVehiclesChoice, true)
	end
end

function unlockVehiclesAll()
	for i = 1, (#gameStatusVehicles[1][1] - 1) do
		local verifyStr = string.upper(gameStatusVehicles[1][1][i+1])
		if verifyStr == "HILL CLIMBER MK 2" then verifyStr = "HILL CLIMBER Mk2" end
		unlockVehiclesFunc(verifyStr)
		gg.toast(gameStatusVehicles[1][1][i+1] .. " Done")
	end
end

function getVehiclesAddress(vehiclesName)
	local vehicleAddress = 0
	local getFirstPointer = gg.getValues({{
		address = baseGameStatus[1].address + 0x68,
		flags = 32
	}})[1].value
	local getSecondPointer = gg.getValues({{
		address = getFirstPointer + 0xB0,
		flags = 32
	}})[1].value
	local totalVehicles = gg.getValues({{
		address = getFirstPointer + 0xB8,
		flags = 4
	}})[1].value
	for i = 1, totalVehicles do
		local getVehiclePointer = gg.getValues({{
			address = getSecondPointer + (i-1)*8,
			flags = 32
		}})[1].value
		local getVehicleName = gg.getValues({{
			address = getVehiclePointer + 0x18,
			flags = 32
		}})[1].value
		if string.match(rl.getString(getVehicleName+1), vehiclesName) then
			vehicleAddress = getVehiclePointer
			break
		end
	end
	return vehicleAddress
end

function exit()
gg.clearResults()
os.exit()
end

function priceMenu()
    local menuw = {
        "Scooter", "Bus", "Hill Climber Mk 2",
        "Tractor", "Motocross", "Dune Buggy",
        "Sports Car", "Monster Truck", "Rotator",
        "Super Diesel", "Chopper", "Tank",
        "Lowrider", "Snowmobile", "Monowheel",
        "Beast", "Rally Car", "Formula",
        "Muscle Car", "Racing Truck", "Hot Rod",
        "CC-EV", "Superbike", "Supercar",
        "Rock Bouncer", "Hoverbike", "Raider",
        "Bolt", -- All vehicles
        "ðŸš€ All Vehicles",  -- Special options
        "ðŸ”™ Back",  -- Back option
    }
    
    local choices = gg.multiChoice(menuw, nil, "Vehicle Price Editor")
    
    if not choices then return end
    
    -- Handle special options first
  if choices[#menuw] then         -- Back (last item)
        Start()
        return
    elseif choices[#menuw - 1] then -- All Vehicles (second last)
        modifyAllVehicles()
        return
    end

    -- Process vehicle selections
    local anySelected = false
    for i = 1, #vehiclesName[1][1] do  -- Only check vehicle indexes
        if choices[i] then
            modifySingleVehicle(i)
            anySelected = true
        end
    end

    if not anySelected then
        gg.alert("No vehicles selected!")
    end
end

function modifySingleVehicle(index)
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.clearResults()
    
    local hexPattern = vehiclesName[1][2][index]
    local vehicleName = vehiclesName[1][1][index]
    
    -- Convert hex pattern to searchable format
    local searchStr = hexPattern:sub(1, -9)  -- Remove last 4 bytes (price)
    
    -- Search with original 'h' prefix
    gg.searchNumber(searchStr, gg.TYPE_BYTE)
    
    local results = gg.getResults(1)
    if #results > 0 then
        local targetAddress = results[1].address + 0x18
        gg.setValues({
            {
                address = targetAddress,
                flags = gg.TYPE_DWORD,
                value = 1
            }
        })
        gg.toast(vehicleName.." price set to 1")
    end
    gg.clearResults()
end

function modifyAllVehicles()
    gg.toast("Processing all vehicles...")
    for i = 1, #vehiclesName[1][1] do
        modifySingleVehicle(i)
    end
    gg.alert("All vehicles processed!")
end

Start()
while(true)
do
  while gg.isVisible(true)
    do
      gg.setVisible(false)
    Start()
    end
end