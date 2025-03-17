my_list = []

def user_input_numbers():
    number = 1
    while number > 0:
        number = int(input("Enter a number: "))
        if number == 0:
            return my_list
        my_list.append(number)

def average_of_list(list):
    average = sum(list) / len(list)
    print("The average of the list is " + str(average))

user_input_numbers()
average_of_list(my_list)