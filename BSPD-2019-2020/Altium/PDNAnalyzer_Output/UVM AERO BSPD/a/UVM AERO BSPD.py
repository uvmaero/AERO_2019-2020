designFile = "C:/git/AERO_2019-2020/BSPD-2019-2020/Altium/PDNAnalyzer_Output/UVM AERO BSPD/odb.tgz"

powerNets = ["+5", "+5_OUT", "+12", "L+", "D+", "FUSED", "IN+", "+15", "-15", "-5_OUT", "-5"]

groundNets = ["GND", "IN-"]

excitation = [
{
"id": "0",
"type": "load",
"power_pins": [ ("K1", "5") ],
"ground_pins": [ ("Q1", "2") ],
"resistance": 1E-09,
"Rpin": 42,
}
,
{
"id": "1",
"type": "source",
"power_pins": [ ("J2", "2") ],
"ground_pins": [ ("J2", "3") ],
"voltage": 12,
"Rpin": 0,
}
,
{
"id": "2",
"type": "load",
"power_pins": [ ("J3", "1") ],
"ground_pins": [ ("J3", "4") ],
"current": 0.05,
"Rpin": 2,
}
,
{
"id": "3",
"type": "load",
"power_pins": [ ("J3", "2") ],
"ground_pins": [ ("J3", "4") ],
"current": -0.05,
"Rpin": 2,
}
,
{
"id": "4",
"type": "load",
"power_pins": [ ("R6", "3") ],
"ground_pins": [ ("PS2", "2"), ("PS2", "6") ],
"resistance": 1E-09,
"Rpin": 6666.66666666667,
}
,
{
"id": "5",
"type": "source",
"power_pins": [ ("PS1", "11"), ("PS1", "14") ],
"ground_pins": [ ("PS1", "3"), ("PS1", "10"), ("PS1", "12"), ("PS1", "13"), ("PS1", "15"), ("PS1", "22") ],
"voltage": 15,
"Rpin": 0,
}
,
{
"id": "6",
"type": "load",
"power_pins": [ ("PS1", "1"), ("PS1", "24") ],
"ground_pins": [ ("PS1", "3"), ("PS1", "10"), ("PS1", "12"), ("PS1", "13"), ("PS1", "15"), ("PS1", "22") ],
"current": 0.0001,
"Rpin": 300000,
}
,
{
"id": "7",
"type": "source",
"power_pins": [ ("PS2", "7") ],
"ground_pins": [ ("PS2", "2"), ("PS2", "6") ],
"voltage": 5,
"Rpin": 0,
}
,
{
"id": "8",
"type": "load",
"power_pins": [ ("PS2", "1") ],
"ground_pins": [ ("PS2", "2"), ("PS2", "6") ],
"current": 0.0001,
"Rpin": 133333.333333333,
}
,
{
"id": "9",
"type": "source",
"power_pins": [ ("PS1", "2"), ("PS1", "23") ],
"ground_pins": [ ("PS1", "3"), ("PS1", "10"), ("PS1", "12"), ("PS1", "13"), ("PS1", "15"), ("PS1", "22") ],
"voltage": -15,
"Rpin": 0,
}
,
{
"id": "10",
"type": "load",
"power_pins": [ ("PS1", "1"), ("PS1", "24") ],
"ground_pins": [ ("PS1", "3"), ("PS1", "10"), ("PS1", "12"), ("PS1", "13"), ("PS1", "15"), ("PS1", "22") ],
"current": 0.0001,
"Rpin": 300000,
}
,
{
"id": "11",
"type": "source",
"power_pins": [ ("PS2", "5") ],
"ground_pins": [ ("PS2", "2"), ("PS2", "6") ],
"voltage": -5,
"Rpin": 0,
}
,
{
"id": "12",
"type": "load",
"power_pins": [ ("PS2", "1") ],
"ground_pins": [ ("PS2", "2"), ("PS2", "6") ],
"current": 0.0001,
"Rpin": 133333.333333333,
}
]


voltage_regulators = [
{
"id": "13",
"type": "linear",

"in": [ ("L1", "2") ],
"out": [ ("L1", "1") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 5E-07,
}
,
{
"id": "14",
"type": "linear",

"in": [ ("FB1", "2") ],
"out": [ ("FB1", "1") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 0.005,
}
,
{
"id": "15",
"type": "linear",

"in": [ ("L4", "4") ],
"out": [ ("L4", "1") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 5E-07,
}
,
{
"id": "16",
"type": "linear",

"in": [ ("D1", "2") ],
"out": [ ("D1", "1") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 5E-07,
}
,
{
"id": "17",
"type": "linear",

"in": [ ("F2", "2") ],
"out": [ ("F2", "1") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 5E-07,
}
,
{
"id": "18",
"type": "linear",

"in": [ ("L4", "3") ],
"out": [ ("L4", "2") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 5E-07,
}
,
{
"id": "19",
"type": "linear",

"in": [ ("L3", "1") ],
"out": [ ("L3", "2") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 5E-07,
}
]


# Resistors / Inductors

passives = []


# Material Properties:

tech = [

        {'name': 'TOP_SOLDER', 'DielectricConstant': 4, 'Thickness': 2.54E-05},
        {'name': 'TOP_LAYER', 'Conductivity': 47000000, 'Thickness': 3.556E-05},
        {'name': 'SUBSTRATE-1', 'DielectricConstant': 4.2, 'Thickness': 0.0014224},
        {'name': 'BOTTOM_LAYER', 'Conductivity': 47000000, 'Thickness': 3.556E-05},
        {'name': 'BOTTOM_SOLDER', 'DielectricConstant': 4, 'Thickness': 2.54E-05}

       ]

special_settings = {'removecutoutsize' : 7.8 }


plating_thickness = 0.7
finished_hole_diameters = False
