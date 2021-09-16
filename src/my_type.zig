
pub const MyType = struct {
    value: usize,
    pub fn sum(self: MyType, my_type: MyType) MyType {
        return MyType{.value = my_type.value + self.value};
    }
};
