## 1.4.2013
## Quelle: http://de.wikipedia.org/wiki/Enigma_%28Maschine%29
##
## Tag UKW  Walzenlage  Ringstellung  ---- Steckerverbindungen ----
##  31  B   I   IV III    16 26 08    AD CN ET FL GI JV KZ PU QY WX
##  30  B   II  V  I      18 24 11    BN DZ EP FX GT HW IY OU QV RS
##  29  B   III I  IV     01 17 22    AH BL CX DI ER FK GU NP OQ TY

##  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z
## 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26

## Vorerst nur UKW, Walzenlage, Ringstellung implementiert
## Steckverbindungen vorerst nicht verwendet

function out = enigma(in, set)

  UKW.A = ["AE";"BJ";"CM";"DZ";"FL";"GY";"HX";"IV";"KW";"NR";"OQ";"PU";"ST"];
  UKW.B = ["AY";"BR";"CU";"DH";"EQ";"FS";"GL";"IP";"JX";"KN";"MO";"TZ";"VW"];
  UKW.C = ["AF";"BV";"CP";"DJ";"EI";"GO";"HY";"KR";"LZ";"MX";"NW";"QT";"SU"];

  tmp=strsplit(set,":");
  walzen=strsplit(tmp{1},"-");
  ukw=tmp{2};
  start=tmp{3};
  rings=str2num(tmp{4});

  persistent wheelpos=start;
  in = toupper(in);

  for l=1:length(in)
    
    c=in(l)
    #rl=right to left
    #lr=left to right
    rl1=substwheel(walzen{3},c)
    rl2=substwheel(walzen{2},c)
    rl3=substwheel(walzen{1},c)
    
    #o=Walze.(walzen{1})(Walze.(walzen{2})-'A'+1)-'A'+1)


  endfor

endfunction

function ret = charnum(in)
  ret = in - 'A' + 1;
endfunction

function ret = numchar(in)
  ret = in + 'A' - 1;
endfunction

function ret = substwheel(wheel,c)
  Walze.I  = "EKMFLGDQVZNTOWYHXUSPAIBRCJ";
  Walze.II = "AJDKSIRUXBLHWTMCQGZNPYFVOE";
  Walze.III= "BDFHJLCPRTXVZNYEIWGAKMUSQO";
  Walze.IV = "ESOVPZJAYQUIRHXLNFTGKDCMWB";
  Walze.V  = "VZBRGITYUPSDNHLXAWMJQOFECK";
  ret = Walze.(wheel)(charnum(c));
endfunction

function ret=Walzenvorschub(wp,rings)
## 1x3 wp mit der Stellung der 3 Walzen und
## 1x3 rings mit der jeweiligen Ringstellung


endfunction
