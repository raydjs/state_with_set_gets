# state_with_set_gets

This is the same as the concatenation state but it's applied with setter

# Basic usage

watch({"MyStuff", "data", "isBusy"}, function(returningValue)
    print(returningValue, "isBusy")
end)

watch({"MyStuff", "myInventory"}, function(returningValue)
    print(returningValue, "inventory")
end)

watch({"MyStuff", "IsAttacking"}, function(returningValue)
    print(returningValue, "isAttacking")
end)

set({"MyStuff", "data", "isBusy"}, true)
set({"MyStuff", "data", "isBusy"}, false)
set({"MyStuff", "myInventory"}, {dop = "5", dep = "5"})
set({"MyStuff", "myInventory"}, {})
set({"MyStuff", "IsAttacking"}, true)
set({"MyStuff", "IsAttacking"}, false)
