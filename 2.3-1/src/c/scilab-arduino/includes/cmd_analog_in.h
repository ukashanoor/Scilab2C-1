/*
 *  Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 *  Copyright (C) 2008 - INRIA - Arnaud TORSET
 *
 *  This file must be used under the terms of the CeCILL.
 *  This source file is licensed as described in the file COPYING, which
 *  you should have received as part of this distribution.  The terms
 *  are also available at
 *  http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 *
 */
 
 
#ifndef __CMD_ANALOG_IN_H__
#define __CMD_ANALOG_IN_H__
 
#include "types.h"

#ifdef  __cplusplus
extern "C" {
#endif
	
uint16 u8cmd_analog_ins(uint8 board_no, uint8 pin);

#ifdef  __cplusplus
} /* extern "C" */
#endif

#endif /* __CMD_DIGITAL_IN_H__ */
