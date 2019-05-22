(* FStar.Interactive.Lsp and FStar.Interactive.Ide need to push various *
 * text fragments and update state; this file collects helpers for them *)
#light "off"

module FStar.PushHelper
open FStar.ST
open FStar.Util
open FStar.JsonHelper
open FStar.TypeChecker.Env

module DsEnv = FStar.Syntax.DsEnv

type push_kind = | SyntaxCheck | LaxCheck | FullCheck
type ctx_depth_t = int * int * solver_depth_t * int

val repl_stack : ref<repl_stack_t>

val set_check_kind : env_t -> push_kind -> env_t
val snapshot_env : env_t -> string -> repl_depth_t * env_t
val push_repl : string -> push_kind -> repl_task -> repl_state -> repl_state
val rollback_env : solver_t -> string -> ctx_depth_t * int -> env_t
val pop_repl : string -> repl_state -> repl_state

// Core functionality
val run_repl_task : optmod_t -> env_t -> repl_task -> optmod_t * env_t

// A REPL transaction without name-tracking; used exclusively by LSP;
// variant of run_repl_transaction in IDE
val repl_tx : repl_state -> push_kind -> repl_task -> bool * repl_state