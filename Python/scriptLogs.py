file_path = './myapp.log'

try:
    with open(file_path, 'r') as f:
        info_count = 0
        warning_count = 0
        error_count = 0

        for line in f:
            if 'INFO' in line: #подсчет info в логах
                info_count += 1
            if 'ERROR' in line: #подсчет error в логах
                error_count += 1
            if 'WARNING' in line: #подсчет warning в логах
                warning_count += 1
except:
    print("Файл лога не найден")
else:
    print(f"INFO: {info_count}")
    print(f"ERROR: {error_count}")
    print(f"WARNING: {warning_count}")

    if error_count and warning_count:
        print("Соединение с базой данных потеряно!!!! Заканчивается память.")
    else:
        if error_count:
            print("Соединение с базой данных потеряно!!!!")
        if warning_count:
            print("Заканчивается память.")

    if not error_count and not warning_count:
        print("Все отлично.")


