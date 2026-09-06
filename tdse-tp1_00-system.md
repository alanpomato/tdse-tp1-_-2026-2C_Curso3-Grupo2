El sistema recibe el evento EV_SYS_BTN_ON y pasa de "en espera" a "trabajando/despachando", en donde envía la señal "EV_ACT_LED_ON" al actuador.
Además, en ese momento reinicia a T el timer.
Luego de un tiempo razonable que debe estar relacionado al tiempo de trabajo del actuador (según qué sea el actuador), el estado del sistema vuelve a "WAITING".

| Estado Actual | Evento | [Guard] | Próximo Estado | Acción |
| :--- | :--- | :--- | :--- | :--- |
| ST_SYS_WAITING | EV_SYS_BTN_ON | — | ST_SYS_WORKING | EV_ACT_LED_ON, reiniciar T |
| ST_SYS_WORKING | — | [T > espera] | ST_SYS_WAITING | — |
