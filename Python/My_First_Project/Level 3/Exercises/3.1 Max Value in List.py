# Exercise 3.1

def max_value_in_list(list):
    max_value = 0
    for i in list:
        if i > max_value:
            max_value = i
    return max_value

my_list = [1, 2, 3, 4, 5, 50, 7, 8, 9, 10]
print(max_value_in_list(my_list))