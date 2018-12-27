#SingleInstance, force 
#Persistent
#NoTrayIcon

Arr := [["","",""],["","",""],["","",""]]

RandomBlock(Arr)

SqR1C1 := Arr.1.1
SqR1C2 := Arr.1.2
SqR1C3 := Arr.1.3

SqR2C1 := Arr.2.1
SqR2C2 := Arr.2.2
SqR2C3 := Arr.2.3

SqR3C1 := Arr.3.1
SqR3C2 := Arr.3.2
SqR3C3 := Arr.3.3

;row 1
Gui, Add, Edit, x0 y0 w333 h333 ReadOnly vR1C1, % Arr.1.1 
Gui, Add, Edit, x333 y0 w333 h333 ReadOnly vR1C2, % Arr.1.2 
Gui, Add, Edit, x666 y0 w333 h333 ReadOnly vR1C3, % Arr.1.3

;row2
Gui, Add, Edit, x0 y333 w333 h333 ReadOnly vR2C1, % Arr.2.1 
Gui, Add, Edit, x333 y333 w333 h333 ReadOnly vR2C2, % Arr.2.2 
Gui, Add, Edit, x666 y333 w333 h333 ReadOnly vR2C3, % Arr.2.3

;row3
Gui, Add, Edit, x0 y666 w333 h333 ReadOnly vR3C1, % Arr.3.1
Gui, Add, Edit, x333 y666 w333 h333 ReadOnly vR3C2, % Arr.3.2
Gui, Add, Edit, x666 y666 w333 h333 ReadOnly vR3C3, % Arr.3.3

Gui, Show, w999 h999, Test 

return 

;this is the controls section

UP:: ;up arrow key
{
	KeyPress(Arr)
	;MsgBox, Up
	return 
}

DOWN:: ;down arrow key
{
	;Arr.2.1 := Arr.1.1
	;Arr.1.1 := ""
	;MsgBox, % Arr.1.1 
	;MsgBox, % Arr.2.1
	KeyPress(Arr)
	;MsgBox, Down 
	return 
}

LEFT:: ;left arrow key
{
	KeyPress(Arr)
	;MsgBox, Left 
	return
}

RIGHT:: ;right arrow key 
{
	KeyPress(Arr)
	;MsgBox, Right 
	return
}

GuiClose: ;when the GUI closes, the entire script closes 
ExitApp

;----------------------------------- FUNCTIONS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------
BoxRedraw() { ;this will cause the GUI to update the boxes and show the values in the array 
	global 
	SqR1C1 := Arr.1.1
	SqR1C2 := Arr.1.2
	SqR1C3 := Arr.1.3

	SqR2C1 := Arr.2.1
	SqR2C2 := Arr.2.2
	SqR2C3 := Arr.2.3

	SqR3C1 := Arr.3.1
	SqR3C2 := Arr.3.2
	SqR3C3 := Arr.3.3

	GuiControl,, R1C1, %SqR1C1%
	GuiControl,, R1C2, %SqR1C2%
	GuiControl,, R1C3, %SqR1C3%

	GuiControl,, R2C1, %SqR2C1%
	GuiControl,, R2C2, %SqR2C2%
	GuiControl,, R2C3, %SqR2C3%

	GuiControl,, R3C1, %SqR3C1%
	GuiControl,, R3C2, %SqR3C2%
	GuiControl,, R3C3, %SqR3C3%

	return 
}

RandomBlock(byref array) { ;this will create a random 2 block in an empty space 
	for index1, row in array 
	{
		for index2, val in row 
		{
			;MsgBox % val
			if val =
			{
				ArrayCount += 1  
			}
		}
		;MsgBox, Done with %index1% 
	}
	;MsgBox % ArrayCount 


	;game over screen if no empty spaces are left 
	if ArrayCount = 
	{
		MsgBox, GAME OVER 
		Exit 
	}

	Random, rndNum, 1, ArrayCount ;randomly assigns a 2 to empty space 
	;MsgBox % rndNum 
	ArrayCount := 0

	for index1, row in array ;loop through to find empty space
	{
		for index2, val in row 
		{
			if val =
			{
				ArrayCount += 1
				;MsgBox %ArrayCount% : %rndNum%
			}

			if (ArrayCount = rndNum) ;counts empty space until element equals the randomly generated number
			{
				;MsgBox, Column Match : %A_Index%
				col := A_Index ;gets column index of element
				break  
			}
		}

		if (ArrayCount = rndNum) ;finds the row index of element as well 
		{ 
			;MsgBox, Row Match : %A_Index%
			rw := A_Index 
			break  
		}		
	} 
	;MsgBox, row: %rw%, column: %col%
	array[rw][col] := 2 ;appends 2 to the randomly chosen element location 
	;MsgBox % array%rw%_%col%
	;herp := join2D(array) 
	;MsgBox % herp 
	ArrayCount := 0
	return 
}

KeyPress(byref array) { ;this will execute BoxRedraw and RandomBlock anytime a key is pressed
	RandomBlock(array)
	BoxRedraw()
	return 
}






; join functions to get array readouts in debugging 
join( strArray ) {
  s := ""
  for i,v in strArray
    s .= ", " . v
  return substr(s, 3)
}

join2D( strArray2D ) {
  s := ""
  for i,array in strArray2D
    s .= ", [" . join(array) . "]"
  return substr(s, 3)
}