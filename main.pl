parent(surkis_igor, surkis_anton).
parent(pavlova_olga, surkis_anton).
parent(surkis_igor, surkis_tanya).
parent(pavlova_olga, surkis_tanya).
parent(surkis_felix, surkis_igor).
parent(shelutko_ludmila, surkis_igor).
parent(ennenberg_mikhail, pavlova_olga).
parent(pavlova_valentina, pavlova_olga).
parent(ennenberg_mikhail, pavlov_vasiliy).
parent(pavlova_valentina, pavlov_vasiliy).
parent(surkis_yakov, surkis_felix).
parent(shelutko_arkady, shelutko_ludmila).
parent(shelutko_zinaida, shelutko_ludmila).
parent(surkis_yakov,  surkis_semyon).
parent(shelutko_arkady, shelutko_gennady).
parent(shelutko_zinaida, shelutko_gennady).
parent(shelutko_arkady, shelutko_vladislav).
parent(shelutko_zinaida, shelutko_vladislav).
parent(shelutko_arkady, shelutko_lev).
parent(shelutko_zinaida, shelutko_lev).
parent(ennenberg_heinrich, ennenberg_mikhail).
parent(pavlov_philip, pavlova_valentina).
parent(obukhov_nikita, shelutko_zinaida).
parent(obukhov_nikita, kuznetsova_zoya).
parent(obukhov_nikita, obukhova_nina).

male(surkis_anton).
male(surkis_igor).
male(pavlov_vasiliy).
male(surkis_felix).
male(ennenberg_mikhail).
male(shelutko_gennady).
male(shelutko_vladislav).
male(shelutko_lev).
male(surkis_semyon).
male(surkis_yakov).
male(shelutko_arkady).
male(ennenberg_heinrich).
male(pavlov_philip).
male(obukhov_nikita).

female(surkis_tanya).
female(pavlova_olga).
female(shelutko_ludmila).
female(pavlova_valentina).
female(shelutko_zinaida).
female(kuznetsova_zoya).
female(obukhova_nina).

predecessor(X, Y) :- parent(X, Y).
predecessor(X, Y) :- parent(Z, Y), predecessor(X, Z).
grandparent(X, Y) :- parent(Z, Y), parent(X, Z).
grand_grandparent(X, Y) :- grandparent(Z, Y), parent(X, Z).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
uncle_or_aunt(X, Y) :- sibling(X, Z), parent(Z, Y).
grand_uncle_or_aunt(X, Y) :- uncle_or_aunt(X, Z), parent(Z, Y).
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
son(X, Y) :- male(X), parent(Y, X).
daughter(X, Y) :- female(X), parent(Y, X).
grandson(X, Y) :- male(X), grandparent(Y, X).
granddaughter(X, Y) :- female(X), grandparent(Y, X).
brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).
uncle(X, Y) :- male(X), uncle_or_aunt(X, Y).
aunt(X, Y) :- female(X), uncle_or_aunt(X, Y).
grand_uncle(X, Y) :- male(X), grand_uncle_or_aunt(X, Y).
grand_aunt(X, Y) :- female(X), grand_uncle_or_aunt(X, Y).

