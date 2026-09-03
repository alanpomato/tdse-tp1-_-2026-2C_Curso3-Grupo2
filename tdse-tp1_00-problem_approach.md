

## 1. Descripción de la Solución de COMA Electronics (Intelligent Parking Management System)

El **Intelligent Parking Management System (Sistema Inteligente de Gestión de Estacionamiento)** de **COMA Electronics** representa una solución integral y automatizada para el control de ingresos, egresos y recaudación en playas de estacionamiento de alta densidad (como centros comerciales o aeropuertos).

### Estructura y Componentes del Sistema
De acuerdo con la arquitectura general de COMA Electronics, el ecosistema de hardware y software se compone de:
*   **Parking System Server (Servidor del Sistema)**: El núcleo centralizado que procesa, almacena y sincroniza la base de datos de transacciones, estado de ocupación y tarifas en tiempo real.
*   **Entry Machine (Máquina de Entrada)**: Dispensadora automática de tickets encargada de registrar el ingreso de los vehículos.
*   **Exit Machine (Máquina de Salida)**: Terminal lectora de tickets que valida el cobro y controla la barrera física de salida.
*   **Toll Computer / Automatic Pay Station (Estación de Pago Automático)**: Cajero autoservicio que permite el cobro descentralizado y autónomo.

### Flujo de Proceso Automatizado (Automated Parking System)
El sistema opera bajo un flujo de trabajo optimizado sin intervención de personal de asistencia física (*unmanned design*):
1.  **Ingreso**: Al arribar un vehículo, la máquina de entrada detecta la presencia física (mediante espira de inducción magnética) y la cámara captura/reconoce el vehículo. El usuario presiona el botón físico y la máquina imprime un ticket de código de barras único, registrando fecha y hora exacta. Al retirarse el ticket, se envía la señal de apertura a la barrera.
2.  **Validación y Pago**: Antes de regresar a su vehículo, el usuario escanea el ticket en la **Estación de Pago Automático (Auto Pay Station)**. La estación calcula automáticamente la tarifa en función de la duración de la estadía. Soporta múltiples modalidades de pago (efectivo, tarjetas, códigos QR). Una vez completada la transacción, el sistema otorga un tiempo de gracia de cortesía para abandonar el predio.
3.  **Salida**: El vehículo se dirige a la máquina de salida. Al escanear el ticket pago, la terminal de salida verifica la validez de la transacción dentro del tiempo de gracia. Si es correcto, envía el comando de apertura de la barrera y registra la salida en el servidor central.

---

## 2. Implementación de la "Parking Ticket Dispenser Machine (Entry)"

Como parte del desarrollo académico de la asignatura **Taller de Sistemas Embebidos (FIUBA)**, se implementa un **Producto Mínimo Viable (MVP)** funcional para simular y validar el comportamiento lógico de la terminal de acceso (Entry Machine) de COMA Electronics.

Esta implementación se diseña sobre la plataforma de desarrollo **NUCLEO-F103RB** utilizando un enfoque estructurado y portable bajo los siguientes pilares de diseño de software embebido:

### Arquitectura de Software Modular (Escrutar, Procesar, Actuar)
Para asegurar la portabilidad, el aislamiento de hardware y el reuso de código, el firmware se divide estrictamente en tres módulos desacoplados que se ejecutan cooperativamente en un ejecutivo cíclico de 1 mS:
1.  **Sensores (Escrutar)**: Se encarga de muestrear periódicamente las entradas digitales físicas y de procesar las señales de entrada.
2.  **Sistema (Procesar)**: Contiene las reglas del negocio y la lógica de estado del dispensador.
3.  **Actuadores (Actuar)**: Recibe directivas de control y comanda las salidas físicas.

### Simulación y Mapeo de Hardware
Dado que se trabaja sobre la placa de evaluación NUCLEO-F103RB sin el hardware industrial de estacionamiento real, se establece un mapeo virtual utilizando los recursos de la placa y periféricos simples:
*   **Sensor Cámara (Camera)** $\rightarrow$ Simulado mediante **Llave On/Off** (Interruptor digital).
*   **Pulsador de Pedido de Ticket (Button)** $\rightarrow$ Simulado mediante **Pulsador Físico** (Push-button de la placa).
*   **Espira de Inducción de Asfalto (Sensor Coil)** $\rightarrow$ Simulado mediante **Llave On/Off** (Interruptor digital).
*   **Barrera de Acceso (Barrier)** $\rightarrow$ Simulado mediante un **LED indicador** (el LD2 embebido de la placa).

### Sincronización y Comunicación
Los módulos de Sensores, Sistema y Actuadores no tienen dependencias directas de variables globales ni llamadas cruzadas de funciones. Su interacción y sincronización se realiza exclusivamente mediante el intercambio de **Mensajes** que se depositan en interfaces estructuradas de comunicación (colaborando con la cohesión interna y el bajo acoplamiento).

