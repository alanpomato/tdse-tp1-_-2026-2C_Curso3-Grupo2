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
            "text": "@EventDriven\n@SuperSteps(no)\ninterface:\n    // Eventos que representan el estado físico del pulsador (entradas)\n    in event EV_BTN_ON\n    in event EV_BTN_OFF\n    in event timer   \n\n    // Señal de salida que le avisa al sistema que inicie el proceso de parking\n    out event EV_SYS_ON\n\n    // Variable para contar el tiempo de persistencia del estado (debounce)\n    var T : integer = 0\n    \n    // Umbral de ruido (milisegundos o ciclos estables, ej: 20 ticks de 1ms)\n    const RUIDO : integer = 20\n    "
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -221,
          "y": -18
        },
        "size": {
          "height": 60,
          "width": 112
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_UP",
            "fontSize": 11
          }
        },
        "id": "7fe60486-38ed-4d64-b0a1-e164e4690106",
        "z": 4
      },
      {
        "position": {
          "x": 8,
          "y": -18
        },
        "size": {
          "height": 60,
          "width": 122
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_FALLING",
            "fontSize": 11
          },
          "specification": {
            "text": "    timer / T += 1"
          }
        },
        "id": "15cb909d-1110-4812-acfa-553723fed55f",
        "z": 5
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7fe60486-38ed-4d64-b0a1-e164e4690106"
        },
        "target": {
          "id": "15cb909d-1110-4812-acfa-553723fed55f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "15.574%",
              "dy": "51.667%",
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
                "text": "EV_BTN_ON / T = 0"
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
        "id": "dc0747f2-65ef-4338-850a-688274f900e3",
        "z": 13,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "15cb909d-1110-4812-acfa-553723fed55f"
        },
        "target": {
          "id": "7fe60486-38ed-4d64-b0a1-e164e4690106",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "72.321%",
              "dy": "48.333%",
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
                "text": "EV_BTN_OFF"
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
        "id": "6cb40ecc-3899-47ad-a29a-6a14b2505653",
        "z": 19,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -48,
            "y": 118
          }
        ]
      },
      {
        "position": {
          "x": 361,
          "y": -4
        },
        "size": {
          "height": 60,
          "width": 109
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_DOWN\n",
            "fontSize": 11
          }
        },
        "id": "27976e80-4691-42b1-a8b2-aa10b23ee7d0",
        "z": 23
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "15cb909d-1110-4812-acfa-553723fed55f"
        },
        "target": {
          "id": "27976e80-4691-42b1-a8b2-aa10b23ee7d0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "3.061%",
              "dy": "45%",
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
                "text": "timer [T > RUIDO] / raise EV_SYS_ON"
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
        "id": "e93c0dbd-2222-4b17-bc86-38f69c8e8b7e",
        "z": 24,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 219,
          "y": -157
        },
        "size": {
          "height": 55,
          "width": 55
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "62ed6ba1-2498-4b01-8021-10cc3b8fce9d",
        "z": 29,
        "embeds": [
          "df40f2a2-8e19-4c8b-98dd-26ca9601a96d"
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
          "x": 219,
          "y": -142
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "df40f2a2-8e19-4c8b-98dd-26ca9601a96d",
        "z": 30,
        "parent": "62ed6ba1-2498-4b01-8021-10cc3b8fce9d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "62ed6ba1-2498-4b01-8021-10cc3b8fce9d"
        },
        "target": {
          "id": "7fe60486-38ed-4d64-b0a1-e164e4690106",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "46.667%",
              "dy": "41.667%",
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
        "id": "96afde5b-1984-4b0f-848b-edd9da70aa0f",
        "z": 31,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 600,
          "y": -6
        },
        "size": {
          "height": 61,
          "width": 125
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_RISING",
            "fontSize": 11
          },
          "specification": {
            "text": "    timer / T += 1"
          }
        },
        "id": "c584ce00-5c61-40d2-b287-7709424f0f2d",
        "z": 34
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "27976e80-4691-42b1-a8b2-aa10b23ee7d0"
        },
        "target": {
          "id": "c584ce00-5c61-40d2-b287-7709424f0f2d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "48.8%",
              "dy": "72.131%",
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
                "text": "EV_BTN_OFF / T = 0"
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
        "id": "96732ea5-edfb-48e2-b2dc-a98cef2f511d",
        "z": 35,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c584ce00-5c61-40d2-b287-7709424f0f2d"
        },
        "target": {
          "id": "7fe60486-38ed-4d64-b0a1-e164e4690106",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "59.821%",
              "dy": "86.667%",
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
                "text": "timer [T > RUIDO]"
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
        "id": "18316eeb-f0bd-44f3-b194-9111a5084c39",
        "z": 35,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 695,
            "y": 217
          },
          {
            "x": -83,
            "y": 217
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c584ce00-5c61-40d2-b287-7709424f0f2d"
        },
        "target": {
          "id": "27976e80-4691-42b1-a8b2-aa10b23ee7d0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "55.102%",
              "dy": "78.333%",
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
                "text": "EV_BTN_ON"
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
        "id": "820735fe-59cf-45ea-9714-4a2e8c2bc7b7",
        "z": 35,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 543,
            "y": 145
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