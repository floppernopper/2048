#SingleInstance, force 
#Persistent
#NoTrayIcon

Arr := [["","",""],["","",""],["","",""]]

isArrayChanged := false 

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
Gui, Add, Edit, x0 y0 w50 h50 ReadOnly vR1C1, % Arr.1.1 
Gui, Add, Edit, x50 y0 w50 h50 ReadOnly vR1C2, % Arr.1.2 
Gui, Add, Edit, x100 y0 w50 h50 ReadOnly vR1C3, % Arr.1.3

;row2
Gui, Add, Edit, x0 y50 w50 h50 ReadOnly vR2C1, % Arr.2.1 
Gui, Add, Edit, x50 y50 w50 h50 ReadOnly vR2C2, % Arr.2.2 
Gui, Add, Edit, x100 y50 w50 h50 ReadOnly vR2C3, % Arr.2.3

;row3
Gui, Add, Edit, x0 y100 w50 h50 ReadOnly vR3C1, % Arr.3.1
Gui, Add, Edit, x50 y100 w50 h50 ReadOnly vR3C2, % Arr.3.2
Gui, Add, Edit, x100 y100 w50 h50 ReadOnly vR3C3, % Arr.3.3

Gui, Show, w150 h150, Test 

return 

;this is the controls section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; UP ARROW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UP:: ;up arrow key
{
	isArrayChanged := false
	for index, row in Arr ;looping through rows
	{
		if A_Index = 2 ;we start at the 2nd row
		{
			for index, val in row ;looping through second row 
			{ 
				if val != ;if value is not empty 
				{
					col := A_Index ;get column position of value 
					
					if (Arr[1][col] = "" ) ;if value below is empty 
					{
						;we move the value to the position below 
						Arr[1][col] := Arr[2][col]
						Arr[2][col] := ""
						isArrayChanged := true 
						continue  
					}
					if Arr[1][col] = Arr[2][col] ;if element below is same as value
					{
						;we add the two values together in bottom space 
						Arr[1][col] := Arr[1][col] * 2
						Arr[2][col] := ""
						isArrayChanged := true 
						continue  
					}

				}
			} 

		}	
		if A_Index = 2 ;finish looping if done with 2nd row 
			break  
	}

	for index, row in Arr 
	{
		if A_Index = 3 ;same as above,but for first row 
		{
			for index, val in row 
			{
				if val !=
				{
					col := A_Index 

					if (Arr[2][col] = "" ) 
					{ 
						Arr[2][col] := Arr[3][col]
						Arr[3][col] := ""
						isArrayChanged := true 
						continue  
					}
					if Arr[2][col] = Arr[3][col]
					{
						Arr[2][col] := Arr[2][col] * 2
						Arr[3][col] := ""
						isArrayChanged := true 
						continue  
					}
				}
			} 

		}	
		if A_Index = 3
			break  
	}

	for index, row in Arr ;looping through rows
	{
		if A_Index = 2 ;we start at the 2nd row
		{
			for index, val in row ;looping through second row 
			{ 
				if val != ;if value is not empty 
				{
					col := A_Index ;get column position of value 
					
					if (Arr[1][col] = "" ) ;if value below is empty 
					{
						;we move the value to the position below 
						Arr[1][col] := Arr[2][col]
						Arr[2][col] := ""
						isArrayChanged := true 
						continue  
					}
					if Arr[1][col] = Arr[2][col] ;if element below is same as value
					{
						;we add the two values together in bottom space 
						Arr[1][col] := Arr[1][col] * 2
						Arr[2][col] := ""
						isArrayChanged := true 
						continue  
					}
				}
			} 

		}	
		if A_Index = 2 ;finish looping if done with 2nd row 
			break  
	}

	if isArrayChanged = 1 
		KeyPress(Arr)	
	return 
}

DOWN:: ;down arrow key ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DOWN ARROW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
{
	isArrayChanged := false 
	for index, row in Arr ;looping through rows
	{
		if A_Index = 2 ;we start at the 2nd row
		{
			for index, val in row ;looping through second row 
			{ 
				if val != ;if value is not empty 
				{
					col := A_Index ;get column position of value 
					
					if (Arr[3][col] = "" ) ;if value below is empty 
					{
						;we move the value to the position below 
						Arr[3][col] := Arr[2][col]
						Arr[2][col] := ""
						isArrayChanged := true
						continue  
					}
					if Arr[3][col] = Arr[2][col] ;if element below is same as value
					{
						;we add the two values together in bottom space 
						Arr[3][col] := Arr[3][col] * 2
						Arr[2][col] := ""
						isArrayChanged := true
						continue  
					}
				}
			} 

		}	
		if A_Index = 2 ;finish looping if done with 2nd row 
			break  
	}

	for index, row in Arr 
	{
		if A_Index = 1 ;same as above,but for first row 
		{
			for index, val in row 
			{
				if val !=
				{
					col := A_Index 

					if (Arr[2][col] = "" ) 
					{ 
						Arr[2][col] := Arr[1][col]
						Arr[1][col] := ""
						isArrayChanged := true
						continue  
					}
					if Arr[2][col] = Arr[1][col]
					{
						Arr[2][col] := Arr[2][col] * 2
						Arr[1][col] := ""
						isArrayChanged := true
						continue  
					}
				}
			} 

		}	
		if A_Index = 1
			break  
	}

;you have to loop back through row 2 to get everything you moved down from row 1


	for index, row in Arr ;looping through rows
	{
		if A_Index = 2 ;we start at the 2nd row
		{
			for index, val in row ;looping through second row 
			{ 
				if val != ;if value is not empty 
				{
					col := A_Index ;get column position of value 
					
					if (Arr[3][col] = "" ) ;if value below is empty 
					{
						;we move the value to the position below 
						Arr[3][col] := Arr[2][col]
						Arr[2][col] := ""
						isArrayChanged := true
						continue  
					}
					if Arr[3][col] = Arr[2][col] ;if element below is same as value
					{
						;we add the two values together in bottom space 
						Arr[3][col] := Arr[3][col] * 2
						Arr[2][col] := ""
						isArrayChanged := true
						continue  
					}
				}
			} 
		}	
		if A_Index = 2 ;finish looping if done with 2nd row 
			break  
	}
	if isArrayChanged = 1
		KeyPress(Arr) 
	return 
}

