#!/bin/bash

show_help() {
    echo "Użycie: $0 [-a | -b | -h]"
    echo "Opcje:"
    echo "  -a    Wyświetl aktualną godzinę."
    echo "  -b    Wyświetl zawartość bieżącego katalogu."
    echo "  -h    Wyświetl informacje pomocnicze dotyczące skryptu."
}

read  option

if [[ $option == "-a" ]]; then
    echo "Aktualna godzina: $(date +"%T")"
elif [[ $option == "-b" ]]; then
    echo "Zawartość bieżącego katalogu:"
    ls
elif [[ $option == "-h" ]]; then
    show_help
else
    echo "Nieprawidłowa opcja."
    exit 1
fi

while true; do
    echo "Menu:"
    echo "1. Obliczanie sumy od 1 do N"
    echo "2. Wyświetlanie danego słowa w odwrotnej kolejności"
    read -p "Wybierz opcję z menu (1/2): " menu_option

    case $menu_option in
        1)
            read -p "Podaj liczbę N: " N
            sum=0
            for ((i = 1; i <= N; i++)); do
                sum=$((sum + i))
            done
            echo "Suma liczb od 1 do $N wynosi: $sum"
            ;;
        2)
            read -p "Podaj słowo do wyświetlenia w odwrotnej kolejności: " word
            reversed_word=$(echo "$word" | rev)
            echo "Słowo '$word' w odwrotnej kolejności: $reversed_word"
            ;;
        *)
            echo "Nieprawidłowa opcja."
            ;;
    esac

    read -p "Czy chcesz kontynuować? (t/n): " continue_option
    if [[ $continue_option != "t" ]]; then
        break
    fi
done

echo "Koniec programu."
