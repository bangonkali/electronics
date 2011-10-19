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
static const char *ng0 = "C:/Users/Bangonkali/Desktop/FSM/xilinx_simpsons/simpsons/simpsons_sensor_tb.v";
static int ng1[] = {0, 0};
static const char *ng2 = "Bart Enters: LEVEL = %d";
static const char *ng3 = "Bart Leaves: LEVEL = %d";
static const char *ng4 = "Homer Enters: LEVEL = %d";
static const char *ng5 = "Homer Leaves: LEVEL = %d";



static void Initial_50_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 1776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);

LAB4:    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1160);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1252);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(61, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(63, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB13:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    xsi_set_current_line(73, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB15:    xsi_set_current_line(74, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB16:    xsi_set_current_line(77, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB17:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB18:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB19:    xsi_set_current_line(80, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB20:    xsi_set_current_line(83, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB21:    xsi_set_current_line(84, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB22;
    goto LAB1;

LAB22:    xsi_set_current_line(85, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB23:    xsi_set_current_line(88, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB24;
    goto LAB1;

LAB24:    xsi_set_current_line(89, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB25:    xsi_set_current_line(90, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB26:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB27:    xsi_set_current_line(94, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB28:    xsi_set_current_line(95, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB29:    xsi_set_current_line(96, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB30;
    goto LAB1;

LAB30:    xsi_set_current_line(97, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB31:    xsi_set_current_line(100, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB32;
    goto LAB1;

LAB32:    xsi_set_current_line(101, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB33:    xsi_set_current_line(102, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB34;
    goto LAB1;

LAB34:    xsi_set_current_line(103, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB35:    xsi_set_current_line(106, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB36;
    goto LAB1;

LAB36:    xsi_set_current_line(107, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB37:    xsi_set_current_line(108, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB38;
    goto LAB1;

LAB38:    xsi_set_current_line(111, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB39:    xsi_set_current_line(112, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB40;
    goto LAB1;

LAB40:    xsi_set_current_line(113, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng2, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB41:    xsi_set_current_line(116, ng0);
    t3 = (t0 + 424);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB42;
    goto LAB1;

LAB42:    xsi_set_current_line(117, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB43:    xsi_set_current_line(118, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB44;
    goto LAB1;

LAB44:    xsi_set_current_line(119, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB45;
    goto LAB1;

LAB45:    xsi_set_current_line(122, ng0);
    t3 = (t0 + 344);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB46;
    goto LAB1;

LAB46:    xsi_set_current_line(123, ng0);
    t3 = (t0 + 264);
    t4 = *((char **)t3);
    t3 = (t0 + 1068);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 2);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 1676);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB47:    xsi_set_current_line(124, ng0);
    t3 = (t0 + 840U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng3, 2, t0, (char)118, t4, 2);
    xsi_set_current_line(126, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}

static void Always_130_1(char *t0)
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

LAB0:    t1 = (t0 + 1920U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(130, ng0);

LAB4:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 1820);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(131, ng0);
    t4 = (t0 + 1160);
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

LAB9:    t14 = (t0 + 1160);
    xsi_vlogvar_assign_value(t14, t3, 0, 0, 1);
    goto LAB2;

LAB6:    *((unsigned int *)t3) = 1;
    goto LAB9;

}


extern void work_m_00000000003817390603_0804074332_init()
{
	static char *pe[] = {(void *)Initial_50_0,(void *)Always_130_1};
	xsi_register_didat("work_m_00000000003817390603_0804074332", "isim/simpsons_sensor_tb_isim_beh.exe.sim/work/m_00000000003817390603_0804074332.didat");
	xsi_register_executes(pe);
}
