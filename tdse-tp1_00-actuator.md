Dos estados y un solo evento recibido.
La acción al pasar de Led OFF a LED On es una función "led_on()" (a implementar), además de reiniciar el Timer del actuador.
Una vez transcurrido un tiempo mayor a "pulso", se apaga el led.


| Estado Actual | Evento | [Guard] | Próximo Estado | Acción |
| :--- | :--- | :--- | :--- | :--- |
| ST_ACT_LED_OFF | EV_ACT_LED_ON | — | ST_ACT_LED_ON | led_on(), reiniciar T |
| ST_ACT_LED_ON | — | [T > pulso] | ST_ACT_LED_OFF | led_off() |
