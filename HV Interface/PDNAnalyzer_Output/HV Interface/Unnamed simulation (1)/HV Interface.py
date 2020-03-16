designFile = "C:/git/AERO_2019-2020/HV Interface/PDNAnalyzer_Output/HV Interface/odb.tgz"

powerNets = ["VICOR_OUT", "FILT", "DCDC_OUT+", "+DCDC_OUT"]

groundNets = ["PGND"]

excitation = [
{
"id": "0",
"type": "source",
"power_pins": [ ("A1", "3") ],
"ground_pins": [ ("A1", "4") ],
"voltage": 13.2,
"Rpin": 0,
}
,
{
"id": "1",
"type": "load",
"power_pins": [ ("J2", "1") ],
"ground_pins": [ ("J2", "2") ],
"current": 20,
"Rpin": 0.005,
}
]


voltage_regulators = [
{
"id": "2",
"type": "linear",

"in": [ ("L2", "1") ],
"out": [ ("L2", "2") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 0.000125,
}
,
{
"id": "3",
"type": "linear",

"in": [ ("F1", "3"), ("F1", "1") ],
"out": [ ("F1", "4"), ("F1", "2") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 0.00321,
}
,
{
"id": "4",
"type": "linear",

"in": [ ("R14", "1") ],
"out": [ ("R14", "2") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 0.0015,
}
,
{
"id": "5",
"type": "linear",

"in": [ ("R4", "1") ],
"out": [ ("R4", "2") ],
"ref": [],

"v2": 0,
"i1": 0,
"Ro": 1E-06,
"Rpin": 0.125,
}
]


# Resistors / Inductors

passives = []


# Material Properties:

tech = [

        {'name': 'TOP_SOLDER', 'DielectricConstant': 4, 'Thickness': 2.54E-05},
        {'name': 'TOP_LAYER', 'Conductivity': 47000000, 'Thickness': 3.556E-05},
        {'name': 'SUBSTRATE-1', 'DielectricConstant': 4.2, 'Thickness': 0.0014732},
        {'name': 'BOTTOM_LAYER', 'Conductivity': 47000000, 'Thickness': 3.556E-05},
        {'name': 'BOTTOM_SOLDER', 'DielectricConstant': 4, 'Thickness': 2.54E-05}

       ]

special_settings = {'removecutoutsize' : 7.8 }


plating_thickness = 0.7
finished_hole_diameters = False
