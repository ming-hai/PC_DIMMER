/*
	Dieses Plugin soll ein Grundger�st f�r eigene Plugins f�r das PC_DIMMER2010 Pluginsystem dienen. Aus diesem
	Grund besitzt dieses Plugin keine nennenswerten Funktionen au�er der Verbindung zwischen PC_DIMMER und Plugin.

	Bitte wenden sie sich an christian.noeding@arcor.de oder an http://www.pcdimmer.de, falls ihr Plugin ver�ffentlicht
	werden soll.

	Vielen Dank,
	Christian N�ding
*/

#include "stdafx.h"
#include "mmsystem.h"
#include "math.h"
#include <oaidl.h>

// CallBacks Definitionen
typedef void (__stdcall cbSetDLLValues) (int address, int startvalue, int endvalue, int fadetime, int delay) ;
typedef void (__stdcall cbSetDLLValueEvent) (int address, int endvalue) ;
typedef void (__stdcall cbSetDLLNames) (int address, char *channelname) ;
typedef void (__stdcall cbGetDLLValue) (int address) ;
typedef void (__stdcall cbSendMessage) (char MSG, VARIANT Data1, VARIANT Data2) ;

//Funktionen in der DLL nach au�en hin sichtbar machen
extern "C" __declspec(dllexport)void DLLCreate(cbSetDLLValues * CallbackSetDLLValues, cbSetDLLValueEvent * CallbackSetDLLValueEvent,
                           cbSetDLLNames * CallbackSetDLLNames, cbGetDLLValue * CallbackGetDLLValue,
						   cbSendMessage * CallbackSendMessage);
extern "C" __declspec(dllexport)void DLLStart();
extern "C" __declspec(dllexport)bool DLLDestroy();
extern "C" __declspec(dllexport)char * DLLIdentify();
extern "C" __declspec(dllexport)char * DLLGetName();
extern "C" __declspec(dllexport)char * DLLGetVersion();
extern "C" __declspec(dllexport)void DLLConfigure();
extern "C" __declspec(dllexport)void DLLAbout();
extern "C" __declspec(dllexport)void DLLSendData(int address, int startvalue, int endvalue, int fadetime, char *name);
extern "C" __declspec(dllexport)bool DLLIsSending();
extern "C" __declspec(dllexport)void DLLSendMessage(char MSG, VARIANT Data1, VARIANT Data2);

// Globale Pointers to Functions
cbSetDLLValues * pSetDLLValues  = NULL ;
cbSetDLLValueEvent * pSetDLLValueEvent  = NULL ;
cbSetDLLNames * pSetDLLNames = NULL ;
cbGetDLLValue * pGetDLLValue = NULL ;
cbSendMessage * pSendMessage = NULL ;

#define MaxChan 512

int channelvalue[MaxChan];
bool IsSending;

BOOL APIENTRY DllMain( HANDLE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
  return true ;
}

// === Die folgenden 5 Funktionen koennen vom Plugin aufgerufen werden (s.o.)
//
// procedure CallbackSetDLLValues(address,startvalue,endvalue,fadetime:integer);
//   Funktion wird aufgerufen, wenn Plugins einen neuen Kanalwert an das
//   Hauptprogramm senden sollen.
//
// procedure CallbackSetDLLValueEvent(address,endvalue:integer);
//   Funktion wird aufgerufen, wenn Plugins statt eines neuen Kanalwertes
//   Ereignisse �ber die Data-In-Funktion ausf�hren sollen.
//
// procedure CallbackSetDLLNames(address:integer; channelname:PChar);
//   Funktion wird aufgerufen, wenn Plugins einen neuen Kanalnamen an das
//   Hauptprogramm senden sollen.
//
// CallbackGetValue(address:integer);
//   Funktion wird aufgerufen, wenn Plugins einen Kanalwert anfordern.
//   Die Funktion ruft (im Hauptprogramm) dann wiederum DLLSendData()
//   bzw. DLLSendMessage:MSG_ACTUALCHANNELVALUE auf
//
// CallbackSendMessage(MSG:Byte; Data1,Data2: Variant);
//   Funktion kann ausgef�hrt werden, um Nachrichten an das Hauptprogramm
//   zu liefern. Eine Liste aller m�glicher Nachrichten gibt es hier: http://www.pcdimmer.de/wiki/index.php/Nachrichtensystem

