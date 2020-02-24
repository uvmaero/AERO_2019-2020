designFile = "C:/git/AERO_2019-2020/HV Box Connector Board/PDNAnalyzer_Output/HV Box Connector Board/odb.tgz"

powerNets = ["+DCDC"]

groundNets = ["PGND"]

excitation = [
{
"id": "0",
"type": "source",
"power_pins": [ ("J14", "1") ],
"ground_pins": [ ("J14", "2") ],
"voltage": 13.2,
"Rpin": 0.0025,
}
,
{
"id": "1",
"type": "load",
"power_pins": [ ("J9", "3"), ("J9", "4"), ("J9", "15"), ("J9", "16") ],
"ground_pins": [ ("J9", "1"), ("J9", "2"), ("J9", "13"), ("J9", "24"), ("J9", "25") ],
"current": 20,
"Rpin": 0.0222222222222222,
}
]


voltage_regulators = []


# Resistors / Inductors

passives = []


# Material Properties:

tech = [

        {'name': 'TOP_SOLDER', 'DielectricConstant': 4, 'Thickness': 2.54E-05},
        {'name': 'TOP_LAYER', 'Conductivity': 47000000, 'Thickness': 3.5E-05},
        {'name': 'SUBSTRATE-1', 'DielectricConstant': 4.3, 'Thickness': 0.0014986},
        {'name': 'BOTTOM_LAYER', 'Conductivity': 47000000, 'Thickness': 3.5E-05},
        {'name': 'BOTTOM_SOLDER', 'DielectricConstant': 4, 'Thickness': 2.54E-05}

       ]

special_settings = {'removecutoutsize' : 7.8 }


plating_thickness = 0.7
finished_hole_diameters = False
