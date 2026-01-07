#include "static_calculatrice.h"
#include <stdio.h>

float staticDivision(float a, float b){
  if(b == 0.0){
    puts("Opération invalide ! Division par zéro impossible");
    return 0.0;

  }
  return a / b;

}
