## Enigma Funktionen testen

in="EHallo";

settings="I-II-III:B:MCK:17 05 22"

#enigma(in, settings);

function ret=Walzenvorschub(wp,rings)
  ## 1x3 wp mit der Stellung der 3 Walzen und
  ## 1x3 rings mit der jeweiligen Ringstellung

  wp(3)+=1;
  for n=3:-1:1
    if wp(n)==rings(n)+1 && n>1
      wp(n-1)+=1;
    endif  
    if wp(n)==27
      wp(n)==1;
    endif
  endfor
  ret = wp;
endfunction

in=[1 1 4]
in=Walzenvorschub(in,[5 5 5])
in=Walzenvorschub(in,[5 5 5])
in=Walzenvorschub(in,[5 5 5])
