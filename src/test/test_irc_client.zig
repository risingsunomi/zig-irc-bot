const irc_client = @import("./../irc_client.zig");
const log = @import("std").log;

test "read_irc_stream" {
    const irc_server: []const u8 = "irc.rizon.net";
    const irc_port: comptime_int = 6667;
    var irc_stream = irc_client.connect_irc(irc_server, irc_port);
    while (true) {
        // read stream
        const stream_buffer = []u8;
        const read_size = try irc_stream.readAll(stream_buffer);

        // check if end of read size
        if (stream_buffer.len > read_size) {
            // last end of stream
            log.info("end of stream: {}", .{stream_buffer});
            break;
        }

        log.info("end of stream: {}", .{stream_buffer});
    }
}
