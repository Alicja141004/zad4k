#!/bin/bash

# Funkcja wyświetlająca aktualną datę i godzinę
show_current_datetime() {
    echo "Aktualna data i godzina: $(date +"%Y-%m-%d %H:%M:%S")"
}

# Funkcja wyświetlająca zawartość bieżącego katalogu
show_current_directory_content() {
    echo "Zawartość bieżącego katalogu:"
    ls
}

# Funkcja wyświetlająca nazwę użytkownika wykonującego skrypt
show_current_user() {
    echo "Nazwa użytkownika wykonującego skrypt: $USER"
}

# Funkcja tworząca nowy katalog o podanej nazwie
create_new_directory() {
    read -p "Podaj nazwę nowego katalogu: " dirname
    mkdir "$dirname"
    echo "Utworzono katalog \"$dirname\"."
}

# Funkcja usuwająca plik o podanej nazwie
delete_file() {
    read -p "Podaj nazwę pliku do usunięcia: " filename
    rm -i "$filename"
    echo "Usunięto plik \"$filename\"."
}

# Funkcja wyświetlająca pierwsze 10 linii podanego pliku
show_first_10_lines() {
    read -p "Podaj nazwę pliku: " filename
    head "$filename"
}

# Funkcja wyświetlająca ostatnie 10 linii podanego pliku
show_last_10_lines() {
    read -p "Podaj nazwę pliku: " filename
    tail "$filename"
}

# Funkcja wyświetlająca informacje pomocnicze dotyczące skryptu
show_script_help() {
    echo "Użycie: $0 [opcja]"
    echo "Opcje:"
    echo "  -a    Wyświetl aktualną datę i godzinę."
    echo "  -b    Wyświetl zawartość bieżącego katalogu."
    echo "  -c    Wyświetl nazwę użytkownika wykonującego skrypt."
    echo "  -d    Utwórz nowy katalog o nazwie podanej jako argument."
    echo "  -e    Usuń plik o nazwie podanej jako argument."
    echo "  -f    Wyświetl pierwsze 10 linii pliku podanego jako argument."
    echo "  -g    Wyświetl ostatnie 10 linii pliku podanego jako argument."
    echo "  -h    Wyświetl informacje pomocnicze dotyczące skryptu."
    echo "  -i    Zlicz liczbę plików w bieżącym katalogu."
    echo "  -j    Wyświetl nazwy plików w bieżącym katalogu, które mają rozszerzenie '.txt'."
}

# Funkcja obliczająca sumę liczb od 1 do N
calculate_sum() {
    read -p "Podaj liczbę N: " N
    sum=0
    for ((i = 1; i <= N; i++)); do
        ((sum += i))
    done
    echo "Suma liczb od 1 do $N wynosi: $sum"
}

# Funkcja odczytująca i wyświetlająca zawartość pliku w odwrotnej kolejności
show_file_content_reverse() {
    read -p "Podaj nazwę pliku: " filename
    if [ -f "$filename" ]; then
        tac "$filename"
    else
        echo "Plik \"$filename\" nie istnieje."
    fi
}

# Funkcja sprawdzająca, czy podana ścieżka jest katalogiem czy plikiem
check_path_type() {
    read -p "Podaj ścieżkę: " path
    if [ -d "$path" ]; then
        echo "Podana ścieżka \"$path\" jest katalogiem."
    elif [ -f "$path" ]; then
        echo "Podana ścieżka \"$path\" jest plikiem."
    else
        echo "Podana ścieżka \"$path\" nie istnieje."
    fi
}

# Funkcja zliczająca liczbę plików i katalogów w bieżącym katalogu
count_files_and_dirs() {
    files=$(find . -maxdepth 1 -type f | wc -l)
    dirs=$(find . -maxdepth 1 -type d | wc -l)
    echo "Liczba plików: $files"
    echo "Liczba katalogów: $dirs"
}

