# Zig IRC Bot
Currently building an IRC bot with commands and tools

## Dev
Using zig std.net standard library for IRC interface. Further backend commands executed using multithreading. In Windows, std.net is not fully support. Using [zigwin32](https://github.com/marlersoft/zigwin32) for winsocks.

### win32zig install
```console
$ zig fetch --save=zigwin32 git+https://github.com/marlersoft/zigwin32#master
```
Then in build.zig.zon
```zig
// Win32 dep
const zigwin32_dep = b.dependency("zigwin32", .{});
exe.root_module.addImport("zigwin32", zigwin32_dep.module("zigwin32"));
exe_unit_tests.root_module.addImport("zigwin32", zigwin32_dep.module("zigwin32"));
```