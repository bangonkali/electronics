/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x6dd86d03 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Bangonkali/Documents/Project/electronics/fsm/simpsons_sensor/xilinx_simpsons_sensor/simpsons/simpsons_sensor_tb.v";
static int ng1[] = {0, 0};
static const char *ng2 = "Bart Enters: LEVEL = %d";
static const char *ng3 = "Bart Leaves: LEVEL = %d";
static const char *ng4 = "Homer Enters: LEVEL = %d";
static const char *ng5 = "Homer Leaves: LEVEL = %d";
static const char *ng6 = "But this time, both G1 and G0 are emitting 1";
static const char *ng7 = "after an initial G0 of 1. Which basically means";
static const char *ng8 = "head first, then both his head and lower body is";
static const char *ng9 = "being detected by the sensor as he's entering";
static const char *ng10 = "being detected by the sensor as he's exiting";
static const char *ng11 = "This shows the reset capability.";
static const char *ng12 = "The device's reset is pressed.";
static int ng13[] = {1, 0};
static const char *ng14 = "The device's reset is unpressed.";
static const char *ng15 = "Current LEVEL: LEVEL = %d";
static const char *ng16 = "End of simulation: LEVEL = %d";



static void Initial_64_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 1856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng0);

LAB4:    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1240);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1332);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(75, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(76, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(80, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(81, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(82, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    xsi_set_current_line(85, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB13:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    xsi_set_current_line(87, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB15:    xsi_set_current_line(88, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB16:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB17:    xsi_set_current_line(92, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB18:    xsi_set_current_line(93, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB19:    xsi_set_current_line(94, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB20:    xsi_set_current_line(97, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB21:    xsi_set_current_line(98, ng0);
    t3 = (t0 + 504);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB22:    xsi_set_current_line(99, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB23:    xsi_set_current_line(100, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(101, ng0);
    xsi_vlogfile_write(1, 0, 0, ng6, 1, t0);
    xsi_set_current_line(102, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(103, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(104, ng0);
    xsi_vlogfile_write(1, 0, 0, ng9, 1, t0);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB24;
    goto LAB1;

LAB24:    xsi_set_current_line(107, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB25:    xsi_set_current_line(108, ng0);
    t3 = (t0 + 504);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB26:    xsi_set_current_line(109, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB27:    xsi_set_current_line(110, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(111, ng0);
    xsi_vlogfile_write(1, 0, 0, ng6, 1, t0);
    xsi_set_current_line(112, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(113, ng0);
    xsi_vlogfile_write(1, 0, 0, ng8, 1, t0);
    xsi_set_current_line(114, ng0);
    xsi_vlogfile_write(1, 0, 0, ng10, 1, t0);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB28:    xsi_set_current_line(117, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB29:    xsi_set_current_line(118, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB30;
    goto LAB1;

LAB30:    xsi_set_current_line(119, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB31:    xsi_set_current_line(122, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB32;
    goto LAB1;

LAB32:    xsi_set_current_line(123, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB33:    xsi_set_current_line(124, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(125, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB34;
    goto LAB1;

LAB34:    xsi_set_current_line(125, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB35:    xsi_set_current_line(128, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB36;
    goto LAB1;

LAB36:    xsi_set_current_line(129, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB37:    xsi_set_current_line(130, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB38;
    goto LAB1;

LAB38:    xsi_set_current_line(131, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB39:    xsi_set_current_line(134, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB40;
    goto LAB1;

LAB40:    xsi_set_current_line(135, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(136, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB41:    xsi_set_current_line(136, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB42;
    goto LAB1;

LAB42:    xsi_set_current_line(137, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB43:    xsi_set_current_line(140, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB44;
    goto LAB1;

LAB44:    xsi_set_current_line(141, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(142, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB45;
    goto LAB1;

LAB45:    xsi_set_current_line(142, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB46;
    goto LAB1;

LAB46:    xsi_set_current_line(145, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(146, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB47:    xsi_set_current_line(146, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB48;
    goto LAB1;

LAB48:    xsi_set_current_line(147, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB49;
    goto LAB1;

LAB49:    xsi_set_current_line(150, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB50;
    goto LAB1;

LAB50:    xsi_set_current_line(151, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB51:    xsi_set_current_line(152, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB52;
    goto LAB1;

LAB52:    xsi_set_current_line(153, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB53;
    goto LAB1;

LAB53:    xsi_set_current_line(156, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB54;
    goto LAB1;

LAB54:    xsi_set_current_line(157, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB55:    xsi_set_current_line(158, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB56;
    goto LAB1;

LAB56:    xsi_set_current_line(160, ng0);
    xsi_vlogfile_write(1, 0, 0, ng11, 1, t0);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB57;
    goto LAB1;

LAB57:    xsi_set_current_line(162, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB58;
    goto LAB1;

LAB58:    xsi_set_current_line(163, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB59:    xsi_set_current_line(164, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB60;
    goto LAB1;

LAB60:    xsi_set_current_line(165, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(167, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB61;
    goto LAB1;

LAB61:    xsi_set_current_line(167, ng0);
    xsi_vlogfile_write(1, 0, 0, ng12, 1, t0);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB62;
    goto LAB1;

LAB62:    xsi_set_current_line(168, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 1332);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB63;
    goto LAB1;

LAB63:    xsi_set_current_line(169, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1332);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(170, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB64;
    goto LAB1;

LAB64:    xsi_set_current_line(170, ng0);
    xsi_vlogfile_write(1, 0, 0, ng14, 1, t0);
    xsi_set_current_line(171, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB65;
    goto LAB1;

LAB65:    xsi_set_current_line(171, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng15, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(174, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB66;
    goto LAB1;

LAB66:    xsi_set_current_line(174, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(175, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB67:    xsi_set_current_line(175, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(176, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB68;
    goto LAB1;

LAB68:    xsi_set_current_line(176, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(177, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB69;
    goto LAB1;

LAB69:    xsi_set_current_line(177, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB70;
    goto LAB1;

LAB70:    xsi_set_current_line(180, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(181, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB71:    xsi_set_current_line(181, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(182, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB72;
    goto LAB1;

LAB72:    xsi_set_current_line(182, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1148);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(183, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB73;
    goto LAB1;

LAB73:    xsi_set_current_line(183, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(186, ng0);
    t2 = (t0 + 1756);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB74;
    goto LAB1;

LAB74:    xsi_set_current_line(186, ng0);
    t3 = (t0 + 920U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng16, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(188, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}

static void Always_192_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 2000U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(192, ng0);

LAB4:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 1900);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(193, ng0);
    t4 = (t0 + 1240);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t7) == 0)
        goto LAB6;

LAB8:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB9:    t14 = (t0 + 1240);
    xsi_vlogvar_assign_value(t14, t3, 0, 0, 1);
    goto LAB2;

LAB6:    *((unsigned int *)t3) = 1;
    goto LAB9;

}


extern void work_m_00000000003790847820_0804074332_init()
{
	static char *pe[] = {(void *)Initial_64_0,(void *)Always_192_1};
	xsi_register_didat("work_m_00000000003790847820_0804074332", "isim/simpsons_sensor_tb_isim_beh.exe.sim/work/m_00000000003790847820_0804074332.didat");
	xsi_register_executes(pe);
}