### Restricción de No-Bloqueo
Todo el sistema corre bajo una **ejecución cíclica no bloqueante con un período estricto de 1 mS**. Queda prohibido el uso de la función `HAL_Delay()` o de lazos de espera activa en cualquiera de los módulos. Esto garantiza un "comportamiento comunitario" del microcontrolador, asegurando que todos los módulos tengan acceso equitativo a la CPU y que se cumpla el tiempo de ciclo sin pérdida de eventos.

---

## 3. Modelos de Comportamiento de los Módulos de Código C (Periodo = 1 mS)

En un diseño de tiempo real guiado por tiempo (**Time-Triggered Cyclic Executive** con período de $1\text{ mS}$), el comportamiento interno de cada módulo en C responde a un modelo matemático y de control de flujo específico:

[ SysTick 1mS ] │ ▼ ┌──────────────────┐       Mensaje (Evento)      ┌──────────────────┐ │  MÓDULO SENSOR   │────────────────────────────>│  MÓDULO SYSTEM   │ │  (Escrutar - C)  │                             │  (Procesar - C)  │ └──────────────────┘                             └──────────────────┘ ▲                                                │ │ Muestreo (1mS)                                 │ Comando (Mensaje) │                                                ▼ ┌──────────────────┐                             ┌──────────────────┐ │ Entrada Digital  │                             │ MÓDULO ACTUATOR  │ │ (Switches/Butt.) │                             │   (Actuar - C)   │ └──────────────────┘                             └──────────────────┘ │ ▼ ┌──────────────────┐ │ Salidas / LEDs   │ │  (Barrera/Disp.) │ └──────────────────┘

### A. Módulo SENSOR (Escrutar / Scrutinize)
*   **Modelo de Comportamiento**: **Máquina de Estados Finita (FSM) basada en Muestreo Temporal (Sampling)**.
*   **Descripción del Flujo en C**:\
    El planificador ejecuta la tarea de escrutinio cada 1 mS. En lugar de reaccionar por interrupciones externas (que podrían generar ruido o sobrecarga), se realiza una lectura activa de los estados de los pines de entrada. El módulo implementa una FSM independiente para cada sensor físico mapeado (Cámara, Pulsador, Espira):
    *   **Filtrado de Ruido (Debouncing)**: Un temporizador de software basado en ticks de ciclo valida la persistencia de la señal durante un número definido de milisegundos para filtrar rebotes mecánicos o transitorios eléctricos.
    *   **Detector de Flancos**: Al confirmarse un cambio estable en el nivel lógico de un sensor (p. ej., flanco de bajada al presionar el pulsador), la FSM transiciona de estado y genera un mensaje de evento.
    *   **Envío**: El evento se deposita en la interfaz del módulo *System* y la tarea retorna inmediatamente el control a la CPU.

### B. Módulo SYSTEM (Procesar / Process)
*   **Modelo de Comportamiento**: **Statechart (Máquina de Estados Jerárquica/Compleja) Conducida por Mensajes / Eventos**.
*   **Descripción del Flujo en C**:\
    Este módulo se encarga de implementar la máquina de estados principal que gobierna las reglas lógicas del control de acceso. El comportamiento se modela comúnmente con la herramienta **Itemis Create**:
    *   **Procesamiento de Mensajes**: Cada 1 mS, la función `system_update()` verifica si existe algún mensaje nuevo en la interfaz proveniente de los sensores.
    *   **Transiciones de Estado**: Si hay un mensaje, actúa como el estímulo o trigger que dispara la transición en el Statechart (por ejemplo, transicionar de `ESPERANDO_AUTO` a `ESPERANDO_TICKET` al recibir el mensaje `CAR_ARRIVES`).
    *   **Generación de Comandos**: En la entrada o salida de un estado, el Statechart genera comandos de acción (por ejemplo, `DISPLAY_WELCOME` u `OPEN_BARRIER`) que se escriben como mensajes salientes dirigidos al módulo de Actuadores. Posteriormente, retorna la ejecución de inmediato.

### C. Módulo ACTUATOR (Actuar / Act)
*   **Modelo de Comportamiento**: **Manejador de Mensajes (Message Dispatcher) y Temporizadores de Software no Bloqueantes**.
*   **Descripción del Flujo en C**:\
    El actuador ejecuta su rutina cada 1 mS para materializar las órdenes del sistema en el hardware físico o simulado:
    *   **Despacho (Dispatching)**: Lee la interfaz de comandos enviada por el módulo *System*. Si hay un comando (p. ej., `BARRIER_OPEN`), lo traduce en la acción correspondiente de hardware (escribir un '1' lógico en el pin del LED que simula la barrera).
    *   **Máquinas de Acción Temporizadas (Non-blocking timers)**: Ciertas acciones requieren duración en el tiempo (por ejemplo, mantener la barrera abierta durante 5 segundos o parpadear un LED de advertencia). El actuador no realiza retrasos bloqueantes en C. En su lugar, inicializa un temporizador de software interno (una variable que decrementa o incrementa cada 1 mS). Cuando el temporizador expira, la pequeña máquina de estados del actuador ejecuta la acción de cierre o apagado de forma completamente autónoma y transparente para el sistema principal.
