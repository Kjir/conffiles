#include <stdio.h>
#include <stdlib.h>

/**
 * Per compilare questo programma: gcc -o esempi esempi_memoria.c
 * Per farlo girare: ./esempi
 * Su windows potrebbe non funzionare, nel caso sostituisci la riga 18 con printf("\n");
 *
 * Inizia a leggere questo file a partire dal main. Il resto leggilo man mano che vengono usate le funzioni.
 * Il main si trova a riga 103
 */

void wait_ln() {
    char line[256];

    printf("\nPress ENTER\n");
    fgets(line, 256, stdin);
    printf("\033[2J\033[0;0H"); // Questa è magia che funziona solo su Linux, non ci far caso...
    // Se proprio vuoi sapere "\033[2J" è un comando magico per ripulire il terminale
    // Mentre "\033[0;0H" è il comando per posizionare il cursore in alto a sinistra.
    // Non funziona ovunque, perciò non ci fare affidamento: fai finta di non saperlo!!
}

int increment_int(int v) {
    printf("Indirizzo di v: %p\n", &v);
    v++;
    return v;
}

int increment_intp(int *p) {
    printf("Indirizzo di p: %p\n", &p);
    printf("Indirizzo IN p: %p\n", p); // Qui non metto & davanti!!!
    *p += 1; // Assegno 1 all'area di memoria a cui punta p
    return *p; // Ritorno il valore
}

/**
 * In questa funzione allochiamo della memoria per un array di 2 elementi
 * e impostiamo dei valori in questi array. Qualcosa però non funziona...
 */
int *alloca_e_assegna_array_nf(int *p) {
    printf("Indirizzo in p: %p\n", p);
    p = (int *)malloc(sizeof(int) * 2);
    printf("Indirizzo in p dopo malloc: %p\n", p);
    p[0] = 34;
    p[1] = 67;
    return p;
}

/**
 * In questa funzione allochiamo della memoria per un array di 2 elementi
 * e impostiamo dei valori in questi array. Questa volta funziona!!!
 */
int *alloca_e_assegna_array(int **pp) {
    printf("Indirizzo in *pp: %p\n", *pp);
    printf("Indirizzo in pp: %p\n", pp);
    *pp = (int *)malloc(sizeof(int) * 2);
    printf("Indirizzo in *pp dopo malloc: %p\n", *pp);
    printf("Indirizzo in pp dopo malloc: %p\n", pp);
    (*pp)[0] = 34;
    *(*pp+1) = 67;
    return *pp;
}

void print_couples(int **a, int n) {
    int k;
    printf("Valori delle coppie:\n");
    for(k = 0; k < n; k++) {
        if(k != 0)
            printf(", ");
        printf("(%d, %d)", a[k][0], a[k][1]);
    }
    printf("\n");
}

// Qui usiamo int ***. Di solito è indice di un design non ottimale...
void n_coppie(int ***array, int n) {
    int j, k = 0;
    *array = (int **)malloc(sizeof(int *) * n);
    for(j = 0; j < n; j++) {
        (*array)[j] = (int *)malloc(sizeof(int) * 2);
        (*array)[j][0] = increment_intp(&k);
        (*array)[j][1] = increment_intp(&k);
    }
    print_couples(*array, n);
}

int **n_coppie_2(int n) {
    int j, k = 0;
    int **array;
    array = (int **)malloc(sizeof(int *) * n);
    for(j = 0; j < n; j++) {
        array[j] = (int *)malloc(sizeof(int) * 2);
        array[j][0] = increment_intp(&k);
        array[j][1] = increment_intp(&k);
    }
    print_couples(array, n);
    return array;
}

void n_coppie_alternativo(int n);

