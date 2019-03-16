( usage: <number> parity )
: parity 
	2 % 
	if ." odd" 
	else ." even" 
	then cr ;

( returns [-1] is argument is negative, [0] if number is not prime and [1] if is prime )
: prime-without-log
	dup 0 < 
	if 
		-1 
	else
		dup 2 < 
		if 
			0 
		else
			dup 1 -
			repeat
				dup 1 = 
				if  
					drop drop 1 1
				else 
					>r dup r> dup 1 - >r % 
					0 = 
					if 
						r> drop drop 0 1 
					else 
						r> 0 
					then
				then
			until
		then
	then ;

( usage: <number> prime )
: prime
	prime-without-log dup -1 = 
	if
		." Negative argument"
	else
		dup 0 =
		if
			." Number is not prime"
		else
			dup 1 =
			if
				." Number is prime"
			then
		then
	then cr ;

( usage: <number> prime-allot )
( puts adress of allocated cell to stack )
: prime-allot
	prime 
	1 allot dup 
	rot swap
	! ;

( usage: <adr1> <adr2> concat )
( writes concatenated string to stdout and puts adress of that string to stack )
: concat
	swap 
	( count length of final string )
	over count over count + 
	heap-alloc 
	dup >r 
	( copying str1 to new string )
	swap dup >r string-copy 
	r> dup heap-free count r> dup >r + 
	( copying str2 to new string after str1 )
	swap dup >r string-copy r> heap-free 
	r> dup prints cr ;


( m" Добровицкий" string-hash 3 % . outputs 2 )
( usage: <number> radical )
( returns radical of given number )
: radical
	dup 1 - swap 1 swap
	repeat
		rot dup 1 =
		if 
			1 
		else
			-rot dup >r rot dup 1 - >r 
			dup -rot % not 
			if 
				dup prime-without-log 
				if 
					* 
				else
					drop
				then 
			else
				drop
			then 
			r> swap r> 0
		then
	until 
	rot . cr drop drop ;
