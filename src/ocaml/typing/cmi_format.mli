(**************************************************************************)
(*                                                                        *)
(*                                 OCaml                                  *)
(*                                                                        *)
(*                   Fabrice Le Fessant, INRIA Saclay                     *)
(*                                                                        *)
(*   Copyright 2012 Institut National de Recherche en Informatique et     *)
(*     en Automatique.                                                    *)
(*                                                                        *)
(*   All rights reserved.  This file is distributed under the terms of    *)
(*   the GNU Lesser General Public License version 2.1, with the          *)
(*   special exception on linking described in the file LICENSE.          *)
(*                                                                        *)
(**************************************************************************)

open Misc

type pers_flags =
  | Rectypes
  | Alerts of alerts
  | Opaque
  | Unsafe_string

type cmi_infos = {
    cmi_name : Compilation_unit.t;
    cmi_sign : Types.signature_item list;
    cmi_crcs : Import_info.t array;
    cmi_flags : pers_flags list;
}

(* write the magic + the cmi information *)
val output_cmi : string -> out_channel -> cmi_infos -> Digest.t

(* read the cmi information (the magic is supposed to have already been read) *)
val input_cmi : in_channel -> cmi_infos

(* read a cmi from a filename, checking the magic *)
val read_cmi : string -> cmi_infos

(* Error report moved to {!Magic_numbers.Cmi} *)
