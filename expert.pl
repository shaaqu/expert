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


miejsce(Lazurowe_Wybrzeze) :- is_true('')

# INTERFEJS UZYTKOWNIKA