void DLLCreate(cbSetDLLValues * CallbackSetDLLValues, cbSetDLLValueEvent * CallbackSetDLLValueEvent,
                           cbSetDLLNames * CallbackSetDLLNames, cbGetDLLValue * CallbackGetDLLValue,
						   cbSendMessage * CallbackSendMessage)
{
  // Funktionsaufruf bei Pluginaktivierung

  // Zuweisen der einzelnen Pointer f�r die Callbacks
  pSetDLLValues		= CallbackSetDLLValues ;
  pSetDLLValueEvent = CallbackSetDLLValueEvent ;
  pSetDLLNames		= CallbackSetDLLNames ;
  pGetDLLValue		= CallbackGetDLLValue ;
  pSendMessage		= CallbackSendMessage ;

  IsSending=false;

  return ;
}

void DLLStart()
{
  // Funktionsaufruf direkt nach DLLCreate
  return ;
}

bool DLLDestroy()
{
  // Funktionsaufruf bei Plugindeaktivierung
  return ;
}

char * DLLIdentify()
{
  // Funktionsaufruf bei Identifizierung ob Programmplugin oder Ausgabeplugin
  return ("Output") ; // Output oder Input
}

char * DLLGetName()
{
  // Dieser Name wird in der Pluginliste angezeigt
  return ("PC_DIMMER Output-Plugindemo f�r C") ;
}

char * DLLGetVersion()
{
  // Derzeit nur zu Anzeigezwecken verwendet
  return ("V0.1") ;
}

void DLLConfigure()
{
  // Funktionsaufruf bei Klick auf "Konfigurieren"
  MessageBox(NULL, "This is DLLConfigure", "PC_DIMMER-Plugin", MB_OK | MB_ICONEXCLAMATION) ;
  return ;
}

void DLLAbout()
{
  // Funktionsaufruf bei Klick auf "Info"
  MessageBox(NULL, "This is DLLAbout", "PC_DIMMER-Plugin", MB_OK | MB_ICONEXCLAMATION);
  return ;
}

// fadetime in milliseconds !
void DLLSendData(int address, int startvalue, int endvalue, int fadetime, char *name)
{
// Diese Funktion wird bei jeder manuellen Kanal�nderung, bzw. bei jedem Start eines automatischen Dimmvorganges ausgef�hrt
// Hat man eine Hardware, die keine Fadezeiten unterst�tzt und den internen PC_DIMMER2008-Dimmerkernel ben�tigt, nutzt man
// besser die Funktion DLLSendMessage weiter unten, um immer die aktuellen Kanalwerte zu erhalten
  return ;
}

bool DLLIsSending()
{
  // Funktionsaufruf um bei Interfaces mit DMX-In keine Feedbackschleife zu erzeugen. Sendet das Plugin einen Wert an
  // den PC_DIMMER, muss entsprechend die Variable "IsSending" gesetzt werden.
  return IsSending;
}

void DLLSendMessage(char MSG, VARIANT Data1, VARIANT Data2)
{
//   Funktion wird aufgerufen, wenn im PC_DIMMER Nachrichten erzeugt
//   werden. Dies tritt bei Beat-Impulsen, Speicher-/�ffnen-Anforderungen
//   oder Kanalwert�nderungen des Dimmerkernels auf. F�r DMX Ger�te sollte
//   auf die Nachricht MSG=MSG_ACUTALCHANNELVALUE=14 reagiert und
//   auf Data1=Kanal und Data2=Kanalwert ausgewertet werden.

if (MSG==14) // MSG_ACTUALCHANNELVALUE=14
  {
    // Hier etwas mit den neuen Kanalwerten machen
    channelvalue[Data1.intVal] = Data2.intVal ;
  }
}

