#include <iostream>
#include <math.h>
#include "ic.h"

#define LN2 0.6931471805599453

using namespace std;

void printHelp(void) {
    
    cout << "Options:" << endl;
    cout << "   -f [desired_frequency] : defaults to 1200 if not specified." << endl;
    cout << "   -r1 [r1_const]         : defaults to 1K Ohm if not specified." << endl;
    cout << "   -r1_vary               : r1 will not be locked to any const value" << endl;
    cout << "                          : (more accurate) but this will deviate the" << endl;
    cout << "                          : duty cycle away from 50%." << endl;
    cout << "" << endl;
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
                                if (err_save > err || iPass == 0) {
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

    cout << "R1 is: " << r1 << endl;
    cout << "R2 is: " << r2 << endl;
    cout << "C is: " << c << endl;
    cout << "High is: " << high << endl;
    cout << "Low is: " << low << endl;
    cout << "Period is: " << period << endl;
    cout << "Duty Cycle is: " << duty << endl;
    cout << "Frequency is: " << f << endl;
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
