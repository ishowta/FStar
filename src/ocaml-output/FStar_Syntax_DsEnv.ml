open Prims
type local_binding = (FStar_Ident.ident * FStar_Syntax_Syntax.bv)
type rec_binding =
  (FStar_Ident.ident * FStar_Ident.lid * FStar_Syntax_Syntax.delta_depth)
type module_abbrev = (FStar_Ident.ident * FStar_Ident.lident)
type open_kind =
  | Open_module 
  | Open_namespace 
let (uu___is_Open_module : open_kind -> Prims.bool) =
  fun projectee  ->
    match projectee with | Open_module  -> true | uu____53 -> false
  
let (uu___is_Open_namespace : open_kind -> Prims.bool) =
  fun projectee  ->
    match projectee with | Open_namespace  -> true | uu____64 -> false
  
type open_module_or_namespace = (FStar_Ident.lident * open_kind)
type record_or_dc =
  {
  typename: FStar_Ident.lident ;
  constrname: FStar_Ident.ident ;
  parms: FStar_Syntax_Syntax.binders ;
  fields: (FStar_Ident.ident * FStar_Syntax_Syntax.typ) Prims.list ;
  is_private_or_abstract: Prims.bool ;
  is_record: Prims.bool }
let (__proj__Mkrecord_or_dc__item__typename :
  record_or_dc -> FStar_Ident.lident) =
  fun projectee  ->
    match projectee with
    | { typename; constrname; parms; fields; is_private_or_abstract;
        is_record;_} -> typename
  
let (__proj__Mkrecord_or_dc__item__constrname :
  record_or_dc -> FStar_Ident.ident) =
  fun projectee  ->
    match projectee with
    | { typename; constrname; parms; fields; is_private_or_abstract;
        is_record;_} -> constrname
  
let (__proj__Mkrecord_or_dc__item__parms :
  record_or_dc -> FStar_Syntax_Syntax.binders) =
  fun projectee  ->
    match projectee with
    | { typename; constrname; parms; fields; is_private_or_abstract;
        is_record;_} -> parms
  
let (__proj__Mkrecord_or_dc__item__fields :
  record_or_dc -> (FStar_Ident.ident * FStar_Syntax_Syntax.typ) Prims.list) =
  fun projectee  ->
    match projectee with
    | { typename; constrname; parms; fields; is_private_or_abstract;
        is_record;_} -> fields
  
