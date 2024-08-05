// IRC Client
// Using sockets via std.net, interface to IRC server
const std = @import("std");
const net = std.net;
const heap = std.heap;
const log = std.log;
const builtin = @import("builtin");
const win32_sock = @import("zigwin32").networking.win_sock;

pub fn connect_irc(url: []const u8, port: comptime_int) net.TcpConnectToHostError!net.Stream {
    // add in using .env file for irc server to use
    if (builtin.os.tag == .windows) {
        std.debug.print("Detected windows, using windows sockets");

        const DEFAULT_BUFLEN = 512;
        const wsa_data: win32_sock.WSAData = .{};
        const connect_socket: win32_sock.SOCKET = win32_sock.INVALID_SOCKET;
    } else {
        // not supported yet in windows zig 0.13.0
        // get IPv4
        const ip4_addr = try net.Address.resolveIp(url, port);

        // connect to host via ip4_addr
        return try net.tcpConnectToAddress(ip4_addr);
    }
}
