Программу можна запустить 2 способами:
1)Через консоль
Загрузив сначало модель:
target = LoadTargetFromFile('путь к папкеПрога\Abrams_M1.trg');
Запустить расчет по одному из распределений:
target.calculateArmorWithUniformDistribution(n,L,step);
n - число точек
L - глубина пробития 
step - шаг по углу
target.calculateArmorWithNormalDistribution(n,L,step,sigma)
sigma - среднеквадротичное распределение