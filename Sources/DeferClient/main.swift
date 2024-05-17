import Defer

func actual()
{
    #logExit
    print("hello, sailor")
}

func expected()
{
    defer { print("exiting function \(#function)") }
    print("hello, sailor")
}

print("=== Expected ===")
expected()
print("=== Actual ===")
actual()

