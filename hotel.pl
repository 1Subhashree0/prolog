/*Hotel Recommendation System*/

/*Facts for admin*/
/*Lists : Type,Rating,Location,Amenities*/

type(["'Luxary'","'Budget'","'Resort'","'Botique'","'Motel'"]).

location(["'Durbarmarg'","'Naxal'","'Thamel'","'Sinamangal'","'Boudha'","'Lazimpath'","'Baneshwor'","'Gokarnashwar'","'Dhumbharai'"]).

rating(["'Excellent'","'Very Good'","'Good'","'Average'","'Poor'"]).

amenities(["'Swimming Pool'","'Wifi'","'T.V'","'Free Breakfast'","'Parking'","'Room service'","'Swimming Pool & Wifi'","'Fitness center & Spa'","'Free Breakfast & Wifi'","'Wifi & Room service'","'T.V & Parking'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast &Fitness center & Spa'","'Swimming Pool & Wifi & Parking & Room service & Fitness center'"]).




hotels('Yak and yeti',"'Luxary'","'Durbarmarg'","'Excellent'","''Swimming Pool & Wifi & Parking & Room service & Fitness center'").
hotels('Annapurna Hotel',"'Luxary'","'Durbarmarg'","'Excellent'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast &Fitness center & Spa'").
hotels('Radission Hotel',"'Luxary'","'Lazimpath'","'Excellent'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast &Fitness center & Spa'").
hotels('Marriott',"'Luxry'","'Naxal'","'Excellent'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast &Fitness center & Spa'").
hotels('Hotel nameste',"'Budget'","'Naxal'","'Good'","'Wifi'").
hotels('Kathmandu Madhuban Guest House',"'Motel'","'Dhumbharai'","'Average'","'Room service'").
hotels('Three Brothers',"'Motel'","'Lazimpath'","'Good'","'Wifi'").
hotels('Kathmandu Beli Nepal',"'Motel'","'Thamel'","'Average'","'T.V'").
hotels('Kathmandu Home Stay',"'Motel'","'Thamel'","'Average'","'Parking'").
hotels('Samsara Boutique Hotel',"'Botique'","'Sinamangal'","'Very Good'","''Swimming Pool & Wifi'").
hotels('Kathmandu Botique Hotel',"'Botique'","'Baneshwor'","'Very Good'","''Wifi & Room service'").
hotels('Hotel Jampa',"'Budget'","'Thamel'","'Good'","'T.V & Parking'").
hotels('Hotel Pomelo House',"'Budget'","'Boudha'","'Good'","'Free Breakfast & Wifi'").
hotels('Hotel Meridian Suite',"'Motel'","'Baneshwor'","'Average'","'Fitness center & Spa'").
hotels('Kathmandu Eco Hotel',"'Budget'","'Naxal'","'Good'","'Parking'").
hotels('Arushi Boutique Hotel',"'Boutique'","'Thamel'","'Very Good'","'Swimming Pool & Wifi & Parking & Room service & Fitness center'").
hotels('Avataar Kathmandu Hotel',"'Motel'","'Boudha'","'Poor'","'Wifi'").
hotels('Kathmandu Guest House',"'Budget'","'Thamel'","'Very Good'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast'").
hotels('Everest Hotel',"'Resort'","'Sinamangal'","'Very Good'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast &Fitness center & Spa'").
hotels('Himalayan Hotel',"'Luxary'","'Gokarnashwar'","'Excellent'","''Swimming Pool & Wifi & Parking & Room service & Fitness center'").
hotels('Sankar Hotel',"'Luxary'","'Lazimpath'","'Excellent'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast &Fitness center & Spa'").
hotels('Shangrila',"'Luxary'","'Lazimpath'","'Excellent'","'Swimming Pool & Wifi & Parking & Room service & Free Breakfast & Fitness center'").
hotels('Kathmandu Garden Hotel',"'motel'","'Naxal'","'Poor'","'Parking'").






/*Rule*/
/*Write begin first*/
begin:-
      write('***StayFinder : Hotel Recommendation System ***'),nl,nl,
      write('**WELCOME !! Our system will make recommendations to travelers by suggesting the best-matched hotel based on the users selections or preferences. **'),nl,
      catalogue.
/*Main catalogue rule*/
catalogue:-
     nl,nl,
     write('Want to find a hotel of your preference? "Choose 1,2 or 3"'),nl,
     write('1- Yes'),nl,
     write('2- No'),nl,
write('3- I am admin'),nl,
write('Enter your choice:'),nl,
read(X),
choice(X).

/*second catalogue rule*/
cataloguetwo:-
nl,nl,
write('Would you like any other recommendation? "Select 1 or 2"'),nl,
write('1- Yes'),nl,
write('2- No'),nl,
write('Enter your choice:'),nl,
read(X),
choice(X).



/*catalogue choice rule*/
choice(1):-
         write('Which type of hotel do you prefer ? "Select from 1 to 5 "'),nl,
         type(L),
         (display(L,0);true),
         write('Enter your choice:'),
         nl,read(X),
		 checkinput(X,L),
		 nb_getval(checkresult,S),
		 option(S).

choice(2):-
         write('Hope your experience was good! Thankyou for using our system.').

choice(3):-
            nl,
            write('Your Name: '),nl,read(U),
            write('Your Password: '),nl, read(P),
            (admin(U,P)->(adcat);(write("The name or password you entered is invalid"),choice(3))).



/*Admin catalogue rule*/
adcat:-
        nl,
        write('Select from the following: "Select 1 or 2"'),nl,
        write('1- Display all hotels'),nl,
        write('2- Exit'),nl,
        write('Enter your choice:'),nl,
        read(X),
        editselection(X).

