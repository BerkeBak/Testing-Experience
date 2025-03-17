my_list = []

def user_input_numbers():
    for i in range(5):
        number = int(input("Enter a number: "))
        my_list.append(number)
    return my_list

def average_of_list(list):
    average = sum(list) / len(list)
    print("The average of the list is " + str(average))

user_input_numbers()
average_of_list(my_list)