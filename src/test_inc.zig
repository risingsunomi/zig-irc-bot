// Include file for tests
// This is a zig build hack to include tests in multiple files

test {
    _ = @import("./test_irc_client.zig");
}
