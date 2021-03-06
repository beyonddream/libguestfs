#!/bin/sh
# -*- lua -*-
test -z "$LUA" && LUA=lua
exec $LUA << END_OF_FILE
-- libguestfs Lua bindings -*- lua -*-
-- Copyright (C) 2012 Red Hat Inc.
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

local G = require "guestfs"

local g1 = G.create ()
local g2 = G.create ()
local g3 = G.create ()

-- Check that each handle is independent.
g1:set_path ("1")
g2:set_path ("2")
g3:set_path ("3")

assert (g1:get_path () == "1", "incorrect path in g1, expected '1'")
assert (g2:get_path () == "2", "incorrect path in g2, expected '2'")
assert (g3:get_path () == "3", "incorrect path in g3, expected '3'")