LEFT:: ;left arrow key ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LEFT ARROW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
{
	isArrayChanged := false 
	for index, row in Arr 
	{
		rw := A_Index 

		for index, val in row 
		{
			if A_Index = 2
			{
				if val !=
				{
					if(Arr[rw][1] = "")
					{
						Arr[rw][1] := Arr[rw][2]
						Arr[rw][2] := ""
						isArrayChanged := true
						continue
					}
					if Arr[rw][2] = Arr[rw][1]
					{
						Arr[rw][1] := Arr[rw][1] * 2
						Arr[rw][2] := ""
						isArrayChanged := true
						continue 
					}
				}
			}

			if A_Index = 3
			{
				if val !=
				{
					if(Arr[rw][2] = "")
					{
						Arr[rw][2] := Arr[rw][3]
						Arr[rw][3] := ""
						isArrayChanged := true
						continue 
					}
					if Arr[rw][3] = Arr[rw][2]
					{
						Arr[rw][2] := Arr[rw][2] * 2
						Arr[rw][3] := ""
						isArrayChanged := true
						continue 
					}
				}
			}
		}

	}

	for index, row in Arr 
	{
		rw := A_Index 

		for index, val in row 
		{
			if A_Index = 2
			{
				if val !=
				{
					if(Arr[rw][1] = "")
					{
						Arr[rw][1] := Arr[rw][2]
						Arr[rw][2] := ""
						isArrayChanged := true
						continue
					}
					if Arr[rw][2] = Arr[rw][1]
					{
						Arr[rw][1] := Arr[rw][1] * 2
						Arr[rw][2] := ""
						isArrayChanged := true
						continue 
					}
				}
			}
		}	
	}	

	if isArrayChanged = 1
		KeyPress(Arr)
	return
}

RIGHT:: ;right arrow key ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; RIGHT ARROW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
{
	isArrayChanged := false 
	for index, row in Arr 
	{
		rw := A_Index 

		for index, val in row 
		{
			if A_Index = 2
			{
				if val !=
				{
					if(Arr[rw][3] = "")
					{
						Arr[rw][3] := Arr[rw][2]
						Arr[rw][2] := ""
						isArrayChanged := true
						continue
					}
					if Arr[rw][2] = Arr[rw][3]
					{
						Arr[rw][3] := Arr[rw][3] * 2
						Arr[rw][2] := ""
						isArrayChanged := true
						continue 
					}
				}
			}
		}
	}

	for index, row in Arr 
	{
		rw := A_Index 

		for index, val in row 
		{
			if A_Index = 1
			{
				if val !=
				{
					if(Arr[rw][2] = "")
					{
						Arr[rw][2] := Arr[rw][1]
						Arr[rw][1] := ""
						isArrayChanged := true
						continue 
					}
					if Arr[rw][1] = Arr[rw][2]
					{
						Arr[rw][2] := Arr[rw][2] * 2
						Arr[rw][1] := ""
						isArrayChanged := true
						continue 
					}
				}
			}
			if A_Index = 2
			{
				if val !=
				{
					if(Arr[rw][3] = "")
					{
						Arr[rw][3] := Arr[rw][2]
						Arr[rw][2] := ""
						isArrayChanged := true
						continue
					}
					if Arr[rw][2] = Arr[rw][3]
					{
						Arr[rw][3] := Arr[rw][3] * 2
						Arr[rw][2] := ""
						isArrayChanged := true
						continue 
					}
				}
			}
		}	
	}

	if isArrayChanged = 1
		KeyPress(Arr) 
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
/*
	if ArrayCount = 
	{
		MsgBox, GAME OVER 
		Exit 
	}
*/
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

	;check to see if game over
	for index1, row in array 
	{
		for index2, val in row 
		{
			if val =
			{
				ArrayCount += 1
				;MsgBox %ArrayCount% : %rndNum%
			}
		}
	}

	isEqual := false 

	if ArrayCount = 0
	{
		for index1, row in array 
		{
			
			rw := A_Index 

			for index2, val in row 
			{
				if A_Index = 2
				{
					if (array[rw][A_Index] = array[rw][A_Index - 1]) or (array[rw][A_Index] = array[rw][A_Index + 1]) 
					{
						isEqual := true 
						break 
					}
				}
			}

			if A_Index = 2
			{
				for index2, val in row 
				{
					col := A_Index 
					if (array[A_Index][col] = array[A_Index - 1][col]) or (array[A_Index][col] = array[A_Index + 1][col])
					{
						isEqual := true
						break
					}
				}	
			}

			if isEqual = 1
				break 
		}
	}

	if ArrayCount = 0 
	{
		if isEqual = 0
		{
			MsgBox, GAME OVER!
			Reload 
			Exit 
		}
	}

	return 
}

KeyPress(byref array) { ;this will execute BoxRedraw and RandomBlock anytime a key is pressed
	RandomBlock(array)
	BoxRedraw()
	return 
}

