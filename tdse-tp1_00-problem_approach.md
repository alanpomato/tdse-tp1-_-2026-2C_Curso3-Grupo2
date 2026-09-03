## 1. Descripción de la Solución de COMA Electronics (Intelligent Parking Management System)

El **Intelligent Parking Management System (Sistema Inteligente de Gestión de Estacionamiento)** de **COMA Electronics** representa una solución integral y automatizada para el control de ingresos, egresos y recaudación en playas de estacionamiento de alta densidad (como centros comerciales o aeropuertos) [3, 4].

### Estructura y Componentes del Sistema
De acuerdo con la arquitectura general de COMA Electronics, el ecosistema de hardware y software se compone de [4]:
*   **Parking System Server (Servidor del Sistema)**: El núcleo centralizado que procesa, almacena y sincroniza la base de datos de transacciones, estado de ocupación y tarifas en tiempo real [4].
*   **Entry Machine (Máquina de Entrada)**: Dispensadora automática de tickets encargada de registrar el ingreso de los vehículos [1, 4].
*   **Exit Machine (Máquina de Salida)**: Terminal lectora de tickets que valida el cobro y controla la barrera física de salida [4].
*   **Toll Computer / Automatic Pay Station (Estación de Pago Automático)**: Cajero autoservicio que permite el cobro descentralizado y autónomo [4].

### Flujo de Proceso Automatizado (Automated Parking System)
El sistema opera bajo un flujo de trabajo optimizado sin intervención de personal de asistencia física (*unmanned design*):
1.  **Ingreso**: Al arribar un vehículo, la máquina de entrada detecta la presencia física (mediante espira de inducción magnética) y la cámara captura/reconoce el vehículo. El usuario presiona el botón físico y la máquina imprime un ticket de código de barras único, registrando fecha y hora exacta. Al retirarse el ticket, se envía la señal de apertura a la barrera.
2.  **Validación y Pago**: Antes de regresar a su vehículo, el usuario escanea el ticket en la **Estación de Pago Automático (Auto Pay Station)**. La estación calcula automáticamente la tarifa en función de la duración de la estadía. Soporta múltiples modalidades de pago (efectivo, tarjetas, códigos QR). Una vez completada la transacción, el sistema otorga un tiempo de gracia de cortesía para abandonar el predio.
3.  **Salida**: El vehículo se dirige a la máquina de salida. Al escanear el ticket pago, la terminal de salida verifica la validez de la transacción dentro del tiempo de gracia. Si es correcto, envía el comando de apertura de la barrera y registra la salida en el servidor central.

---

## 2. Implementación de la "Parking Ticket Dispenser Machine (Entry)"

Como parte del desarrollo académico de la asignatura **Taller de Sistemas Embebidos (FIUBA)**, se implementa un **Producto Mínimo Viable (MVP)** funcional para simular y validar el comportamiento lógico de la terminal de acceso (Entry Machine) de COMA Electronics [5, 6].

Esta implementación se diseña sobre la plataforma de desarrollo **NUCLEO-F103RB** utilizando un enfoque estructurado y portable bajo los siguientes pilares de diseño de software embebido [1, 7, 8]:

### Arquitectura de Software Modular (Escrutar, Procesar, Actuar)
Para asegurar la portabilidad, el aislamiento de hardware y el reuso de código, el firmware se divide estrictamente en tres módulos desacoplados que se ejecutan cooperativamente en un ejecutivo cíclico de 1 mS [1, 2, 9]:
1.  **Sensores (Escrutar)**: Se encarga de muestrear periódicamente las entradas digitales físicas y de procesar las señales de entrada [1, 2].
2.  **Sistema (Procesar)**: Contiene las reglas del negocio y la lógica de estado del dispensador [1].
3.  **Actuadores (Actuar)**: Recibe directivas de control y comanda las salidas físicas [1].

### Simulación y Mapeo de Hardware
Dado que se trabaja sobre la placa de evaluación NUCLEO-F103RB sin el hardware industrial de estacionamiento real, se establece un mapeo virtual utilizando entradas y salidas digitales simples para simular los elementos de campo [1, 2]:
*   **Sensores Reales (Digital Inputs)**: Reemplazados por **pulsadores** e **interruptores DIP Switch** [1]:
    *   **Cámara (Camera)** $\rightarrow$ Simulado mediante **Interruptor DIP Switch / Pulsador** [1].
    *   **Pulsador de Pedido de Ticket (Button)** $\rightarrow$ Simulado mediante **Pulsador Físico** [1].
    *   **Espira de Inducción de Asfalto (Sensor Coil)** $\rightarrow$ Simulado mediante **Interruptor DIP Switch / Pulsador** [1].
*   **Actuadores Reales (Digital Outputs)**: Reemplazados por **LEDs** indicadores de la placa de desarrollo o periféricos asociados [2]:
    *   **Pantalla (Display)** $\rightarrow$ Simulado mediante **LED** [2].
    *   **Impresora (Printer)** $\rightarrow$ Simulado mediante **LED** [2].
    *   **Barrera de Acceso (Barrier)** $\rightarrow$ Simulado mediante **LED** (p. ej., LD2 embebido) [2, 9].
    *   **Servidor (Server)** $\rightarrow$ Simulado mediante **LED** [2].

### Sincronización y Comunicación
Los módulos de Sensores, Sistema y Actuadores no tienen dependencias directas de variables globales ni llamadas cruzadas de funciones. Su interacción y sincronización se realiza exclusivamente mediante el intercambio de **Mensajes** que se depositan en interfaces estructuradas de comunicación (colaborando con la cohesión interna y el bajo acoplamiento) [2].

