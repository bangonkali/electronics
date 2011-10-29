#include <math.h>
#include <string.h>
#include <iostream>
#include <stdlib.h>
#include "ic.h"

using namespace std;

int main(int argc, char *argv[])
{
    // defaults
    double result = 0.0;
    double f = 1200.0;
    double r1_const = 1000.0;

    int i_c = 1;

    short f_set = 0;

    if(argc > 1) {
        for (i_c = 1; i_c < argc; i_c++) {
            // printf("%s\n", argv[i_c]);

            if (strcmp(argv[i_c],"-r1") == 0){
                r1_const = atof(argv[i_c + 1]);
            } else if (strcmp(argv[i_c], "-f") == 0){
                f = atof(argv[i_c + 1]);
                f_set = 1;
            } else if (strcmp(argv[i_c], "-r1_vary") == 0){
                r1_const = 0;
            } else if (strcmp(argv[i_c], "-h") == 0){
                printHelp();
                return 0;
            }
        }
    } else {

        cout << "No arguments specified, use -h flag for help." << endl;
        return 0;
    }

    if (f_set == 0) {
        cout << "\tFrequency was not set. To set, use flag '-f [freq]'."  << endl << endl;

        return 0;
    }

    result = brute(f, r1_const);

    cout << "Desired Frequency: "  << f << endl;
    cout << "Percent Error: "  << getError(result, f) << endl;
    cout << "Calculation Completed." << endl;

    system("PAUSE");
    return EXIT_SUCCESS;
}

