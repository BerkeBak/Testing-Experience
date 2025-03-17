# Exercise 2.2
def two_integer_numbers_of_user():
    # Ask the user two numbers
    first_number = int(input("Enter the first number: "))
    second_number = int(input("Enter the second number: "))
    sum = first_number + second_number

    # Print the sum of the two numbers
    print("The sum of " + str(first_number) + " and " + str(second_number) + " is " + str(sum))

two_integer_numbers_of_user()