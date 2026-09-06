{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "sensor_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\n\n\ninterface Botones:\n    in event EV_BTN_OFF   \n    in event EV_BTN_ON    \n    \ninterface Signal:\n    out event EV_SYS_ON\n    \n    \n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -259,
          "y": -258
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "9f9f40a3-e1b6-4b7e-aa1a-3f78e9044542",
        "z": 19,
        "embeds": [
          "5d8a4f03-946d-48c7-8335-946c50325cb2"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -259,
          "y": -243
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "5d8a4f03-946d-48c7-8335-946c50325cb2",
        "z": 20,
        "parent": "9f9f40a3-e1b6-4b7e-aa1a-3f78e9044542"
      },
      {
        "position": {
          "x": -238,
          "y": -168
        },
        "size": {
          "height": 74,
          "width": 151
        },
        "type": "State",
        "attrs": {
          "body": {
            "strokeWidth": 0,
            "stroke": "#FFFFFF",
            "fill": "#F76868"
          },
          "name": {
            "text": "ST_BTN_UP",
            "fontSize": 11
          }
        },
        "id": "b4d38df2-61b6-4299-af41-e3c4a355649b",
        "z": 22,
        "embeds": [
          "5d2506a0-d0f7-45df-a1bf-8b5cd01334ae"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "9f9f40a3-e1b6-4b7e-aa1a-3f78e9044542"
        },
        "target": {
          "id": "b4d38df2-61b6-4299-af41-e3c4a355649b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "48.344%",
              "dy": "6.757%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a3752d7a-0542-4706-a2d1-07f71410f615",
        "z": 23,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b4d38df2-61b6-4299-af41-e3c4a355649b"
        },
        "target": {
          "id": "b4d38df2-61b6-4299-af41-e3c4a355649b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.338%",
              "dy": "56.757%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Botones.EV_BTN_OFF"
              }
            },
            "position": {
              "distance": 0.36290694355221403,
              "offset": -13,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5d2506a0-d0f7-45df-a1bf-8b5cd01334ae",
        "z": 24,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -36,
            "y": -58
          }
        ],
        "parent": "b4d38df2-61b6-4299-af41-e3c4a355649b"
      },
      {
        "position": {
          "x": 163,
          "y": -123
        },
        "size": {
          "height": 87,
          "width": 195
        },
        "type": "State",
        "attrs": {
          "body": {
            "fill": "#BDF7A6"
          },
          "name": {
            "text": "ST_BTN_FALLING",
            "fontSize": 11
          }
        },
        "id": "c9fb3a94-1367-463e-9292-5d652af472b4",
        "z": 26
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b4d38df2-61b6-4299-af41-e3c4a355649b"
        },
        "target": {
          "id": "c9fb3a94-1367-463e-9292-5d652af472b4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.513%",
              "dy": "52.874%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Botones.EV_BTN_ON"
              }
            },
            "position": {
              "distance": 0.658535482257555,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "b1f18aff-4f31-4f53-839d-8a20ff557078",
        "z": 27,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9fb3a94-1367-463e-9292-5d652af472b4"
        },
        "target": {
          "id": "b4d38df2-61b6-4299-af41-e3c4a355649b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "56.954%",
              "dy": "4.054%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Botones.EV_BTN_OFF"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "831bdd37-c998-4d7d-b607-01b0efebd8e8",
        "z": 27,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 161,
            "y": -165
          }
        ]
      },
      {
        "position": {
          "x": 179,
          "y": 37
        },
        "size": {
          "height": 88,
          "width": 150
        },
        "type": "State",
        "attrs": {
          "body": {
            "fill": "#45F76E"
          },
          "name": {
            "text": "ST_BTN_DOWN",
            "fontSize": 11
          },
          "specification": {
            "text": " "
          }
        },
        "id": "d0c03a42-6728-427f-ba4a-032268a72520",
        "z": 30,
        "embeds": [
          "6dbcbb04-e028-4012-b0db-07fc1c928811"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9fb3a94-1367-463e-9292-5d652af472b4"
        },
        "target": {
          "id": "d0c03a42-6728-427f-ba4a-032268a72520",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.333%",
              "dy": "8.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Botones.EV_BTN_ON, after 5000 ms / raise Signal.EV_SYS_ON"
              }
            },
            "position": {
              "distance": 0.4504950503780417,
              "offset": -193,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e46510ff-bcbb-4414-bcfa-2d84cc85058b",
        "z": 31,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "d0c03a42-6728-427f-ba4a-032268a72520"
        },
        "target": {
          "id": "d0c03a42-6728-427f-ba4a-032268a72520",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.333%",
              "dy": "50%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Botones.EV_BTN_ON"
              }
            },
            "position": {
              "distance": 0.39990933252673816,
              "offset": -14,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "6dbcbb04-e028-4012-b0db-07fc1c928811",
        "z": 32,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 431,
            "y": 146
          }
        ],
        "parent": "d0c03a42-6728-427f-ba4a-032268a72520"
      },
      {
        "position": {
          "x": -186,
          "y": 62
        },
        "size": {
          "height": 67,
          "width": 201
        },
        "type": "State",
        "attrs": {
          "body": {
            "fill": "#FDAFAF"
          },
          "name": {
            "text": "ST_BTN_RISING",
            "fontSize": 11
          }
        },
        "id": "1e1babfe-76f7-4279-8c28-bf591d428f0f",
        "z": 33
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "d0c03a42-6728-427f-ba4a-032268a72520"
        },
        "target": {
          "id": "1e1babfe-76f7-4279-8c28-bf591d428f0f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.005%",
              "dy": "46.269%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Botones.EV_BTN_OFF"
              }
            },
            "position": {
              "distance": 0.524390243902439,
              "offset": 13,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0f148461-6085-4f90-89ec-45a3df50b1b7",
        "z": 34,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1e1babfe-76f7-4279-8c28-bf591d428f0f"
        },
        "target": {
          "id": "b4d38df2-61b6-4299-af41-e3c4a355649b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "15.894%",
              "dy": "91.892%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Botones.EV_BTN_OFF, after 5000 ms"
              }
            },
            "position": {
              "distance": 0.6781882097887396,
              "offset": -20.475296020507812,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5e083f51-5766-4efb-b828-4397e3289b3a",
        "z": 35,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -102,
            "y": 21
          },
          {
            "x": -214,
            "y": -13
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1e1babfe-76f7-4279-8c28-bf591d428f0f"
        },
        "target": {
          "id": "d0c03a42-6728-427f-ba4a-032268a72520",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "9.333%",
              "dy": "100%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Botones.EV_BTN_ON"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4f92b815-a2af-4894-8a7b-ea95c819e153",
        "z": 36,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SensorStatechart",
          "statemachinePrefix": "sensorStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}