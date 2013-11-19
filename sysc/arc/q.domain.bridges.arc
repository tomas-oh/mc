.//============================================================================
.// $RCSfile: q.domain.bridges.arc,v $
.//
.// Description:
.// External Entity bridge process skeleton generator.
.//
.// Notice:
.// (C) Copyright 1998-2011 Mentor Graphics Corporation
.//     All rights reserved.
.//
.// This document contains confidential and proprietary information and
.// property of Mentor Graphics Corp.  No part of this document may be
.// reproduced without the express written permission of Mentor Graphics Corp.
.//============================================================================
.//
.//
.//
.invoke include_files = ClassAddIncludeFiles( te_c, false )
.select many te_ees related by te_c->TE_EE[R2085] where ( selected.RegisteredName != "TIM" )
.for each te_ee in te_ees
  .select one s_ee related by te_ee->S_EE[R2020]
  .select many s_brgs related by s_ee->S_BRG[R19]
  .if ( te_ee.TypeCode == 10 )
  .//
  .// Generate declaration file.
  .// Note: The order of these is important.  The body is generated first
  .//       to ensure that the data types are marked as used.
  .invoke ee_body = TE_BRG_CreateDeclarations( s_brgs )
  .invoke includes = AddBridgeIncludeFiles( s_ee, TRUE )
  .include "${arc_path}/t.ee.h"
  .emit to file "${te_file.system_include_path}/${te_ee.Include_File}"
  .//
  .// Generate skeleton implementation file.
  .invoke ee_body = TE_BRG_CreateDefinition( s_ee, s_brgs )
  .select any o_obj from instances of O_OBJ where ( false )
  .invoke includes = AddBridgeIncludeFiles( s_ee, FALSE )
  .include "${arc_path}/t.ee.c"
  .emit to file "${te_file.system_source_path}/${te_ee.file}.${te_file.src_file_ext}"
  .end if
.end for
.//