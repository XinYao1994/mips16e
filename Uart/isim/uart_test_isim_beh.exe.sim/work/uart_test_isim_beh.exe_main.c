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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000712700604_2782103923_init();
    work_m_00000000001144585115_2882768297_init();
    work_m_00000000001826465850_2296850996_init();
    work_m_00000000000365198147_3206695380_init();
    work_m_00000000000009107416_1891985281_init();
    work_m_00000000004221069629_2733303611_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000004221069629_2733303611");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