/*Admin editselection rule*/
editselection(1):-
                  nl,
                  write('The hotels name: '),
                  (printFinalResult(_,_,_,_);true),
                  nl,adcat,nl.

editselection(2):-
                  nl,
                  write('Thankyou!! Your have exit the admin authority.'),nl,nl,
                  begin.



/* Hotel's filter questions*/

option(X):-
         T is X-1,
         type(L),
         nth0(T,L,Result1),
         nb_setval(result1,Result1),
		 nb_setval(result1,Result1),
         write('Which location do you prefer? "Select from 1 to 9 or 0 to print recommendation"'),nl,
         location(R),
         (display(R,0);true),
         write('Enter your choice:'),nl,
         read(S), checkinput(S,R),
		 nb_getval(checkresult,A),
		 (A =:= 0 ->( nb_setval(flag,1),end );(locationMenu(A))).


locationMenu(X):-
                N is X-1,
                location(R),
                nth0(N,R,Result2),
				(Result2 == "'No preference'"  ->( nb_setval(result2," "));(nb_setval(result2,Result2))),
                write('What type of hotel rating are you looking for ? "Select from 1 to 4 or 0 to print recommendation"'),nl,
                rating(A),
                (display(A,0);true),
                write('Enter your choice:'),nl,
                read(L),
				checkinput(L,A),
		        nb_getval(checkresult,S),
	        (S =:= 0 ->( nb_setval(flag,2),end) ;(ratingMenu(S))).

ratingMenu(X):-
           N is X-1,
           rating(R),
           nth0(N,R,Result3),
          (Result3 == "'No preference'" ->( nb_setval(result3," "));(nb_setval(result3,Result3))),
           write('What are the amenities you want in the hotel ? "Select from 1 to 14 or 0 to print recommendation"'),nl,
           amenities(A),
           (display(A,0);true),
           write('Enter your choice:'),nl,
           read(L),
		   checkinput(L,A),
		   nb_getval(checkresult,O),
		   ( O =:= 0 ->( nb_setval(flag,3),end );(amenitiesMenu(O))).

amenitiesMenu(X):-
              U is X-1,
              amenities(P),
              nth0(U,P,Result4),
              (Result4 == "'No preference'" ->( nb_setval(result4," "));(nb_setval(result4,Result4))),
			  nb_setval(flag,4)
			 ,end.



end:- nb_getval(flag,Flag),print(Flag).

/* hotel's filter result*/
print(1):-

         nb_getval(result1,Result1),nl,
         write('** Based on your preferences **'),nl,
         write('Type: ') ,write(Result1),nl,
         write('We have Recommended: '),
		 nl, (printFinalResult(Result1,_,_,_);true),
		 nl,nl,write('**Note: if there is no result that it is mean there is no match with your preferences**'),
		 cataloguetwo.

print(2):-
         nb_getval(result1,Result1),
         nb_getval(result2,Result2),
         write('** Based on your preferences **'),nl,
         write('Type: ') ,write(Result1),nl,
         write('Location: '), ( Result2 == " "->(write(' No preferences '),nb_setval(result2,_));(write(Result2))),nl,
	     write('We have recommended: '),
		 nb_getval(result2,Result2new),
		 nl, (printFinalResult(Result1,Result2new,_,_);true),
		 nl,nl,write('**Note: if there is no result that it is mean there is no match with your preferences**'),
		 cataloguetwo.

print(3):-
         nb_getval(result1,Result1),
         nb_getval(result2,Result2),
         nb_getval(result3,Result3),
         write('** Based on your preferences **'),nl,
         write('Type: ') ,write(Result1),nl,
         write('Location: '), ( Result2 == " "->(write(' No preferences '),nb_setval(result2,_));(write(Result2))),nl,
	     write('Rating: '),( Result3 == " "->(write(' No preferences '),nb_setval(result3,_));(write(Result3))),nl,
         write('Er have Recommended: ') ,
		 nb_getval(result2,Result2new),
		 nb_getval(result3,Result3new),
		 nl, (printFinalResult(Result1,Result2new,Result3new,_);true),
		 nl,nl,write('**Note: if there is no result that it is mean there is no match with your preferences**'),
		 cataloguetwo.


print(4):-
         nb_getval(result1,Result1),
         nb_getval(result2,Result2),
         nb_getval(result3,Result3),
         nb_getval(result4,Result4),
	     write('** Based on your preferences **'),nl,
         write('Type: ') ,write(Result1),nl,
         write('Location: '), ( Result2 == " "->(write(' No preferences '),nb_setval(result2,_));(write(Result2))),nl,
	     write('Rating: '),( Result3 == " "->(write(' No preferences '),nb_setval(result3,_));(write(Result3))),nl,
         write('Amenities: ') , (Result4  == " "-> (write(' No preferences '),nb_setval(result4,_));(write(Result4))),nl,
         write('We have Recommended: ') ,
		 nb_getval(result2,Result2new),
         nb_getval(result3,Result3new),
         nb_getval(result4,Result4new),
		 nl, (printFinalResult(Result1,Result2new,Result3new,Result4new);true),
		 nl,nl, write('**Note: if there is no result that it is mean there is no match with your preferences**'),
		 cataloguetwo.


printFinalResult(Result1,Result2,Result3,Result4):-
                                                  nl,
             hotels(J,Result1,Result2,Result3,Result4),
                                                  nl,
              write(J),
             display(J).


/* display  helper rule for hotel's filter result*/
display([]).
display([H|T],A):-
                  M is A+1,
                  write(M),
                  write('- '),
                  write(H),
			      nl,
                  write(' '),
                  display(T,M).




checkinput(A,L):-
         length(L,Len),
		 ( A>Len ->(write('Please enter valid number: '),read(D),checkinput(D,L) ) ; (nb_setval(checkresult,A),nl) ).



