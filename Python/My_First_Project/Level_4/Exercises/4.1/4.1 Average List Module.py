import My_Modules

with open("My_First_Project\\Level_4\\Exercises\\4.1\\Datafile", "r") as file:
    my_list = [float(x) for x in file.read().split()]

My_Modules.average_of_list(my_list)