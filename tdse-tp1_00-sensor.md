Eventos y acciones del modelo Sensor (un solo botón) 

Un sensor (un solo botón) del tipo binario genera 2 eventos (On_pressed u Off_pressed) que reflejan el valor binario al que la maquina reacciona con un cambio de estado y las salidas correspondientes, las cuales definimos como acciones. En este caso la salida representa la acción de inicializar el proceso de parking


# Sensor Statechart - State Transition Table 

| Estado Actual | Evento | [Guard] | Próximo Estado | Acción | 
| :----- | :--------------------- | :------: | :-------: | :-------: |
|ST_BTN_DOWN|EV_BTN_OFF||ST_BTN_RISING|reiniciar T|
|ST_BTN_DOWN|EV_BTN_ON||ST_BTN_DOWN|
|ST_BTN_UP|EV_BTN_OFF||ST_BTN_UP|
|ST_BTN_UP|EV_BTN_ON||ST_BTN_FALLING|reiniciar T|
|ST_BTN_FALLING|EV_BTN_ON|T > Ruido|ST_BTN_DOWN|EV_SYS_ON|
|ST_BTN_FALLING|EV_BTN_OFF||ST_BTN_UP|
|ST_BTN_RISING|EV_BTN_ON||ST_BTN_DOWN|
|ST_BTN_RISING|EV_BTN_OFF|[T > ruido]|ST_BTN_UP|