### Restricción de No-Bloqueo
Todo el sistema corre bajo una **ejecución cíclica no bloqueante con un período estricto de 1 mS** [9]. Queda prohibido el uso de la función `HAL_Delay()` o de lazos de espera activa en cualquiera de los módulos. Esto garantiza un "comportamiento comunitario" del microcontrolador, asegurando que todos los módulos tengan acceso equitativo a la CPU y que se cumpla el tiempo de ciclo sin pérdida de eventos [9].

---

## 3. Modelos de Comportamiento de los Módulos de Código C (Periodo = 1 mS)

En un diseño de tiempo real guiado por tiempo (**Time-Triggered Cyclic Executive** con período de $1\text{ mS}$), el comportamiento interno de cada módulo en C responde a un modelo matemático y de control de flujo específico [10]:

[ SysTick 1mS ] │ ▼ ┌──────────────────┐       Mensaje (Evento)      ┌──────────────────┐ │  MÓDULO SENSOR   │────────────────────────────>│  MÓDULO SYSTEM   │ │  (Escrutar - C)  │                             │  (Procesar - C)  │ └──────────────────┘                             └──────────────────┘ ▲                                                │ │ Muestreo (1mS)                                 │ Comando (Mensaje) │                                                ▼ ┌──────────────────┐                             ┌──────────────────┐ │ Entrada Digital  │                             │ MÓDULO ACTUATOR  │ │ (DIP-Sw./Butt.)  │                             │   (Actuar - C)   │ └──────────────────┘                             └──────────────────┘ │ ▼ ┌──────────────────┐ │ Salidas / LEDs   │ │ (Disp/Print/Bar/ │ │     Server)      │ └──────────────────┘

### A. Módulo SENSOR (Escrutar / Scrutinize)
*   **Modelo de Comportamiento**: **Máquina de Estados Finita (FSM) basada en Muestreo Temporal (Sampling)**.
*   **Descripción del Flujo en C**:\
    El planificador ejecuta la tarea de escrutinio cada 1 mS. En lugar de reaccionar por interrupciones externas (que podrían generar ruido o sobrecarga), se realiza una lectura activa de los estados de los pines de entrada [2]. El módulo implementa una FSM independiente para cada sensor físico mapeado (Cámara, Pulsador de Ticket, Espira de Inducción) [1, 2]:
    *   **Filtrado de Ruido (Debouncing)**: Un temporizador de software basado en ticks de ciclo valida la persistencia de la señal durante un número definido de milisegundos para filtrar rebotes mecánicos o transitorios eléctricos de los pulsadores e interruptores DIP Switch.
    *   **Detector de Flancos**: Al confirmarse un cambio estable en el nivel lógico de un sensor (p. ej., flanco de bajada al presionar el pulsador de ticket), la FSM transiciona de estado y genera un mensaje de evento.
    *   **Envío**: El evento se deposita en la interfaz del módulo *System* y la tarea retorna inmediatamente el control a la CPU [2].

### B. Módulo SYSTEM (Procesar / Process)
*   **Modelo de Comportamiento**: **Statechart (Máquina de Estados Jerárquica/Compleja) Conducida por Mensajes / Eventos**.
*   **Descripción del Flujo en C**:\
    Este módulo se encarga de implementar la máquina de estados principal que gobierna las reglas lógicas del control de acceso [1, 2]. El comportamiento se modela comúnmente con la herramienta **Itemis Create** [11, 12]:
    *   **Procesamiento de Mensajes**: Cada 1 mS, la función `system_update()` verifica si existe algún mensaje nuevo en la interfaz proveniente de los sensores.
    *   **Transiciones de Estado**: Si hay un mensaje, actúa como el estímulo o trigger que dispara la transición en el Statechart (por ejemplo, transicionar de `ESPERANDO_AUTO` a `ESPERANDO_TICKET` al recibir el mensaje `CAR_ARRIVES`).
    *   **Generación de Comandos**: En la entrada o salida de un estado, el Statechart genera comandos de acción (por ejemplo, `DISPLAY_WELCOME` u `OPEN_BARRIER`) que se escriben como mensajes salientes dirigidos al módulo de Actuadores. Posteriormente, retorna la ejecución de inmediato.

### C. Módulo ACTUATOR (Actuar / Act)
*   **Modelo de Comportamiento**: **Manejador de Mensajes (Message Dispatcher) y Temporizadores de Software no Bloqueantes**.
*   **Descripción del Flujo en C**:\
    El actuador ejecuta su rutina cada 1 mS para materializar las órdenes del sistema en el hardware físico o simulado [9]:
    *   **Despacho (Dispatching)**: Lee la interfaz de comandos enviada por el módulo *System*. Si hay un comando (p. ej., `BARRIER_OPEN`, `PRINT_TICKET`, `UPDATE_DISPLAY`, `SEND_SERVER`), lo traduce en la acción correspondiente de hardware (encender/apagar el LED asignado a dicho actuador) [2, 9].
    *   **Máquinas de Acción Temporizadas (Non-blocking timers)**: Ciertas acciones requieren duración en el tiempo (por ejemplo, mantener la barrera abierta durante 5 segundos o realizar destellos en los LEDs). El actuador no realiza retrasos bloqueantes en C. En su lugar, inicializa un temporizador de software interno (una variable que decrementa o incrementa cada 1 mS). Cuando el temporizador expira, la pequeña máquina de estados del actuador ejecuta la acción de cierre o apagado de forma completamente autónoma y transparente para el sistema principal.
