const std = @import("std");
const expect = std.testing.expect;

const MyType1 = @import("my_type.zig").MyType;
const MyType2 = @import("my_type.zig").MyType;
const MyType3 = @import("my_type.Zig").MyType; // capital Z 

test "sum1" { // this works fine
    const  mt1 = MyType1{.value = 12};
    try expect(mt1.value == 12);

    const mt2 = MyType2{.value  = 13};
    try expect(mt2.value == 13);

    const result = mt1.sum(mt2);
    try expect(result.value == 25);
}

test "sum2" { // this works fine
    const  mt31 = MyType3{.value = 12};
    try expect(mt31.value == 12);

    const mt32 = MyType3{.value  = 13};
    try expect(mt32.value == 13);

    const result = mt31.sum(mt32);
    try expect(result.value == 25);
}

test "sum3" {  // this errors out
    const  mt1 = MyType1{.value = 12};
    try expect(mt1.value == 12);

    const mt3 = MyType3{.value  = 13};
    try expect(mt3.value == 13);

    // .\src\my_user.zig:27:28: error: expected type 'src.my_type.MyType', found 'src.my_type.MyType'
    const result = mt1.sum(mt3);
    try expect(result.value == 25);
}