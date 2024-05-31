results = []
y_targ = []
mass_list = []
order_list = []

# set molar masses
masses = [58000, 69000, 112000]

# cycle for standard separation
with open('Results_3004.txt', 'r') as file:
    next(file)
    for line in file:
        values = line.strip().split('\t')

        y_targ.append(round(float(values[3])))
        results.append([round(float(values[3])), round(float(values[4]))])

    base = min(y_targ)
    high_base = base + 0.1 * base
    low_base = base - 0.1 * base

# cykle for sample separation
with open('Results_3004.txt', 'r') as file:
    next(file)
    for line in file:
        values = line.strip().split('\t')
        if not round(float(values[3])) < high_base and round(float(values[3])) > low_base:
            order_list.append(round(float(values[4])))

    masses = sorted(masses)
    order_list = sorted(order_list)
    for i in range(len(order_list)):
        mass_list.append([order_list[i], masses[i]])

print(mass_list)