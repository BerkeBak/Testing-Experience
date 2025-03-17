List_Cities = []

with open("My_First_Project\\Level_4\\Exercises\\4.2\\Cities", "r") as file:
    for line in file:
        List_Cities += ["".join(map(str, line.strip("\n")))]

with open("My_First_Project\\Level_4\\Exercises\\4.2\\Cities_Sorted", "w") as file:
    for city in sorted(List_Cities):
        file.write(city + "\n")
