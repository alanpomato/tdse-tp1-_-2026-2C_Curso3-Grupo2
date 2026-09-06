**Eventos y acciones del modelo Sensor (un solo botón) **


Un botón se considera apretado en el estado "Down", y sin apretar en el estado "Up".
Además, se consideran dos estados adicionales a la transición entre los anteriores: Falling (de Down a Up) y Rising (de Up a Down).
Los eventos que ejecuta el sensor son "Off" (soltar) y "On" (apretar).
De esta manera se disponen de 4 estados y 2 eventos. La tabla de transiciones entre ellos se muestra debajo.

En palabras, se puede interpretar el siguiente flujo:

	ST_BTN_UP (sin apretar)
	Se presiona boton -> Evento EV_BTN_ON
	El sensor pasa al estado ST_BTN_FALLING.
	En ST_BTN_FALLING hay dos alternativas, si el evento es EV_BTN_ON y pasa un tiempo definido "Ruido" contabilizado mediante el timer, el botón pasa al estado ST_BTN_DOWN (apretado)
	En este caso se envía la señal/acción "EV_SYS_ON".
	Mientras el tiempo sea menor al ruido y siga el evento EV_BTN_ON, se mantiene en ST_BTN_FALLING.
	Si el evento cambia a EV_BTN_OFF (se suelta), entonces regresa al estado ST_BTN_UP. No hay acción ejecutada en este caso y se considera que un ruido de medición.
	El caso inverso es idéntico mediante el estado ST_BTN_RISING, con el mismo tiempo definido relacionado al ruido, con la salvedad de que no habrá una señal/acción a ejecutar.

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




