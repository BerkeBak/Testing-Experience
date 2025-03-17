# Exercise 2.4
def convert_celcius_to_fahrenheit(C):
    F = C * 1.8 + 32
    print(str(C) + " degree Celcius is equal to " + str(F) + " degree Fahrenheit.")

def ask_user_for_celcius():
    C = float(input("Enter the temperature in Celcius: "))
    convert_celcius_to_fahrenheit(C)

ask_user_for_celcius()