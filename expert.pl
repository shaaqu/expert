# DRZEWO DECYZYJNE

tree(if_then_else('Czy za granica?',
                # za granica
                if_then_else('Czy w Europie?',
                    # w europie
                    if_then_else('Czy nad morzem?',
                        # nad morzem
                        miejsce(Lazurowe_Wybrzeze),
                        # nie nad mozem
                        if_then_else('Czy aktywnie?',
                            # aktywnie
                            miejsce(Sycylia),
                            # nie aktywnie
                            miejsce(Barcelona)
                        )
                    )
                    # nie w europie
                    if_then_else('Czy w gorach?',
                        # w gorach
                        miejsce(Nepal),
                        # nie w gorach
                        miejsce(Wietnam)
                    )
                )
                # nie za granica
                if_then_else('Czy tanio?',
                    # tanio
                    if_then_else('Czy zwiedzac?',
                        # zwiedzac
                        miejsce(Torun),
                        # nie zwiedzac
                        miejsce(Sopot)
                    )
                    # nie tanio
                    if_then_else('Czy SPA?',
                        # spa
                        miejsce(Krakow),
                        # nie spa
                        miejsce(Warszawa)
                    )
                )
    )
)

# BAZA WIEDZY

miejsce(A) :-
        tree(T),
        tree_miejsce(T, A).


miejsce(Lazurowe_Wybrzeze) :- is_true('Czy za granica?'), is_true('Czy w Europie?'), is_true('Czy nad morzem?').
miejsce(Sycylia) :- is_true('Czy za granica?'), is_true('Czy w Europie?'), is_true('Czy aktywnie?').
miejsce(Barcelona) :- is_true('Czy za granica?'), is_true('Czy w Europie?').
miejsce(Nepal) :- is_true('Czy za granica?'), is_true('Czy w gorach?').
miejsce(Wietnam) :- is_true('Czy za granica?').
miejsce(Torun) :- is_true('Czy tanio?'), is_true('Czy zwiedzac?').
miejsce(Sopot) :- is_true('Czy tanio?').
miejsce(Krakow) :- is_true('Czy SPA?').
miejsce(Warszawa).

# INTERFEJS UZYTKOWNIKA
is_true(Q) :-
    write("Dokad chcesz wyjechac?"),
    format("~w?", [Q]),
    write("(tak/nie)"),
    read(tak).

# PRZECHODZENIE PRZEZ DRZEWO
tree_miejsce(miejsce(A), A).
tree_miejsce(
    if_then_else(Cond,Then,Else) :-
        (
            is_true(Cond) ->
            tree_miejsce(Then, A)
            ; tree_miejsce(Else, A)
        )

).