int main() {
    int i, j, k = 0;
    int *array = NULL;
    int *altro = NULL;
    int **double_array = NULL;

    // ESEMPIO 1
    printf("ESEMPIO 1\n");
    i = 1;
    printf("Indirizzo di i: %p\n", &i);
    j = increment_int(i);
    printf("i == %d, j == %d\n", i, j);

    wait_ln();

    // ESEMPIO 2
    printf("ESEMPIO 2\n");
    printf("Indirizzo di i: %p\n", &i);
    j = increment_intp(&i); // L'indirizzo IN p è uguale all'indirizzo di i
    printf("i == %d, j == %d\n", i, j);

    wait_ln();

    // ESEMPIO 3
    printf("ESEMPIO 3\n");
    /**
     * Alloca la memoria per contenere un intero
     */
    array = (int *)malloc(sizeof(int));
    *array = 5;
    printf("Valore in array: %d\n", *array); // Valore salvato nell'area di memoria a cui punta array
    printf("Indirizzo IN array: %p\n", array); // Niente &
    printf("Indirizzo di array: %p\n", &array); // Con la & per avere l'indirizzo della variabile array
    j = increment_intp(array); // NOTA: L'indirizzo DI p non cambia da prima!! L'indirizzo IN p, invece, sì
    printf("*array == %d, j == %d\n", *array, j);
    j = increment_int(*array); // NOTA: L'indirizzo di v non cambia da prima!!
    printf("*array == %d, j == %d\n", *array, j);
    free(array); // Libero la memoria
    array = NULL; // Da fare sempre subito dopo la free

    wait_ln();

    // ESEMPIO 4
    printf("ESEMPIO 4\n");
    /**
     * Ora allochiamo la memoria per 5 interi. Facciamo un vero array.
     */
    /**
     * La chiamata calloc equivale a:
     *  array = (int *)malloc(sizeof(int) * 5);
     *  for(k = 0; k < 5; k++)
     *      array[k] = 0;
     */
    array = (int *)calloc(5, sizeof(int) * 5);
    *array = 5;
    printf("Valori in array: %d, %d, %d, %d, %d\n", array[0], array[1], array[2], array[3], array[4]);
    printf("Indirizzo primo elemento: %p, %p\n", &array[0], array);
    printf("Indirizzo secondo elemento: %p, %p\n", &array[1], array+1);
    printf("Indirizzo terzo elemento: %p, %p\n", &array[2], array+2);

    // Questi bisogna pensarci un po' su per capire che giro fanno!
    array[0] = increment_intp(array);
    array[1] = increment_int(array[0]);
    array[2] = increment_intp(array); // Qui cambiamo il valore sia in array[0] che in array[2]!!
    *(array+3) = increment_int(array[1]); // Anche qui si cambia sia array[3] che array[1]
    array[4] = increment_intp(array+1); // E anche qui si cambia sia array[4] che array[1]

    printf("Valori in array: %d, %d, %d, %d, %d\n", array[0], array[1], array[2], array[3], array[4]);
    printf("Valori in array: %d, %d, %d, %d, %d\n", *array, *(array + 1), *(array+2), *(array+3), *(array+4));
    printf("%d == %d\n", array[2], *(array + 2));
    free(array);
    array = NULL;

    wait_ln();

    // ESEMPIO 5
    printf("ESEMPIO 5\n");
    /**
     * Ora vediamo cosa succede se passo il puntatore ad una funzione che cerca di allocare memoria
     */
    printf("Indirizzo in array: %p\n", array);
    altro = alloca_e_assegna_array_nf(array);
    printf("Indirizzo in array: %p\n", array);
    printf("Indirizzo in altro: %p\n", altro);
    printf("Valori in altro: %d, %d\n", altro[0], altro[1]);
    free(altro);
    altro = NULL;

    wait_ln();

    // ESEMPIO 6
    printf("ESEMPIO 6\n");
    // Facciamolo funzionare questa volta...
    printf("Indirizzo in array: %p\n", array);
    printf("Indirizzo DI array: %p\n", &array); // Questo lo ritroverai nella funzione
    altro = alloca_e_assegna_array(&array); // Nota l'uso di &
    printf("Indirizzo in array: %p\n", array);
    printf("Indirizzo in altro: %p\n", altro);
    printf("Valori in array: %d, %d\n", array[0], array[1]);
    printf("Valori in altro: %d, %d\n", altro[0], altro[1]);
    free(altro);
    altro = NULL;
    array = NULL; // Niente free!! L'area di memoria è la stessa di altro, quindi è già stata liberata.


    wait_ln();

    // ESEMPIO 7
    printf("ESEMPIO 7\n");
    /**
     * Facciamo un array bidimensionale. Per ora in modo "semplice"...
     */
    printf("Inserisci il numero di coppie: ");
    scanf("%d", &i);
    printf("\n");
    /**
     * Alloco "i" puntatori a int *, così posso creare "i" array di dimensione 2 in cui salvare le coppie
     */
    double_array = (int **)malloc(sizeof(int *) * i); // Alloco lo spazio per "i" puntatori a int *
    for(k = 0; k < i; k++) {
        double_array[k] = (int *)calloc(2, sizeof(int) * 2); // Alloco lo spazio per 2 int, "i" volte
    }
    printf("Allocato %d puntatori a int *. Indirizzo di double_array: %p\n", i, double_array);
    // Inizializzo le coppie
    j = 0;
    // Questo è lo stesso ciclo di sopra: potrei fare tutto in una volta!
    for(k = 0; k < i; k++) {
        double_array[k][0] = increment_intp(&j);
        double_array[k][1] = increment_intp(&j);
        j += k;
    }
    printf("Valori delle coppie:\n");
    for(k = 0; k < i; k++) {
        if(k != 0)
            printf(", ");
        printf("(%d, %d)", double_array[k][0], double_array[k][1]);
    }
    printf("\n");
    // Liberiamo la memoria. TUTTA!!
    for(k = 0; k < i; k++)
        free(double_array[k]);
    free(double_array);
    double_array = NULL;


    wait_ln();

    // ESEMPIO 8
    printf("ESEMPIO 8\n");
    /**
     * Ora vediamo come funziona il tutto con varie funzioni. Ti sottopongo varie soluzioni,
     * così puoi vedere diversi approcci.
     */
    n_coppie(&double_array, i);
    for(k = 0; k < i; k++)
        free(double_array[k]);
    free(double_array);
    double_array = NULL;

    wait_ln();

    // ESEMPIO 9
    printf("ESEMPIO 9\n");
    double_array = n_coppie_2(i);
    for(k = 0; k < i; k++)
        free(double_array[k]);
    free(double_array);
    double_array = NULL;

    wait_ln();

    // ESEMPIO 10
    printf("ESEMPIO 10\n");
    n_coppie_alternativo(i);
}

/**
 * Questa non te la spiego: hai tutti gli strumenti per capire, perciò te lo lascio come esercizio.
 * Buona fortuna!!!
 */
typedef struct {
    int x;
    int y;
} coppia;

void print_couples_alternativo(coppia *a, int n) {
    int k;
    printf("Valori delle coppie:\n");
    for(k = 0; k < n; k++) {
        if(k != 0)
            printf(", ");
        printf("(%d, %d)", a[k].x, a[k].y);
    }
    printf("\n");
}

void n_coppie_alternativo(int n) {
    int j, k = 0;
    coppia *array;
    array = (coppia *)malloc(sizeof(coppia) * n);
    for(j = 0; j < n; j++) {
        array[j].x = increment_intp(&k);
        array[j].y = increment_intp(&k);
    }
    print_couples_alternativo(array, n);
    free(array);
    array = NULL;
}
