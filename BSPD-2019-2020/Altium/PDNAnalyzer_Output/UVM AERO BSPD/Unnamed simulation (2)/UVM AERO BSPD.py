designFile = "C:/git/AERO_2019-2020/BSPD-2019-2020/Altium/PDNAnalyzer_Output/UVM AERO BSPD/odb.tgz"

powerNets = ["+5"]

groundNets = ["GND"]

excitation = [
{
"id": "0",
"type": "source",
"power_pins": [ ("L1", "2") ],
"ground_pins": [ ("PS2", "2"), ("PS2", "6") ],
"voltage": 5,
"Rpin": 0,
}
,
{
"id": "1",
"type": "load",
"power_pins": [ ("FB2", "1") ],
"ground_pins": [ ("U4", "13"), ("U4", "15"), ("U4", "16"), ("U4", "14"), ("U4", "25") ],
"current": 0.3,
"Rpin": 0.555555555555556,
}
,
{
"id": "2",
"type": "load",
"power_pins": [ ("U11", "8") ],
"ground_pins": [ ("U11", "4") ],
"current": 0.05,
"Rpin": 2,
}
,
{
"id": "3",
"type": "load",
"power_pins": [ ("U1", "5") ],
"ground_pins": [ ("U1", "2") ],
"current": 0.05,
"Rpin": 2,
}
,
{
"id": "4",
"type": "load",
"power_pins": [ ("U3", "5") ],
"ground_pins": [ ("U3", "3") ],
"current": 0.05,
"Rpin": 2,
}
,
{
"id": "5",
"type": "load",
"power_pins": [ ("U6", "7"), ("U6", "8") ],
"ground_pins": [ ("U6", "4") ],
"current": 0.05,
"Rpin": 2.66666666666667,
}
]


voltage_regulators = []


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
