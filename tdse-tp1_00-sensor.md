Eventos y acciones del modelo Sensor (un solo botón) 

Un sensor (un solo botón) del tipo binario genera 2 eventos (On_pressed u Off_pressed) que reflejan el valor binario al que la maquina reacciona con un cambio de estado y las salidas correspondientes, las cuales definimos como acciones. En este caso la salida representa la acción de inicializar el proceso de parking

event => EV_BTN_OFF   
event => EV_BTN_ON    

state => ST_BTN_UP
state => ST_BTN_DWON
state => ST_BTN_FALLING
state => ST_BTN_RISING

signal => EV_SYS_ON

# Sensor Statechart - State Transition Table 
| Curren State | Event | [Guard] | Next State | Actions |
| :----- | :--------------------- | :------: | :-------: |
| ST_BTN_UP | YYYY, ZZZ | | Semana 04 | XXXXXX | XXXXXX |
| ST_BTN_DWON | YYYY, ZZZ | | Semana 04 | XXXXXX | XXXXXX |
| ST_BTN_FALLING | YYYY, ZZZ | | Semana 04 | XXXXXX | XXXXXX |





