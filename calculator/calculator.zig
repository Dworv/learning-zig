const std = @import("std");

pub fn main() !void {
    var num1 = try getInt();
    var op = try getOp();
    var num2 = try getInt();
    var num3 = switch (op) {
        0 => num1 + num2,
        1 => num1 - num2,
        2 => num1 * num2,
        3 => num1 / num2,
        else => 0
    };
    std.debug.print("{}\n", .{num3});
}

pub fn getInt() !u64 {
    const stdin = std.io.getStdIn().reader();
    while (true) {
        const line = try stdin.readUntilDelimiterAlloc(
            std.heap.page_allocator,
            '\n',
            2048
        );
        defer std.heap.page_allocator.free(line);
        const num = std.fmt.parseInt(u64, line, 10) catch continue;
        return num;
    }
}

pub fn getOp() !u8 {
    const stdin = std.io.getStdIn().reader();
    while (true) {
        const line = try stdin.readUntilDelimiterAlloc(
            std.heap.page_allocator,
            '\n',
            2048
        );
        defer std.heap.page_allocator.free(line);
        if (line[0] == '+') {
            return 0;
        } else if (line[0] == '-') {
            return 1;
        } else if (line[0] == '*') {
            return 2;
        } else if (line[0] == '/') {
            return 3;
        }
    }
}