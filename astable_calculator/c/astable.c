/* log10 example */
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>


#define LN2 0.6931471805599453

double brute(double f, double r1_const);
double getFrequency(double r1, double r2, double c);
double getPeriod(double frequency);
double getDutyCycle(double high, double period);
double getHigh(double r1, double r2, double c);
double getLow(double r1, double r2, double c);
double getError(double actual, double estimate);
void cprintDetails(double r1, double r2, double c);
void printHelp(void);

int main (int argc, char *argv[]) {
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
        printf("No arguments specified, use -h flag for help.\n");
        return 0;
    }

    if (f_set == 0) {
        printf("\tFrequency was not set. To set, use flag '-f [freq]'./n/n");
        return 0;
    }

    result = brute(f, r1_const);
    printf("Desired Frequency: %G\n", f);
    printf("Percent Error: %G Percent\n", getError(result, f));
    printf("Calculation Completed.\n", getError(result, f));

    return 0;
}

void printHelp(void) {
    printf("Options:\n");
    printf("   -f [desired_frequency] : defaults to 1200 if not specified.\n");
    printf("   -r1 [r1_const]         : defaults to 1K Ohm if not specified.\n");
    printf("   -r1_vary               : r1 will not be locked to any const value\n");
    printf("                          : (more accurate) but this will deviate the\n");
    printf("                          : duty cycle away from 50%.\n");
    printf("\n");
}

double brute(double f, double r1_const) {
    double e12_arr[13] = {1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2, 10};

    double r1 = 0;
    double r2 = 0;
    double c0 = 0;

    double r1_curr = 1;
    double r2_curr = 1;
    double c0_curr = 0;
    double f_curr = 0;
    double f_save = 0;
    double err = 0;
    double err_save = 0;

    long iCount = 0;

    short init = 1;
    short iPass = 0;

    int cK, cI, r2k, r2I, r1k, r1I;

    for (r1k = 3; r1k <= 15; r1k++) {
        for (r1I=0; r1I<13; r1I++){

            if (r1_const != 0) {
                r1_curr = r1_const;
            } else {
                r1_curr = e12_arr[r1I]*pow(10.0,r1k);
            }

            for (cK = 0; cK >= -17; cK--){
                for (cI=0; cI<13; cI++){

                    c0_curr = e12_arr[cI] * pow(10.0, cK);

                    for (r2k = 3; r2k <= 15; r2k++) {
                        for (r2I=0; r2I<13; r2I++){

                            r2_curr = e12_arr[r2I]*pow(10.0,r2k);
                            f_curr = getFrequency(r1_curr, r2_curr, c0_curr);
                            err = getError(f, f_curr);

                            if (init == 1) {
                                init = 0;
                            } else {
                                if ((err_save > err || iPass == 0) && (r2_curr < r1_curr * 0.5)) {
                                    r1 = r1_curr;
                                    r2 = r2_curr;
                                    c0 = c0_curr;

                                    iCount++;

                                    f_save = f_curr;
                                    err_save = err;

                                    if (iPass == 0) {
                                        iPass = 1;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // If r1 is not varying, the break loop.
            if (r1_const != 0) {
                break;
            }
        }

        // If r1 is not varying, the break loop.
        if (r1_const != 0) {
            break;
        }

    }

    cprintDetails(r1, r2, c0);

    return f_save;
}

void cprintDetails(double r1, double r2, double c) {
    double f = getFrequency(r1, r2, c);
    double high = getHigh(r1, r2, c);
    double low = getLow(r1, r2, c);
    double period = getPeriod(f);
    double duty = getDutyCycle(high, period);

    printf("R1 is: %G\n", r1);
    printf("R2 is: %G\n", r2);
    printf("C is: %G\n", c);
    printf("High is: %G\n", high);
    printf("Low is: %G\n", low);
    printf("Period is: %G\n", period);
    printf("Duty Cycle is: %G\n", duty);
    printf("Frequency is: %G\n", f);
}

double getFrequency(double r1, double r2, double c) {
    return (1 / (LN2*c*(r1+(2*r2))));
}

double getPeriod(double frequency) {
   return (1 / frequency);
}

double getDutyCycle(double high, double period) {
   return (high / period);
}

double getHigh(double r1, double r2, double c) {
   return LN2*c*(r1+r2);
}

double getLow(double r1, double r2, double c) {
   return LN2*r2*c;
}

double getError(double actual, double estimate) {
   return ((fabs(actual-estimate))/actual)*100;
}