let (__proj__Mkrecord_or_dc__item__is_private_or_abstract :
  record_or_dc -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { typename; constrname; parms; fields; is_private_or_abstract;
        is_record;_} -> is_private_or_abstract
  
let (__proj__Mkrecord_or_dc__item__is_record : record_or_dc -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { typename; constrname; parms; fields; is_private_or_abstract;
        is_record;_} -> is_record
  
type scope_mod =
  | Local_binding of local_binding 
  | Rec_binding of rec_binding 
  | Module_abbrev of module_abbrev 
  | Open_module_or_namespace of open_module_or_namespace 
  | Top_level_def of FStar_Ident.ident 
  | Record_or_dc of record_or_dc 
let (uu___is_Local_binding : scope_mod -> Prims.bool) =
  fun projectee  ->
    match projectee with | Local_binding _0 -> true | uu____284 -> false
  
let (__proj__Local_binding__item___0 : scope_mod -> local_binding) =
  fun projectee  -> match projectee with | Local_binding _0 -> _0 
let (uu___is_Rec_binding : scope_mod -> Prims.bool) =
  fun projectee  ->
    match projectee with | Rec_binding _0 -> true | uu____303 -> false
  
let (__proj__Rec_binding__item___0 : scope_mod -> rec_binding) =
  fun projectee  -> match projectee with | Rec_binding _0 -> _0 
let (uu___is_Module_abbrev : scope_mod -> Prims.bool) =
  fun projectee  ->
    match projectee with | Module_abbrev _0 -> true | uu____322 -> false
  
let (__proj__Module_abbrev__item___0 : scope_mod -> module_abbrev) =
  fun projectee  -> match projectee with | Module_abbrev _0 -> _0 
let (uu___is_Open_module_or_namespace : scope_mod -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Open_module_or_namespace _0 -> true
    | uu____341 -> false
  
let (__proj__Open_module_or_namespace__item___0 :
  scope_mod -> open_module_or_namespace) =
  fun projectee  -> match projectee with | Open_module_or_namespace _0 -> _0 
let (uu___is_Top_level_def : scope_mod -> Prims.bool) =
  fun projectee  ->
    match projectee with | Top_level_def _0 -> true | uu____360 -> false
  
let (__proj__Top_level_def__item___0 : scope_mod -> FStar_Ident.ident) =
  fun projectee  -> match projectee with | Top_level_def _0 -> _0 
let (uu___is_Record_or_dc : scope_mod -> Prims.bool) =
  fun projectee  ->
    match projectee with | Record_or_dc _0 -> true | uu____379 -> false
  
let (__proj__Record_or_dc__item___0 : scope_mod -> record_or_dc) =
  fun projectee  -> match projectee with | Record_or_dc _0 -> _0 
type string_set = Prims.string FStar_Util.set
type exported_id_kind =
  | Exported_id_term_type 
  | Exported_id_field 
let (uu___is_Exported_id_term_type : exported_id_kind -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | Exported_id_term_type  -> true
    | uu____400 -> false
  
let (uu___is_Exported_id_field : exported_id_kind -> Prims.bool) =
  fun projectee  ->
    match projectee with | Exported_id_field  -> true | uu____411 -> false
  
type exported_id_set = exported_id_kind -> string_set FStar_ST.ref
type env =
  {
  curmodule: FStar_Ident.lident FStar_Pervasives_Native.option ;
  curmonad: FStar_Ident.ident FStar_Pervasives_Native.option ;
  modules: (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list ;
  scope_mods: scope_mod Prims.list ;
  exported_ids: exported_id_set FStar_Util.smap ;
  trans_exported_ids: exported_id_set FStar_Util.smap ;
  includes: FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap ;
  sigaccum: FStar_Syntax_Syntax.sigelts ;
  sigmap: (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap ;
  iface: Prims.bool ;
  admitted_iface: Prims.bool ;
  expect_typ: Prims.bool ;
  docs: FStar_Parser_AST.fsdoc FStar_Util.smap ;
  remaining_iface_decls:
    (FStar_Ident.lident * FStar_Parser_AST.decl Prims.list) Prims.list ;
  syntax_only: Prims.bool ;
  ds_hooks: dsenv_hooks ;
  dep_graph: FStar_Parser_Dep.deps }
and dsenv_hooks =
  {
  ds_push_open_hook: env -> open_module_or_namespace -> unit ;
  ds_push_include_hook: env -> FStar_Ident.lident -> unit ;
  ds_push_module_abbrev_hook:
    env -> FStar_Ident.ident -> FStar_Ident.lident -> unit }
let (__proj__Mkenv__item__curmodule :
  env -> FStar_Ident.lident FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> curmodule
  
let (__proj__Mkenv__item__curmonad :
  env -> FStar_Ident.ident FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> curmonad
  
let (__proj__Mkenv__item__modules :
  env -> (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> modules
  
let (__proj__Mkenv__item__scope_mods : env -> scope_mod Prims.list) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> scope_mods
  
let (__proj__Mkenv__item__exported_ids :
  env -> exported_id_set FStar_Util.smap) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> exported_ids
  
let (__proj__Mkenv__item__trans_exported_ids :
  env -> exported_id_set FStar_Util.smap) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> trans_exported_ids
  
let (__proj__Mkenv__item__includes :
  env -> FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> includes
  
let (__proj__Mkenv__item__sigaccum : env -> FStar_Syntax_Syntax.sigelts) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> sigaccum
  
let (__proj__Mkenv__item__sigmap :
  env -> (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> sigmap
  
let (__proj__Mkenv__item__iface : env -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> iface
  
let (__proj__Mkenv__item__admitted_iface : env -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> admitted_iface
  
let (__proj__Mkenv__item__expect_typ : env -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> expect_typ
  
let (__proj__Mkenv__item__docs :
  env -> FStar_Parser_AST.fsdoc FStar_Util.smap) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> docs
  
let (__proj__Mkenv__item__remaining_iface_decls :
  env -> (FStar_Ident.lident * FStar_Parser_AST.decl Prims.list) Prims.list)
  =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> remaining_iface_decls
  
let (__proj__Mkenv__item__syntax_only : env -> Prims.bool) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> syntax_only
  
let (__proj__Mkenv__item__ds_hooks : env -> dsenv_hooks) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> ds_hooks
  
let (__proj__Mkenv__item__dep_graph : env -> FStar_Parser_Dep.deps) =
  fun projectee  ->
    match projectee with
    | { curmodule; curmonad; modules; scope_mods; exported_ids;
        trans_exported_ids; includes; sigaccum; sigmap; iface;
        admitted_iface; expect_typ; docs; remaining_iface_decls; syntax_only;
        ds_hooks; dep_graph;_} -> dep_graph
  
let (__proj__Mkdsenv_hooks__item__ds_push_open_hook :
  dsenv_hooks -> env -> open_module_or_namespace -> unit) =
  fun projectee  ->
    match projectee with
    | { ds_push_open_hook; ds_push_include_hook;
        ds_push_module_abbrev_hook;_} -> ds_push_open_hook
  
let (__proj__Mkdsenv_hooks__item__ds_push_include_hook :
  dsenv_hooks -> env -> FStar_Ident.lident -> unit) =
  fun projectee  ->
    match projectee with
    | { ds_push_open_hook; ds_push_include_hook;
        ds_push_module_abbrev_hook;_} -> ds_push_include_hook
  
let (__proj__Mkdsenv_hooks__item__ds_push_module_abbrev_hook :
  dsenv_hooks -> env -> FStar_Ident.ident -> FStar_Ident.lident -> unit) =
  fun projectee  ->
    match projectee with
    | { ds_push_open_hook; ds_push_include_hook;
        ds_push_module_abbrev_hook;_} -> ds_push_module_abbrev_hook
  
type 'a withenv = env -> ('a * env)
let (default_ds_hooks : dsenv_hooks) =
  {
    ds_push_open_hook = (fun uu____2031  -> fun uu____2032  -> ());
    ds_push_include_hook = (fun uu____2035  -> fun uu____2036  -> ());
    ds_push_module_abbrev_hook =
      (fun uu____2040  -> fun uu____2041  -> fun uu____2042  -> ())
  } 
type foundname =
  | Term_name of (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.attribute
  Prims.list) 
  | Eff_name of (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident) 
let (uu___is_Term_name : foundname -> Prims.bool) =
  fun projectee  ->
    match projectee with | Term_name _0 -> true | uu____2079 -> false
  
let (__proj__Term_name__item___0 :
  foundname ->
    (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.attribute Prims.list))
  = fun projectee  -> match projectee with | Term_name _0 -> _0 
let (uu___is_Eff_name : foundname -> Prims.bool) =
  fun projectee  ->
    match projectee with | Eff_name _0 -> true | uu____2120 -> false
  
let (__proj__Eff_name__item___0 :
  foundname -> (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident)) =
  fun projectee  -> match projectee with | Eff_name _0 -> _0 
let (set_iface : env -> Prims.bool -> env) =
  fun env  ->
    fun b  ->
      let uu___129_2154 = env  in
      {
        curmodule = (uu___129_2154.curmodule);
        curmonad = (uu___129_2154.curmonad);
        modules = (uu___129_2154.modules);
        scope_mods = (uu___129_2154.scope_mods);
        exported_ids = (uu___129_2154.exported_ids);
        trans_exported_ids = (uu___129_2154.trans_exported_ids);
        includes = (uu___129_2154.includes);
        sigaccum = (uu___129_2154.sigaccum);
        sigmap = (uu___129_2154.sigmap);
        iface = b;
        admitted_iface = (uu___129_2154.admitted_iface);
        expect_typ = (uu___129_2154.expect_typ);
        docs = (uu___129_2154.docs);
        remaining_iface_decls = (uu___129_2154.remaining_iface_decls);
        syntax_only = (uu___129_2154.syntax_only);
        ds_hooks = (uu___129_2154.ds_hooks);
        dep_graph = (uu___129_2154.dep_graph)
      }
  
let (iface : env -> Prims.bool) = fun e  -> e.iface 
let (set_admitted_iface : env -> Prims.bool -> env) =
  fun e  ->
    fun b  ->
      let uu___134_2175 = e  in
      {
        curmodule = (uu___134_2175.curmodule);
        curmonad = (uu___134_2175.curmonad);
        modules = (uu___134_2175.modules);
        scope_mods = (uu___134_2175.scope_mods);
        exported_ids = (uu___134_2175.exported_ids);
        trans_exported_ids = (uu___134_2175.trans_exported_ids);
        includes = (uu___134_2175.includes);
        sigaccum = (uu___134_2175.sigaccum);
        sigmap = (uu___134_2175.sigmap);
        iface = (uu___134_2175.iface);
        admitted_iface = b;
        expect_typ = (uu___134_2175.expect_typ);
        docs = (uu___134_2175.docs);
        remaining_iface_decls = (uu___134_2175.remaining_iface_decls);
        syntax_only = (uu___134_2175.syntax_only);
        ds_hooks = (uu___134_2175.ds_hooks);
        dep_graph = (uu___134_2175.dep_graph)
      }
  
let (admitted_iface : env -> Prims.bool) = fun e  -> e.admitted_iface 
let (set_expect_typ : env -> Prims.bool -> env) =
  fun e  ->
    fun b  ->
      let uu___139_2196 = e  in
      {
        curmodule = (uu___139_2196.curmodule);
        curmonad = (uu___139_2196.curmonad);
        modules = (uu___139_2196.modules);
        scope_mods = (uu___139_2196.scope_mods);
        exported_ids = (uu___139_2196.exported_ids);
        trans_exported_ids = (uu___139_2196.trans_exported_ids);
        includes = (uu___139_2196.includes);
        sigaccum = (uu___139_2196.sigaccum);
        sigmap = (uu___139_2196.sigmap);
        iface = (uu___139_2196.iface);
        admitted_iface = (uu___139_2196.admitted_iface);
        expect_typ = b;
        docs = (uu___139_2196.docs);
        remaining_iface_decls = (uu___139_2196.remaining_iface_decls);
        syntax_only = (uu___139_2196.syntax_only);
        ds_hooks = (uu___139_2196.ds_hooks);
        dep_graph = (uu___139_2196.dep_graph)
      }
  
let (expect_typ : env -> Prims.bool) = fun e  -> e.expect_typ 
let (all_exported_id_kinds : exported_id_kind Prims.list) =
  [Exported_id_field; Exported_id_term_type] 
let (transitive_exported_ids :
  env -> FStar_Ident.lident -> Prims.string Prims.list) =
  fun env  ->
    fun lid  ->
      let module_name = FStar_Ident.string_of_lid lid  in
      let uu____2223 =
        FStar_Util.smap_try_find env.trans_exported_ids module_name  in
      match uu____2223 with
      | FStar_Pervasives_Native.None  -> []
      | FStar_Pervasives_Native.Some exported_id_set ->
          let uu____2236 =
            let uu____2240 = exported_id_set Exported_id_term_type  in
            FStar_ST.op_Bang uu____2240  in
          FStar_All.pipe_right uu____2236 FStar_Util.set_elements
  
let (open_modules :
  env -> (FStar_Ident.lident * FStar_Syntax_Syntax.modul) Prims.list) =
  fun e  -> e.modules 
let (open_modules_and_namespaces : env -> FStar_Ident.lident Prims.list) =
  fun env  ->
    FStar_List.filter_map
      (fun uu___0_2328  ->
         match uu___0_2328 with
         | Open_module_or_namespace (lid,_info) ->
             FStar_Pervasives_Native.Some lid
         | uu____2333 -> FStar_Pervasives_Native.None) env.scope_mods
  
let (set_current_module : env -> FStar_Ident.lident -> env) =
  fun e  ->
    fun l  ->
      let uu___158_2345 = e  in
      {
        curmodule = (FStar_Pervasives_Native.Some l);
        curmonad = (uu___158_2345.curmonad);
        modules = (uu___158_2345.modules);
        scope_mods = (uu___158_2345.scope_mods);
        exported_ids = (uu___158_2345.exported_ids);
        trans_exported_ids = (uu___158_2345.trans_exported_ids);
        includes = (uu___158_2345.includes);
        sigaccum = (uu___158_2345.sigaccum);
        sigmap = (uu___158_2345.sigmap);
        iface = (uu___158_2345.iface);
        admitted_iface = (uu___158_2345.admitted_iface);
        expect_typ = (uu___158_2345.expect_typ);
        docs = (uu___158_2345.docs);
        remaining_iface_decls = (uu___158_2345.remaining_iface_decls);
        syntax_only = (uu___158_2345.syntax_only);
        ds_hooks = (uu___158_2345.ds_hooks);
        dep_graph = (uu___158_2345.dep_graph)
      }
  
let (current_module : env -> FStar_Ident.lident) =
  fun env  ->
    match env.curmodule with
    | FStar_Pervasives_Native.None  -> failwith "Unset current module"
    | FStar_Pervasives_Native.Some m -> m
  
let (iface_decls :
  env ->
    FStar_Ident.lident ->
      FStar_Parser_AST.decl Prims.list FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____2369 =
        FStar_All.pipe_right env.remaining_iface_decls
          (FStar_List.tryFind
             (fun uu____2403  ->
                match uu____2403 with
                | (m,uu____2412) -> FStar_Ident.lid_equals l m))
         in
      match uu____2369 with
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
      | FStar_Pervasives_Native.Some (uu____2429,decls) ->
          FStar_Pervasives_Native.Some decls
  
let (set_iface_decls :
  env -> FStar_Ident.lident -> FStar_Parser_AST.decl Prims.list -> env) =
  fun env  ->
    fun l  ->
      fun ds  ->
        let uu____2463 =
          FStar_List.partition
            (fun uu____2493  ->
               match uu____2493 with
               | (m,uu____2502) -> FStar_Ident.lid_equals l m)
            env.remaining_iface_decls
           in
        match uu____2463 with
        | (uu____2507,rest) ->
            let uu___183_2541 = env  in
            {
              curmodule = (uu___183_2541.curmodule);
              curmonad = (uu___183_2541.curmonad);
              modules = (uu___183_2541.modules);
              scope_mods = (uu___183_2541.scope_mods);
              exported_ids = (uu___183_2541.exported_ids);
              trans_exported_ids = (uu___183_2541.trans_exported_ids);
              includes = (uu___183_2541.includes);
              sigaccum = (uu___183_2541.sigaccum);
              sigmap = (uu___183_2541.sigmap);
              iface = (uu___183_2541.iface);
              admitted_iface = (uu___183_2541.admitted_iface);
              expect_typ = (uu___183_2541.expect_typ);
              docs = (uu___183_2541.docs);
              remaining_iface_decls = ((l, ds) :: rest);
              syntax_only = (uu___183_2541.syntax_only);
              ds_hooks = (uu___183_2541.ds_hooks);
              dep_graph = (uu___183_2541.dep_graph)
            }
  
let (qual : FStar_Ident.lident -> FStar_Ident.ident -> FStar_Ident.lident) =
  FStar_Syntax_Util.qual_id 
let (qualify : env -> FStar_Ident.ident -> FStar_Ident.lident) =
  fun env  ->
    fun id1  ->
      match env.curmonad with
      | FStar_Pervasives_Native.None  ->
          let uu____2570 = current_module env  in qual uu____2570 id1
      | FStar_Pervasives_Native.Some monad ->
          let uu____2572 =
            let uu____2573 = current_module env  in qual uu____2573 monad  in
          FStar_Syntax_Util.mk_field_projector_name_from_ident uu____2572 id1
  
let (syntax_only : env -> Prims.bool) = fun env  -> env.syntax_only 
let (set_syntax_only : env -> Prims.bool -> env) =
  fun env  ->
    fun b  ->
      let uu___193_2594 = env  in
      {
        curmodule = (uu___193_2594.curmodule);
        curmonad = (uu___193_2594.curmonad);
        modules = (uu___193_2594.modules);
        scope_mods = (uu___193_2594.scope_mods);
        exported_ids = (uu___193_2594.exported_ids);
        trans_exported_ids = (uu___193_2594.trans_exported_ids);
        includes = (uu___193_2594.includes);
        sigaccum = (uu___193_2594.sigaccum);
        sigmap = (uu___193_2594.sigmap);
        iface = (uu___193_2594.iface);
        admitted_iface = (uu___193_2594.admitted_iface);
        expect_typ = (uu___193_2594.expect_typ);
        docs = (uu___193_2594.docs);
        remaining_iface_decls = (uu___193_2594.remaining_iface_decls);
        syntax_only = b;
        ds_hooks = (uu___193_2594.ds_hooks);
        dep_graph = (uu___193_2594.dep_graph)
      }
  
let (ds_hooks : env -> dsenv_hooks) = fun env  -> env.ds_hooks 
let (set_ds_hooks : env -> dsenv_hooks -> env) =
  fun env  ->
    fun hooks  ->
      let uu___198_2612 = env  in
      {
        curmodule = (uu___198_2612.curmodule);
        curmonad = (uu___198_2612.curmonad);
        modules = (uu___198_2612.modules);
        scope_mods = (uu___198_2612.scope_mods);
        exported_ids = (uu___198_2612.exported_ids);
        trans_exported_ids = (uu___198_2612.trans_exported_ids);
        includes = (uu___198_2612.includes);
        sigaccum = (uu___198_2612.sigaccum);
        sigmap = (uu___198_2612.sigmap);
        iface = (uu___198_2612.iface);
        admitted_iface = (uu___198_2612.admitted_iface);
        expect_typ = (uu___198_2612.expect_typ);
        docs = (uu___198_2612.docs);
        remaining_iface_decls = (uu___198_2612.remaining_iface_decls);
        syntax_only = (uu___198_2612.syntax_only);
        ds_hooks = hooks;
        dep_graph = (uu___198_2612.dep_graph)
      }
  
let new_sigmap : 'Auu____2618 . unit -> 'Auu____2618 FStar_Util.smap =
  fun uu____2625  -> FStar_Util.smap_create (Prims.of_int (100)) 
let (empty_env : FStar_Parser_Dep.deps -> env) =
  fun deps  ->
    let uu____2633 = new_sigmap ()  in
    let uu____2638 = new_sigmap ()  in
    let uu____2643 = new_sigmap ()  in
    let uu____2654 = new_sigmap ()  in
    let uu____2667 = new_sigmap ()  in
    {
      curmodule = FStar_Pervasives_Native.None;
      curmonad = FStar_Pervasives_Native.None;
      modules = [];
      scope_mods = [];
      exported_ids = uu____2633;
      trans_exported_ids = uu____2638;
      includes = uu____2643;
      sigaccum = [];
      sigmap = uu____2654;
      iface = false;
      admitted_iface = false;
      expect_typ = false;
      docs = uu____2667;
      remaining_iface_decls = [];
      syntax_only = false;
      ds_hooks = default_ds_hooks;
      dep_graph = deps
    }
  
let (dep_graph : env -> FStar_Parser_Dep.deps) = fun env  -> env.dep_graph 
let (set_dep_graph : env -> FStar_Parser_Dep.deps -> env) =
  fun env  ->
    fun ds  ->
      let uu___205_2701 = env  in
      {
        curmodule = (uu___205_2701.curmodule);
        curmonad = (uu___205_2701.curmonad);
        modules = (uu___205_2701.modules);
        scope_mods = (uu___205_2701.scope_mods);
        exported_ids = (uu___205_2701.exported_ids);
        trans_exported_ids = (uu___205_2701.trans_exported_ids);
        includes = (uu___205_2701.includes);
        sigaccum = (uu___205_2701.sigaccum);
        sigmap = (uu___205_2701.sigmap);
        iface = (uu___205_2701.iface);
        admitted_iface = (uu___205_2701.admitted_iface);
        expect_typ = (uu___205_2701.expect_typ);
        docs = (uu___205_2701.docs);
        remaining_iface_decls = (uu___205_2701.remaining_iface_decls);
        syntax_only = (uu___205_2701.syntax_only);
        ds_hooks = (uu___205_2701.ds_hooks);
        dep_graph = ds
      }
  
let (sigmap :
  env -> (FStar_Syntax_Syntax.sigelt * Prims.bool) FStar_Util.smap) =
  fun env  -> env.sigmap 
let (has_all_in_scope : env -> Prims.bool) =
  fun env  ->
    FStar_List.existsb
      (fun uu____2729  ->
         match uu____2729 with
         | (m,uu____2736) ->
             FStar_Ident.lid_equals m FStar_Parser_Const.all_lid) env.modules
  
let (set_bv_range :
  FStar_Syntax_Syntax.bv -> FStar_Range.range -> FStar_Syntax_Syntax.bv) =
  fun bv  ->
    fun r  ->
      let id1 =
        let uu___214_2749 = bv.FStar_Syntax_Syntax.ppname  in
        {
          FStar_Ident.idText = (uu___214_2749.FStar_Ident.idText);
          FStar_Ident.idRange = r
        }  in
      let uu___217_2750 = bv  in
      {
        FStar_Syntax_Syntax.ppname = id1;
        FStar_Syntax_Syntax.index = (uu___217_2750.FStar_Syntax_Syntax.index);
        FStar_Syntax_Syntax.sort = (uu___217_2750.FStar_Syntax_Syntax.sort)
      }
  
let (bv_to_name :
  FStar_Syntax_Syntax.bv -> FStar_Range.range -> FStar_Syntax_Syntax.term) =
  fun bv  -> fun r  -> FStar_Syntax_Syntax.bv_to_name (set_bv_range bv r) 
let (unmangleMap :
  (Prims.string * Prims.string * FStar_Syntax_Syntax.delta_depth *
    FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option) Prims.list)
  =
  [("op_ColonColon", "Cons", FStar_Syntax_Syntax.delta_constant,
     (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor));
  ("not", "op_Negation", FStar_Syntax_Syntax.delta_equational,
    FStar_Pervasives_Native.None)]
  
let (unmangleOpName :
  FStar_Ident.ident ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun id1  ->
    FStar_Util.find_map unmangleMap
      (fun uu____2853  ->
         match uu____2853 with
         | (x,y,dd,dq) ->
             if id1.FStar_Ident.idText = x
             then
               let uu____2884 =
                 let uu____2885 =
                   FStar_Ident.lid_of_path ["Prims"; y]
                     id1.FStar_Ident.idRange
                    in
                 FStar_Syntax_Syntax.fvar uu____2885 dd dq  in
               FStar_Pervasives_Native.Some uu____2884
             else FStar_Pervasives_Native.None)
  
type 'a cont_t =
  | Cont_ok of 'a 
  | Cont_fail 
  | Cont_ignore 
let uu___is_Cont_ok : 'a . 'a cont_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Cont_ok _0 -> true | uu____2925 -> false
  
let __proj__Cont_ok__item___0 : 'a . 'a cont_t -> 'a =
  fun projectee  -> match projectee with | Cont_ok _0 -> _0 
let uu___is_Cont_fail : 'a . 'a cont_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Cont_fail  -> true | uu____2962 -> false
  
let uu___is_Cont_ignore : 'a . 'a cont_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Cont_ignore  -> true | uu____2983 -> false
  
let option_of_cont :
  'a .
    (unit -> 'a FStar_Pervasives_Native.option) ->
      'a cont_t -> 'a FStar_Pervasives_Native.option
  =
  fun k_ignore  ->
    fun uu___1_3013  ->
      match uu___1_3013 with
      | Cont_ok a -> FStar_Pervasives_Native.Some a
      | Cont_fail  -> FStar_Pervasives_Native.None
      | Cont_ignore  -> k_ignore ()
  
let find_in_record :
  'Auu____3032 .
    FStar_Ident.ident Prims.list ->
      FStar_Ident.ident ->
        record_or_dc ->
          (record_or_dc -> 'Auu____3032 cont_t) -> 'Auu____3032 cont_t
  =
  fun ns  ->
    fun id1  ->
      fun record  ->
        fun cont  ->
          let typename' =
            FStar_Ident.lid_of_ids
              (FStar_List.append ns [(record.typename).FStar_Ident.ident])
             in
          let uu____3069 = FStar_Ident.lid_equals typename' record.typename
             in
          if uu____3069
          then
            let fname =
              FStar_Ident.lid_of_ids
                (FStar_List.append (record.typename).FStar_Ident.ns [id1])
               in
            let find1 =
              FStar_Util.find_map record.fields
                (fun uu____3085  ->
                   match uu____3085 with
                   | (f,uu____3093) ->
                       if id1.FStar_Ident.idText = f.FStar_Ident.idText
                       then FStar_Pervasives_Native.Some record
                       else FStar_Pervasives_Native.None)
               in
            match find1 with
            | FStar_Pervasives_Native.Some r -> cont r
            | FStar_Pervasives_Native.None  -> Cont_ignore
          else Cont_ignore
  
let (get_exported_id_set :
  env ->
    Prims.string ->
      (exported_id_kind -> string_set FStar_ST.ref)
        FStar_Pervasives_Native.option)
  = fun e  -> fun mname  -> FStar_Util.smap_try_find e.exported_ids mname 
let (get_trans_exported_id_set :
  env ->
    Prims.string ->
      (exported_id_kind -> string_set FStar_ST.ref)
        FStar_Pervasives_Native.option)
  =
  fun e  -> fun mname  -> FStar_Util.smap_try_find e.trans_exported_ids mname 
let (string_of_exported_id_kind : exported_id_kind -> Prims.string) =
  fun uu___2_3167  ->
    match uu___2_3167 with
    | Exported_id_field  -> "field"
    | Exported_id_term_type  -> "term/type"
  
let find_in_module_with_includes :
  'a .
    exported_id_kind ->
      (FStar_Ident.lident -> 'a cont_t) ->
        'a cont_t ->
          env -> FStar_Ident.lident -> FStar_Ident.ident -> 'a cont_t
  =
  fun eikind  ->
    fun find_in_module  ->
      fun find_in_module_default  ->
        fun env  ->
          fun ns  ->
            fun id1  ->
              let idstr = id1.FStar_Ident.idText  in
              let rec aux uu___3_3243 =
                match uu___3_3243 with
                | [] -> find_in_module_default
                | modul::q ->
                    let mname = modul.FStar_Ident.str  in
                    let not_shadowed =
                      let uu____3256 = get_exported_id_set env mname  in
                      match uu____3256 with
                      | FStar_Pervasives_Native.None  -> true
                      | FStar_Pervasives_Native.Some mex ->
                          let mexports =
                            let uu____3283 = mex eikind  in
                            FStar_ST.op_Bang uu____3283  in
                          FStar_Util.set_mem idstr mexports
                       in
                    let mincludes =
                      let uu____3345 =
                        FStar_Util.smap_try_find env.includes mname  in
                      match uu____3345 with
                      | FStar_Pervasives_Native.None  -> []
                      | FStar_Pervasives_Native.Some minc ->
                          FStar_ST.op_Bang minc
                       in
                    let look_into =
                      if not_shadowed
                      then
                        let uu____3400 = qual modul id1  in
                        find_in_module uu____3400
                      else Cont_ignore  in
                    (match look_into with
                     | Cont_ignore  -> aux (FStar_List.append mincludes q)
                     | uu____3405 -> look_into)
                 in
              aux [ns]
  
let (is_exported_id_field : exported_id_kind -> Prims.bool) =
  fun uu___4_3414  ->
    match uu___4_3414 with | Exported_id_field  -> true | uu____3417 -> false
  
let try_lookup_id'' :
  'a .
    env ->
      FStar_Ident.ident ->
        exported_id_kind ->
          (local_binding -> 'a cont_t) ->
            (rec_binding -> 'a cont_t) ->
              (record_or_dc -> 'a cont_t) ->
                (FStar_Ident.lident -> 'a cont_t) ->
                  ('a cont_t -> FStar_Ident.ident -> 'a cont_t) ->
                    'a FStar_Pervasives_Native.option
  =
  fun env  ->
    fun id1  ->
      fun eikind  ->
        fun k_local_binding  ->
          fun k_rec_binding  ->
            fun k_record  ->
              fun find_in_module  ->
                fun lookup_default_id  ->
                  let check_local_binding_id uu___5_3541 =
                    match uu___5_3541 with
                    | (id',uu____3544) ->
                        id'.FStar_Ident.idText = id1.FStar_Ident.idText
                     in
                  let check_rec_binding_id uu___6_3552 =
                    match uu___6_3552 with
                    | (id',uu____3555,uu____3556) ->
                        id'.FStar_Ident.idText = id1.FStar_Ident.idText
                     in
                  let curmod_ns =
                    let uu____3561 = current_module env  in
                    FStar_Ident.ids_of_lid uu____3561  in
                  let proc uu___7_3569 =
                    match uu___7_3569 with
                    | Local_binding l when check_local_binding_id l ->
                        k_local_binding l
                    | Rec_binding r when check_rec_binding_id r ->
                        k_rec_binding r
                    | Open_module_or_namespace (ns,Open_module ) ->
                        find_in_module_with_includes eikind find_in_module
                          Cont_ignore env ns id1
                    | Top_level_def id' when
                        id'.FStar_Ident.idText = id1.FStar_Ident.idText ->
                        lookup_default_id Cont_ignore id1
                    | Record_or_dc r when is_exported_id_field eikind ->
                        let uu____3578 = FStar_Ident.lid_of_ids curmod_ns  in
                        find_in_module_with_includes Exported_id_field
                          (fun lid  ->
                             let id2 = lid.FStar_Ident.ident  in
                             find_in_record lid.FStar_Ident.ns id2 r k_record)
                          Cont_ignore env uu____3578 id1
                    | uu____3583 -> Cont_ignore  in
                  let rec aux uu___8_3593 =
                    match uu___8_3593 with
                    | a::q ->
                        let uu____3602 = proc a  in
                        option_of_cont (fun uu____3606  -> aux q) uu____3602
                    | [] ->
                        let uu____3607 = lookup_default_id Cont_fail id1  in
                        option_of_cont
                          (fun uu____3611  -> FStar_Pervasives_Native.None)
                          uu____3607
                     in
                  aux env.scope_mods
  
let found_local_binding :
  'Auu____3619 .
    FStar_Range.range ->
      ('Auu____3619 * FStar_Syntax_Syntax.bv) -> FStar_Syntax_Syntax.term
  =
  fun r  ->
    fun uu____3633  -> match uu____3633 with | (id',x) -> bv_to_name x r
  
let find_in_module :
  'Auu____3651 .
    env ->
      FStar_Ident.lident ->
        (FStar_Ident.lident ->
           (FStar_Syntax_Syntax.sigelt * Prims.bool) -> 'Auu____3651)
          -> 'Auu____3651 -> 'Auu____3651
  =
  fun env  ->
    fun lid  ->
      fun k_global_def  ->
        fun k_not_found  ->
          let uu____3692 =
            FStar_Util.smap_try_find (sigmap env) lid.FStar_Ident.str  in
          match uu____3692 with
          | FStar_Pervasives_Native.Some sb -> k_global_def lid sb
          | FStar_Pervasives_Native.None  -> k_not_found
  
let (try_lookup_id :
  env ->
    FStar_Ident.ident ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun id1  ->
      let uu____3736 = unmangleOpName id1  in
      match uu____3736 with
      | FStar_Pervasives_Native.Some f -> FStar_Pervasives_Native.Some f
      | uu____3742 ->
          try_lookup_id'' env id1 Exported_id_term_type
            (fun r  ->
               let uu____3748 = found_local_binding id1.FStar_Ident.idRange r
                  in
               Cont_ok uu____3748) (fun uu____3750  -> Cont_fail)
            (fun uu____3752  -> Cont_ignore)
            (fun i  ->
               find_in_module env i
                 (fun uu____3759  -> fun uu____3760  -> Cont_fail)
                 Cont_ignore)
            (fun uu____3768  -> fun uu____3769  -> Cont_fail)
  
let lookup_default_id :
  'a .
    env ->
      FStar_Ident.ident ->
        (FStar_Ident.lident ->
           (FStar_Syntax_Syntax.sigelt * Prims.bool) -> 'a cont_t)
          -> 'a cont_t -> 'a cont_t
  =
  fun env  ->
    fun id1  ->
      fun k_global_def  ->
        fun k_not_found  ->
          let find_in_monad =
            match env.curmonad with
            | FStar_Pervasives_Native.Some uu____3843 ->
                let lid = qualify env id1  in
                let uu____3845 =
                  FStar_Util.smap_try_find (sigmap env) lid.FStar_Ident.str
                   in
                (match uu____3845 with
                 | FStar_Pervasives_Native.Some r ->
                     let uu____3873 = k_global_def lid r  in
                     FStar_Pervasives_Native.Some uu____3873
                 | FStar_Pervasives_Native.None  ->
                     FStar_Pervasives_Native.None)
            | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
             in
          match find_in_monad with
          | FStar_Pervasives_Native.Some v1 -> v1
          | FStar_Pervasives_Native.None  ->
              let lid =
                let uu____3897 = current_module env  in qual uu____3897 id1
                 in
              find_in_module env lid k_global_def k_not_found
  
let (lid_is_curmod : env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun lid  ->
      match env.curmodule with
      | FStar_Pervasives_Native.None  -> false
      | FStar_Pervasives_Native.Some m -> FStar_Ident.lid_equals lid m
  
let (module_is_defined : env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun lid  ->
      (lid_is_curmod env lid) ||
        (FStar_List.existsb
           (fun x  ->
              FStar_Ident.lid_equals lid (FStar_Pervasives_Native.fst x))
           env.modules)
  
let (resolve_module_name :
  env ->
    FStar_Ident.lident ->
      Prims.bool -> FStar_Ident.lident FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun lid  ->
      fun honor_ns  ->
        let nslen = FStar_List.length lid.FStar_Ident.ns  in
        let rec aux uu___9_3969 =
          match uu___9_3969 with
          | [] ->
              let uu____3974 = module_is_defined env lid  in
              if uu____3974
              then FStar_Pervasives_Native.Some lid
              else FStar_Pervasives_Native.None
          | (Open_module_or_namespace (ns,Open_namespace ))::q when honor_ns
              ->
              let new_lid =
                let uu____3986 =
                  let uu____3987 = FStar_Ident.path_of_lid ns  in
                  let uu____3991 = FStar_Ident.path_of_lid lid  in
                  FStar_List.append uu____3987 uu____3991  in
                let uu____3996 = FStar_Ident.range_of_lid lid  in
                FStar_Ident.lid_of_path uu____3986 uu____3996  in
              let uu____3997 = module_is_defined env new_lid  in
              if uu____3997
              then FStar_Pervasives_Native.Some new_lid
              else aux q
          | (Module_abbrev (name,modul))::uu____4006 when
              (nslen = Prims.int_zero) &&
                (name.FStar_Ident.idText =
                   (lid.FStar_Ident.ident).FStar_Ident.idText)
              -> FStar_Pervasives_Native.Some modul
          | uu____4012::q -> aux q  in
        aux env.scope_mods
  
let (fail_if_curmodule :
  env -> FStar_Ident.lident -> FStar_Ident.lident -> unit) =
  fun env  ->
    fun ns_original  ->
      fun ns_resolved  ->
        let uu____4032 =
          let uu____4034 = current_module env  in
          FStar_Ident.lid_equals ns_resolved uu____4034  in
        if uu____4032
        then
          let uu____4036 =
            FStar_Ident.lid_equals ns_resolved FStar_Parser_Const.prims_lid
             in
          (if uu____4036
           then ()
           else
             (let uu____4041 =
                let uu____4047 =
                  FStar_Util.format1
                    "Reference %s to current module is forbidden (see GitHub issue #451)"
                    ns_original.FStar_Ident.str
                   in
                (FStar_Errors.Fatal_ForbiddenReferenceToCurrentModule,
                  uu____4047)
                 in
              let uu____4051 = FStar_Ident.range_of_lid ns_original  in
              FStar_Errors.raise_error uu____4041 uu____4051))
        else ()
  
let (fail_if_qualified_by_curmodule : env -> FStar_Ident.lident -> unit) =
  fun env  ->
    fun lid  ->
      match lid.FStar_Ident.ns with
      | [] -> ()
      | uu____4065 ->
          let modul_orig = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
          let uu____4069 = resolve_module_name env modul_orig true  in
          (match uu____4069 with
           | FStar_Pervasives_Native.Some modul_res ->
               fail_if_curmodule env modul_orig modul_res
           | uu____4074 -> ())
  
let (is_open : env -> FStar_Ident.lident -> open_kind -> Prims.bool) =
  fun env  ->
    fun lid  ->
      fun open_kind  ->
        FStar_List.existsb
          (fun uu___10_4097  ->
             match uu___10_4097 with
             | Open_module_or_namespace (ns,k) ->
                 (k = open_kind) && (FStar_Ident.lid_equals lid ns)
             | uu____4101 -> false) env.scope_mods
  
let (namespace_is_open : env -> FStar_Ident.lident -> Prims.bool) =
  fun env  -> fun lid  -> is_open env lid Open_namespace 
let (module_is_open : env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun lid  -> (lid_is_curmod env lid) || (is_open env lid Open_module)
  
let (shorten_module_path :
  env ->
    FStar_Ident.ident Prims.list ->
      Prims.bool ->
        (FStar_Ident.ident Prims.list * FStar_Ident.ident Prims.list))
  =
  fun env  ->
    fun ids  ->
      fun is_full_path  ->
        let rec aux revns id1 =
          let lid = FStar_Ident.lid_of_ns_and_id (FStar_List.rev revns) id1
             in
          if namespace_is_open env lid
          then
            FStar_Pervasives_Native.Some
              ((FStar_List.rev (id1 :: revns)), [])
          else
            (match revns with
             | [] -> FStar_Pervasives_Native.None
             | ns_last_id::rev_ns_prefix ->
                 let uu____4230 = aux rev_ns_prefix ns_last_id  in
                 FStar_All.pipe_right uu____4230
                   (FStar_Util.map_option
                      (fun uu____4280  ->
                         match uu____4280 with
                         | (stripped_ids,rev_kept_ids) ->
                             (stripped_ids, (id1 :: rev_kept_ids)))))
           in
        let do_shorten env1 ids1 =
          match FStar_List.rev ids1 with
          | [] -> ([], [])
          | ns_last_id::ns_rev_prefix ->
              let uu____4350 = aux ns_rev_prefix ns_last_id  in
              (match uu____4350 with
               | FStar_Pervasives_Native.None  -> ([], ids1)
               | FStar_Pervasives_Native.Some (stripped_ids,rev_kept_ids) ->
                   (stripped_ids, (FStar_List.rev rev_kept_ids)))
           in
        if is_full_path && ((FStar_List.length ids) > Prims.int_zero)
        then
          let uu____4413 =
            let uu____4416 = FStar_Ident.lid_of_ids ids  in
            resolve_module_name env uu____4416 true  in
          match uu____4413 with
          | FStar_Pervasives_Native.Some m when module_is_open env m ->
              (ids, [])
          | uu____4431 -> do_shorten env ids
        else do_shorten env ids
  
let resolve_in_open_namespaces'' :
  'a .
    env ->
      FStar_Ident.lident ->
        exported_id_kind ->
          (local_binding -> 'a cont_t) ->
            (rec_binding -> 'a cont_t) ->
              (record_or_dc -> 'a cont_t) ->
                (FStar_Ident.lident -> 'a cont_t) ->
                  ('a cont_t -> FStar_Ident.ident -> 'a cont_t) ->
                    'a FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      fun eikind  ->
        fun k_local_binding  ->
          fun k_rec_binding  ->
            fun k_record  ->
              fun f_module  ->
                fun l_default  ->
                  match lid.FStar_Ident.ns with
                  | uu____4552::uu____4553 ->
                      let uu____4556 =
                        let uu____4559 =
                          let uu____4560 =
                            FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
                          let uu____4561 = FStar_Ident.range_of_lid lid  in
                          FStar_Ident.set_lid_range uu____4560 uu____4561  in
                        resolve_module_name env uu____4559 true  in
                      (match uu____4556 with
                       | FStar_Pervasives_Native.None  ->
                           FStar_Pervasives_Native.None
                       | FStar_Pervasives_Native.Some modul ->
                           let uu____4566 =
                             find_in_module_with_includes eikind f_module
                               Cont_fail env modul lid.FStar_Ident.ident
                              in
                           option_of_cont
                             (fun uu____4570  -> FStar_Pervasives_Native.None)
                             uu____4566)
                  | [] ->
                      try_lookup_id'' env lid.FStar_Ident.ident eikind
                        k_local_binding k_rec_binding k_record f_module
                        l_default
  
let cont_of_option :
  'a . 'a cont_t -> 'a FStar_Pervasives_Native.option -> 'a cont_t =
  fun k_none  ->
    fun uu___11_4594  ->
      match uu___11_4594 with
      | FStar_Pervasives_Native.Some v1 -> Cont_ok v1
      | FStar_Pervasives_Native.None  -> k_none
  
let resolve_in_open_namespaces' :
  'a .
    env ->
      FStar_Ident.lident ->
        (local_binding -> 'a FStar_Pervasives_Native.option) ->
          (rec_binding -> 'a FStar_Pervasives_Native.option) ->
            (FStar_Ident.lident ->
               (FStar_Syntax_Syntax.sigelt * Prims.bool) ->
                 'a FStar_Pervasives_Native.option)
              -> 'a FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      fun k_local_binding  ->
        fun k_rec_binding  ->
          fun k_global_def  ->
            let k_global_def' k lid1 def =
              let uu____4715 = k_global_def lid1 def  in
              cont_of_option k uu____4715  in
            let f_module lid' =
              let k = Cont_ignore  in
              find_in_module env lid' (k_global_def' k) k  in
            let l_default k i = lookup_default_id env i (k_global_def' k) k
               in
            resolve_in_open_namespaces'' env lid Exported_id_term_type
              (fun l  ->
                 let uu____4751 = k_local_binding l  in
                 cont_of_option Cont_fail uu____4751)
              (fun r  ->
                 let uu____4757 = k_rec_binding r  in
                 cont_of_option Cont_fail uu____4757)
              (fun uu____4761  -> Cont_ignore) f_module l_default
  
let (fv_qual_of_se :
  FStar_Syntax_Syntax.sigelt ->
    FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option)
  =
  fun se  ->
    match se.FStar_Syntax_Syntax.sigel with
    | FStar_Syntax_Syntax.Sig_datacon
        (uu____4772,uu____4773,uu____4774,l,uu____4776,uu____4777) ->
        let qopt =
          FStar_Util.find_map se.FStar_Syntax_Syntax.sigquals
            (fun uu___12_4790  ->
               match uu___12_4790 with
               | FStar_Syntax_Syntax.RecordConstructor (uu____4793,fs) ->
                   FStar_Pervasives_Native.Some
                     (FStar_Syntax_Syntax.Record_ctor (l, fs))
               | uu____4805 -> FStar_Pervasives_Native.None)
           in
        (match qopt with
         | FStar_Pervasives_Native.None  ->
             FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor
         | x -> x)
    | FStar_Syntax_Syntax.Sig_declare_typ (uu____4811,uu____4812,uu____4813)
        -> FStar_Pervasives_Native.None
    | uu____4814 -> FStar_Pervasives_Native.None
  
let (lb_fv :
  FStar_Syntax_Syntax.letbinding Prims.list ->
    FStar_Ident.lident -> FStar_Syntax_Syntax.fv)
  =
  fun lbs  ->
    fun lid  ->
      let uu____4830 =
        FStar_Util.find_map lbs
          (fun lb  ->
             let fv = FStar_Util.right lb.FStar_Syntax_Syntax.lbname  in
             let uu____4838 = FStar_Syntax_Syntax.fv_eq_lid fv lid  in
             if uu____4838
             then FStar_Pervasives_Native.Some fv
             else FStar_Pervasives_Native.None)
         in
      FStar_All.pipe_right uu____4830 FStar_Util.must
  
let (ns_of_lid_equals :
  FStar_Ident.lident -> FStar_Ident.lident -> Prims.bool) =
  fun lid  ->
    fun ns  ->
      (let uu____4861 =
         let uu____4862 = FStar_Ident.ids_of_lid ns  in
         FStar_List.length uu____4862  in
       (FStar_List.length lid.FStar_Ident.ns) = uu____4861) &&
        (let uu____4866 = FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
         FStar_Ident.lid_equals uu____4866 ns)
  
let (delta_depth_of_declaration :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.qualifier Prims.list ->
      FStar_Syntax_Syntax.delta_depth)
  =
  fun lid  ->
    fun quals  ->
      let dd =
        let uu____4883 =
          (FStar_Syntax_Util.is_primop_lid lid) ||
            (FStar_All.pipe_right quals
               (FStar_Util.for_some
                  (fun uu___13_4890  ->
                     match uu___13_4890 with
                     | FStar_Syntax_Syntax.Projector uu____4892 -> true
                     | FStar_Syntax_Syntax.Discriminator uu____4898 -> true
                     | uu____4900 -> false)))
           in
        if uu____4883
        then FStar_Syntax_Syntax.delta_equational
        else FStar_Syntax_Syntax.delta_constant  in
      let uu____4905 =
        (FStar_All.pipe_right quals
           (FStar_Util.for_some
              (fun uu___14_4911  ->
                 match uu___14_4911 with
                 | FStar_Syntax_Syntax.Abstract  -> true
                 | uu____4914 -> false)))
          ||
          ((FStar_All.pipe_right quals
              (FStar_Util.for_some
                 (fun uu___15_4920  ->
                    match uu___15_4920 with
                    | FStar_Syntax_Syntax.Assumption  -> true
                    | uu____4923 -> false)))
             &&
             (let uu____4926 =
                FStar_All.pipe_right quals
                  (FStar_Util.for_some
                     (fun uu___16_4932  ->
                        match uu___16_4932 with
                        | FStar_Syntax_Syntax.New  -> true
                        | uu____4935 -> false))
                 in
              Prims.op_Negation uu____4926))
         in
      if uu____4905 then FStar_Syntax_Syntax.Delta_abstract dd else dd
  
let (try_lookup_name :
  Prims.bool ->
    Prims.bool ->
      env -> FStar_Ident.lident -> foundname FStar_Pervasives_Native.option)
  =
  fun any_val  ->
    fun exclude_interf  ->
      fun env  ->
        fun lid  ->
          let occurrence_range = FStar_Ident.range_of_lid lid  in
          let k_global_def source_lid uu___19_4987 =
            match uu___19_4987 with
            | (uu____4995,true ) when exclude_interf ->
                FStar_Pervasives_Native.None
            | (se,uu____4999) ->
                (match se.FStar_Syntax_Syntax.sigel with
                 | FStar_Syntax_Syntax.Sig_inductive_typ uu____5004 ->
                     let uu____5021 =
                       let uu____5022 =
                         let uu____5029 =
                           FStar_Syntax_Syntax.fvar source_lid
                             FStar_Syntax_Syntax.delta_constant
                             FStar_Pervasives_Native.None
                            in
                         (uu____5029, (se.FStar_Syntax_Syntax.sigattrs))  in
                       Term_name uu____5022  in
                     FStar_Pervasives_Native.Some uu____5021
                 | FStar_Syntax_Syntax.Sig_datacon uu____5032 ->
                     let uu____5048 =
                       let uu____5049 =
                         let uu____5056 =
                           let uu____5057 = fv_qual_of_se se  in
                           FStar_Syntax_Syntax.fvar source_lid
                             FStar_Syntax_Syntax.delta_constant uu____5057
                            in
                         (uu____5056, (se.FStar_Syntax_Syntax.sigattrs))  in
                       Term_name uu____5049  in
                     FStar_Pervasives_Native.Some uu____5048
                 | FStar_Syntax_Syntax.Sig_let ((uu____5062,lbs),uu____5064)
                     ->
                     let fv = lb_fv lbs source_lid  in
                     let uu____5076 =
                       let uu____5077 =
                         let uu____5084 =
                           FStar_Syntax_Syntax.fvar source_lid
                             fv.FStar_Syntax_Syntax.fv_delta
                             fv.FStar_Syntax_Syntax.fv_qual
                            in
                         (uu____5084, (se.FStar_Syntax_Syntax.sigattrs))  in
                       Term_name uu____5077  in
                     FStar_Pervasives_Native.Some uu____5076
                 | FStar_Syntax_Syntax.Sig_declare_typ
                     (lid1,uu____5088,uu____5089) ->
                     let quals = se.FStar_Syntax_Syntax.sigquals  in
                     let uu____5093 =
                       any_val ||
                         (FStar_All.pipe_right quals
                            (FStar_Util.for_some
                               (fun uu___17_5099  ->
                                  match uu___17_5099 with
                                  | FStar_Syntax_Syntax.Assumption  -> true
                                  | uu____5102 -> false)))
                        in
                     if uu____5093
                     then
                       let lid2 =
                         let uu____5108 = FStar_Ident.range_of_lid source_lid
                            in
                         FStar_Ident.set_lid_range lid1 uu____5108  in
                       let dd = delta_depth_of_declaration lid2 quals  in
                       let uu____5110 =
                         FStar_Util.find_map quals
                           (fun uu___18_5115  ->
                              match uu___18_5115 with
                              | FStar_Syntax_Syntax.Reflectable refl_monad ->
                                  FStar_Pervasives_Native.Some refl_monad
                              | uu____5119 -> FStar_Pervasives_Native.None)
                          in
                       (match uu____5110 with
                        | FStar_Pervasives_Native.Some refl_monad ->
                            let refl_const =
                              FStar_Syntax_Syntax.mk
                                (FStar_Syntax_Syntax.Tm_constant
                                   (FStar_Const.Const_reflect refl_monad))
                                FStar_Pervasives_Native.None occurrence_range
                               in
                            FStar_Pervasives_Native.Some
                              (Term_name
                                 (refl_const,
                                   (se.FStar_Syntax_Syntax.sigattrs)))
                        | uu____5128 ->
                            let uu____5131 =
                              let uu____5132 =
                                let uu____5139 =
                                  let uu____5140 = fv_qual_of_se se  in
                                  FStar_Syntax_Syntax.fvar lid2 dd uu____5140
                                   in
                                (uu____5139,
                                  (se.FStar_Syntax_Syntax.sigattrs))
                                 in
                              Term_name uu____5132  in
                            FStar_Pervasives_Native.Some uu____5131)
                     else FStar_Pervasives_Native.None
                 | FStar_Syntax_Syntax.Sig_new_effect ne ->
                     let uu____5148 =
                       let uu____5149 =
                         let uu____5154 =
                           let uu____5155 =
                             FStar_Ident.range_of_lid source_lid  in
                           FStar_Ident.set_lid_range
                             ne.FStar_Syntax_Syntax.mname uu____5155
                            in
                         (se, uu____5154)  in
                       Eff_name uu____5149  in
                     FStar_Pervasives_Native.Some uu____5148
                 | FStar_Syntax_Syntax.Sig_effect_abbrev uu____5156 ->
                     FStar_Pervasives_Native.Some (Eff_name (se, source_lid))
                 | FStar_Syntax_Syntax.Sig_splice (lids,t) ->
                     let uu____5175 =
                       let uu____5176 =
                         let uu____5183 =
                           FStar_Syntax_Syntax.fvar source_lid
                             (FStar_Syntax_Syntax.Delta_constant_at_level
                                Prims.int_one) FStar_Pervasives_Native.None
                            in
                         (uu____5183, [])  in
                       Term_name uu____5176  in
                     FStar_Pervasives_Native.Some uu____5175
                 | uu____5187 -> FStar_Pervasives_Native.None)
             in
          let k_local_binding r =
            let t =
              let uu____5205 = FStar_Ident.range_of_lid lid  in
              found_local_binding uu____5205 r  in
            FStar_Pervasives_Native.Some (Term_name (t, []))  in
          let k_rec_binding uu____5221 =
            match uu____5221 with
            | (id1,l,dd) ->
                let uu____5233 =
                  let uu____5234 =
                    let uu____5241 =
                      let uu____5242 =
                        let uu____5243 = FStar_Ident.range_of_lid lid  in
                        FStar_Ident.set_lid_range l uu____5243  in
                      FStar_Syntax_Syntax.fvar uu____5242 dd
                        FStar_Pervasives_Native.None
                       in
                    (uu____5241, [])  in
                  Term_name uu____5234  in
                FStar_Pervasives_Native.Some uu____5233
             in
          let found_unmangled =
            match lid.FStar_Ident.ns with
            | [] ->
                let uu____5251 = unmangleOpName lid.FStar_Ident.ident  in
                (match uu____5251 with
                 | FStar_Pervasives_Native.Some t ->
                     FStar_Pervasives_Native.Some (Term_name (t, []))
                 | uu____5259 -> FStar_Pervasives_Native.None)
            | uu____5262 -> FStar_Pervasives_Native.None  in
          match found_unmangled with
          | FStar_Pervasives_Native.None  ->
              resolve_in_open_namespaces' env lid k_local_binding
                k_rec_binding k_global_def
          | x -> x
  
let (try_lookup_effect_name' :
  Prims.bool ->
    env ->
      FStar_Ident.lident ->
        (FStar_Syntax_Syntax.sigelt * FStar_Ident.lident)
          FStar_Pervasives_Native.option)
  =
  fun exclude_interf  ->
    fun env  ->
      fun lid  ->
        let uu____5300 = try_lookup_name true exclude_interf env lid  in
        match uu____5300 with
        | FStar_Pervasives_Native.Some (Eff_name (o,l)) ->
            FStar_Pervasives_Native.Some (o, l)
        | uu____5316 -> FStar_Pervasives_Native.None
  
let (try_lookup_effect_name :
  env ->
    FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____5336 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l  in
      match uu____5336 with
      | FStar_Pervasives_Native.Some (o,l1) ->
          FStar_Pervasives_Native.Some l1
      | uu____5351 -> FStar_Pervasives_Native.None
  
let (try_lookup_effect_name_and_attributes :
  env ->
    FStar_Ident.lident ->
      (FStar_Ident.lident * FStar_Syntax_Syntax.cflag Prims.list)
        FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____5377 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l  in
      match uu____5377 with
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect
               ne;
             FStar_Syntax_Syntax.sigrng = uu____5393;
             FStar_Syntax_Syntax.sigquals = uu____5394;
             FStar_Syntax_Syntax.sigmeta = uu____5395;
             FStar_Syntax_Syntax.sigattrs = uu____5396;_},l1)
          ->
          FStar_Pervasives_Native.Some
            (l1, (ne.FStar_Syntax_Syntax.cattributes))
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_effect_abbrev
               (uu____5414,uu____5415,uu____5416,uu____5417,cattributes);
             FStar_Syntax_Syntax.sigrng = uu____5419;
             FStar_Syntax_Syntax.sigquals = uu____5420;
             FStar_Syntax_Syntax.sigmeta = uu____5421;
             FStar_Syntax_Syntax.sigattrs = uu____5422;_},l1)
          -> FStar_Pervasives_Native.Some (l1, cattributes)
      | uu____5444 -> FStar_Pervasives_Native.None
  
let (try_lookup_effect_defn :
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.eff_decl FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____5470 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l  in
      match uu____5470 with
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect
               ne;
             FStar_Syntax_Syntax.sigrng = uu____5480;
             FStar_Syntax_Syntax.sigquals = uu____5481;
             FStar_Syntax_Syntax.sigmeta = uu____5482;
             FStar_Syntax_Syntax.sigattrs = uu____5483;_},uu____5484)
          -> FStar_Pervasives_Native.Some ne
      | uu____5493 -> FStar_Pervasives_Native.None
  
let (is_effect_name : env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun lid  ->
      let uu____5512 = try_lookup_effect_name env lid  in
      match uu____5512 with
      | FStar_Pervasives_Native.None  -> false
      | FStar_Pervasives_Native.Some uu____5517 -> true
  
let (try_lookup_root_effect_name :
  env ->
    FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____5532 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l  in
      match uu____5532 with
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_effect_abbrev
               (l',uu____5542,uu____5543,uu____5544,uu____5545);
             FStar_Syntax_Syntax.sigrng = uu____5546;
             FStar_Syntax_Syntax.sigquals = uu____5547;
             FStar_Syntax_Syntax.sigmeta = uu____5548;
             FStar_Syntax_Syntax.sigattrs = uu____5549;_},uu____5550)
          ->
          let rec aux new_name =
            let uu____5571 =
              FStar_Util.smap_try_find (sigmap env) new_name.FStar_Ident.str
               in
            match uu____5571 with
            | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
            | FStar_Pervasives_Native.Some (s,uu____5592) ->
                (match s.FStar_Syntax_Syntax.sigel with
                 | FStar_Syntax_Syntax.Sig_new_effect ne ->
                     let uu____5603 =
                       let uu____5604 = FStar_Ident.range_of_lid l  in
                       FStar_Ident.set_lid_range ne.FStar_Syntax_Syntax.mname
                         uu____5604
                        in
                     FStar_Pervasives_Native.Some uu____5603
                 | FStar_Syntax_Syntax.Sig_effect_abbrev
                     (uu____5605,uu____5606,uu____5607,cmp,uu____5609) ->
                     let l'' = FStar_Syntax_Util.comp_effect_name cmp  in
                     aux l''
                 | uu____5615 -> FStar_Pervasives_Native.None)
             in
          aux l'
      | FStar_Pervasives_Native.Some (uu____5616,l') ->
          FStar_Pervasives_Native.Some l'
      | uu____5622 -> FStar_Pervasives_Native.None
  
let (lookup_letbinding_quals_and_attrs :
  env ->
    FStar_Ident.lident ->
      (FStar_Syntax_Syntax.qualifier Prims.list *
        FStar_Syntax_Syntax.attribute Prims.list))
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___20_5673 =
        match uu___20_5673 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ
               (uu____5689,uu____5690,uu____5691);
             FStar_Syntax_Syntax.sigrng = uu____5692;
             FStar_Syntax_Syntax.sigquals = quals;
             FStar_Syntax_Syntax.sigmeta = uu____5694;
             FStar_Syntax_Syntax.sigattrs = attrs;_},uu____5696)
            -> FStar_Pervasives_Native.Some (quals, attrs)
        | uu____5715 -> FStar_Pervasives_Native.None  in
      let uu____5729 =
        resolve_in_open_namespaces' env lid
          (fun uu____5749  -> FStar_Pervasives_Native.None)
          (fun uu____5759  -> FStar_Pervasives_Native.None) k_global_def
         in
      match uu____5729 with
      | FStar_Pervasives_Native.Some qa -> qa
      | uu____5793 -> ([], [])
  
let (try_lookup_module :
  env ->
    FStar_Ident.path ->
      FStar_Syntax_Syntax.modul FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun path  ->
      let uu____5821 =
        FStar_List.tryFind
          (fun uu____5836  ->
             match uu____5836 with
             | (mlid,modul) ->
                 let uu____5844 = FStar_Ident.path_of_lid mlid  in
                 uu____5844 = path) env.modules
         in
      match uu____5821 with
      | FStar_Pervasives_Native.Some (uu____5847,modul) ->
          FStar_Pervasives_Native.Some modul
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
  
let (try_lookup_let :
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___21_5887 =
        match uu___21_5887 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let
               ((uu____5895,lbs),uu____5897);
             FStar_Syntax_Syntax.sigrng = uu____5898;
             FStar_Syntax_Syntax.sigquals = uu____5899;
             FStar_Syntax_Syntax.sigmeta = uu____5900;
             FStar_Syntax_Syntax.sigattrs = uu____5901;_},uu____5902)
            ->
            let fv = lb_fv lbs lid1  in
            let uu____5920 =
              FStar_Syntax_Syntax.fvar lid1 fv.FStar_Syntax_Syntax.fv_delta
                fv.FStar_Syntax_Syntax.fv_qual
               in
            FStar_Pervasives_Native.Some uu____5920
        | uu____5921 -> FStar_Pervasives_Native.None  in
      resolve_in_open_namespaces' env lid
        (fun uu____5928  -> FStar_Pervasives_Native.None)
        (fun uu____5930  -> FStar_Pervasives_Native.None) k_global_def
  
let (try_lookup_definition :
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___22_5963 =
        match uu___22_5963 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let
               (lbs,uu____5974);
             FStar_Syntax_Syntax.sigrng = uu____5975;
             FStar_Syntax_Syntax.sigquals = uu____5976;
             FStar_Syntax_Syntax.sigmeta = uu____5977;
             FStar_Syntax_Syntax.sigattrs = uu____5978;_},uu____5979)
            ->
            FStar_Util.find_map (FStar_Pervasives_Native.snd lbs)
              (fun lb  ->
                 match lb.FStar_Syntax_Syntax.lbname with
                 | FStar_Util.Inr fv when
                     FStar_Syntax_Syntax.fv_eq_lid fv lid1 ->
                     FStar_Pervasives_Native.Some
                       (lb.FStar_Syntax_Syntax.lbdef)
                 | uu____6005 -> FStar_Pervasives_Native.None)
        | uu____6012 -> FStar_Pervasives_Native.None  in
      resolve_in_open_namespaces' env lid
        (fun uu____6023  -> FStar_Pervasives_Native.None)
        (fun uu____6027  -> FStar_Pervasives_Native.None) k_global_def
  
let (empty_include_smap :
  FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap) = new_sigmap () 
let (empty_exported_id_smap : exported_id_set FStar_Util.smap) =
  new_sigmap () 
let (try_lookup_lid' :
  Prims.bool ->
    Prims.bool ->
      env ->
        FStar_Ident.lident ->
          (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.attribute
            Prims.list) FStar_Pervasives_Native.option)
  =
  fun any_val  ->
    fun exclude_interface  ->
      fun env  ->
        fun lid  ->
          let uu____6087 = try_lookup_name any_val exclude_interface env lid
             in
          match uu____6087 with
          | FStar_Pervasives_Native.Some (Term_name (e,attrs)) ->
              FStar_Pervasives_Native.Some (e, attrs)
          | uu____6112 -> FStar_Pervasives_Native.None
  
let (drop_attributes :
  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.attribute Prims.list)
    FStar_Pervasives_Native.option ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun x  ->
    match x with
    | FStar_Pervasives_Native.Some (t,uu____6150) ->
        FStar_Pervasives_Native.Some t
    | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
  
let (try_lookup_lid_with_attributes :
  env ->
    FStar_Ident.lident ->
      (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.attribute Prims.list)
        FStar_Pervasives_Native.option)
  = fun env  -> fun l  -> try_lookup_lid' env.iface false env l 
let (try_lookup_lid :
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____6208 = try_lookup_lid_with_attributes env l  in
      FStar_All.pipe_right uu____6208 drop_attributes
  
let (resolve_to_fully_qualified_name :
  env ->
    FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____6240 = try_lookup_lid env l  in
      match uu____6240 with
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
      | FStar_Pervasives_Native.Some e ->
          let uu____6246 =
            let uu____6247 = FStar_Syntax_Subst.compress e  in
            uu____6247.FStar_Syntax_Syntax.n  in
          (match uu____6246 with
           | FStar_Syntax_Syntax.Tm_fvar fv ->
               FStar_Pervasives_Native.Some
                 ((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
           | uu____6253 -> FStar_Pervasives_Native.None)
  
let (shorten_lid' : env -> FStar_Ident.lident -> FStar_Ident.lident) =
  fun env  ->
    fun lid  ->
      let uu____6265 = shorten_module_path env lid.FStar_Ident.ns true  in
      match uu____6265 with
      | (uu____6275,short) ->
          FStar_Ident.lid_of_ns_and_id short lid.FStar_Ident.ident
  
let (shorten_lid : env -> FStar_Ident.lid -> FStar_Ident.lid) =
  fun env  ->
    fun lid  ->
      match env.curmodule with
      | FStar_Pervasives_Native.None  -> shorten_lid' env lid
      | uu____6296 ->
          let lid_without_ns =
            FStar_Ident.lid_of_ns_and_id [] lid.FStar_Ident.ident  in
          let uu____6300 = resolve_to_fully_qualified_name env lid_without_ns
             in
          (match uu____6300 with
           | FStar_Pervasives_Native.Some lid' when
               lid'.FStar_Ident.str = lid.FStar_Ident.str -> lid_without_ns
           | uu____6305 -> shorten_lid' env lid)
  
let (try_lookup_lid_with_attributes_no_resolve :
  env ->
    FStar_Ident.lident ->
      (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.attribute Prims.list)
        FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let env' =
        let uu___862_6336 = env  in
        {
          curmodule = (uu___862_6336.curmodule);
          curmonad = (uu___862_6336.curmonad);
          modules = (uu___862_6336.modules);
          scope_mods = [];
          exported_ids = empty_exported_id_smap;
          trans_exported_ids = (uu___862_6336.trans_exported_ids);
          includes = empty_include_smap;
          sigaccum = (uu___862_6336.sigaccum);
          sigmap = (uu___862_6336.sigmap);
          iface = (uu___862_6336.iface);
          admitted_iface = (uu___862_6336.admitted_iface);
          expect_typ = (uu___862_6336.expect_typ);
          docs = (uu___862_6336.docs);
          remaining_iface_decls = (uu___862_6336.remaining_iface_decls);
          syntax_only = (uu___862_6336.syntax_only);
          ds_hooks = (uu___862_6336.ds_hooks);
          dep_graph = (uu___862_6336.dep_graph)
        }  in
      try_lookup_lid_with_attributes env' l
  
let (try_lookup_lid_no_resolve :
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun l  ->
      let uu____6352 = try_lookup_lid_with_attributes_no_resolve env l  in
      FStar_All.pipe_right uu____6352 drop_attributes
  
let (try_lookup_doc :
  env ->
    FStar_Ident.lid -> FStar_Parser_AST.fsdoc FStar_Pervasives_Native.option)
  = fun env  -> fun l  -> FStar_Util.smap_try_find env.docs l.FStar_Ident.str 
let (try_lookup_datacon :
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.fv FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 se =
        match se with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ
               (uu____6422,uu____6423,uu____6424);
             FStar_Syntax_Syntax.sigrng = uu____6425;
             FStar_Syntax_Syntax.sigquals = quals;
             FStar_Syntax_Syntax.sigmeta = uu____6427;
             FStar_Syntax_Syntax.sigattrs = uu____6428;_},uu____6429)
            ->
            let uu____6436 =
              FStar_All.pipe_right quals
                (FStar_Util.for_some
                   (fun uu___23_6442  ->
                      match uu___23_6442 with
                      | FStar_Syntax_Syntax.Assumption  -> true
                      | uu____6445 -> false))
               in
            if uu____6436
            then
              let uu____6450 =
                FStar_Syntax_Syntax.lid_as_fv lid1
                  FStar_Syntax_Syntax.delta_constant
                  FStar_Pervasives_Native.None
                 in
              FStar_Pervasives_Native.Some uu____6450
            else FStar_Pervasives_Native.None
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon
               uu____6453;
             FStar_Syntax_Syntax.sigrng = uu____6454;
             FStar_Syntax_Syntax.sigquals = uu____6455;
             FStar_Syntax_Syntax.sigmeta = uu____6456;
             FStar_Syntax_Syntax.sigattrs = uu____6457;_},uu____6458)
            ->
            let qual1 = fv_qual_of_se (FStar_Pervasives_Native.fst se)  in
            let uu____6484 =
              FStar_Syntax_Syntax.lid_as_fv lid1
                FStar_Syntax_Syntax.delta_constant qual1
               in
            FStar_Pervasives_Native.Some uu____6484
        | uu____6485 -> FStar_Pervasives_Native.None  in
      resolve_in_open_namespaces' env lid
        (fun uu____6492  -> FStar_Pervasives_Native.None)
        (fun uu____6494  -> FStar_Pervasives_Native.None) k_global_def
  
let (find_all_datacons :
  env ->
    FStar_Ident.lident ->
      FStar_Ident.lident Prims.list FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___24_6529 =
        match uu___24_6529 with
        | ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_inductive_typ
               (uu____6539,uu____6540,uu____6541,uu____6542,datas,uu____6544);
             FStar_Syntax_Syntax.sigrng = uu____6545;
             FStar_Syntax_Syntax.sigquals = uu____6546;
             FStar_Syntax_Syntax.sigmeta = uu____6547;
             FStar_Syntax_Syntax.sigattrs = uu____6548;_},uu____6549)
            -> FStar_Pervasives_Native.Some datas
        | uu____6566 -> FStar_Pervasives_Native.None  in
      resolve_in_open_namespaces' env lid
        (fun uu____6577  -> FStar_Pervasives_Native.None)
        (fun uu____6581  -> FStar_Pervasives_Native.None) k_global_def
  
let (record_cache_aux_with_filter :
  ((((unit -> unit) * (unit -> unit)) * (((unit -> (Prims.int * unit)) *
    (Prims.int FStar_Pervasives_Native.option -> unit)) *
    ((unit -> record_or_dc Prims.list) * (record_or_dc -> unit)))) *
    (unit -> unit)))
  =
  let record_cache = FStar_Util.mk_ref [[]]  in
  let push1 uu____6660 =
    let uu____6661 =
      let uu____6666 =
        let uu____6669 = FStar_ST.op_Bang record_cache  in
        FStar_List.hd uu____6669  in
      let uu____6703 = FStar_ST.op_Bang record_cache  in uu____6666 ::
        uu____6703
       in
    FStar_ST.op_Colon_Equals record_cache uu____6661  in
  let pop1 uu____6769 =
    let uu____6770 =
      let uu____6775 = FStar_ST.op_Bang record_cache  in
      FStar_List.tl uu____6775  in
    FStar_ST.op_Colon_Equals record_cache uu____6770  in
  let snapshot1 uu____6846 = FStar_Common.snapshot push1 record_cache ()  in
  let rollback1 depth = FStar_Common.rollback pop1 record_cache depth  in
  let peek1 uu____6870 =
    let uu____6871 = FStar_ST.op_Bang record_cache  in
    FStar_List.hd uu____6871  in
  let insert r =
    let uu____6911 =
      let uu____6916 = let uu____6919 = peek1 ()  in r :: uu____6919  in
      let uu____6922 =
        let uu____6927 = FStar_ST.op_Bang record_cache  in
        FStar_List.tl uu____6927  in
      uu____6916 :: uu____6922  in
    FStar_ST.op_Colon_Equals record_cache uu____6911  in
  let filter1 uu____6995 =
    let rc = peek1 ()  in
    let filtered =
      FStar_List.filter
        (fun r  -> Prims.op_Negation r.is_private_or_abstract) rc
       in
    let uu____7004 =
      let uu____7009 =
        let uu____7014 = FStar_ST.op_Bang record_cache  in
        FStar_List.tl uu____7014  in
      filtered :: uu____7009  in
    FStar_ST.op_Colon_Equals record_cache uu____7004  in
  let aux = ((push1, pop1), ((snapshot1, rollback1), (peek1, insert)))  in
  (aux, filter1) 
let (record_cache_aux :
  (((unit -> unit) * (unit -> unit)) * (((unit -> (Prims.int * unit)) *
    (Prims.int FStar_Pervasives_Native.option -> unit)) *
    ((unit -> record_or_dc Prims.list) * (record_or_dc -> unit)))))
  = FStar_Pervasives_Native.fst record_cache_aux_with_filter 
let (filter_record_cache : unit -> unit) =
  FStar_Pervasives_Native.snd record_cache_aux_with_filter 
let (push_record_cache : unit -> unit) =
  FStar_Pervasives_Native.fst (FStar_Pervasives_Native.fst record_cache_aux) 
let (pop_record_cache : unit -> unit) =
  FStar_Pervasives_Native.snd (FStar_Pervasives_Native.fst record_cache_aux) 
let (snapshot_record_cache : unit -> (Prims.int * unit)) =
  FStar_Pervasives_Native.fst
    (FStar_Pervasives_Native.fst
       (FStar_Pervasives_Native.snd record_cache_aux))
  
let (rollback_record_cache :
  Prims.int FStar_Pervasives_Native.option -> unit) =
  FStar_Pervasives_Native.snd
    (FStar_Pervasives_Native.fst
       (FStar_Pervasives_Native.snd record_cache_aux))
  
let (peek_record_cache : unit -> record_or_dc Prims.list) =
  FStar_Pervasives_Native.fst
    (FStar_Pervasives_Native.snd
       (FStar_Pervasives_Native.snd record_cache_aux))
  
let (insert_record_cache : record_or_dc -> unit) =
  FStar_Pervasives_Native.snd
    (FStar_Pervasives_Native.snd
       (FStar_Pervasives_Native.snd record_cache_aux))
  
let (extract_record :
  env ->
    scope_mod Prims.list FStar_ST.ref -> FStar_Syntax_Syntax.sigelt -> unit)
  =
  fun e  ->
    fun new_globs  ->
      fun se  ->
        match se.FStar_Syntax_Syntax.sigel with
        | FStar_Syntax_Syntax.Sig_bundle (sigs,uu____7940) ->
            let is_record =
              FStar_Util.for_some
                (fun uu___25_7959  ->
                   match uu___25_7959 with
                   | FStar_Syntax_Syntax.RecordType uu____7961 -> true
                   | FStar_Syntax_Syntax.RecordConstructor uu____7971 -> true
                   | uu____7981 -> false)
               in
            let find_dc dc =
              FStar_All.pipe_right sigs
                (FStar_Util.find_opt
                   (fun uu___26_8006  ->
                      match uu___26_8006 with
                      | {
                          FStar_Syntax_Syntax.sigel =
                            FStar_Syntax_Syntax.Sig_datacon
                            (lid,uu____8009,uu____8010,uu____8011,uu____8012,uu____8013);
                          FStar_Syntax_Syntax.sigrng = uu____8014;
                          FStar_Syntax_Syntax.sigquals = uu____8015;
                          FStar_Syntax_Syntax.sigmeta = uu____8016;
                          FStar_Syntax_Syntax.sigattrs = uu____8017;_} ->
                          FStar_Ident.lid_equals dc lid
                      | uu____8028 -> false))
               in
            FStar_All.pipe_right sigs
              (FStar_List.iter
                 (fun uu___27_8064  ->
                    match uu___27_8064 with
                    | {
                        FStar_Syntax_Syntax.sigel =
                          FStar_Syntax_Syntax.Sig_inductive_typ
                          (typename,univs1,parms,uu____8068,uu____8069,dc::[]);
                        FStar_Syntax_Syntax.sigrng = uu____8071;
                        FStar_Syntax_Syntax.sigquals = typename_quals;
                        FStar_Syntax_Syntax.sigmeta = uu____8073;
                        FStar_Syntax_Syntax.sigattrs = uu____8074;_} ->
                        let uu____8085 =
                          let uu____8086 = find_dc dc  in
                          FStar_All.pipe_left FStar_Util.must uu____8086  in
                        (match uu____8085 with
                         | {
                             FStar_Syntax_Syntax.sigel =
                               FStar_Syntax_Syntax.Sig_datacon
                               (constrname,uu____8092,t,uu____8094,uu____8095,uu____8096);
                             FStar_Syntax_Syntax.sigrng = uu____8097;
                             FStar_Syntax_Syntax.sigquals = uu____8098;
                             FStar_Syntax_Syntax.sigmeta = uu____8099;
                             FStar_Syntax_Syntax.sigattrs = uu____8100;_} ->
                             let uu____8111 =
                               FStar_Syntax_Util.arrow_formals t  in
                             (match uu____8111 with
                              | (formals,uu____8127) ->
                                  let is_rec = is_record typename_quals  in
                                  let formals' =
                                    FStar_All.pipe_right formals
                                      (FStar_List.collect
                                         (fun uu____8181  ->
                                            match uu____8181 with
                                            | (x,q) ->
                                                let uu____8194 =
                                                  (FStar_Syntax_Syntax.is_null_bv
                                                     x)
                                                    ||
                                                    (is_rec &&
                                                       (FStar_Syntax_Syntax.is_implicit
                                                          q))
                                                   in
                                                if uu____8194
                                                then []
                                                else [(x, q)]))
                                     in
                                  let fields' =
                                    FStar_All.pipe_right formals'
                                      (FStar_List.map
                                         (fun uu____8249  ->
                                            match uu____8249 with
                                            | (x,q) ->
                                                ((x.FStar_Syntax_Syntax.ppname),
                                                  (x.FStar_Syntax_Syntax.sort))))
                                     in
                                  let fields = fields'  in
                                  let record =
                                    {
                                      typename;
                                      constrname =
                                        (constrname.FStar_Ident.ident);
                                      parms;
                                      fields;
                                      is_private_or_abstract =
                                        ((FStar_List.contains
                                            FStar_Syntax_Syntax.Private
                                            typename_quals)
                                           ||
                                           (FStar_List.contains
                                              FStar_Syntax_Syntax.Abstract
                                              typename_quals));
                                      is_record = is_rec
                                    }  in
                                  ((let uu____8273 =
                                      let uu____8276 =
                                        FStar_ST.op_Bang new_globs  in
                                      (Record_or_dc record) :: uu____8276  in
                                    FStar_ST.op_Colon_Equals new_globs
                                      uu____8273);
                                   (match () with
                                    | () ->
                                        ((let add_field uu____8335 =
                                            match uu____8335 with
                                            | (id1,uu____8341) ->
                                                let modul =
                                                  let uu____8344 =
                                                    FStar_Ident.lid_of_ids
                                                      constrname.FStar_Ident.ns
                                                     in
                                                  uu____8344.FStar_Ident.str
                                                   in
                                                let uu____8345 =
                                                  get_exported_id_set e modul
                                                   in
                                                (match uu____8345 with
                                                 | FStar_Pervasives_Native.Some
                                                     my_ex ->
                                                     let my_exported_ids =
                                                       my_ex
                                                         Exported_id_field
                                                        in
                                                     ((let uu____8368 =
                                                         let uu____8369 =
                                                           FStar_ST.op_Bang
                                                             my_exported_ids
                                                            in
                                                         FStar_Util.set_add
                                                           id1.FStar_Ident.idText
                                                           uu____8369
                                                          in
                                                       FStar_ST.op_Colon_Equals
                                                         my_exported_ids
                                                         uu____8368);
                                                      (match () with
                                                       | () ->
                                                           let projname =
                                                             let uu____8414 =
                                                               let uu____8415
                                                                 =
                                                                 FStar_Syntax_Util.mk_field_projector_name_from_ident
                                                                   constrname
                                                                   id1
                                                                  in
                                                               uu____8415.FStar_Ident.ident
                                                                in
                                                             uu____8414.FStar_Ident.idText
                                                              in
                                                           let uu____8417 =
                                                             let uu____8418 =
                                                               FStar_ST.op_Bang
                                                                 my_exported_ids
                                                                in
                                                             FStar_Util.set_add
                                                               projname
                                                               uu____8418
                                                              in
                                                           FStar_ST.op_Colon_Equals
                                                             my_exported_ids
                                                             uu____8417))
                                                 | FStar_Pervasives_Native.None
                                                      -> ())
                                             in
                                          FStar_List.iter add_field fields');
                                         (match () with
                                          | () -> insert_record_cache record)))))
                         | uu____8470 -> ())
                    | uu____8471 -> ()))
        | uu____8472 -> ()
  
let (try_lookup_record_or_dc_by_field_name :
  env -> FStar_Ident.lident -> record_or_dc FStar_Pervasives_Native.option) =
  fun env  ->
    fun fieldname  ->
      let find_in_cache fieldname1 =
        let uu____8494 =
          ((fieldname1.FStar_Ident.ns), (fieldname1.FStar_Ident.ident))  in
        match uu____8494 with
        | (ns,id1) ->
            let uu____8511 = peek_record_cache ()  in
            FStar_Util.find_map uu____8511
              (fun record  ->
                 let uu____8517 =
                   find_in_record ns id1 record (fun r  -> Cont_ok r)  in
                 option_of_cont
                   (fun uu____8523  -> FStar_Pervasives_Native.None)
                   uu____8517)
         in
      resolve_in_open_namespaces'' env fieldname Exported_id_field
        (fun uu____8525  -> Cont_ignore) (fun uu____8527  -> Cont_ignore)
        (fun r  -> Cont_ok r)
        (fun fn  ->
           let uu____8533 = find_in_cache fn  in
           cont_of_option Cont_ignore uu____8533)
        (fun k  -> fun uu____8539  -> k)
  
let (try_lookup_record_by_field_name :
  env -> FStar_Ident.lident -> record_or_dc FStar_Pervasives_Native.option) =
  fun env  ->
    fun fieldname  ->
      let uu____8555 = try_lookup_record_or_dc_by_field_name env fieldname
         in
      match uu____8555 with
      | FStar_Pervasives_Native.Some r when r.is_record ->
          FStar_Pervasives_Native.Some r
      | uu____8561 -> FStar_Pervasives_Native.None
  
let (belongs_to_record :
  env -> FStar_Ident.lident -> record_or_dc -> Prims.bool) =
  fun env  ->
    fun lid  ->
      fun record  ->
        let uu____8581 = try_lookup_record_by_field_name env lid  in
        match uu____8581 with
        | FStar_Pervasives_Native.Some record' when
            let uu____8586 =
              let uu____8588 =
                FStar_Ident.path_of_ns (record.typename).FStar_Ident.ns  in
              FStar_Ident.text_of_path uu____8588  in
            let uu____8589 =
              let uu____8591 =
                FStar_Ident.path_of_ns (record'.typename).FStar_Ident.ns  in
              FStar_Ident.text_of_path uu____8591  in
            uu____8586 = uu____8589 ->
            let uu____8593 =
              find_in_record (record.typename).FStar_Ident.ns
                lid.FStar_Ident.ident record (fun uu____8597  -> Cont_ok ())
               in
            (match uu____8593 with
             | Cont_ok uu____8599 -> true
             | uu____8601 -> false)
        | uu____8605 -> false
  
let (try_lookup_dc_by_field_name :
  env ->
    FStar_Ident.lident ->
      (FStar_Ident.lident * Prims.bool) FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun fieldname  ->
      let uu____8627 = try_lookup_record_or_dc_by_field_name env fieldname
         in
      match uu____8627 with
      | FStar_Pervasives_Native.Some r ->
          let uu____8638 =
            let uu____8644 =
              let uu____8645 =
                FStar_Ident.lid_of_ids
                  (FStar_List.append (r.typename).FStar_Ident.ns
                     [r.constrname])
                 in
              let uu____8646 = FStar_Ident.range_of_lid fieldname  in
              FStar_Ident.set_lid_range uu____8645 uu____8646  in
            (uu____8644, (r.is_record))  in
          FStar_Pervasives_Native.Some uu____8638
      | uu____8653 -> FStar_Pervasives_Native.None
  
let (string_set_ref_new : unit -> Prims.string FStar_Util.set FStar_ST.ref) =
  fun uu____8671  ->
    let uu____8672 = FStar_Util.new_set FStar_Util.compare  in
    FStar_Util.mk_ref uu____8672
  
let (exported_id_set_new :
  unit -> exported_id_kind -> Prims.string FStar_Util.set FStar_ST.ref) =
  fun uu____8693  ->
    let term_type_set = string_set_ref_new ()  in
    let field_set = string_set_ref_new ()  in
    fun uu___28_8706  ->
      match uu___28_8706 with
      | Exported_id_term_type  -> term_type_set
      | Exported_id_field  -> field_set
  
let (unique :
  Prims.bool -> Prims.bool -> env -> FStar_Ident.lident -> Prims.bool) =
  fun any_val  ->
    fun exclude_interface  ->
      fun env  ->
        fun lid  ->
          let filter_scope_mods uu___29_8744 =
            match uu___29_8744 with
            | Rec_binding uu____8746 -> true
            | uu____8748 -> false  in
          let this_env =
            let uu___1088_8751 = env  in
            let uu____8752 =
              FStar_List.filter filter_scope_mods env.scope_mods  in
            {
              curmodule = (uu___1088_8751.curmodule);
              curmonad = (uu___1088_8751.curmonad);
              modules = (uu___1088_8751.modules);
              scope_mods = uu____8752;
              exported_ids = empty_exported_id_smap;
              trans_exported_ids = (uu___1088_8751.trans_exported_ids);
              includes = empty_include_smap;
              sigaccum = (uu___1088_8751.sigaccum);
              sigmap = (uu___1088_8751.sigmap);
              iface = (uu___1088_8751.iface);
              admitted_iface = (uu___1088_8751.admitted_iface);
              expect_typ = (uu___1088_8751.expect_typ);
              docs = (uu___1088_8751.docs);
              remaining_iface_decls = (uu___1088_8751.remaining_iface_decls);
              syntax_only = (uu___1088_8751.syntax_only);
              ds_hooks = (uu___1088_8751.ds_hooks);
              dep_graph = (uu___1088_8751.dep_graph)
            }  in
          let uu____8755 =
            try_lookup_lid' any_val exclude_interface this_env lid  in
          match uu____8755 with
          | FStar_Pervasives_Native.None  -> true
          | FStar_Pervasives_Native.Some uu____8772 -> false
  
let (push_scope_mod : env -> scope_mod -> env) =
  fun env  ->
    fun scope_mod  ->
      let uu___1096_8797 = env  in
      {
        curmodule = (uu___1096_8797.curmodule);
        curmonad = (uu___1096_8797.curmonad);
        modules = (uu___1096_8797.modules);
        scope_mods = (scope_mod :: (env.scope_mods));
        exported_ids = (uu___1096_8797.exported_ids);
        trans_exported_ids = (uu___1096_8797.trans_exported_ids);
        includes = (uu___1096_8797.includes);
        sigaccum = (uu___1096_8797.sigaccum);
        sigmap = (uu___1096_8797.sigmap);
        iface = (uu___1096_8797.iface);
        admitted_iface = (uu___1096_8797.admitted_iface);
        expect_typ = (uu___1096_8797.expect_typ);
        docs = (uu___1096_8797.docs);
        remaining_iface_decls = (uu___1096_8797.remaining_iface_decls);
        syntax_only = (uu___1096_8797.syntax_only);
        ds_hooks = (uu___1096_8797.ds_hooks);
        dep_graph = (uu___1096_8797.dep_graph)
      }
  
let (push_bv : env -> FStar_Ident.ident -> (env * FStar_Syntax_Syntax.bv)) =
  fun env  ->
    fun x  ->
      let bv =
        FStar_Syntax_Syntax.gen_bv x.FStar_Ident.idText
          (FStar_Pervasives_Native.Some (x.FStar_Ident.idRange))
          FStar_Syntax_Syntax.tun
         in
      ((push_scope_mod env (Local_binding (x, bv))), bv)
  
let (push_top_level_rec_binding :
  env -> FStar_Ident.ident -> FStar_Syntax_Syntax.delta_depth -> env) =
  fun env  ->
    fun x  ->
      fun dd  ->
        let l = qualify env x  in
        let uu____8831 =
          (unique false true env l) || (FStar_Options.interactive ())  in
        if uu____8831
        then push_scope_mod env (Rec_binding (x, l, dd))
        else
          (let uu____8838 = FStar_Ident.range_of_lid l  in
           FStar_Errors.raise_error
             (FStar_Errors.Fatal_DuplicateTopLevelNames,
               (Prims.op_Hat "Duplicate top-level names " l.FStar_Ident.str))
             uu____8838)
  
let (push_sigelt' : Prims.bool -> env -> FStar_Syntax_Syntax.sigelt -> env) =
  fun fail_on_dup  ->
    fun env  ->
      fun s  ->
        let err l =
          let sopt = FStar_Util.smap_try_find (sigmap env) l.FStar_Ident.str
             in
          let r =
            match sopt with
            | FStar_Pervasives_Native.Some (se,uu____8882) ->
                let uu____8890 =
                  FStar_Util.find_opt (FStar_Ident.lid_equals l)
                    (FStar_Syntax_Util.lids_of_sigelt se)
                   in
                (match uu____8890 with
                 | FStar_Pervasives_Native.Some l1 ->
                     let uu____8895 = FStar_Ident.range_of_lid l1  in
                     FStar_All.pipe_left FStar_Range.string_of_range
                       uu____8895
                 | FStar_Pervasives_Native.None  -> "<unknown>")
            | FStar_Pervasives_Native.None  -> "<unknown>"  in
          let uu____8904 =
            let uu____8910 =
              let uu____8912 = FStar_Ident.text_of_lid l  in
              FStar_Util.format2
                "Duplicate top-level names [%s]; previously declared at %s"
                uu____8912 r
               in
            (FStar_Errors.Fatal_DuplicateTopLevelNames, uu____8910)  in
          let uu____8916 = FStar_Ident.range_of_lid l  in
          FStar_Errors.raise_error uu____8904 uu____8916  in
        let globals = FStar_Util.mk_ref env.scope_mods  in
        let env1 =
          let uu____8925 =
            match s.FStar_Syntax_Syntax.sigel with
            | FStar_Syntax_Syntax.Sig_let uu____8938 -> (false, true)
            | FStar_Syntax_Syntax.Sig_bundle uu____8949 -> (false, true)
            | uu____8962 -> (false, false)  in
          match uu____8925 with
          | (any_val,exclude_interface) ->
              let lids = FStar_Syntax_Util.lids_of_sigelt s  in
              let uu____8976 =
                FStar_Util.find_map lids
                  (fun l  ->
                     let uu____8982 =
                       let uu____8984 =
                         unique any_val exclude_interface env l  in
                       Prims.op_Negation uu____8984  in
                     if uu____8982
                     then FStar_Pervasives_Native.Some l
                     else FStar_Pervasives_Native.None)
                 in
              (match uu____8976 with
               | FStar_Pervasives_Native.Some l when fail_on_dup -> err l
               | uu____8992 ->
                   (extract_record env globals s;
                    (let uu___1137_8996 = env  in
                     {
                       curmodule = (uu___1137_8996.curmodule);
                       curmonad = (uu___1137_8996.curmonad);
                       modules = (uu___1137_8996.modules);
                       scope_mods = (uu___1137_8996.scope_mods);
                       exported_ids = (uu___1137_8996.exported_ids);
                       trans_exported_ids =
                         (uu___1137_8996.trans_exported_ids);
                       includes = (uu___1137_8996.includes);
                       sigaccum = (s :: (env.sigaccum));
                       sigmap = (uu___1137_8996.sigmap);
                       iface = (uu___1137_8996.iface);
                       admitted_iface = (uu___1137_8996.admitted_iface);
                       expect_typ = (uu___1137_8996.expect_typ);
                       docs = (uu___1137_8996.docs);
                       remaining_iface_decls =
                         (uu___1137_8996.remaining_iface_decls);
                       syntax_only = (uu___1137_8996.syntax_only);
                       ds_hooks = (uu___1137_8996.ds_hooks);
                       dep_graph = (uu___1137_8996.dep_graph)
                     })))
           in
        let env2 =
          let uu___1140_8998 = env1  in
          let uu____8999 = FStar_ST.op_Bang globals  in
          {
            curmodule = (uu___1140_8998.curmodule);
            curmonad = (uu___1140_8998.curmonad);
            modules = (uu___1140_8998.modules);
            scope_mods = uu____8999;
            exported_ids = (uu___1140_8998.exported_ids);
            trans_exported_ids = (uu___1140_8998.trans_exported_ids);
            includes = (uu___1140_8998.includes);
            sigaccum = (uu___1140_8998.sigaccum);
            sigmap = (uu___1140_8998.sigmap);
            iface = (uu___1140_8998.iface);
            admitted_iface = (uu___1140_8998.admitted_iface);
            expect_typ = (uu___1140_8998.expect_typ);
            docs = (uu___1140_8998.docs);
            remaining_iface_decls = (uu___1140_8998.remaining_iface_decls);
            syntax_only = (uu___1140_8998.syntax_only);
            ds_hooks = (uu___1140_8998.ds_hooks);
            dep_graph = (uu___1140_8998.dep_graph)
          }  in
        let uu____9025 =
          match s.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_bundle (ses,uu____9051) ->
              let uu____9060 =
                FStar_List.map
                  (fun se  -> ((FStar_Syntax_Util.lids_of_sigelt se), se))
                  ses
                 in
              (env2, uu____9060)
          | uu____9087 -> (env2, [((FStar_Syntax_Util.lids_of_sigelt s), s)])
           in
        match uu____9025 with
        | (env3,lss) ->
            (FStar_All.pipe_right lss
               (FStar_List.iter
                  (fun uu____9146  ->
                     match uu____9146 with
                     | (lids,se) ->
                         FStar_All.pipe_right lids
                           (FStar_List.iter
                              (fun lid  ->
                                 (let uu____9168 =
                                    let uu____9171 = FStar_ST.op_Bang globals
                                       in
                                    (Top_level_def (lid.FStar_Ident.ident))
                                      :: uu____9171
                                     in
                                  FStar_ST.op_Colon_Equals globals uu____9168);
                                 (match () with
                                  | () ->
                                      let modul =
                                        let uu____9222 =
                                          FStar_Ident.lid_of_ids
                                            lid.FStar_Ident.ns
                                           in
                                        uu____9222.FStar_Ident.str  in
                                      ((let uu____9224 =
                                          get_exported_id_set env3 modul  in
                                        match uu____9224 with
                                        | FStar_Pervasives_Native.Some f ->
                                            let my_exported_ids =
                                              f Exported_id_term_type  in
                                            let uu____9246 =
                                              let uu____9247 =
                                                FStar_ST.op_Bang
                                                  my_exported_ids
                                                 in
                                              FStar_Util.set_add
                                                (lid.FStar_Ident.ident).FStar_Ident.idText
                                                uu____9247
                                               in
                                            FStar_ST.op_Colon_Equals
                                              my_exported_ids uu____9246
                                        | FStar_Pervasives_Native.None  -> ());
                                       (match () with
                                        | () ->
                                            let is_iface =
                                              env3.iface &&
                                                (Prims.op_Negation
                                                   env3.admitted_iface)
                                               in
                                            FStar_Util.smap_add (sigmap env3)
                                              lid.FStar_Ident.str
                                              (se,
                                                (env3.iface &&
                                                   (Prims.op_Negation
                                                      env3.admitted_iface))))))))));
             (let env4 =
                let uu___1165_9304 = env3  in
                let uu____9305 = FStar_ST.op_Bang globals  in
                {
                  curmodule = (uu___1165_9304.curmodule);
                  curmonad = (uu___1165_9304.curmonad);
                  modules = (uu___1165_9304.modules);
                  scope_mods = uu____9305;
                  exported_ids = (uu___1165_9304.exported_ids);
                  trans_exported_ids = (uu___1165_9304.trans_exported_ids);
                  includes = (uu___1165_9304.includes);
                  sigaccum = (uu___1165_9304.sigaccum);
                  sigmap = (uu___1165_9304.sigmap);
                  iface = (uu___1165_9304.iface);
                  admitted_iface = (uu___1165_9304.admitted_iface);
                  expect_typ = (uu___1165_9304.expect_typ);
                  docs = (uu___1165_9304.docs);
                  remaining_iface_decls =
                    (uu___1165_9304.remaining_iface_decls);
                  syntax_only = (uu___1165_9304.syntax_only);
                  ds_hooks = (uu___1165_9304.ds_hooks);
                  dep_graph = (uu___1165_9304.dep_graph)
                }  in
              env4))
  
let (push_sigelt : env -> FStar_Syntax_Syntax.sigelt -> env) =
  fun env  -> fun se  -> push_sigelt' true env se 
let (push_sigelt_force : env -> FStar_Syntax_Syntax.sigelt -> env) =
  fun env  -> fun se  -> push_sigelt' false env se 
let (push_namespace : env -> FStar_Ident.lident -> env) =
  fun env  ->
    fun ns  ->
      let uu____9366 =
        let uu____9371 = resolve_module_name env ns false  in
        match uu____9371 with
        | FStar_Pervasives_Native.None  ->
            let modules = env.modules  in
            let uu____9386 =
              FStar_All.pipe_right modules
                (FStar_Util.for_some
                   (fun uu____9404  ->
                      match uu____9404 with
                      | (m,uu____9411) ->
                          let uu____9412 =
                            let uu____9414 = FStar_Ident.text_of_lid m  in
                            Prims.op_Hat uu____9414 "."  in
                          let uu____9417 =
                            let uu____9419 = FStar_Ident.text_of_lid ns  in
                            Prims.op_Hat uu____9419 "."  in
                          FStar_Util.starts_with uu____9412 uu____9417))
               in
            if uu____9386
            then (ns, Open_namespace)
            else
              (let uu____9429 =
                 let uu____9435 =
                   let uu____9437 = FStar_Ident.text_of_lid ns  in
                   FStar_Util.format1 "Namespace %s cannot be found"
                     uu____9437
                    in
                 (FStar_Errors.Fatal_NameSpaceNotFound, uu____9435)  in
               let uu____9441 = FStar_Ident.range_of_lid ns  in
               FStar_Errors.raise_error uu____9429 uu____9441)
        | FStar_Pervasives_Native.Some ns' ->
            (fail_if_curmodule env ns ns'; (ns', Open_module))
         in
      match uu____9366 with
      | (ns',kd) ->
          ((env.ds_hooks).ds_push_open_hook env (ns', kd);
           push_scope_mod env (Open_module_or_namespace (ns', kd)))
  
let (push_include : env -> FStar_Ident.lident -> env) =
  fun env  ->
    fun ns  ->
      let ns0 = ns  in
      let uu____9463 = resolve_module_name env ns false  in
      match uu____9463 with
      | FStar_Pervasives_Native.Some ns1 ->
          ((env.ds_hooks).ds_push_include_hook env ns1;
           fail_if_curmodule env ns0 ns1;
           (let env1 =
              push_scope_mod env
                (Open_module_or_namespace (ns1, Open_module))
               in
            let curmod =
              let uu____9473 = current_module env1  in
              uu____9473.FStar_Ident.str  in
            (let uu____9475 = FStar_Util.smap_try_find env1.includes curmod
                in
             match uu____9475 with
             | FStar_Pervasives_Native.None  -> ()
             | FStar_Pervasives_Native.Some incl ->
                 let uu____9499 =
                   let uu____9502 = FStar_ST.op_Bang incl  in ns1 ::
                     uu____9502
                    in
                 FStar_ST.op_Colon_Equals incl uu____9499);
            (match () with
             | () ->
                 let uu____9551 =
                   get_trans_exported_id_set env1 ns1.FStar_Ident.str  in
                 (match uu____9551 with
                  | FStar_Pervasives_Native.Some ns_trans_exports ->
                      ((let uu____9571 =
                          let uu____9668 = get_exported_id_set env1 curmod
                             in
                          let uu____9715 =
                            get_trans_exported_id_set env1 curmod  in
                          (uu____9668, uu____9715)  in
                        match uu____9571 with
                        | (FStar_Pervasives_Native.Some
                           cur_exports,FStar_Pervasives_Native.Some
                           cur_trans_exports) ->
                            let update_exports k =
                              let ns_ex =
                                let uu____10131 = ns_trans_exports k  in
                                FStar_ST.op_Bang uu____10131  in
                              let ex = cur_exports k  in
                              (let uu____10232 =
                                 let uu____10236 = FStar_ST.op_Bang ex  in
                                 FStar_Util.set_difference uu____10236 ns_ex
                                  in
                               FStar_ST.op_Colon_Equals ex uu____10232);
                              (match () with
                               | () ->
                                   let trans_ex = cur_trans_exports k  in
                                   let uu____10328 =
                                     let uu____10332 =
                                       FStar_ST.op_Bang trans_ex  in
                                     FStar_Util.set_union uu____10332 ns_ex
                                      in
                                   FStar_ST.op_Colon_Equals trans_ex
                                     uu____10328)
                               in
                            FStar_List.iter update_exports
                              all_exported_id_kinds
                        | uu____10381 -> ());
                       (match () with | () -> env1))
                  | FStar_Pervasives_Native.None  ->
                      let uu____10483 =
                        let uu____10489 =
                          FStar_Util.format1
                            "include: Module %s was not prepared"
                            ns1.FStar_Ident.str
                           in
                        (FStar_Errors.Fatal_IncludeModuleNotPrepared,
                          uu____10489)
                         in
                      let uu____10493 = FStar_Ident.range_of_lid ns1  in
                      FStar_Errors.raise_error uu____10483 uu____10493))))
      | uu____10494 ->
          let uu____10497 =
            let uu____10503 =
              FStar_Util.format1 "include: Module %s cannot be found"
                ns.FStar_Ident.str
               in
            (FStar_Errors.Fatal_ModuleNotFound, uu____10503)  in
          let uu____10507 = FStar_Ident.range_of_lid ns  in
          FStar_Errors.raise_error uu____10497 uu____10507
  
let (push_module_abbrev :
  env -> FStar_Ident.ident -> FStar_Ident.lident -> env) =
  fun env  ->
    fun x  ->
      fun l  ->
        let uu____10524 = module_is_defined env l  in
        if uu____10524
        then
          (fail_if_curmodule env l l;
           (env.ds_hooks).ds_push_module_abbrev_hook env x l;
           push_scope_mod env (Module_abbrev (x, l)))
        else
          (let uu____10531 =
             let uu____10537 =
               let uu____10539 = FStar_Ident.text_of_lid l  in
               FStar_Util.format1 "Module %s cannot be found" uu____10539  in
             (FStar_Errors.Fatal_ModuleNotFound, uu____10537)  in
           let uu____10543 = FStar_Ident.range_of_lid l  in
           FStar_Errors.raise_error uu____10531 uu____10543)
  
let (push_doc :
  env ->
    FStar_Ident.lident ->
      FStar_Parser_AST.fsdoc FStar_Pervasives_Native.option -> env)
  =
  fun env  ->
    fun l  ->
      fun doc_opt  ->
        match doc_opt with
        | FStar_Pervasives_Native.None  -> env
        | FStar_Pervasives_Native.Some doc1 ->
            ((let uu____10566 =
                FStar_Util.smap_try_find env.docs l.FStar_Ident.str  in
              match uu____10566 with
              | FStar_Pervasives_Native.None  -> ()
              | FStar_Pervasives_Native.Some old_doc ->
                  let uu____10570 = FStar_Ident.range_of_lid l  in
                  let uu____10571 =
                    let uu____10577 =
                      let uu____10579 = FStar_Ident.string_of_lid l  in
                      let uu____10581 =
                        FStar_Parser_AST.string_of_fsdoc old_doc  in
                      let uu____10583 = FStar_Parser_AST.string_of_fsdoc doc1
                         in
                      FStar_Util.format3
                        "Overwriting doc of %s; old doc was [%s]; new doc are [%s]"
                        uu____10579 uu____10581 uu____10583
                       in
                    (FStar_Errors.Warning_DocOverwrite, uu____10577)  in
                  FStar_Errors.log_issue uu____10570 uu____10571);
             FStar_Util.smap_add env.docs l.FStar_Ident.str doc1;
             env)
  
let (check_admits :
  env -> FStar_Syntax_Syntax.modul -> FStar_Syntax_Syntax.modul) =
  fun env  ->
    fun m  ->
      let admitted_sig_lids =
        FStar_All.pipe_right env.sigaccum
          (FStar_List.fold_left
             (fun lids  ->
                fun se  ->
                  match se.FStar_Syntax_Syntax.sigel with
                  | FStar_Syntax_Syntax.Sig_declare_typ (l,u,t) when
                      let uu____10629 =
                        FStar_All.pipe_right se.FStar_Syntax_Syntax.sigquals
                          (FStar_List.contains FStar_Syntax_Syntax.Assumption)
                         in
                      Prims.op_Negation uu____10629 ->
                      let uu____10634 =
                        FStar_Util.smap_try_find (sigmap env)
                          l.FStar_Ident.str
                         in
                      (match uu____10634 with
                       | FStar_Pervasives_Native.Some
                           ({
                              FStar_Syntax_Syntax.sigel =
                                FStar_Syntax_Syntax.Sig_let uu____10649;
                              FStar_Syntax_Syntax.sigrng = uu____10650;
                              FStar_Syntax_Syntax.sigquals = uu____10651;
                              FStar_Syntax_Syntax.sigmeta = uu____10652;
                              FStar_Syntax_Syntax.sigattrs = uu____10653;_},uu____10654)
                           -> lids
                       | FStar_Pervasives_Native.Some
                           ({
                              FStar_Syntax_Syntax.sigel =
                                FStar_Syntax_Syntax.Sig_inductive_typ
                                uu____10672;
                              FStar_Syntax_Syntax.sigrng = uu____10673;
                              FStar_Syntax_Syntax.sigquals = uu____10674;
                              FStar_Syntax_Syntax.sigmeta = uu____10675;
                              FStar_Syntax_Syntax.sigattrs = uu____10676;_},uu____10677)
                           -> lids
                       | uu____10705 ->
                           ((let uu____10714 =
                               let uu____10716 = FStar_Options.interactive ()
                                  in
                               Prims.op_Negation uu____10716  in
                             if uu____10714
                             then
                               let uu____10719 = FStar_Ident.range_of_lid l
                                  in
                               let uu____10720 =
                                 let uu____10726 =
                                   let uu____10728 =
                                     FStar_Ident.string_of_lid l  in
                                   FStar_Util.format1
                                     "Admitting %s without a definition"
                                     uu____10728
                                    in
                                 (FStar_Errors.Warning_AdmitWithoutDefinition,
                                   uu____10726)
                                  in
                               FStar_Errors.log_issue uu____10719 uu____10720
                             else ());
                            (let quals = FStar_Syntax_Syntax.Assumption ::
                               (se.FStar_Syntax_Syntax.sigquals)  in
                             FStar_Util.smap_add (sigmap env)
                               l.FStar_Ident.str
                               ((let uu___1268_10745 = se  in
                                 {
                                   FStar_Syntax_Syntax.sigel =
                                     (uu___1268_10745.FStar_Syntax_Syntax.sigel);
                                   FStar_Syntax_Syntax.sigrng =
                                     (uu___1268_10745.FStar_Syntax_Syntax.sigrng);
                                   FStar_Syntax_Syntax.sigquals = quals;
                                   FStar_Syntax_Syntax.sigmeta =
                                     (uu___1268_10745.FStar_Syntax_Syntax.sigmeta);
                                   FStar_Syntax_Syntax.sigattrs =
                                     (uu___1268_10745.FStar_Syntax_Syntax.sigattrs)
                                 }), false);
                             l
                             ::
                             lids)))
                  | uu____10747 -> lids) [])
         in
      let uu___1273_10748 = m  in
      let uu____10749 =
        FStar_All.pipe_right m.FStar_Syntax_Syntax.declarations
          (FStar_List.map
             (fun s  ->
                match s.FStar_Syntax_Syntax.sigel with
                | FStar_Syntax_Syntax.Sig_declare_typ
                    (lid,uu____10759,uu____10760) when
                    FStar_List.existsb
                      (fun l  -> FStar_Ident.lid_equals l lid)
                      admitted_sig_lids
                    ->
                    let uu___1282_10763 = s  in
                    {
                      FStar_Syntax_Syntax.sigel =
                        (uu___1282_10763.FStar_Syntax_Syntax.sigel);
                      FStar_Syntax_Syntax.sigrng =
                        (uu___1282_10763.FStar_Syntax_Syntax.sigrng);
                      FStar_Syntax_Syntax.sigquals =
                        (FStar_Syntax_Syntax.Assumption ::
                        (s.FStar_Syntax_Syntax.sigquals));
                      FStar_Syntax_Syntax.sigmeta =
                        (uu___1282_10763.FStar_Syntax_Syntax.sigmeta);
                      FStar_Syntax_Syntax.sigattrs =
                        (uu___1282_10763.FStar_Syntax_Syntax.sigattrs)
                    }
                | uu____10764 -> s))
         in
      {
        FStar_Syntax_Syntax.name = (uu___1273_10748.FStar_Syntax_Syntax.name);
        FStar_Syntax_Syntax.declarations = uu____10749;
        FStar_Syntax_Syntax.exports =
          (uu___1273_10748.FStar_Syntax_Syntax.exports);
        FStar_Syntax_Syntax.is_interface =
          (uu___1273_10748.FStar_Syntax_Syntax.is_interface)
      }
  
let (finish : env -> FStar_Syntax_Syntax.modul -> env) =
  fun env  ->
    fun modul  ->
      FStar_All.pipe_right modul.FStar_Syntax_Syntax.declarations
        (FStar_List.iter
           (fun se  ->
              let quals = se.FStar_Syntax_Syntax.sigquals  in
              match se.FStar_Syntax_Syntax.sigel with
              | FStar_Syntax_Syntax.Sig_bundle (ses,uu____10788) ->
                  if
                    (FStar_List.contains FStar_Syntax_Syntax.Private quals)
                      ||
                      (FStar_List.contains FStar_Syntax_Syntax.Abstract quals)
                  then
                    FStar_All.pipe_right ses
                      (FStar_List.iter
                         (fun se1  ->
                            match se1.FStar_Syntax_Syntax.sigel with
                            | FStar_Syntax_Syntax.Sig_datacon
                                (lid,uu____10809,uu____10810,uu____10811,uu____10812,uu____10813)
                                ->
                                FStar_Util.smap_remove (sigmap env)
                                  lid.FStar_Ident.str
                            | FStar_Syntax_Syntax.Sig_inductive_typ
                                (lid,univ_names,binders,typ,uu____10829,uu____10830)
                                ->
                                (FStar_Util.smap_remove (sigmap env)
                                   lid.FStar_Ident.str;
                                 if
                                   Prims.op_Negation
                                     (FStar_List.contains
                                        FStar_Syntax_Syntax.Private quals)
                                 then
                                   (let sigel =
                                      let uu____10847 =
                                        let uu____10854 =
                                          let uu____10855 =
                                            FStar_Ident.range_of_lid lid  in
                                          let uu____10856 =
                                            let uu____10863 =
                                              let uu____10864 =
                                                let uu____10879 =
                                                  FStar_Syntax_Syntax.mk_Total
                                                    typ
                                                   in
                                                (binders, uu____10879)  in
                                              FStar_Syntax_Syntax.Tm_arrow
                                                uu____10864
                                               in
                                            FStar_Syntax_Syntax.mk
                                              uu____10863
                                             in
                                          uu____10856
                                            FStar_Pervasives_Native.None
                                            uu____10855
                                           in
                                        (lid, univ_names, uu____10854)  in
                                      FStar_Syntax_Syntax.Sig_declare_typ
                                        uu____10847
                                       in
                                    let se2 =
                                      let uu___1314_10893 = se1  in
                                      {
                                        FStar_Syntax_Syntax.sigel = sigel;
                                        FStar_Syntax_Syntax.sigrng =
                                          (uu___1314_10893.FStar_Syntax_Syntax.sigrng);
                                        FStar_Syntax_Syntax.sigquals =
                                          (FStar_Syntax_Syntax.Assumption ::
                                          quals);
                                        FStar_Syntax_Syntax.sigmeta =
                                          (uu___1314_10893.FStar_Syntax_Syntax.sigmeta);
                                        FStar_Syntax_Syntax.sigattrs =
                                          (uu___1314_10893.FStar_Syntax_Syntax.sigattrs)
                                      }  in
                                    FStar_Util.smap_add (sigmap env)
                                      lid.FStar_Ident.str (se2, false))
                                 else ())
                            | uu____10903 -> ()))
                  else ()
              | FStar_Syntax_Syntax.Sig_declare_typ
                  (lid,uu____10907,uu____10908) ->
                  if FStar_List.contains FStar_Syntax_Syntax.Private quals
                  then
                    FStar_Util.smap_remove (sigmap env) lid.FStar_Ident.str
                  else ()
              | FStar_Syntax_Syntax.Sig_let ((uu____10917,lbs),uu____10919)
                  ->
                  (if
                     (FStar_List.contains FStar_Syntax_Syntax.Private quals)
                       ||
                       (FStar_List.contains FStar_Syntax_Syntax.Abstract
                          quals)
                   then
                     FStar_All.pipe_right lbs
                       (FStar_List.iter
                          (fun lb  ->
                             let uu____10937 =
                               let uu____10939 =
                                 let uu____10940 =
                                   let uu____10943 =
                                     FStar_Util.right
                                       lb.FStar_Syntax_Syntax.lbname
                                      in
                                   uu____10943.FStar_Syntax_Syntax.fv_name
                                    in
                                 uu____10940.FStar_Syntax_Syntax.v  in
                               uu____10939.FStar_Ident.str  in
                             FStar_Util.smap_remove (sigmap env) uu____10937))
                   else ();
                   if
                     (FStar_List.contains FStar_Syntax_Syntax.Abstract quals)
                       &&
                       (Prims.op_Negation
                          (FStar_List.contains FStar_Syntax_Syntax.Private
                             quals))
                   then
                     FStar_All.pipe_right lbs
                       (FStar_List.iter
                          (fun lb  ->
                             let lid =
                               let uu____10960 =
                                 let uu____10963 =
                                   FStar_Util.right
                                     lb.FStar_Syntax_Syntax.lbname
                                    in
                                 uu____10963.FStar_Syntax_Syntax.fv_name  in
                               uu____10960.FStar_Syntax_Syntax.v  in
                             let quals1 = FStar_Syntax_Syntax.Assumption ::
                               quals  in
                             let decl =
                               let uu___1337_10968 = se  in
                               {
                                 FStar_Syntax_Syntax.sigel =
                                   (FStar_Syntax_Syntax.Sig_declare_typ
                                      (lid, (lb.FStar_Syntax_Syntax.lbunivs),
                                        (lb.FStar_Syntax_Syntax.lbtyp)));
                                 FStar_Syntax_Syntax.sigrng =
                                   (uu___1337_10968.FStar_Syntax_Syntax.sigrng);
                                 FStar_Syntax_Syntax.sigquals = quals1;
                                 FStar_Syntax_Syntax.sigmeta =
                                   (uu___1337_10968.FStar_Syntax_Syntax.sigmeta);
                                 FStar_Syntax_Syntax.sigattrs =
                                   (uu___1337_10968.FStar_Syntax_Syntax.sigattrs)
                               }  in
                             FStar_Util.smap_add (sigmap env)
                               lid.FStar_Ident.str (decl, false)))
                   else ())
              | uu____10978 -> ()));
      (let curmod =
         let uu____10981 = current_module env  in uu____10981.FStar_Ident.str
          in
       (let uu____10983 =
          let uu____11080 = get_exported_id_set env curmod  in
          let uu____11127 = get_trans_exported_id_set env curmod  in
          (uu____11080, uu____11127)  in
        match uu____10983 with
        | (FStar_Pervasives_Native.Some cur_ex,FStar_Pervasives_Native.Some
           cur_trans_ex) ->
            let update_exports eikind =
              let cur_ex_set =
                let uu____11546 = cur_ex eikind  in
                FStar_ST.op_Bang uu____11546  in
              let cur_trans_ex_set_ref = cur_trans_ex eikind  in
              let uu____11652 =
                let uu____11656 = FStar_ST.op_Bang cur_trans_ex_set_ref  in
                FStar_Util.set_union cur_ex_set uu____11656  in
              FStar_ST.op_Colon_Equals cur_trans_ex_set_ref uu____11652  in
            FStar_List.iter update_exports all_exported_id_kinds
        | uu____11705 -> ());
       (match () with
        | () ->
            (filter_record_cache ();
             (match () with
              | () ->
                  let uu___1355_11803 = env  in
                  {
                    curmodule = FStar_Pervasives_Native.None;
                    curmonad = (uu___1355_11803.curmonad);
                    modules = (((modul.FStar_Syntax_Syntax.name), modul) ::
                      (env.modules));
                    scope_mods = [];
                    exported_ids = (uu___1355_11803.exported_ids);
                    trans_exported_ids = (uu___1355_11803.trans_exported_ids);
                    includes = (uu___1355_11803.includes);
                    sigaccum = [];
                    sigmap = (uu___1355_11803.sigmap);
                    iface = (uu___1355_11803.iface);
                    admitted_iface = (uu___1355_11803.admitted_iface);
                    expect_typ = (uu___1355_11803.expect_typ);
                    docs = (uu___1355_11803.docs);
                    remaining_iface_decls =
                      (uu___1355_11803.remaining_iface_decls);
                    syntax_only = (uu___1355_11803.syntax_only);
                    ds_hooks = (uu___1355_11803.ds_hooks);
                    dep_graph = (uu___1355_11803.dep_graph)
                  }))))
  
let (stack : env Prims.list FStar_ST.ref) = FStar_Util.mk_ref [] 
let (push : env -> env) =
  fun env  ->
    FStar_Util.atomically
      (fun uu____11830  ->
         push_record_cache ();
         (let uu____11833 =
            let uu____11836 = FStar_ST.op_Bang stack  in env :: uu____11836
             in
          FStar_ST.op_Colon_Equals stack uu____11833);
         (let uu___1361_11885 = env  in
          let uu____11886 = FStar_Util.smap_copy env.exported_ids  in
          let uu____11891 = FStar_Util.smap_copy env.trans_exported_ids  in
          let uu____11896 = FStar_Util.smap_copy env.includes  in
          let uu____11907 = FStar_Util.smap_copy env.sigmap  in
          let uu____11920 = FStar_Util.smap_copy env.docs  in
          {
            curmodule = (uu___1361_11885.curmodule);
            curmonad = (uu___1361_11885.curmonad);
            modules = (uu___1361_11885.modules);
            scope_mods = (uu___1361_11885.scope_mods);
            exported_ids = uu____11886;
            trans_exported_ids = uu____11891;
            includes = uu____11896;
            sigaccum = (uu___1361_11885.sigaccum);
            sigmap = uu____11907;
            iface = (uu___1361_11885.iface);
            admitted_iface = (uu___1361_11885.admitted_iface);
            expect_typ = (uu___1361_11885.expect_typ);
            docs = uu____11920;
            remaining_iface_decls = (uu___1361_11885.remaining_iface_decls);
            syntax_only = (uu___1361_11885.syntax_only);
            ds_hooks = (uu___1361_11885.ds_hooks);
            dep_graph = (uu___1361_11885.dep_graph)
          }))
  
let (pop : unit -> env) =
  fun uu____11928  ->
    FStar_Util.atomically
      (fun uu____11935  ->
         let uu____11936 = FStar_ST.op_Bang stack  in
         match uu____11936 with
         | env::tl1 ->
             (pop_record_cache (); FStar_ST.op_Colon_Equals stack tl1; env)
         | uu____11991 -> failwith "Impossible: Too many pops")
  
let (snapshot : env -> (Prims.int * env)) =
  fun env  -> FStar_Common.snapshot push stack env 
let (rollback : Prims.int FStar_Pervasives_Native.option -> env) =
  fun depth  -> FStar_Common.rollback pop stack depth 
let (export_interface : FStar_Ident.lident -> env -> env) =
  fun m  ->
    fun env  ->
      let sigelt_in_m se =
        match FStar_Syntax_Util.lids_of_sigelt se with
        | l::uu____12038 -> l.FStar_Ident.nsstr = m.FStar_Ident.str
        | uu____12042 -> false  in
      let sm = sigmap env  in
      let env1 = pop ()  in
      let keys = FStar_Util.smap_keys sm  in
      let sm' = sigmap env1  in
      FStar_All.pipe_right keys
        (FStar_List.iter
           (fun k  ->
              let uu____12084 = FStar_Util.smap_try_find sm' k  in
              match uu____12084 with
              | FStar_Pervasives_Native.Some (se,true ) when sigelt_in_m se
                  ->
                  (FStar_Util.smap_remove sm' k;
                   (let se1 =
                      match se.FStar_Syntax_Syntax.sigel with
                      | FStar_Syntax_Syntax.Sig_declare_typ (l,u,t) ->
                          let uu___1396_12115 = se  in
                          {
                            FStar_Syntax_Syntax.sigel =
                              (uu___1396_12115.FStar_Syntax_Syntax.sigel);
                            FStar_Syntax_Syntax.sigrng =
                              (uu___1396_12115.FStar_Syntax_Syntax.sigrng);
                            FStar_Syntax_Syntax.sigquals =
                              (FStar_Syntax_Syntax.Assumption ::
                              (se.FStar_Syntax_Syntax.sigquals));
                            FStar_Syntax_Syntax.sigmeta =
                              (uu___1396_12115.FStar_Syntax_Syntax.sigmeta);
                            FStar_Syntax_Syntax.sigattrs =
                              (uu___1396_12115.FStar_Syntax_Syntax.sigattrs)
                          }
                      | uu____12116 -> se  in
                    FStar_Util.smap_add sm' k (se1, false)))
              | uu____12124 -> ()));
      env1
  
let (finish_module_or_interface :
  env -> FStar_Syntax_Syntax.modul -> (env * FStar_Syntax_Syntax.modul)) =
  fun env  ->
    fun modul  ->
      let modul1 =
        if Prims.op_Negation modul.FStar_Syntax_Syntax.is_interface
        then check_admits env modul
        else modul  in
      let uu____12151 = finish env modul1  in (uu____12151, modul1)
  
type exported_ids =
  {
  exported_id_terms: Prims.string Prims.list ;
  exported_id_fields: Prims.string Prims.list }
let (__proj__Mkexported_ids__item__exported_id_terms :
  exported_ids -> Prims.string Prims.list) =
  fun projectee  ->
    match projectee with
    | { exported_id_terms; exported_id_fields;_} -> exported_id_terms
  
let (__proj__Mkexported_ids__item__exported_id_fields :
  exported_ids -> Prims.string Prims.list) =
  fun projectee  ->
    match projectee with
    | { exported_id_terms; exported_id_fields;_} -> exported_id_fields
  
let (as_exported_ids : exported_id_set -> exported_ids) =
  fun e  ->
    let terms =
      let uu____12220 =
        let uu____12224 = e Exported_id_term_type  in
        FStar_ST.op_Bang uu____12224  in
      FStar_Util.set_elements uu____12220  in
    let fields =
      let uu____12287 =
        let uu____12291 = e Exported_id_field  in
        FStar_ST.op_Bang uu____12291  in
      FStar_Util.set_elements uu____12287  in
    { exported_id_terms = terms; exported_id_fields = fields }
  
let (as_exported_id_set :
  exported_ids FStar_Pervasives_Native.option ->
    exported_id_kind -> Prims.string FStar_Util.set FStar_ST.ref)
  =
  fun e  ->
    match e with
    | FStar_Pervasives_Native.None  -> exported_id_set_new ()
    | FStar_Pervasives_Native.Some e1 ->
        let terms =
          let uu____12383 =
            FStar_Util.as_set e1.exported_id_terms FStar_Util.compare  in
          FStar_Util.mk_ref uu____12383  in
        let fields =
          let uu____12397 =
            FStar_Util.as_set e1.exported_id_fields FStar_Util.compare  in
          FStar_Util.mk_ref uu____12397  in
        (fun uu___30_12405  ->
           match uu___30_12405 with
           | Exported_id_term_type  -> terms
           | Exported_id_field  -> fields)
  
type module_inclusion_info =
  {
  mii_exported_ids: exported_ids FStar_Pervasives_Native.option ;
  mii_trans_exported_ids: exported_ids FStar_Pervasives_Native.option ;
  mii_includes: FStar_Ident.lident Prims.list FStar_Pervasives_Native.option }
let (__proj__Mkmodule_inclusion_info__item__mii_exported_ids :
  module_inclusion_info -> exported_ids FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { mii_exported_ids; mii_trans_exported_ids; mii_includes;_} ->
        mii_exported_ids
  
let (__proj__Mkmodule_inclusion_info__item__mii_trans_exported_ids :
  module_inclusion_info -> exported_ids FStar_Pervasives_Native.option) =
  fun projectee  ->
    match projectee with
    | { mii_exported_ids; mii_trans_exported_ids; mii_includes;_} ->
        mii_trans_exported_ids
  
let (__proj__Mkmodule_inclusion_info__item__mii_includes :
  module_inclusion_info ->
    FStar_Ident.lident Prims.list FStar_Pervasives_Native.option)
  =
  fun projectee  ->
    match projectee with
    | { mii_exported_ids; mii_trans_exported_ids; mii_includes;_} ->
        mii_includes
  
let (default_mii : module_inclusion_info) =
  {
    mii_exported_ids = FStar_Pervasives_Native.None;
    mii_trans_exported_ids = FStar_Pervasives_Native.None;
    mii_includes = FStar_Pervasives_Native.None
  } 
let as_includes :
  'Auu____12509 .
    'Auu____12509 Prims.list FStar_Pervasives_Native.option ->
      'Auu____12509 Prims.list FStar_ST.ref
  =
  fun uu___31_12522  ->
    match uu___31_12522 with
    | FStar_Pervasives_Native.None  -> FStar_Util.mk_ref []
    | FStar_Pervasives_Native.Some l -> FStar_Util.mk_ref l
  
let (inclusion_info : env -> FStar_Ident.lident -> module_inclusion_info) =
  fun env  ->
    fun l  ->
      let mname = FStar_Ident.string_of_lid l  in
      let as_ids_opt m =
        let uu____12565 = FStar_Util.smap_try_find m mname  in
        FStar_Util.map_opt uu____12565 as_exported_ids  in
      let uu____12571 = as_ids_opt env.exported_ids  in
      let uu____12574 = as_ids_opt env.trans_exported_ids  in
      let uu____12577 =
        let uu____12582 = FStar_Util.smap_try_find env.includes mname  in
        FStar_Util.map_opt uu____12582 (fun r  -> FStar_ST.op_Bang r)  in
      {
        mii_exported_ids = uu____12571;
        mii_trans_exported_ids = uu____12574;
        mii_includes = uu____12577
      }
  
let (prepare_module_or_interface :
  Prims.bool ->
    Prims.bool ->
      env ->
        FStar_Ident.lident -> module_inclusion_info -> (env * Prims.bool))
  =
  fun intf  ->
    fun admitted  ->
      fun env  ->
        fun mname  ->
          fun mii  ->
            let prep env1 =
              let filename =
                let uu____12671 = FStar_Ident.text_of_lid mname  in
                FStar_Util.strcat uu____12671 ".fst"  in
              let auto_open =
                FStar_Parser_Dep.hard_coded_dependencies filename  in
              let auto_open1 =
                let convert_kind uu___32_12693 =
                  match uu___32_12693 with
                  | FStar_Parser_Dep.Open_namespace  -> Open_namespace
                  | FStar_Parser_Dep.Open_module  -> Open_module  in
                FStar_List.map
                  (fun uu____12705  ->
                     match uu____12705 with
                     | (lid,kind) -> (lid, (convert_kind kind))) auto_open
                 in
              let namespace_of_module =
                if (FStar_List.length mname.FStar_Ident.ns) > Prims.int_zero
                then
                  let uu____12731 =
                    let uu____12736 =
                      FStar_Ident.lid_of_ids mname.FStar_Ident.ns  in
                    (uu____12736, Open_namespace)  in
                  [uu____12731]
                else []  in
              let auto_open2 =
                FStar_List.append namespace_of_module
                  (FStar_List.rev auto_open1)
                 in
              (let uu____12767 = as_exported_id_set mii.mii_exported_ids  in
               FStar_Util.smap_add env1.exported_ids mname.FStar_Ident.str
                 uu____12767);
              (match () with
               | () ->
                   ((let uu____12772 =
                       as_exported_id_set mii.mii_trans_exported_ids  in
                     FStar_Util.smap_add env1.trans_exported_ids
                       mname.FStar_Ident.str uu____12772);
                    (match () with
                     | () ->
                         ((let uu____12777 = as_includes mii.mii_includes  in
                           FStar_Util.smap_add env1.includes
                             mname.FStar_Ident.str uu____12777);
                          (match () with
                           | () ->
                               let env' =
                                 let uu___1466_12787 = env1  in
                                 let uu____12788 =
                                   FStar_List.map
                                     (fun x  -> Open_module_or_namespace x)
                                     auto_open2
                                    in
                                 {
                                   curmodule =
                                     (FStar_Pervasives_Native.Some mname);
                                   curmonad = (uu___1466_12787.curmonad);
                                   modules = (uu___1466_12787.modules);
                                   scope_mods = uu____12788;
                                   exported_ids =
                                     (uu___1466_12787.exported_ids);
                                   trans_exported_ids =
                                     (uu___1466_12787.trans_exported_ids);
                                   includes = (uu___1466_12787.includes);
                                   sigaccum = (uu___1466_12787.sigaccum);
                                   sigmap = (env1.sigmap);
                                   iface = intf;
                                   admitted_iface = admitted;
                                   expect_typ = (uu___1466_12787.expect_typ);
                                   docs = (uu___1466_12787.docs);
                                   remaining_iface_decls =
                                     (uu___1466_12787.remaining_iface_decls);
                                   syntax_only =
                                     (uu___1466_12787.syntax_only);
                                   ds_hooks = (uu___1466_12787.ds_hooks);
                                   dep_graph = (uu___1466_12787.dep_graph)
                                 }  in
                               (FStar_List.iter
                                  (fun op  ->
                                     (env1.ds_hooks).ds_push_open_hook env'
                                       op) (FStar_List.rev auto_open2);
                                env'))))))
               in
            let uu____12800 =
              FStar_All.pipe_right env.modules
                (FStar_Util.find_opt
                   (fun uu____12826  ->
                      match uu____12826 with
                      | (l,uu____12833) -> FStar_Ident.lid_equals l mname))
               in
            match uu____12800 with
            | FStar_Pervasives_Native.None  ->
                let uu____12843 = prep env  in (uu____12843, false)
            | FStar_Pervasives_Native.Some (uu____12846,m) ->
                ((let uu____12853 =
                    (let uu____12857 = FStar_Options.interactive ()  in
                     Prims.op_Negation uu____12857) &&
                      ((Prims.op_Negation m.FStar_Syntax_Syntax.is_interface)
                         || intf)
                     in
                  if uu____12853
                  then
                    let uu____12860 =
                      let uu____12866 =
                        FStar_Util.format1
                          "Duplicate module or interface name: %s"
                          mname.FStar_Ident.str
                         in
                      (FStar_Errors.Fatal_DuplicateModuleOrInterface,
                        uu____12866)
                       in
                    let uu____12870 = FStar_Ident.range_of_lid mname  in
                    FStar_Errors.raise_error uu____12860 uu____12870
                  else ());
                 (let uu____12873 =
                    let uu____12874 = push env  in prep uu____12874  in
                  (uu____12873, true)))
  
let (enter_monad_scope : env -> FStar_Ident.ident -> env) =
  fun env  ->
    fun mname  ->
      match env.curmonad with
      | FStar_Pervasives_Native.Some mname' ->
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_MonadAlreadyDefined,
              (Prims.op_Hat "Trying to define monad "
                 (Prims.op_Hat mname.FStar_Ident.idText
                    (Prims.op_Hat ", but already in monad scope "
                       mname'.FStar_Ident.idText))))
            mname.FStar_Ident.idRange
      | FStar_Pervasives_Native.None  ->
          let uu___1487_12892 = env  in
          {
            curmodule = (uu___1487_12892.curmodule);
            curmonad = (FStar_Pervasives_Native.Some mname);
            modules = (uu___1487_12892.modules);
            scope_mods = (uu___1487_12892.scope_mods);
            exported_ids = (uu___1487_12892.exported_ids);
            trans_exported_ids = (uu___1487_12892.trans_exported_ids);
            includes = (uu___1487_12892.includes);
            sigaccum = (uu___1487_12892.sigaccum);
            sigmap = (uu___1487_12892.sigmap);
            iface = (uu___1487_12892.iface);
            admitted_iface = (uu___1487_12892.admitted_iface);
            expect_typ = (uu___1487_12892.expect_typ);
            docs = (uu___1487_12892.docs);
            remaining_iface_decls = (uu___1487_12892.remaining_iface_decls);
            syntax_only = (uu___1487_12892.syntax_only);
            ds_hooks = (uu___1487_12892.ds_hooks);
            dep_graph = (uu___1487_12892.dep_graph)
          }
  
let fail_or :
  'a .
    env ->
      (FStar_Ident.lident -> 'a FStar_Pervasives_Native.option) ->
        FStar_Ident.lident -> 'a
  =
  fun env  ->
    fun lookup1  ->
      fun lid  ->
        let uu____12927 = lookup1 lid  in
        match uu____12927 with
        | FStar_Pervasives_Native.None  ->
            let opened_modules =
              FStar_List.map
                (fun uu____12942  ->
                   match uu____12942 with
                   | (lid1,uu____12949) -> FStar_Ident.text_of_lid lid1)
                env.modules
               in
            let msg =
              let uu____12952 = FStar_Ident.text_of_lid lid  in
              FStar_Util.format1 "Identifier not found: [%s]" uu____12952  in
            let msg1 =
              if (FStar_List.length lid.FStar_Ident.ns) = Prims.int_zero
              then msg
              else
                (let modul =
                   let uu____12964 =
                     FStar_Ident.lid_of_ids lid.FStar_Ident.ns  in
                   let uu____12965 = FStar_Ident.range_of_lid lid  in
                   FStar_Ident.set_lid_range uu____12964 uu____12965  in
                 let uu____12966 = resolve_module_name env modul true  in
                 match uu____12966 with
                 | FStar_Pervasives_Native.None  ->
                     let opened_modules1 =
                       FStar_String.concat ", " opened_modules  in
                     FStar_Util.format3
                       "%s\nModule %s does not belong to the list of modules in scope, namely %s"
                       msg modul.FStar_Ident.str opened_modules1
                 | FStar_Pervasives_Native.Some modul' when
                     Prims.op_Negation
                       (FStar_List.existsb
                          (fun m  -> m = modul'.FStar_Ident.str)
                          opened_modules)
                     ->
                     let opened_modules1 =
                       FStar_String.concat ", " opened_modules  in
                     FStar_Util.format4
                       "%s\nModule %s resolved into %s, which does not belong to the list of modules in scope, namely %s"
                       msg modul.FStar_Ident.str modul'.FStar_Ident.str
                       opened_modules1
                 | FStar_Pervasives_Native.Some modul' ->
                     FStar_Util.format4
                       "%s\nModule %s resolved into %s, definition %s not found"
                       msg modul.FStar_Ident.str modul'.FStar_Ident.str
                       (lid.FStar_Ident.ident).FStar_Ident.idText)
               in
            let uu____12987 = FStar_Ident.range_of_lid lid  in
            FStar_Errors.raise_error
              (FStar_Errors.Fatal_IdentifierNotFound, msg1) uu____12987
        | FStar_Pervasives_Native.Some r -> r
  
let fail_or2 :
  'a .
    (FStar_Ident.ident -> 'a FStar_Pervasives_Native.option) ->
      FStar_Ident.ident -> 'a
  =
  fun lookup1  ->
    fun id1  ->
      let uu____13017 = lookup1 id1  in
      match uu____13017 with
      | FStar_Pervasives_Native.None  ->
          FStar_Errors.raise_error
            (FStar_Errors.Fatal_IdentifierNotFound,
              (Prims.op_Hat "Identifier not found ["
                 (Prims.op_Hat id1.FStar_Ident.idText "]")))
            id1.FStar_Ident.idRange
      | FStar_Pervasives_Native.Some r -> r
  