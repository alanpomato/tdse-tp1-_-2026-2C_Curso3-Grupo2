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
            "text": "actuator_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\n\ninterface Led:\n    in event EV_ACT_LED_ON \n\ninterface Signal:\n    out event led_on\n    out event led_off"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -355,
          "y": -105
        },
        "size": {
          "height": 87,
          "width": 186
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_LED_APAGADO",
            "fontSize": 11
          }
        },
        "z": 11,
        "id": "f46f8f2c-f447-40bd-935a-e74a470b21e0"
      },
      {
        "position": {
          "x": -306,
          "y": -187
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "z": 14,
        "id": "08e4c4f0-36a3-476f-995f-2d0126218892",
        "embeds": [
          "17554598-5ce0-4920-8b2d-15682c973398"
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
          "x": -306,
          "y": -172
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
          }
        },
        "parent": "08e4c4f0-36a3-476f-995f-2d0126218892",
        "z": 15,
        "id": "17554598-5ce0-4920-8b2d-15682c973398"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "08e4c4f0-36a3-476f-995f-2d0126218892"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "48.387%",
              "dy": "1.149%"
            },
            "name": "topLeft"
          },
          "id": "f46f8f2c-f447-40bd-935a-e74a470b21e0",
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 16,
        "id": "d5268001-dcf6-406e-b586-1c2c308b34dc"
      },
      {
        "position": {
          "x": 226,
          "y": 43
        },
        "size": {
          "height": 90,
          "width": 140
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_LED_ON",
            "fontSize": 11
          }
        },
        "z": 20,
        "id": "cb83c9b7-d3be-4ce7-bd4b-ae18f14a5929",
        "embeds": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f46f8f2c-f447-40bd-935a-e74a470b21e0"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "0.457%",
              "dy": "52.632%"
            },
            "name": "topLeft"
          },
          "id": "cb83c9b7-d3be-4ce7-bd4b-ae18f14a5929",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "Led.EV_ACT_LED_ON / raise Signal.led_on"
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 26,
        "id": "c363b094-897e-49df-8daf-cc8bf1396f0a"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "cb83c9b7-d3be-4ce7-bd4b-ae18f14a5929"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "43.548%",
              "dy": "97.701%"
            },
            "name": "topLeft"
          },
          "id": "f46f8f2c-f447-40bd-935a-e74a470b21e0",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "after 10000 ms / raise Signal.led_off"
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
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 176,
            "y": 82
          }
        ],
        "z": 26,
        "id": "83c4fbd0-e353-4a2a-96e5-8b544877fbdc"
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
          "moduleName": "ActuatorStatechart",
          "statemachinePrefix": "actuatorStatechart",
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