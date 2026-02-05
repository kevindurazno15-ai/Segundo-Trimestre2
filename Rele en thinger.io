#include <WiFi.h>
#include <ThingerESP32.h>
/* ========= THINGER.IO ========= */
#define USERNAME "TU_NOMBRE_DE_USUARIO"
#define DEVICE_ID "NOMBRE_DEL_DISPODITIVO"
#define DEVICE_CREDENTIAL "CREDENCIAL_DEL_DISPOSITIVO"
/* ========= WIFI ========= */
#define SSID "NOMBRE DE TU RED_Wi-fi"
#define SSID_PASSWORD "TU_CLAVE_WIFI" // Reemplaza por tu clave
/* ========= LED ========= */
#define RELE 2 // RELE interno del ESP32 (GPIO2)
ThingerESP32 thing(USERNAME, DEVICE_ID, DEVICE_CREDENTIAL);
void setup() {
 Serial.begin(115200);
 delay(1000);
 pinMode(RELE, OUTPUT);
 digitalWrite(RELE, LOW);
 thing.add_wifi(SSID, SSID_PASSWORD);
 // Recurso para control desde Thinger (Switch)
 thing["RELE"] << digitalPin(RELE);
 Serial.println("ESP32 iniciado. Revisa Thinger.io (ONLINE).");
}
void loop() {
 thing.handle();
}
