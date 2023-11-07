import random
f = open("adder_testvectors.tv", "w")
for tests in range(500):
    i = random.randint(0, 18446744073709551615)
    j = random.randint(0, 18446744073709551615)
    k = random.randint(0, 1)
    f.write(format(i, '064b'))
    f.write('_')
    f.write(format(j, '064b'))
    f.write('_')
    f.write(format(k, '01b'))
    f.write('_')
    f.write(format(i+j+k, '065b'))
    f.write('\n')
f.close