# Funkcja wyszukująca pliki o podanej nazwie w bieżącym katalogu
search_files_by_name() {
    read -p "Podaj nazwę pliku: " filename
    echo "Pliki o nazwie \"$filename\":"
    find . -maxdepth 1 -type f -name "$filename"
}

# Sprawdzenie czy podano argumenty
if [ $# -eq 0 ]; then
    echo "Nie podano żadnych argumentów."
    exit 1
fi

# Wywołanie odpowiedniej funkcji w zależności od podanej opcji
option="$1"
if [ "$option" == "-a" ]; then
    show_current_datetime
elif [ "$option" == "-b" ]; then
    show_current_directory_content
elif [ "$option" == "-c" ]; then
    show_current_user
elif [ "$option" == "-d" ]; then
    create_new_directory
elif [ "$option" == "-e" ]; then
    delete_file
elif [ "$option" == "-f" ]; then
    show_first_10_lines
elif [ "$option" == "-g" ]; then
    show_last_10_lines
elif [ "$option" == "-h" ]; then
    show_script_help
elif [ "$option" == "-i" ]; then
    count_files_and_dirs
elif [ "$option" == "-j" ]; then
    search_files_by_name
else
    echo "Nieprawidłowa opcja: $option"
    exit 1
fi


# ----------------------------------------------------------

# Funkcja obliczająca sumę liczb od 1 do N
calculate_sum() {
    read -p "Podaj liczbę N: " N
    sum=0
    for ((i = 1; i <= N; i++)); do
        ((sum += i))
    done
    echo "Suma liczb od 1 do $N wynosi: $sum"
}

# Funkcja odczytująca i wyświetlająca zawartość pliku w odwrotnej kolejności
show_file_content_reverse() {
    local filename=$1

    if [ -f "$filename" ]; then
        # Wczytanie zawartości pliku do tablicy lines
        IFS=$'\n' read -d '' -ra lines < "$filename"

        # Wyświetlenie linii w odwrotnej kolejności
        for ((i = ${#lines[@]} - 1; i >= 0; i--)); do
            echo "${lines[i]}"
        done
    else
        echo "Plik \"$filename\" nie istnieje."
    fi
}


# Funkcja sprawdzająca, czy podana ścieżka jest katalogiem czy plikiem
check_path_type() {
    read -p "Podaj ścieżkę: " path
    if [ -d "$path" ]; then
        echo "Podana ścieżka \"$path\" jest katalogiem."
    elif [ -f "$path" ]; then
        echo "Podana ścieżka \"$path\" jest plikiem."
    else
        echo "Podana ścieżka \"$path\" nie istnieje."
    fi
}

# Funkcja zliczająca liczbę plików i katalogów w bieżącym katalogu
count_files_and_dirs() {
    files=$(find . -maxdepth 1 -type f | wc -l)
    dirs=$(find . -maxdepth 1 -type d | wc -l)
    echo "Liczba plików: $files"
    echo "Liczba katalogów: $dirs"
}

# Funkcja wyszukująca pliki o podanej nazwie w bieżącym katalogu
search_files_by_name() {
    read -p "Podaj nazwę pliku: " filename
    echo "Pliki o nazwie \"$filename\":"
    find . -maxdepth 1 -type f -name "$filename"
}

# Menu główne
echo "Menu:"
echo "i. Obliczanie sumy liczb od 1 do N (użytkownik podaje N)."
echo "ii. Odczytanie i wyświetlenie zawartości pliku w odwrotnej kolejności (użytkownik podaje nazwę pliku)."
echo "iii. Sprawdzenie, czy podana ścieżka jest katalogiem czy plikiem."
echo "iv. Zliczenie liczby plików i katalogów w bieżącym katalogu."
echo "v. Wyszukanie plików o podanej nazwie w bieżącym katalogu."

read -p "Wybierz opcję z menu (i/v): " menu_option

case $menu_option in
    i) calculate_sum ;;
    ii) show_file_content_reverse ;;
    iii) check_path_type ;;
    iv) count_files_and_dirs ;;
    v) search_files_by_name ;;
    *) echo "Nieprawidłowa opcja." ;;
esac
