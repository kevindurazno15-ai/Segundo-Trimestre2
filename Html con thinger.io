<style>
  .radar {
    width: 260px;
    height: 260px;
    border-radius: 50%;
    background: #0a0a0a;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: Arial, sans-serif;
    box-shadow: 0 0 30px rgba(0,255,170,0.4);
    overflow: hidden;
  }

  .rueda {
    position: absolute;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: conic-gradient(#00ffaa, #003d33, #00ffaa);
    animation: girar 4s linear infinite;
    opacity: 0.8;
  }

  @keyframes girar {
    to { transform: rotate(360deg); }
  }

  .centro {
    position: relative;
    width: 60%;
    height: 60%;
    border-radius: 50%;
    background: #000;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #fff;
    box-shadow: inset 0 0 15px rgba(0,255,170,0.5);
  }

  .etiqueta {
    font-size: 0.65em;
    color: #7bed9f;
    letter-spacing: 1px;
  }

  .valor {
    font-size: 2.5em;
    font-weight: bold;
    color: #00ffaa;
  }

  .unidad {
    font-size: 0.4em;
    color: #b2bec3;
  }
</style>

<div class="radar">
  <div class="rueda"></div>

  <div class="centro">
    <div class="etiqueta">DISTANCIA</div>
    <div class="valor" id="contador">0.00</div>
    <div class="unidad">cm</div>
  </div>
</div>

<script>
  let actual = 0;

  function animarValor(nuevo) {
    const contador = document.getElementById("contador");
    const duracion = 600;
    const pasos = 30;
    const incremento = (nuevo - actual) / pasos;
    let i = 0;

    const intervalo = setInterval(() => {
      actual += incremento;
      contador.textContent = actual.toFixed(2);
      i++;
      if (i >= pasos) {
        actual = nuevo;
        contador.textContent = nuevo.toFixed(2);
        clearInterval(intervalo);
      }
    }, duracion / pasos);
  }

  // 🔹 SIMULA EL VALOR DEL SENSOR
  // En Node-RED, aquí reemplazas el número por {{value}}
  setInterval(() => {
    const valorSensor = {{value | number:2}};
    animarValor(valorSensor);
  }, 800);
</script>
