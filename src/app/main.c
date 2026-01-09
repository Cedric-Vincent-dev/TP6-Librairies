#include<stdio.h>
#include "static_calculatrice.h"
#include "dynamic_calculatrice.h"



int main(){

  float nombre1, nombre2;
  int choixUtilisateur;


  //Message de bienvenue à l'utilisateur
  puts("=== CALCULATRICE CENTER ===");
  puts("Entrez le premier nombre:");
  scanf("%f",&nombre1);

  puts("Entrez le second nombre:");
  scanf("%f",&nombre2);

  puts("Choississez l'opération:");
  puts("1. Addition");
  puts("2. Soustraction");
  puts("3. Multiplication");
  puts("4. Division");
  scanf("%i",&choixUtilisateur);

  switch(choixUtilisateur){
  case 1:
    printf("Static: %.2f + %.2f = %.2f\n", nombre1, nombre2, staticAddition(nombre1, nombre2));
    printf("Dynamic: %.2f + %.2f = %.2f\n", nombre1, nombre2, dynamicAddition(nombre1, nombre2));
    break;

  case 2:
    printf("Static: %.2f - %.2f = %.2f\n", nombre1, nombre2, staticSubtraction(nombre1, nombre2));
    printf("Dynamic: %.2f - %.2f = %.2f\n", nombre1, nombre2, dynamicSubtraction(nombre1, nombre2));
    break;

  case 3:
    printf("Static: %.2f x %.2f = %.2f\n", nombre1, nombre2, staticMultiplication(nombre1, nombre2));
    printf("Dynamic: %.2f x %.2f = %.2f\n", nombre1, nombre2, dynamicMultiplication(nombre1, nombre2));
    break;

  case 4:
    printf("Static: %.2f / %.2f = %.2f\n", nombre1, nombre2, staticDivision(nombre1, nombre2));
    printf("Dynamic: %.2f / %.2f = %.2f\n", nombre1, nombre2, dynamicDivision(nombre1, nombre2));
    break;

  default:
    puts("Choix invalide !");

  }

  return 0;

}
