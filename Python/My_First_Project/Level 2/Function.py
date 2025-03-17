def say_hello(user_name, user_age):
    print("Hello " + user_name + "! You are " + str(user_age) + " years old.")

def double_number(number):
    return number * 2

def print_double_number(number):
    result = double_number(number)
    print("Double of " + str(number) + " is " + str(result))

print_double_number(5)


#say_hello("Bob", 25)
#say_hello("John", 23)
