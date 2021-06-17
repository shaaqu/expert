% INTERFEJS UZYTKOWNIKA
is_true(Q) :-
    write("Dokad chcesz wyjechac? "),
    format("~w", [Q]),
    write("(tak/nie)"),
    read(tak).

% PRZECHODZENIE PRZEZ DRZEWO
tree_miejsce(miejsce(A), A).
tree_miejsce(if_then_else(Cond,Then,Else), A) :-
        is_true(Cond) ->
        tree_miejsce(Then, A)
        ; tree_miejsce(Else, A).

% DRZEWO DECYZYJNE

tree(if_then_else('Czy za granica?',
                % za granica
                if_then_else('Czy w Europie?',
                    % w europie
                    if_then_else('Czy nad morzem?',
                        % nad morzem
                        miejsce(lazurowe_wybrzeze),
                        % nie nad mozem
                        if_then_else('Czy aktywnie?',
                            % aktywnie
                            miejsce(sycylia),
                            % nie aktywnie
                            miejsce(barcelona)
                        )
                    ),
                    % nie w europie
                    if_then_else('Czy w gorach?',
                        % w gorach
                        miejsce(nepal),
                        % nie w gorach
                        miejsce(wietnam)
                    )
                ),
                % nie za granica
                if_then_else('Czy tanio?',
                    % tanio
                    if_then_else('Czy zwiedzac?',
                        % zwiedzac
                        miejsce(torun),
                        % nie zwiedzac
                        miejsce(sopot)
                    ),
                    % nie tanio
                    if_then_else('Czy SPA?',
                        % spa
                        miejsce(krakow),
                        % nie spa
                        miejsce(warszawa)
                    )
                )
    )
).

% BAZA WIEDZY

miejsce(A) :-
        tree(T),
        tree_miejsce(T, A).


miejsce(lazurowe_wybrzeze) :- is_true('Czy za granica?'), is_true('Czy w Europie?'), is_true('Czy nad morzem?').
miejsce(sycylia) :- is_true('Czy za granica?'), is_true('Czy w Europie?'), is_true('Czy aktywnie?').
miejsce(barcelona) :- is_true('Czy za granica?'), is_true('Czy w Europie?').
miejsce(nepal) :- is_true('Czy za granica?'), is_true('Czy w gorach?').
miejsce(wietnam) :- is_true('Czy za granica?').
miejsce(torun) :- is_true('Czy tanio?'), is_true('Czy zwiedzac?').
miejsce(sopot) :- is_true('Czy tanio?').
miejsce(krakow) :- is_true('Czy SPA?').
miejsce(warszawa).