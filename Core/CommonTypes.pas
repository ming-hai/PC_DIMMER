unit CommonTypes;
{ CommonTypes Visualyzation by Alessandro Cappellozza
  version 0.8 05/2002
  http://digilander.iol.it/Kappe/audioobject
}

interface
 uses Windows, Dialogs, Forms, Controls, StdCtrls, Classes, ExtCtrls, SysUtils;

  Type TWaveData = array [ 0..2048] of DWORD;
  Type TFFTData  = array [0..512] of Single;

implementation

end.
