f = open('Output.txt', 'w')
for i in range(1,1001):
    if i % 4 == 0 and not i % 9 == 0:
        f.write("DEAD\n")
        continue
    if i % 9 == 0 and not i % 4 == 0:
        f.write("BEEF\n")
        continue
    if i % 9 == 0and i % 4 == 0:
        f.write("DEADBEEF\n")
        continue
    else:
        f.write('%d\n' % i)
