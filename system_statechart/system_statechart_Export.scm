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
            "text": "system_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\n\ninterface Botones:\n    in event EV_SYS_BTN_ON  \n\ninterface Signal:\n    out event EV_ACT_LED_ON"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -312,
          "y": -202
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "08e4c4f0-36a3-476f-995f-2d0126218892",
        "z": 5,
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
          "x": -312,
          "y": -187
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "17554598-5ce0-4920-8b2d-15682c973398",
        "z": 6,
        "parent": "08e4c4f0-36a3-476f-995f-2d0126218892"
      },
      {
        "position": {
          "x": 195,
          "y": -103
        },
        "size": {
          "height": 76,
          "width": 219
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_WORKING",
            "fontSize": 11
          }
        },
        "id": "cb83c9b7-d3be-4ce7-bd4b-ae18f14a5929",
        "z": 9
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
            "text": "ST_SYS_WAITING",
            "fontSize": 11
          }
        },
        "id": "f46f8f2c-f447-40bd-935a-e74a470b21e0",
        "z": 11
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "08e4c4f0-36a3-476f-995f-2d0126218892"
        },
        "target": {
          "id": "f46f8f2c-f447-40bd-935a-e74a470b21e0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "48.387%",
              "dy": "1.149%",
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
        "id": "d5268001-dcf6-406e-b586-1c2c308b34dc",
        "z": 12,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f46f8f2c-f447-40bd-935a-e74a470b21e0"
        },
        "target": {
          "id": "cb83c9b7-d3be-4ce7-bd4b-ae18f14a5929",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.457%",
              "dy": "52.632%",
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
                "text": "Botones.EV_SYS_BTN_ON / raise Signal.EV_ACT_LED_ON"
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
        "id": "c363b094-897e-49df-8daf-cc8bf1396f0a",
        "z": 12,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "cb83c9b7-d3be-4ce7-bd4b-ae18f14a5929"
        },
        "target": {
          "id": "f46f8f2c-f447-40bd-935a-e74a470b21e0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "43.548%",
              "dy": "97.701%",
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
                "text": "after 10000 ms"
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
        "id": "83c4fbd0-e353-4a2a-96e5-8b544877fbdc",
        "z": 13,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 81,
            "y": 64
          }
        ]
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
          "moduleName": "SystemStatechart",
          "statemachinePrefix": "systemStatechart",
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