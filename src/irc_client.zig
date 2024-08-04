// IRC Client
// Using sockets via std.net, interface to IRC server
const std = @import("std");
const net = std.net;
const heap = std.heap;
const log = std.log;

pub fn connect_irc(url: []const u8, port: comptime_int) net.TcpConnectToHostError!net.Stream {
    // add in using .env file for irc server to use

    // get IPv4
    const ip4_addr = net.Ip4Address.resolveIp(url, port);
    // connect to host via ip4_addr
    const allocator = heap.page_allocator;

    return try net.tcpConnectToHost(allocator, ip4_addr, port);
}
