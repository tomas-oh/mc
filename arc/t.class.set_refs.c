.if ( te_dt.Initial_Value != "CTOR" )
  ${form_ptr}->${ref_te_attr.GeneratedName} = ${part_ptr}->${ident_te_attr.GeneratedName};
.else
  .if ( 4 == te_dt.Core_Typ )
    .if ( te_sys.InstanceLoading )
  ${form_ptr}->${ref_te_attr.GeneratedName} = ${te_instance.module}${te_string.strcpy}( ${form_ptr}->${ref_te_attr.GeneratedName}, ${part_ptr}->${ident_te_attr.GeneratedName} );
    .else
  ${te_instance.module}${te_string.strcpy}( ${form_ptr}->${ref_te_attr.GeneratedName}, ${part_ptr}->${ident_te_attr.GeneratedName} );
    .end if
  .else
  ${te_instance.module}${te_string.memmove}( &${form_ptr}->${ref_te_attr.GeneratedName}, &${part_ptr}->${ident_te_attr.GeneratedName}, sizeof( ${form_ptr}->${ref_te_attr.GeneratedName} ) );
  .end if
.end if
.//
