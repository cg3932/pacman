%This imports the GUI's
import GUI in "%oot/lib/GUI"

%This set the screen to full screen
View.Set ("graphics:max;max,nobuttonbar")

var Font_Title, Font_Opening_Buttons, Font_Bottom_Selection : int
var Button_GUI_Bottom_Selection_1, Button_GUI_Bottom_Selection_2, Button_GUI_Bottom_Selection_3 : int
var Button_GUI_Topic_1, Button_GUI_Topic_2, Button_GUI_Topic_3, Button_GUI_Topic_4 : int
var Button_GUI_Topic_5, Button_GUI_Topic_6 : int
var Font_Title_Introduction, Font_Writing_Introduction : int
var Font_Mission_Details : int
var GUI_Bottom_Return_Introduction_2, GUI_Bottom_Play_Game_Introduction_2, GUI_Bottom_Quit_Introduction_2 : int
var Monitor_Introduction_2 := 0
var GUI_Bottom_Return_Program_Details, GUI_Bottom_Play_Game_Program_Details : int
var GUI_Centre_Information_Program_Details, GUI_Bottom_Quit_Program_Details : int
var Monitor_Program_Details_Menu := 0


Font_Title := Font.New ("Times New Roman Bold:25")
Font_Opening_Buttons := Font.New ("Times New Roman Bold:23")
Font_Bottom_Selection := Font.New ("Times New Roman Bold:18")
Font_Title_Introduction := Font.New ("Times New Roman Bold:30")
Font_Writing_Introduction := Font.New ("Times New Roman Bold:20")
Font_Mission_Details := Font.New ("Times New Roman Bold:16")


















%These are the variables needed for the direction button controls for The Pacman Game
var Get_Key_Input : array char of boolean
var Initial_Y, Initial_X, X_Value_Pacman, Y_Value_Pacman, Radius_Pacman, Check_Radius_Pacman : int
var Old_X_Value_Pacman, Old_Y_Value_Pacman, Eye_Position, Draw_Eye_Once : int

%These are the Fonts used in the pacman game
var Font_Finish_Pacman_Stage_1, Font_Start_Pacman_Stage_1, Font_Stage_Completion : int
var Font_Pacman_Titles_Stage_1, Font_Not_Finished_Pacman_Stage_1, Font_Choose_Panel_Colour : int
var Font_Title_Colour_Pacman : int

%These fonts will be used in the pacman game
Font_Finish_Pacman_Stage_1 := Font.New ("Times New Roman Bold:15")
Font_Start_Pacman_Stage_1 := Font.New ("Times New Roman Bold:14")
Font_Pacman_Titles_Stage_1 := Font.New ("Times New Roman Bold:15")
Font_Not_Finished_Pacman_Stage_1 := Font.New ("Times New Roman Bold:13")
Font_Stage_Completion := Font.New ("Times New Roman Bold:24")
Font_Choose_Panel_Colour := Font.New ("Times New Roman Bold:29")
Font_Title_Colour_Pacman := Font.New ("Times New Roman Bold:26")

%These varibales control the score,restart, and count loop values for the pacman game, stage 1
var Score_Count_Pacman, Restart_Count_Pacman, Count_Loop_Pacman := 0

%This variables control the time monitor for the pacman game, stage 1
var Time_Monitor_Pacman := 0

%These varibales will be used in an "instr" command to display the values on the screen
%with fonts in the pacman game, stage 1
var String_Score_Pacman, Text_Score_Pacman, String_Restarts_Pacman : string
var Text_Restarts_Pacman, String_Time_Pacman, Text_Time_Pacman : string

%This variable controld the stage numeber for the pacman game
var Stage_Number_For_Pacman := 1

%These variables are used to control certain aspects of the pacman, they are interchangeable
%for the three seperate stages of this particular game
var Check_Number_Tokens, Eye_Radius, Eye_Radius_Distance, Delay_On_Movement_Pacman : int
var Moving_Draw_Contant_Pacman, Check_Token_X_Beyond_Pacman, Check_Token_Y_Beyond_Pacman : int
var Check_Boundary_Pacman, Maximum_Score_For_Stage_Pacman, Check_Ensure_Walls : int
var Check_Corners_Pacman, Check_Diagonals_Pacman, Check_Sphere_Pacman, Check_Second_Diagonals : int
var Check_Remainder_Circle_Pacman, Check_Final_Ensure_Wall_Pacman, Delay_Mouth_Movement_Pacman : int

%This variable controls the mouth clearing
var Clear_Mouth_Pacman : int

%These variables control the stage transitions between the three stages
var Show_Stage_Transition_Stage_2_Pacman, Show_Stage_Transition_Stage_3_Pacman := 0

%These variables monitor how the player has lost the game
var Hit_Wall_Lose_Pacman, Finish_Line_Cross_Lose_Pacman, Starting_Line_Cross_Lose_Pacman : int

%These variables are for the GUI's in this program
var GUI_Stage_1_Complete, GUI_Stage_2_Complete, newWidth, newHeight : int

%These variables are for the choose panel colour section
var Monitor_Choose_Panel_Pacman : int
var GUI_Pacman_Panel_Colour_1, GUI_Pacman_Panel_Colour_2, GUI_Pacman_Panel_Colour_3, GUI_Pacman_Panel_Colour_4 : int
var GUI_Pacman_Panel_Colour_5, GUI_Pacman_Panel_Colour_6 : int
var The_Panel_Colour_Pacman, Writing_On_Panel_Pacman : int

%These variables are for the pacman colour selection
var Monitor_Choose_Pacman_Colour_Pacman, Monitor_Stop_Mouth_Opening_Pacman := 0
var GUI_Pacman_Colour_1, GUI_Pacman_Colour_2, GUI_Pacman_Colour_3, GUI_Pacman_Colour_4 : int
var Pacman_Colour_Pacman : int

















procedure You_Have_Lost_The_Game
    cls
    Time_Monitor_Pacman := 1
    drawfillbox (0, 0, 200, maxx, white)

    put "You Have Lost The Game"
end You_Have_Lost_The_Game

%This procedure tells the player his or her final score
procedure Final_Score_Pacman
    Time_Monitor_Pacman := 1
    cls
    locate (2, 1)
    put "You Have Won"
    put "Your Score Is ", Score_Count_Pacman
    put "Your Time Was ", Text_Time_Pacman, " Seconds" ..
end Final_Score_Pacman

process Shoot_Gun
    Music.PlayFile ("Gun_Shot.wav")
end Shoot_Gun
















%This procedure is the animation for if the player has won this pacman game
procedure You_Have_Won_Animation_Pacman
    colourback (black)
    cls

    for Change_Colour : 16 .. 31
	Draw.Text ("You've Won", 228, 256, Font_Goodbye_Quit_Game, Change_Colour)
	delay (100)
    end for

    for decreasing Change_Colour : 31 .. 16
	Draw.Text ("You've Won", 228, 256, Font_Goodbye_Quit_Game, Change_Colour)
	delay (100)
    end for

    colourback (white)
    cls
end You_Have_Won_Animation_Pacman

%This procedure is called upon when the player chooses yellow
procedure Pacman_Colour_Selection_Pacman_1
    cls
    fork Shoot_Gun

    %This disblaes the GUI's for this section
    GUI.Disable (GUI_Pacman_Colour_1)
    GUI.Disable (GUI_Pacman_Colour_2)
    GUI.Disable (GUI_Pacman_Colour_3)
    GUI.Disable (GUI_Pacman_Colour_4)

    %This sets the values for this particular procedure
    Monitor_Stop_Mouth_Opening_Pacman := 1
    Monitor_Choose_Pacman_Colour_Pacman := 1
    Pacman_Colour_Pacman := yellow
end Pacman_Colour_Selection_Pacman_1

%This procedure is called upon when the player chooses blue
procedure Pacman_Colour_Selection_Pacman_2
    cls
    fork Shoot_Gun

    %This disblaes the GUI's for this section
    GUI.Disable (GUI_Pacman_Colour_1)
    GUI.Disable (GUI_Pacman_Colour_2)
    GUI.Disable (GUI_Pacman_Colour_3)
    GUI.Disable (GUI_Pacman_Colour_4)

    %This sets the values for this particular procedure
    Monitor_Stop_Mouth_Opening_Pacman := 1
    Monitor_Choose_Pacman_Colour_Pacman := 1
    Pacman_Colour_Pacman := blue
end Pacman_Colour_Selection_Pacman_2

%This procedure is called upon when the player chooses orange
procedure Pacman_Colour_Selection_Pacman_3
    cls
    fork Shoot_Gun

    %This disblaes the GUI's for this section
    GUI.Disable (GUI_Pacman_Colour_1)
    GUI.Disable (GUI_Pacman_Colour_2)
    GUI.Disable (GUI_Pacman_Colour_3)
    GUI.Disable (GUI_Pacman_Colour_4)

    %This sets the values for this particular procedure
    Monitor_Stop_Mouth_Opening_Pacman := 1
    Monitor_Choose_Pacman_Colour_Pacman := 1
    Pacman_Colour_Pacman := 42
end Pacman_Colour_Selection_Pacman_3

%This procedure is called upon when the player chooses green
procedure Pacman_Colour_Selection_Pacman_4
    cls
    fork Shoot_Gun

    %This disblaes the GUI's for this section
    GUI.Disable (GUI_Pacman_Colour_1)
    GUI.Disable (GUI_Pacman_Colour_2)
    GUI.Disable (GUI_Pacman_Colour_3)
    GUI.Disable (GUI_Pacman_Colour_4)

    %This sets the values for this particular procedure
    Monitor_Stop_Mouth_Opening_Pacman := 1
    Monitor_Choose_Pacman_Colour_Pacman := 1
    Pacman_Colour_Pacman := green
end Pacman_Colour_Selection_Pacman_4

%This animates the pacmen
process Draw_The_Pacman_Types
    for Repeat_Mouth_Movement : 1 .. 100000
	for Open_And_Close_Mouths : 0 .. 45
	    %Top Left
	    drawfillarc (200, 330, 50, 50, 45 - Open_And_Close_Mouths, 315 + Open_And_Close_Mouths, yellow)
	    %Top Right
	    drawfillarc (585, 330, 50, 50, 45 - Open_And_Close_Mouths, 315 + Open_And_Close_Mouths, blue)
	    %Bottom Left
	    drawfillarc (200, 112, 50, 50, 45 - Open_And_Close_Mouths, 315 + Open_And_Close_Mouths, 42)
	    %Bottom Right
	    drawfillarc (585, 112, 50, 50, 45 - Open_And_Close_Mouths, 315 + Open_And_Close_Mouths, green)

	    %Draw The Eyes
	    drawfilloval (200, 355, 7, 7, black)
	    drawfilloval (585, 355, 7, 7, black)
	    drawfilloval (200, 137, 7, 7, black)
	    drawfilloval (585, 137, 7, 7, black)

	    delay (13)

	    if Monitor_Stop_Mouth_Opening_Pacman = 1 then
		cls
		delay (10)
	    end if

	    exit when Monitor_Stop_Mouth_Opening_Pacman = 1
	end for

	%Top Left
	drawfilloval (200, 330, 52, 52, grey)
	%Top Right
	drawfilloval (585, 330, 52, 52, grey)
	%Bottom Left
	drawfilloval (200, 112, 52, 52, grey)
	%Bottom Right
	drawfilloval (585, 112, 52, 52, grey)

	if Monitor_Stop_Mouth_Opening_Pacman = 1 then
	    cls
	    delay (10)
	end if

	exit when Monitor_Stop_Mouth_Opening_Pacman = 1
    end for
end Draw_The_Pacman_Types

%This procedure allows the player to choose the pacman colour
procedure Choose_The_Pacman_Colour_Pacman
    %This resets the monitor for this section
    Monitor_Choose_Pacman_Colour_Pacman := 0

    %Background Picture
    Pic.ScreenLoad ("Background_Choose_Pacman_Colour_Pacman.bmp", 0, 0, picCopy)

    %Flame Decals
    var pic1 : int := Pic.FileNew ("Flame_Decal_Left.bmp")
    Pic.SetTransparentColor (pic1, black)
    Pic.Draw (pic1, 10, 465, picMerge)

    var pic2 : int := Pic.FileNew ("Flame_Decal_Right.bmp")
    Pic.SetTransparentColor (pic2, black)
    Pic.Draw (pic2, 660, 463, picMerge)

    %Title
    Draw.Text ("Please Choose The Pacman Colour", 133, 470, Font_Title_Colour_Pacman, black)

    %GUI Buttons for left three boxes
    %Top Left
    GUI_Pacman_Colour_1 := GUI.CreateButton (80, 265, 0, " ", Pacman_Colour_Selection_Pacman_1)
    newWidth := 250
    newHeight := 170
    GUI.SetSize (GUI_Pacman_Colour_1, newWidth, newHeight)

    %Bottom Left
    GUI_Pacman_Colour_3 := GUI.CreateButton (80, 46, 0, " ", Pacman_Colour_Selection_Pacman_3)
    newWidth := 250
    newHeight := 170
    GUI.SetSize (GUI_Pacman_Colour_3, newWidth, newHeight)

    %GUI Buttons for the right three boxes
    %Top Right
    GUI_Pacman_Colour_2 := GUI.CreateButton (460, 265, 0, " ", Pacman_Colour_Selection_Pacman_2)
    newWidth := 250
    newHeight := 170
    GUI.SetSize (GUI_Pacman_Colour_2, newWidth, newHeight)

    %Bottom Right
    GUI_Pacman_Colour_4 := GUI.CreateButton (460, 46, 0, " ", Pacman_Colour_Selection_Pacman_4)
    newWidth := 250
    newHeight := 170
    GUI.SetSize (GUI_Pacman_Colour_4, newWidth, newHeight)

    %Six Main Buttons
    %Left Boxes
    %Top Left
    Draw.Text ("YELLOW", 135, 395, Font_Opening_Buttons, black)
    %Middle Left
    Draw.Text ("ORANGE", 135, 178, Font_Opening_Buttons, black)

    %Right Boxes
    %Top Right
    Draw.Text ("BLUE", 540, 395, Font_Opening_Buttons, black)
    %Middle Right
    Draw.Text ("GREEN", 525, 178, Font_Opening_Buttons, black)

    fork Draw_The_Pacman_Types

    %This is the loop and monitor for this set of GUI's
    loop
	exit when GUI.ProcessEvent
	if Monitor_Choose_Pacman_Colour_Pacman = 1 then
	    exit
	end if
    end loop
end Choose_The_Pacman_Colour_Pacman

%This procedure is called upon if the player chooses black
procedure Panel_Colour_Selection_Pacman_1
    fork Shoot_Gun
    Monitor_Choose_Panel_Pacman := 1

    GUI.Disable (GUI_Pacman_Panel_Colour_1)
    GUI.Disable (GUI_Pacman_Panel_Colour_2)
    GUI.Disable (GUI_Pacman_Panel_Colour_3)
    GUI.Disable (GUI_Pacman_Panel_Colour_4)
    GUI.Disable (GUI_Pacman_Panel_Colour_5)
    GUI.Disable (GUI_Pacman_Panel_Colour_6)

    The_Panel_Colour_Pacman := black
    Writing_On_Panel_Pacman := white
end Panel_Colour_Selection_Pacman_1

%This procedure is called upon if the player chooses white
procedure Panel_Colour_Selection_Pacman_2
    fork Shoot_Gun
    Monitor_Choose_Panel_Pacman := 1

    GUI.Disable (GUI_Pacman_Panel_Colour_1)
    GUI.Disable (GUI_Pacman_Panel_Colour_2)
    GUI.Disable (GUI_Pacman_Panel_Colour_3)
    GUI.Disable (GUI_Pacman_Panel_Colour_4)
    GUI.Disable (GUI_Pacman_Panel_Colour_5)
    GUI.Disable (GUI_Pacman_Panel_Colour_6)

    The_Panel_Colour_Pacman := grey
    Writing_On_Panel_Pacman := black
end Panel_Colour_Selection_Pacman_2

%This procedure is called upon if the player chooses orange
procedure Panel_Colour_Selection_Pacman_3
    fork Shoot_Gun
    Monitor_Choose_Panel_Pacman := 1

    GUI.Disable (GUI_Pacman_Panel_Colour_1)
    GUI.Disable (GUI_Pacman_Panel_Colour_2)
    GUI.Disable (GUI_Pacman_Panel_Colour_3)
    GUI.Disable (GUI_Pacman_Panel_Colour_4)
    GUI.Disable (GUI_Pacman_Panel_Colour_5)
    GUI.Disable (GUI_Pacman_Panel_Colour_6)

    The_Panel_Colour_Pacman := 42
    Writing_On_Panel_Pacman := black
end Panel_Colour_Selection_Pacman_3

%This procedure is called upon if the player chooses green
procedure Panel_Colour_Selection_Pacman_4
    fork Shoot_Gun
    Monitor_Choose_Panel_Pacman := 1

    GUI.Disable (GUI_Pacman_Panel_Colour_1)
    GUI.Disable (GUI_Pacman_Panel_Colour_2)
    GUI.Disable (GUI_Pacman_Panel_Colour_3)
    GUI.Disable (GUI_Pacman_Panel_Colour_4)
    GUI.Disable (GUI_Pacman_Panel_Colour_5)
    GUI.Disable (GUI_Pacman_Panel_Colour_6)

    The_Panel_Colour_Pacman := green
    Writing_On_Panel_Pacman := black
end Panel_Colour_Selection_Pacman_4

%This procedure is called upon if the player chooses blue
procedure Panel_Colour_Selection_Pacman_5
    fork Shoot_Gun
    Monitor_Choose_Panel_Pacman := 1

    GUI.Disable (GUI_Pacman_Panel_Colour_1)
    GUI.Disable (GUI_Pacman_Panel_Colour_2)
    GUI.Disable (GUI_Pacman_Panel_Colour_3)
    GUI.Disable (GUI_Pacman_Panel_Colour_4)
    GUI.Disable (GUI_Pacman_Panel_Colour_5)
    GUI.Disable (GUI_Pacman_Panel_Colour_6)

    The_Panel_Colour_Pacman := blue
    Writing_On_Panel_Pacman := white
end Panel_Colour_Selection_Pacman_5

%This procedure is called upon if the player chooses red
procedure Panel_Colour_Selection_Pacman_6
    fork Shoot_Gun
    Monitor_Choose_Panel_Pacman := 1

    GUI.Disable (GUI_Pacman_Panel_Colour_1)
    GUI.Disable (GUI_Pacman_Panel_Colour_2)
    GUI.Disable (GUI_Pacman_Panel_Colour_3)
    GUI.Disable (GUI_Pacman_Panel_Colour_4)
    GUI.Disable (GUI_Pacman_Panel_Colour_5)
    GUI.Disable (GUI_Pacman_Panel_Colour_6)

    The_Panel_Colour_Pacman := 39
    Writing_On_Panel_Pacman := black
end Panel_Colour_Selection_Pacman_6

%This procedure allows the player to choose the panel colour for the pacman game
procedure Choose_The_Panel_Colour_Pacman
    %This delays this procedure
    delay (50)

    %This resets the monitor for this section
    Monitor_Choose_Panel_Pacman := 0

    %Background Picture
    Pic.ScreenLoad ("Background_Choose_Panel_Colour_Pacman.bmp", 0, 0, picCopy)

    %Flame Decals
    var pic1 : int := Pic.FileNew ("Flame_Decal_Left.bmp")
    Pic.SetTransparentColor (pic1, black)
    Pic.Draw (pic1, 2, 465, picMerge)

    var pic2 : int := Pic.FileNew ("Flame_Decal_Right.bmp")
    Pic.SetTransparentColor (pic2, black)
    Pic.Draw (pic2, 663, 463, picMerge)

    %Title
    Draw.Text ("Please Choose The Panel Colour", 130, 470, Font_Choose_Panel_Colour, black)

    %GUI Buttons for left three boxes
    %Top Left
    GUI_Pacman_Panel_Colour_1 := GUI.CreateButton (80, 340, 0, " ", Panel_Colour_Selection_Pacman_1)
    newWidth := 250
    newHeight := 90
    GUI.SetSize (GUI_Pacman_Panel_Colour_1, newWidth, newHeight)
    GUI.SetColour (GUI_Pacman_Panel_Colour_1, black)

    %Middle Left
    GUI_Pacman_Panel_Colour_3 := GUI.CreateButton (80, 196, 0, " ", Panel_Colour_Selection_Pacman_3)
    newWidth := 250
    newHeight := 90
    GUI.SetSize (GUI_Pacman_Panel_Colour_3, newWidth, newHeight)
    GUI.SetColour (GUI_Pacman_Panel_Colour_3, 42)

    %Bottom Left
    GUI_Pacman_Panel_Colour_5 := GUI.CreateButton (80, 53, 0, " ", Panel_Colour_Selection_Pacman_5)
    newWidth := 250
    newHeight := 90
    GUI.SetSize (GUI_Pacman_Panel_Colour_5, newWidth, newHeight)
    GUI.SetColour (GUI_Pacman_Panel_Colour_5, blue)

    %GUI Buttons for the right three boxes
    %Top Right
    GUI_Pacman_Panel_Colour_2 := GUI.CreateButton (460, 340, 0, " ", Panel_Colour_Selection_Pacman_2)
    newWidth := 250
    newHeight := 90
    GUI.SetSize (GUI_Pacman_Panel_Colour_2, newWidth, newHeight)
    GUI.SetColour (GUI_Pacman_Panel_Colour_2, grey)

    %Middle Right
    GUI_Pacman_Panel_Colour_4 := GUI.CreateButton (460, 196, 0, " ", Panel_Colour_Selection_Pacman_4)
    newWidth := 250
    newHeight := 90
    GUI.SetSize (GUI_Pacman_Panel_Colour_4, newWidth, newHeight)
    GUI.SetColour (GUI_Pacman_Panel_Colour_4, green)

    %Bottom Right
    GUI_Pacman_Panel_Colour_6 := GUI.CreateButton (460, 53, 0, " ", Panel_Colour_Selection_Pacman_6)
    newWidth := 250
    newHeight := 90
    GUI.SetSize (GUI_Pacman_Panel_Colour_6, newWidth, newHeight)
    GUI.SetColour (GUI_Pacman_Panel_Colour_6, 39)

    %Six Main Buttons
    %Left Boxes
    %Top Left
    Draw.Text ("BLACK", 145, 375, Font_Opening_Buttons, white)
    %Middle Left
    Draw.Text ("ORANGE", 135, 231, Font_Opening_Buttons, black)
    %Bottom Left
    Draw.Text ("BLUE", 158, 88, Font_Opening_Buttons, white)

    %Right Boxes
    %Top Right
    Draw.Text ("GREY", 535, 375, Font_Opening_Buttons, black)
    %Middle Right
    Draw.Text ("GREEN", 525, 231, Font_Opening_Buttons, black)
    %Bottom Right
    Draw.Text ("RED", 550, 88, Font_Opening_Buttons, black)

    %This is the loop and monitor for this set of GUI's
    loop
	exit when GUI.ProcessEvent
	if Monitor_Choose_Panel_Pacman = 1 then
	    exit
	end if
    end loop
end Choose_The_Panel_Colour_Pacman

%This procedure sets the values for the different stages of this game
procedure Set_Values_Stage_Number_Pacman
    if Stage_Number_For_Pacman = 1 then
	%These set variables set the pacman's initial start and movement variables
	Initial_Y := 150
	Initial_X := 465
	Radius_Pacman := 40
	Check_Radius_Pacman := 41
	Old_X_Value_Pacman := Initial_X
	Old_Y_Value_Pacman := Initial_Y

	%These are the key movement variables, they all must be equal to one another
	Eye_Radius_Distance := 22
	X_Value_Pacman := 22
	Y_Value_Pacman := 22
	Moving_Draw_Contant_Pacman := 22

	%This controls the speed of the pacman and his mouth movement
	Delay_On_Movement_Pacman := 10
	Delay_Mouth_Movement_Pacman := 5

	%This sets the checking systems for the tokens
	Check_Token_X_Beyond_Pacman := 4
	Check_Token_Y_Beyond_Pacman := 6
	Check_Boundary_Pacman := 4
	Check_Ensure_Walls := 11

	%This sets the checking systems for the walls and the finish line
	Check_Corners_Pacman := 4
	Check_Diagonals_Pacman := 3
	Check_Sphere_Pacman := 9
	Check_Second_Diagonals := 21
	Check_Remainder_Circle_Pacman := 4
	Check_Final_Ensure_Wall_Pacman := 26

	%This clears the mouth
	Clear_Mouth_Pacman := 22

	%This sets the eye specifications
	Eye_Radius := 5

	%This sets the maximum score for stage 1
	Maximum_Score_For_Stage_Pacman := 34
    elsif Stage_Number_For_Pacman = 2 then
	%These set variables set the pacman's initial start and movement variables
	Initial_Y := 142
	Initial_X := 395
	Radius_Pacman := 37
	Check_Radius_Pacman := 38
	Old_X_Value_Pacman := Initial_X
	Old_Y_Value_Pacman := Initial_Y

	%These are the key movement variables, they all must be equal to one another
	Eye_Radius_Distance := 16
	X_Value_Pacman := 16
	Y_Value_Pacman := 16
	Moving_Draw_Contant_Pacman := 16

	%This controls the speed of the pacman and his mouth movement
	Delay_On_Movement_Pacman := 10
	Delay_Mouth_Movement_Pacman := 5

	%This sets the checking systems for both the tokens and the boundaries
	Check_Token_X_Beyond_Pacman := 4
	Check_Token_Y_Beyond_Pacman := 6
	Check_Boundary_Pacman := 4
	Check_Ensure_Walls := 11

	%This sets the checking systems for the walls and the finish line
	Check_Corners_Pacman := 5
	Check_Diagonals_Pacman := 3
	Check_Sphere_Pacman := 3
	Check_Second_Diagonals := 15
	Check_Remainder_Circle_Pacman := 4
	Check_Final_Ensure_Wall_Pacman := 15

	%This clears the mouth
	Clear_Mouth_Pacman := 22

	%This sets the eye specifications
	Eye_Radius := 5

	%This sets the maximum score for stage 1
	Maximum_Score_For_Stage_Pacman := 54
    elsif Stage_Number_For_Pacman = 3 then
	%These set variables set the pacman's initial start and movement variables
	Initial_Y := 140
	Initial_X := 391
	Radius_Pacman := 23
	Check_Radius_Pacman := 24
	Old_X_Value_Pacman := Initial_X
	Old_Y_Value_Pacman := Initial_Y

	%These are the key movement variables, they all must be equal to one another
	Eye_Radius_Distance := 12
	X_Value_Pacman := 12
	Y_Value_Pacman := 12
	Moving_Draw_Contant_Pacman := 12

	%This controls the speed of the pacman and his mouth movement
	Delay_On_Movement_Pacman := 10
	Delay_Mouth_Movement_Pacman := 5

	%This sets the checking systems for both the tokens and the boundaries
	Check_Token_X_Beyond_Pacman := 4
	Check_Token_Y_Beyond_Pacman := 6
	Check_Boundary_Pacman := 4
	Check_Ensure_Walls := 11

	%This sets the checking systems for the walls and the finish line
	Check_Corners_Pacman := 3
	Check_Diagonals_Pacman := 2
	Check_Sphere_Pacman := 5
	Check_Second_Diagonals := 9
	Check_Remainder_Circle_Pacman := 4
	Check_Final_Ensure_Wall_Pacman := 17

	%This clears the mouth
	Clear_Mouth_Pacman := 12

	%This sets the eye specifications
	Eye_Radius := 3

	%This sets the maximum score for stage 1
	Maximum_Score_For_Stage_Pacman := 69
    end if
end Set_Values_Stage_Number_Pacman

%This is the time counting process for this game
process Time_Count_Pacman
    for c : 0 .. 1000
	String_Time_Pacman := intstr (c, 1)
	Text_Time_Pacman := String_Time_Pacman
	drawfillbox (37, 13, 103, 39, white)
	Draw.Text ("Sec", 72, 20, Font_Pacman_Titles_Stage_1, black)
	delay (1000)
	exit when Time_Monitor_Pacman = 1
    end for
end Time_Count_Pacman

%This is the clear screen procedure for the GUI's that I will be using in this section
procedure Clear_The_Screen_Stage_Pacman
    cls
end Clear_The_Screen_Stage_Pacman

%This procedure draws the transion between the two stage elevations
procedure Draw_Transition_Between_Stages_Pacman
    if Stage_Number_For_Pacman = 2 then
	%This clears the screen
	cls

	%This draws the lines
	for Draw_Vertical_Lines : 0 .. 700 by 112
	    drawfillbox (115 + Draw_Vertical_Lines, 0, 120 + Draw_Vertical_Lines, 700, black)
	end for

	for Draw_Horizontal_Lines : 0 .. 700 by 115
	    drawfillbox (0, 66 + Draw_Horizontal_Lines, maxx, 71 + Draw_Horizontal_Lines, black)
	end for

	%Outer Boxes
	drawfillbox (0, 0, 5, maxy, black)
	drawfillbox (0, 75, maxx, 80, black)
	drawfillbox (maxx - 5, 75, maxx, maxy, black)
	drawfillbox (0, maxy - 5, maxx, maxy, black)
	drawfillbox (6, maxy - 14, maxx - 6, maxy - 6, white)
	drawfillbox (227, maxy - 50, 232, maxy, black)
	drawfillbox (0, 75, 800, 0, white)

	%Start
	drawfillbox (345, 81, 450, 100, 8)
	Draw.Text ("START", 364, 84, Font_Start_Pacman_Stage_1, 17)

	%Finish
	drawfillbox (206, 417, 226, 534, 29)
	Draw.Text ("F", 210, 510, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("I", 212, 494, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("N", 209, 478, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("I", 212, 462, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("S", 211, 446, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("H", 209, 430, Font_Finish_Pacman_Stage_1, 17)

	%Draw in the spaces
	drawfillbox (345, 142, 450, 342, white)
	drawfillbox (345, 410, 650, 302, white)
	drawfillbox (569, 410, 674, 280, white)
	drawfillbox (560, 295, 674, 187, white)
	drawfillbox (457, 295, 562, 177, white)
	drawfillbox (457, 180, 762, 81, white)
	drawfillbox (681, 520, 781, 81, white)
	drawfillbox (281, 525, 781, 417, white)
	drawfillbox (233, 525, 338, 407, white)
	drawfillbox (223, 410, 338, 302, white)
	drawfillbox (233, 290, 338, 172, white)
	drawfillbox (121, 410, 226, 282, white)
	drawfillbox (121, 295, 236, 187, white)
	drawfillbox (111, 180, 236, 81, white)
	drawfillbox (6, 520, 114, 81, white)
	drawfillbox (6, 525, 134, 417, white)

	%Finish Line Protective Barrier
	drawfillbox (227, 411, 232, 526, 19)

	%Draw The Dots
	for Draw_Circles : 0 .. 180 by 65
	    drawfilloval (395, 360 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 75
	    drawfilloval (395 + Draw_Circles, 360, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 65
	    drawfilloval (620, 360 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 150 by 55
	    drawfilloval (620 - Draw_Circles, 230, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 150 by 55
	    drawfilloval (510, 230 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 250 by 74
	    drawfilloval (510 + Draw_Circles, 120, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 350 by 70
	    drawfilloval (732, 120 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 500 by 74
	    drawfilloval (732 - Draw_Circles, 470, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 60
	    drawfilloval (288, 470 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 60
	    drawfilloval (288 - Draw_Circles, 350, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 60
	    drawfilloval (169, 350 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 60
	    drawfilloval (169 + Draw_Circles, 230, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 55
	    drawfilloval (289, 230 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 280 by 57
	    drawfilloval (289 - Draw_Circles, 120, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 350 by 70
	    drawfilloval (61, 120 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 150 by 55
	    drawfilloval (61 + Draw_Circles, 470, 10, 10, brightred)
	end for

    elsif Stage_Number_For_Pacman = 3 then
	%This clears the screen
	cls

	%This draws the lines
	for Draw_Vertical_Lines : 0 .. 700 by 90
	    drawfillbox (80 + Draw_Vertical_Lines, 0, 75 + Draw_Vertical_Lines, 700, black)
	end for

	for Draw_Horizontal_Lines : 0 .. 700 by 92
	    drawfillbox (0, 66 + Draw_Horizontal_Lines, maxx, 71 + Draw_Horizontal_Lines, black)
	end for

	%Outer Edge Boxes
	drawfillbox (0, 0, 5, maxy, black)
	drawfillbox (0, 75, maxx, 80, black)
	drawfillbox (maxx - 5, 75, maxx, maxy, black)
	drawfillbox (6, maxy, maxx - 6, maxy - 5, black)
	drawfillbox (6, maxy - 6, maxx - 6, maxy - 15, white)
	drawfillbox (260, maxy - 6, 255, maxy - 15, black)
	drawfillbox (0, 75, 800, 0, white)

	%Start and Finish
	%Start
	drawfillbox (351, 81, 434, 100, 8)
	Draw.Text ("START", 360, 85, Font_Start_Pacman_Stage_1, 17)

	%Finish
	drawfillbox (81, 230, 164, 249, 29)
	Draw.Text ("FINISH", 89, 234, Font_Finish_Pacman_Stage_1, 17)

	%Draw The Spaces
	drawfillbox (351, 130, 434, 200, white)
	drawfillbox (351, 249, 445, 164, white)
	drawfillbox (551, 249, 645, 164, white)
	drawfillbox (501, 157, 595, 81, white)
	drawfillbox (441, 177, 524, 81, white)
	drawfillbox (531, 177, 614, 81, white)
	drawfillbox (621, 177, 704, 81, white)
	drawfillbox (621, 157, 724, 81, white)
	drawfillbox (711, 257, 781, 81, white)
	drawfillbox (611, 341, 781, 256, white)
	drawfillbox (531, 421, 614, 256, white)
	drawfillbox (531, 433, 714, 348, white)
	drawfillbox (711, 443, 781, 348, white)
	drawfillbox (311, 525, 781, 440, white)
	drawfillbox (351, 525, 434, 400, white)
	drawfillbox (351, 433, 454, 348, white)
	drawfillbox (441, 433, 524, 320, white)
	drawfillbox (341, 341, 524, 256, white)
	drawfillbox (261, 431, 344, 156, white)
	drawfillbox (181, 433, 344, 348, white)
	drawfillbox (171, 453, 254, 348, white)
	drawfillbox (71, 525, 254, 440, white)
	drawfillbox (6, 525, 74, 400, white)
	drawfillbox (6, 433, 144, 348, white)
	drawfillbox (6, 333, 74, 148, white)
	drawfillbox (6, 341, 224, 256, white)
	drawfillbox (171, 341, 254, 156, white)
	drawfillbox (171, 81, 274, 157, white)
	drawfillbox (71, 81, 94, 157, white)
	drawfillbox (81, 81, 164, 177, white)

	%Protective Finish Barrier
	drawfillbox (75, 250, 170, 255, 19)

	%Draw The Circles
	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (391 + Draw_Circles, 210, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (481, 210 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (481 + Draw_Circles, 120, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (571 + Draw_Circles, 210, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (661, 210 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 85
	    drawfilloval (661 + Draw_Circles, 120, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 89
	    drawfilloval (747, 120 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 85
	    drawfilloval (747 - Draw_Circles, 298, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 90
	    drawfilloval (577, 298 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 85
	    drawfilloval (577 + Draw_Circles, 388, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 98
	    drawfilloval (747, 388 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 470 by 90
	    drawfilloval (747 - Draw_Circles, 486, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 98
	    drawfilloval (388, 486 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 90
	    drawfilloval (388 + Draw_Circles, 388, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 90
	    drawfilloval (478, 388 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 88
	    drawfilloval (478 - Draw_Circles, 298, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 88
	    drawfilloval (302, 298 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 88
	    drawfilloval (302, 298 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 88
	    drawfilloval (302 - Draw_Circles, 386, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 98
	    drawfilloval (214, 386 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 280 by 85
	    drawfilloval (214 - Draw_Circles, 484, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 90
	    drawfilloval (45, 484 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 80
	    drawfilloval (45 + Draw_Circles, 394, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 87
	    drawfilloval (302 - Draw_Circles, 122, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 220 by 87
	    drawfilloval (215, 122 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 220 by 85
	    drawfilloval (215 - Draw_Circles, 296, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 220 by 87
	    drawfilloval (45, 296 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 75
	    drawfilloval (45 + Draw_Circles, 122, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 75
	    drawfilloval (120, 122 + Draw_Circles, 10, 10, brightred)
	end for
    end if

    %This draws the bottom panel
    %Bottom Panel
    %Drawfillbox
    drawfillbox (0, 0, maxx, 75, red)

    %Top Line
    drawline (0, 75, 800, 75, black)

    %Drawfill
    drawfill (1, 1, The_Panel_Colour_Pacman, black)

    %Middle Box
    %Lines
    drawline (maxx div 2 - 109, 10, maxx div 2 + 109, 10, black)
    drawline (maxx div 2 - 109, 42, maxx div 2 + 109, 42, black)
    %Left Arc
    drawarc (maxx div 2 - 109, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (maxx div 2 + 109, 26, 16, 16, 270, 90, black)

    %Far Left Box
    %Lines
    drawline (36, 10, 104, 10, black)
    drawline (36, 42, 104, 42, black)
    %Left Arc
    drawarc (36, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (104, 26, 16, 16, 270, 90, black)

    %Left Box
    %Lines
    drawline (160, 10, 228, 10, black)
    drawline (160, 42, 228, 42, black)
    %Left Arc
    drawarc (160, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (228, 26, 16, 16, 270, 90, black)

    %Right Box
    %Lines
    drawline (557, 10, 625, 10, black)
    drawline (557, 42, 625, 42, black)
    %Left Arc
    drawarc (557, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (625, 26, 16, 16, 270, 90, black)

    %Far Right Box
    %Lines
    drawline (681, 10, 749, 10, black)
    drawline (681, 42, 749, 42, black)
    %Left Arc
    drawarc (681, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (749, 26, 16, 16, 270, 90, black)

    %Filling In The Bottom Boxes
    %Middle Box
    drawfillbox (maxx div 2 - 109, 11, maxx div 2 + 109, 41, white)
    drawfillarc (maxx div 2 - 109, 26, 15, 15, 90, 270, white)
    drawfillarc (maxx div 2 + 109, 26, 15, 15, 270, 90, white)

    %Far Left Box
    drawfillbox (37, 11, 104, 41, white)
    drawfillarc (36, 26, 15, 15, 90, 270, white)
    drawfillarc (104, 26, 15, 15, 270, 90, white)

    %Left Box
    drawfillbox (160, 11, 228, 41, white)
    drawfillarc (160, 26, 15, 15, 90, 270, white)
    drawfillarc (228, 26, 15, 15, 270, 90, white)

    %Right Box
    drawfillbox (557, 11, 625, 41, white)
    drawfillarc (557, 26, 15, 15, 90, 270, white)
    drawfillarc (625, 26, 15, 15, 270, 90, white)

    %Far Right Box
    drawfillbox (681, 11, 749, 41, white)
    drawfillarc (681, 26, 15, 15, 90, 270, white)
    drawfillarc (749, 26, 15, 15, 270, 90, white)

    %Text For The Bottom Boxes
    Draw.Text ("Time", 50, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)
    Draw.Text ("Sec", 72, 20, Font_Pacman_Titles_Stage_1, black)
    Draw.Text ("Score", 171, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)
    Draw.Text ("Status", 365, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)
    Draw.Text ("Stage", 568, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)
    Draw.Text ("Restarts", 680, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)

    %Right Box
    %Stage
    if Stage_Number_For_Pacman = 1 then
	Draw.Text ("1", 585, 20, Font_Pacman_Titles_Stage_1, blue)
    elsif Stage_Number_For_Pacman = 2 then
	Draw.Text ("2", 585, 20, Font_Pacman_Titles_Stage_1, blue)
    elsif Stage_Number_For_Pacman = 3 then
	Draw.Text ("3", 585, 20, Font_Pacman_Titles_Stage_1, blue)
    end if

    if Stage_Number_For_Pacman = 2 then
	%Centre GUI
	GUI_Stage_1_Complete := GUI.CreateButton (maxx div 2 - 125, maxy div 2 - 50, 0, " ", Clear_The_Screen_Stage_Pacman)
	newWidth := 250
	newHeight := 100
	GUI.SetSize (GUI_Stage_1_Complete, newWidth, newHeight)

	GUI.Disable (GUI_Stage_1_Complete)

	Draw.Text ("Stage 1 Complete", maxx div 2 - 113, maxy div 2 + 10, Font_Stage_Completion, blue)

	for Fill_The_Box : 0 .. 226
	    drawfillbox (maxx div 2 - 113, maxy div 2 - 10, maxx div 2 - 113 + Fill_The_Box, maxy div 2 - 30, brightred)
	    delay (10)
	end for

    elsif Stage_Number_For_Pacman = 3 then
	%Centre GUI
	GUI_Stage_2_Complete := GUI.CreateButton (maxx div 2 - 125, maxy div 2 - 50, 0, " ", Clear_The_Screen_Stage_Pacman)
	newWidth := 250
	newHeight := 100
	GUI.SetSize (GUI_Stage_2_Complete, newWidth, newHeight)

	GUI.Disable (GUI_Stage_2_Complete)

	Draw.Text ("Stage 2 Complete", maxx div 2 - 113, maxy div 2 + 10, Font_Stage_Completion, blue)

	for Fill_The_Box : 0 .. 226
	    drawfillbox (maxx div 2 - 113, maxy div 2 - 10, maxx div 2 - 113 + Fill_The_Box, maxy div 2 - 30, brightred)
	    delay (10)
	end for
    end if
    %This resets the stage values
    Show_Stage_Transition_Stage_2_Pacman := 0
    Show_Stage_Transition_Stage_3_Pacman := 0
end Draw_Transition_Between_Stages_Pacman

%This draws the background for the pacman game, stage 1
proc Draw_Background_Pacman
    %This draws the transition
    if Show_Stage_Transition_Stage_2_Pacman = 1 then
	Draw_Transition_Between_Stages_Pacman
    elsif Show_Stage_Transition_Stage_3_Pacman = 1 then
	Draw_Transition_Between_Stages_Pacman
    end if

    %This clears the screen
    cls
    delay (100)
    cls

    %This if statement checks which stage of the game it is in order to decide which layout to draw
    if Stage_Number_For_Pacman = 1 then
	%Draw The Vertical Lines
	for Draw_Vertical_Lines : 0 .. 700 by 135
	    drawfillbox (125 + Draw_Vertical_Lines, 0, 130 + Draw_Vertical_Lines, 700, black)
	end for

	%Draw The Horizontal Lines
	for Draw_Horizontal_Lines : 0 .. 700 by 120
	    drawfillbox (0, 60 + Draw_Horizontal_Lines, maxx, 65 + Draw_Horizontal_Lines, black)
	end for

	%Draw The Spaces
	drawfillbox (401, 100, 529, 200, white)
	drawfillbox (200, 306, 540, 419, white)
	drawfillbox (390, 186, 529, 299, white)
	drawfillbox (266, 180, 400, 299, white)
	drawfillbox (66, 75, 394, 179, white)
	drawfillbox (0, 75, 124, 579, white)
	drawfillbox (0, 306, 135, 419, white)
	drawfillbox (0, 426, 135, 549, white)
	drawfillbox (259, 290, 131, 419, white)
	drawfillbox (536, 80, 664, 419, white)
	drawfillbox (664, 75, 794, 179, white)
	drawfillbox (671, 75, 794, 679, white)
	drawfillbox (390, 426, 794, 679, white)

	%Start
	drawfillbox (401, 80, 529, 100, 8)
	Draw.Text ("START", 431, 85, Font_Start_Pacman_Stage_1, 17)

	%Finish
	drawfillbox (266, 426, 286, 535, 29)
	Draw.Text ("F", 270, 510, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("I", 272, 494, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("N", 269, 478, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("I", 272, 462, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("S", 270, 446, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("H", 269, 430, Font_Finish_Pacman_Stage_1, 17)

	%Outer Boxes
	drawfillbox (0, 75, 5, maxy, black)
	drawfillbox (0, maxy, 260, maxy - 5, black)
	drawfillbox (240, maxy, maxx, maxy - 5, black)
	drawfillbox (maxx, maxy, maxx - 5, 75, black)
	drawfillbox (0, 75, 400, 80, black)
	drawfillbox (320, 75, 800, 80, black)

	%Protective Finish Barrier
	drawfillbox (260, 426, 265, 526, 19)

	%Draw The Dots
	for Draw_Circles : 0 .. 300 by 90
	    drawfilloval (60 + Draw_Circles, 130, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 390 by 90
	    drawfilloval (60, 208 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 500 by 90
	    drawfilloval (140 + Draw_Circles, 365, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 390 by 80
	    drawfilloval (595, 290 - Draw_Circles, 10, 10, brightred)
	end for

	%Supplementary Circles
	drawfilloval (665, 128, 10, 10, brightred)
	drawfilloval (730, 128, 10, 10, brightred)

	for Draw_Circles : 0 .. 390 by 90
	    drawfilloval (730, 208 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 300 by 90
	    drawfilloval (650 - Draw_Circles, 480, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 70
	    drawfilloval (130 + Draw_Circles, 480, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 60
	    drawfilloval (195, 300 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 120
	    drawfilloval (460 - Draw_Circles, 240, 10, 10, brightred)
	end for
    elsif Stage_Number_For_Pacman = 2 then
	%This clears the screen
	cls

	%This draws the lines
	for Draw_Vertical_Lines : 0 .. 700 by 112
	    drawfillbox (115 + Draw_Vertical_Lines, 0, 120 + Draw_Vertical_Lines, 700, black)
	end for

	for Draw_Horizontal_Lines : 0 .. 700 by 115
	    drawfillbox (0, 66 + Draw_Horizontal_Lines, maxx, 71 + Draw_Horizontal_Lines, black)
	end for

	%Outer Boxes
	drawfillbox (0, 0, 5, maxy, black)
	drawfillbox (0, 75, maxx, 80, black)
	drawfillbox (maxx - 5, 75, maxx, maxy, black)
	drawfillbox (0, maxy - 5, maxx, maxy, black)
	drawfillbox (6, maxy - 14, maxx - 6, maxy - 6, white)
	drawfillbox (227, maxy - 50, 232, maxy, black)
	drawfillbox (0, 75, 800, 0, white)

	%Start
	drawfillbox (345, 81, 450, 100, 8)
	Draw.Text ("START", 364, 84, Font_Start_Pacman_Stage_1, 17)

	%Finish
	drawfillbox (206, 417, 226, 534, 29)
	Draw.Text ("F", 210, 510, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("I", 212, 494, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("N", 209, 478, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("I", 212, 462, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("S", 211, 446, Font_Finish_Pacman_Stage_1, 17)
	Draw.Text ("H", 209, 430, Font_Finish_Pacman_Stage_1, 17)

	%Draw in the spaces
	drawfillbox (345, 142, 450, 342, white)
	drawfillbox (345, 410, 650, 302, white)
	drawfillbox (569, 410, 674, 280, white)
	drawfillbox (560, 295, 674, 187, white)
	drawfillbox (457, 295, 562, 177, white)
	drawfillbox (457, 180, 762, 81, white)
	drawfillbox (681, 520, 781, 81, white)
	drawfillbox (281, 525, 781, 417, white)
	drawfillbox (233, 525, 338, 407, white)
	drawfillbox (223, 410, 338, 302, white)
	drawfillbox (233, 290, 338, 172, white)
	drawfillbox (121, 410, 226, 282, white)
	drawfillbox (121, 295, 236, 187, white)
	drawfillbox (111, 180, 236, 81, white)
	drawfillbox (6, 520, 114, 81, white)
	drawfillbox (6, 525, 134, 417, white)

	%Finish Line Protective Barrier
	drawfillbox (227, 411, 232, 526, 19)

	%Draw The Dots
	for Draw_Circles : 0 .. 180 by 65
	    drawfilloval (395, 360 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 75
	    drawfilloval (395 + Draw_Circles, 360, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 65
	    drawfilloval (620, 360 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 150 by 55
	    drawfilloval (620 - Draw_Circles, 230, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 150 by 55
	    drawfilloval (510, 230 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 250 by 74
	    drawfilloval (510 + Draw_Circles, 120, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 350 by 70
	    drawfilloval (732, 120 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 500 by 74
	    drawfilloval (732 - Draw_Circles, 470, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 60
	    drawfilloval (288, 470 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 60
	    drawfilloval (288 - Draw_Circles, 350, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 60
	    drawfilloval (169, 350 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 60
	    drawfilloval (169 + Draw_Circles, 230, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 120 by 55
	    drawfilloval (289, 230 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 280 by 57
	    drawfilloval (289 - Draw_Circles, 120, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 350 by 70
	    drawfilloval (61, 120 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 150 by 55
	    drawfilloval (61 + Draw_Circles, 470, 10, 10, brightred)
	end for
    elsif Stage_Number_For_Pacman = 3 then
	%This clears the screen
	cls

	%This draws the lines
	for Draw_Vertical_Lines : 0 .. 700 by 90
	    drawfillbox (80 + Draw_Vertical_Lines, 0, 75 + Draw_Vertical_Lines, 700, black)
	end for

	for Draw_Horizontal_Lines : 0 .. 700 by 92
	    drawfillbox (0, 66 + Draw_Horizontal_Lines, maxx, 71 + Draw_Horizontal_Lines, black)
	end for

	%Outer Edge Boxes
	drawfillbox (0, 0, 5, maxy, black)
	drawfillbox (0, 75, maxx, 80, black)
	drawfillbox (maxx - 5, 75, maxx, maxy, black)
	drawfillbox (6, maxy, maxx - 6, maxy - 5, black)
	drawfillbox (6, maxy - 6, maxx - 6, maxy - 15, white)
	drawfillbox (260, maxy - 6, 255, maxy - 15, black)
	drawfillbox (0, 75, 800, 0, white)

	%Start and Finish
	%Start
	drawfillbox (351, 81, 434, 100, 8)
	Draw.Text ("START", 360, 85, Font_Start_Pacman_Stage_1, 17)

	%Finish
	drawfillbox (81, 230, 164, 249, 29)
	Draw.Text ("FINISH", 89, 234, Font_Finish_Pacman_Stage_1, 17)

	%Draw The Spaces
	drawfillbox (351, 130, 434, 200, white)
	drawfillbox (351, 249, 445, 164, white)
	drawfillbox (551, 249, 645, 164, white)
	drawfillbox (501, 157, 595, 81, white)
	drawfillbox (441, 177, 524, 81, white)
	drawfillbox (531, 177, 614, 81, white)
	drawfillbox (621, 177, 704, 81, white)
	drawfillbox (621, 157, 724, 81, white)
	drawfillbox (711, 257, 781, 81, white)
	drawfillbox (611, 341, 781, 256, white)
	drawfillbox (531, 421, 614, 256, white)
	drawfillbox (531, 433, 714, 348, white)
	drawfillbox (711, 443, 781, 348, white)
	drawfillbox (311, 525, 781, 440, white)
	drawfillbox (351, 525, 434, 400, white)
	drawfillbox (351, 433, 454, 348, white)
	drawfillbox (441, 433, 524, 320, white)
	drawfillbox (341, 341, 524, 256, white)
	drawfillbox (261, 431, 344, 156, white)
	drawfillbox (181, 433, 344, 348, white)
	drawfillbox (171, 453, 254, 348, white)
	drawfillbox (71, 525, 254, 440, white)
	drawfillbox (6, 525, 74, 400, white)
	drawfillbox (6, 433, 144, 348, white)
	drawfillbox (6, 333, 74, 148, white)
	drawfillbox (6, 341, 224, 256, white)
	drawfillbox (171, 341, 254, 156, white)
	drawfillbox (171, 81, 274, 157, white)
	drawfillbox (71, 81, 94, 157, white)
	drawfillbox (81, 81, 164, 177, white)

	%Protective Finish Barrier
	drawfillbox (75, 250, 170, 255, 19)

	%Draw The Circles
	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (391 + Draw_Circles, 210, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (481, 210 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (481 + Draw_Circles, 120, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (571 + Draw_Circles, 210, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 90
	    drawfilloval (661, 210 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 100 by 85
	    drawfilloval (661 + Draw_Circles, 120, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 89
	    drawfilloval (747, 120 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 85
	    drawfilloval (747 - Draw_Circles, 298, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 90
	    drawfilloval (577, 298 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 85
	    drawfilloval (577 + Draw_Circles, 388, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 98
	    drawfilloval (747, 388 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 470 by 90
	    drawfilloval (747 - Draw_Circles, 486, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 98
	    drawfilloval (388, 486 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 90
	    drawfilloval (388 + Draw_Circles, 388, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 90
	    drawfilloval (478, 388 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 88
	    drawfilloval (478 - Draw_Circles, 298, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 88
	    drawfilloval (302, 298 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 88
	    drawfilloval (302, 298 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 88
	    drawfilloval (302 - Draw_Circles, 386, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 180 by 98
	    drawfilloval (214, 386 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 280 by 85
	    drawfilloval (214 - Draw_Circles, 484, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 90
	    drawfilloval (45, 484 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 80
	    drawfilloval (45 + Draw_Circles, 394, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 87
	    drawfilloval (302 - Draw_Circles, 122, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 220 by 87
	    drawfilloval (215, 122 + Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 220 by 85
	    drawfilloval (215 - Draw_Circles, 296, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 220 by 87
	    drawfilloval (45, 296 - Draw_Circles, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 75
	    drawfilloval (45 + Draw_Circles, 122, 10, 10, brightred)
	end for

	for Draw_Circles : 0 .. 90 by 75
	    drawfilloval (120, 122 + Draw_Circles, 10, 10, brightred)
	end for
    end if

    %Bottom Panel
    %Drawfillbox
    drawfillbox (0, 0, maxx, 75, red)

    %Top Line
    drawline (0, 75, 800, 75, black)

    %Drawfill
    drawfill (1, 1, The_Panel_Colour_Pacman, black)

    %Middle Box
    %Lines
    drawline (maxx div 2 - 109, 10, maxx div 2 + 109, 10, black)
    drawline (maxx div 2 - 109, 42, maxx div 2 + 109, 42, black)
    %Left Arc
    drawarc (maxx div 2 - 109, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (maxx div 2 + 109, 26, 16, 16, 270, 90, black)

    %Far Left Box
    %Lines
    drawline (36, 10, 104, 10, black)
    drawline (36, 42, 104, 42, black)
    %Left Arc
    drawarc (36, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (104, 26, 16, 16, 270, 90, black)

    %Left Box
    %Lines
    drawline (160, 10, 228, 10, black)
    drawline (160, 42, 228, 42, black)
    %Left Arc
    drawarc (160, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (228, 26, 16, 16, 270, 90, black)

    %Right Box
    %Lines
    drawline (557, 10, 625, 10, black)
    drawline (557, 42, 625, 42, black)
    %Left Arc
    drawarc (557, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (625, 26, 16, 16, 270, 90, black)

    %Far Right Box
    %Lines
    drawline (681, 10, 749, 10, black)
    drawline (681, 42, 749, 42, black)
    %Left Arc
    drawarc (681, 26, 16, 16, 90, 270, black)
    %Right Arc
    drawarc (749, 26, 16, 16, 270, 90, black)

    %Filling In The Bottom Boxes
    %Middle Box
    drawfillbox (maxx div 2 - 109, 11, maxx div 2 + 109, 41, white)
    drawfillarc (maxx div 2 - 109, 26, 15, 15, 90, 270, white)
    drawfillarc (maxx div 2 + 109, 26, 15, 15, 270, 90, white)

    %Far Left Box
    drawfillbox (37, 11, 104, 41, white)
    drawfillarc (36, 26, 15, 15, 90, 270, white)
    drawfillarc (104, 26, 15, 15, 270, 90, white)

    %Left Box
    drawfillbox (160, 11, 228, 41, white)
    drawfillarc (160, 26, 15, 15, 90, 270, white)
    drawfillarc (228, 26, 15, 15, 270, 90, white)

    %Right Box
    drawfillbox (557, 11, 625, 41, white)
    drawfillarc (557, 26, 15, 15, 90, 270, white)
    drawfillarc (625, 26, 15, 15, 270, 90, white)

    %Far Right Box
    drawfillbox (681, 11, 749, 41, white)
    drawfillarc (681, 26, 15, 15, 90, 270, white)
    drawfillarc (749, 26, 15, 15, 270, 90, white)

    %Text For The Bottom Boxes
    Draw.Text ("Time", 50, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)
    Draw.Text ("Sec", 72, 20, Font_Pacman_Titles_Stage_1, black)
    Draw.Text ("Score", 171, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)
    Draw.Text ("Status", 365, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)
    Draw.Text ("Stage", 568, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)
    Draw.Text ("Restarts", 680, 53, Font_Pacman_Titles_Stage_1, Writing_On_Panel_Pacman)

    %Right Box
    %Stage
    if Stage_Number_For_Pacman = 1 then
	Draw.Text ("1", 585, 20, Font_Pacman_Titles_Stage_1, blue)
    elsif Stage_Number_For_Pacman = 2 then
	Draw.Text ("2", 585, 20, Font_Pacman_Titles_Stage_1, blue)
    elsif Stage_Number_For_Pacman = 3 then
	Draw.Text ("3", 585, 20, Font_Pacman_Titles_Stage_1, blue)
    end if
end Draw_Background_Pacman

%This process displays the score of the player
process Score_Draw_Once_More_Pacman
    %This clears the box
    drawfillbox (161, 13, 227, 39, white)

    delay (50)

    %This displays the Score
    String_Score_Pacman := intstr (Score_Count_Pacman, 1)
    Text_Score_Pacman := String_Score_Pacman
    Draw.Text (Text_Score_Pacman, 185, 20, Font_Pacman_Titles_Stage_1, blue)
end Score_Draw_Once_More_Pacman

%This process displays the time of the player
process Time_Draw_Once_More_Pacman
    %This clears the box
    drawfillbox (37, 13, 103, 39, white)
    Draw.Text ("Sec", 72, 20, Font_Pacman_Titles_Stage_1, black)

    delay (5)

    %This displays the time
    Draw.Text (Text_Time_Pacman, 36, 20, Font_Pacman_Titles_Stage_1, blue)
end Time_Draw_Once_More_Pacman

%the following processes are used to put information into the "Status Bar" at the bottom of the screen
%This process tells the player to go
process Go_Pacman
    delay (300)

    Draw.Text ("GO!", 370, 20, Font_Pacman_Titles_Stage_1, black)

    delay (1000)

    %This clears the box
    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)
end Go_Pacman

%This process tells the player that he or she has hit the wall
process You_Have_Hit_The_Wall
    delay (100)

    Draw.Text ("You Have Hit The Wall", 293, 20, Font_Pacman_Titles_Stage_1, black)

    delay (1000)

    %This clears the box
    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)

    Draw.Text ("GO!", 370, 20, Font_Pacman_Titles_Stage_1, black)

    delay (1000)

    %This clears the box
    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)
end You_Have_Hit_The_Wall

%This process tells the player that he or she is going the wrong way
process Wrong_Way_Pacman
    delay (100)

    Draw.Text ("Wrong Way", 340, 20, Font_Pacman_Titles_Stage_1, black)

    delay (1000)

    %This clears the box
    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)

    Draw.Text ("GO!", 370, 20, Font_Pacman_Titles_Stage_1, black)

    delay (1000)

    %This clears the box
    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)
end Wrong_Way_Pacman

%This process tells the player that he or she has not yet yet collected all the tokens in the level
process You_Are_Not_Done_Pacman
    delay (100)

    Draw.Text ("You Don't Have All The Tokens", 278, 20, Font_Not_Finished_Pacman_Stage_1, black)

    delay (1000)

    %This clears the box
    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)

    Draw.Text ("GO!", 370, 20, Font_Pacman_Titles_Stage_1, black)

    delay (1000)

    %This clears the box
    drawfillbox (maxx div 2 - 108, 13, maxx div 2 + 108, 39, white)
    drawfillarc (maxx div 2 - 108, 26, 14, 14, 90, 270, white)
    drawfillarc (maxx div 2 + 108, 26, 14, 14, 270, 90, white)
end You_Are_Not_Done_Pacman

%This procedure is what gets the information from the keys the player is presing and draws the
%pacman accordingly
procedure Key_Input_Pacman
    %This sets the eye position of the pacman
    %location
    Eye_Position := 0

    %This if statement draws the initial pacman depending on which stage of this game the person is on
    if Stage_Number_For_Pacman = 1 then
	%This draws the initial pacman on the screen
	drawfilloval (Initial_X, Initial_Y, Radius_Pacman, Radius_Pacman, Pacman_Colour_Pacman)
	drawfilloval (443, 160, 5, 5, black)
	drawfilloval (480, 160, 5, 5, black)
	drawfillarc (463, 140, 25, 15, 180, 0, black)
	drawfillarc (463, 143, 25, 8, 180, 0, Pacman_Colour_Pacman)
    elsif Stage_Number_For_Pacman = 2 then
	%This draws the initial pacman on the screen
	drawfilloval (395, 142, 37, 37, Pacman_Colour_Pacman)
	drawfilloval (377, 152, 5, 5, black)
	drawfilloval (410, 152, 5, 5, black)
	drawfillarc (395, 132, 25, 15, 180, 0, black)
	drawfillarc (395, 134, 27, 7, 190, 0, Pacman_Colour_Pacman)
    elsif Stage_Number_For_Pacman = 3 then
	%This draws the initial pacman on the screen
	drawfilloval (391, 140, 23, 23, Pacman_Colour_Pacman)
	drawfilloval (380, 145, 3, 3, black)
	drawfilloval (401, 145, 3, 3, black)
	drawfillarc (391, 135, 17, 9, 180, 0, black)
	drawfillarc (391, 137, 19, 4, 180, 0, Pacman_Colour_Pacman)
    end if

    %This says go for the first time
    if Count_Loop_Pacman = 0 then
	fork Go_Pacman
    end if

    %This is the loop for the checking and drawing commands
    loop
	%This counts the loop
	Count_Loop_Pacman := Count_Loop_Pacman + 1

	%These will used the "instr" feature to display the scoring in the game with fonts
	%This displays the time
	Draw.Text (Text_Time_Pacman, 36, 20, Font_Pacman_Titles_Stage_1, blue)

	%This displays the Restart Number
	String_Restarts_Pacman := intstr (Restart_Count_Pacman, 1)
	Text_Restarts_Pacman := String_Restarts_Pacman
	Draw.Text (Text_Restarts_Pacman, 708, 20, Font_Pacman_Titles_Stage_1, blue)

	%This displays the Score
	String_Score_Pacman := intstr (Score_Count_Pacman, 1)
	Text_Score_Pacman := String_Score_Pacman
	Draw.Text (Text_Score_Pacman, 185, 20, Font_Pacman_Titles_Stage_1, blue)

	%This resets the eye value
	Draw_Eye_Once := 0
	%This check the keys
	Input.KeyDown (Get_Key_Input)

	%These if statements check if the pacman has eaten a token
	%If the token is just at the Pacman
	if View.WhatDotColor (Initial_X, Initial_Y + Check_Radius_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X, Initial_Y - Check_Radius_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman, Initial_Y) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman, Initial_Y) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1

	    %If the token if 4 units beyond the pacman
	elsif View.WhatDotColor (Initial_X, Initial_Y + Check_Radius_Pacman + Check_Token_X_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X, Initial_Y - Check_Radius_Pacman - Check_Token_X_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Token_X_Beyond_Pacman, Initial_Y) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Token_X_Beyond_Pacman, Initial_Y) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1

	    %If the token if 4 units above the pacman
	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Token_X_Beyond_Pacman, Initial_Y + Check_Token_Y_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Token_X_Beyond_Pacman, Initial_Y - Check_Token_Y_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Token_X_Beyond_Pacman, Initial_Y + Check_Token_Y_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Token_X_Beyond_Pacman, Initial_Y - Check_Token_Y_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1

	    %If the token if 4 units below the pacman
	elsif View.WhatDotColor (Initial_X + Check_Token_X_Beyond_Pacman, Initial_Y + Check_Radius_Pacman + Check_Token_Y_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X + Check_Token_X_Beyond_Pacman, Initial_Y - Check_Radius_Pacman - Check_Token_Y_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X - Check_Token_X_Beyond_Pacman, Initial_Y + Check_Radius_Pacman + Check_Token_Y_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	elsif View.WhatDotColor (Initial_X - Check_Token_X_Beyond_Pacman, Initial_Y - Check_Radius_Pacman - Check_Token_Y_Beyond_Pacman) = brightred then
	    delay (100)

	    %This clears the previous score and adds one to it
	    drawfillbox (161, 13, 227, 39, white)
	    fork Score_Draw_Once_More_Pacman
	    fork Time_Draw_Once_More_Pacman
	    Score_Count_Pacman := Score_Count_Pacman + 1
	end if

	%These if statements check if the pacman has crossed the finish line
	%The Pacman has crossed the finish line
	if Stage_Number_For_Pacman = 1 then
	    if View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Diagonals_Pacman, Initial_Y + Check_Sphere_Pacman) = 29
		    or View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Diagonals_Pacman, Initial_Y + Check_Sphere_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if
	    elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman + Check_Remainder_Circle_Pacman, Initial_Y + Check_Final_Ensure_Wall_Pacman) = 29
		    or View.WhatDotColor (Initial_X - Check_Radius_Pacman + Check_Remainder_Circle_Pacman, Initial_Y + Check_Final_Ensure_Wall_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if

	    elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Diagonals_Pacman, Initial_Y - Check_Sphere_Pacman) = 29
		    or View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Diagonals_Pacman, Initial_Y - Check_Sphere_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if

	    elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman + Check_Remainder_Circle_Pacman, Initial_Y - Check_Final_Ensure_Wall_Pacman) = 29
		    or View.WhatDotColor (Initial_X - Check_Radius_Pacman + Check_Remainder_Circle_Pacman, Initial_Y - Check_Final_Ensure_Wall_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if
	    end if

	elsif Stage_Number_For_Pacman = 2 then
	    if View.WhatDotColor (Initial_X + Check_Second_Diagonals, Initial_Y - Check_Radius_Pacman) = 29
		    or View.WhatDotColor (Initial_X + Check_Second_Diagonals, Initial_Y - Check_Radius_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if
	    elsif View.WhatDotColor (Initial_X + Check_Second_Diagonals, Initial_Y + Check_Radius_Pacman) = 29
		    or View.WhatDotColor (Initial_X + Check_Second_Diagonals, Initial_Y + Check_Radius_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if

	    elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman, Initial_Y + Check_Second_Diagonals) = 29
		    or View.WhatDotColor (Initial_X + Check_Radius_Pacman, Initial_Y + Check_Second_Diagonals) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if

	    elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Diagonals_Pacman, Initial_Y - Check_Sphere_Pacman) = 29
		    or View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Diagonals_Pacman, Initial_Y - Check_Sphere_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if
	    end if

	elsif Stage_Number_For_Pacman = 3 then
	    if View.WhatDotColor (Initial_X - Check_Sphere_Pacman, Initial_Y + Check_Radius_Pacman + Check_Diagonals_Pacman) = 29
		    or View.WhatDotColor (Initial_X - Check_Sphere_Pacman, Initial_Y + Check_Radius_Pacman + Check_Diagonals_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if
	    elsif View.WhatDotColor (Initial_X + Check_Sphere_Pacman, Initial_Y + Check_Radius_Pacman + Check_Diagonals_Pacman) = 29
		    or View.WhatDotColor (Initial_X + Check_Sphere_Pacman, Initial_Y + Check_Radius_Pacman + Check_Diagonals_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if

	    elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman + Check_Remainder_Circle_Pacman, Initial_Y + Check_Final_Ensure_Wall_Pacman) = 29
		    or View.WhatDotColor (Initial_X - Check_Radius_Pacman + Check_Remainder_Circle_Pacman, Initial_Y + Check_Final_Ensure_Wall_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if

	    elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman - Check_Remainder_Circle_Pacman, Initial_Y + Check_Final_Ensure_Wall_Pacman) = 29
		    or View.WhatDotColor (Initial_X + Check_Radius_Pacman - Check_Remainder_Circle_Pacman, Initial_Y + Check_Final_Ensure_Wall_Pacman) = 17 then
		if Score_Count_Pacman >= Maximum_Score_For_Stage_Pacman then
		    exit
		elsif Score_Count_Pacman < Maximum_Score_For_Stage_Pacman then
		    if Stage_Number_For_Pacman <= 2 then
			delay (100)
			if Stage_Number_For_Pacman = 1 then
			    Initial_Y := 150
			    Initial_X := 463
			elsif Stage_Number_For_Pacman = 2 then
			    Initial_Y := 142
			    Initial_X := 395
			elsif Stage_Number_For_Pacman = 3 then
			    Initial_Y := 140
			    Initial_X := 391
			end if

			Score_Count_Pacman := 0

			fork You_Are_Not_Done_Pacman

			%Erases and Adds to the restart number count
			drawfillbox (682, 13, 748, 39, white)
			drawfillarc (683, 26, 14, 14, 90, 270, white)
			drawfillarc (747, 26, 14, 14, 270, 90, white)
			Restart_Count_Pacman := Restart_Count_Pacman + 1

			Draw_Background_Pacman
			Key_Input_Pacman

		    elsif Stage_Number_For_Pacman = 3 then
			Finish_Line_Cross_Lose_Pacman := 1
			exit
		    end if
		end if
	    end if
	end if

	%These if statements check if the pacman has crossed the starting line
	%The pacman has touched the staring line
	if View.WhatDotColor (Initial_X, Initial_Y - Check_Radius_Pacman) = 17 then
	    delay (100)
	    if Stage_Number_For_Pacman <= 2 then
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork Wrong_Way_Pacman

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Starting_Line_Cross_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X, Initial_Y - Check_Radius_Pacman) = 42 then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork Wrong_Way_Pacman

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Starting_Line_Cross_Lose_Pacman := 1
		exit
	    end if
	end if

	%These if statements check to see if the pacman has hit any of the black lines
	if View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Corners_Pacman, Initial_Y) = black
		or View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Corners_Pacman, Initial_Y) = The_Panel_Colour_Pacman then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman
	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Corners_Pacman, Initial_Y) = black
		or View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Corners_Pacman, Initial_Y) = The_Panel_Colour_Pacman then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X, Initial_Y - Check_Radius_Pacman - Check_Corners_Pacman) = black
		or View.WhatDotColor (Initial_X, Initial_Y - Check_Radius_Pacman - Check_Corners_Pacman) = The_Panel_Colour_Pacman then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X, Initial_Y + Check_Radius_Pacman + Check_Corners_Pacman) = black
		or View.WhatDotColor (Initial_X, Initial_Y + Check_Radius_Pacman + Check_Corners_Pacman) = The_Panel_Colour_Pacman then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	    %If the pacman is 4 points beyond the black line
	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Diagonals_Pacman, Initial_Y + Check_Sphere_Pacman) = black
		or View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Diagonals_Pacman, Initial_Y + Check_Sphere_Pacman) = The_Panel_Colour_Pacman then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Diagonals_Pacman, Initial_Y + Check_Sphere_Pacman) = black
		or View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Diagonals_Pacman, Initial_Y + Check_Sphere_Pacman) = The_Panel_Colour_Pacman then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Diagonals_Pacman, Initial_Y - Check_Sphere_Pacman) = black
		or View.WhatDotColor (Initial_X - Check_Radius_Pacman - Check_Diagonals_Pacman, Initial_Y - Check_Sphere_Pacman) = The_Panel_Colour_Pacman then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Diagonals_Pacman, Initial_Y - Check_Sphere_Pacman) = black
		or View.WhatDotColor (Initial_X + Check_Radius_Pacman + Check_Diagonals_Pacman, Initial_Y - Check_Sphere_Pacman) = The_Panel_Colour_Pacman then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X + Check_Sphere_Pacman, Initial_Y - Check_Radius_Pacman - Check_Diagonals_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X + Check_Sphere_Pacman, Initial_Y + Check_Radius_Pacman + Check_Diagonals_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X + Check_Sphere_Pacman, Initial_Y + Check_Radius_Pacman + Check_Diagonals_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	elsif View.WhatDotColor (Initial_X - Check_Sphere_Pacman, Initial_Y - Check_Radius_Pacman - Check_Diagonals_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X - Check_Sphere_Pacman, Initial_Y + Check_Radius_Pacman + Check_Diagonals_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X + Check_Second_Diagonals, Initial_Y - Check_Radius_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X - Check_Sphere_Pacman, Initial_Y - Check_Radius_Pacman - Check_Diagonals_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman, Initial_Y + Check_Second_Diagonals) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman, Initial_Y - Check_Second_Diagonals) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman, Initial_Y - Check_Second_Diagonals) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman, Initial_Y + Check_Second_Diagonals) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman + Check_Remainder_Circle_Pacman, Initial_Y + Check_Final_Ensure_Wall_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman - Check_Remainder_Circle_Pacman, Initial_Y + Check_Final_Ensure_Wall_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X - Check_Radius_Pacman + Check_Remainder_Circle_Pacman, Initial_Y - Check_Final_Ensure_Wall_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if

	elsif View.WhatDotColor (Initial_X + Check_Radius_Pacman - Check_Remainder_Circle_Pacman, Initial_Y - Check_Final_Ensure_Wall_Pacman) = black then
	    if Stage_Number_For_Pacman <= 2 then
		delay (100)
		if Stage_Number_For_Pacman = 1 then
		    Initial_Y := 150
		    Initial_X := 463
		elsif Stage_Number_For_Pacman = 2 then
		    Initial_Y := 142
		    Initial_X := 395
		elsif Stage_Number_For_Pacman = 3 then
		    Initial_Y := 140
		    Initial_X := 391
		end if

		Score_Count_Pacman := 0

		fork You_Have_Hit_The_Wall

		%Erases and Adds to the restart number count
		drawfillbox (682, 13, 748, 39, white)
		drawfillarc (683, 26, 14, 14, 90, 270, white)
		drawfillarc (747, 26, 14, 14, 270, 90, white)
		Restart_Count_Pacman := Restart_Count_Pacman + 1

		Draw_Background_Pacman
		Key_Input_Pacman

	    elsif Stage_Number_For_Pacman = 3 then
		Hit_Wall_Lose_Pacman := 1
		exit
	    end if
	end if

	%These if statements draw the pacman according to the keys that have been pressed
	%The Pacman Is Moving Up
	if Get_Key_Input (KEY_UP_ARROW) then
	    for Mouth_Opening : 0 .. 45 by Delay_Mouth_Movement_Pacman
		drawfillarc (Old_X_Value_Pacman, Old_Y_Value_Pacman, Radius_Pacman + 2, Radius_Pacman + 2, 167, 13, white)
		drawfillarc (Old_X_Value_Pacman, Old_Y_Value_Pacman + Y_Value_Pacman, Radius_Pacman, Radius_Pacman, 167, 13, Pacman_Colour_Pacman)
		drawfillarc (Initial_X, Initial_Y + Y_Value_Pacman, Clear_Mouth_Pacman, Clear_Mouth_Pacman, 55, 125, white)

		drawfillarc (Initial_X, Initial_Y + Y_Value_Pacman, Radius_Pacman, Radius_Pacman, 135 - Mouth_Opening, 45 + Mouth_Opening, Pacman_Colour_Pacman)
		drawfilloval (Initial_X - Eye_Radius_Distance, Initial_Y + Eye_Radius_Distance, Eye_Radius, Eye_Radius, black)
		delay (Delay_On_Movement_Pacman)

		View.Update
	    end for
	    drawfilloval (Old_X_Value_Pacman, Old_Y_Value_Pacman + Moving_Draw_Contant_Pacman, Radius_Pacman, Radius_Pacman, Pacman_Colour_Pacman)

	    Initial_Y := Initial_Y + Y_Value_Pacman
	    Eye_Position := 1
	    Draw_Eye_Once := 1

	    %The Pacman Is Moving Down
	elsif Get_Key_Input (KEY_DOWN_ARROW) then
	    for Mouth_Opening : 0 .. 45 by Delay_Mouth_Movement_Pacman
		drawfillarc (Old_X_Value_Pacman, Old_Y_Value_Pacman, Radius_Pacman + 2, Radius_Pacman + 2, 347, 193, white)
		drawfillarc (Old_X_Value_Pacman, Old_Y_Value_Pacman - Y_Value_Pacman, Radius_Pacman, Radius_Pacman, 347, 193, Pacman_Colour_Pacman)
		drawfillarc (Initial_X, Initial_Y - Y_Value_Pacman, Clear_Mouth_Pacman, Clear_Mouth_Pacman, 235, 305, white)

		drawfillarc (Initial_X, Initial_Y - Y_Value_Pacman, Radius_Pacman, Radius_Pacman, 315 - Mouth_Opening, 225 + Mouth_Opening, Pacman_Colour_Pacman)
		drawfilloval (Initial_X + Eye_Radius_Distance, Initial_Y - Eye_Radius_Distance, Eye_Radius, Eye_Radius, black)
		delay (Delay_On_Movement_Pacman)

		View.Update
	    end for
	    drawfilloval (Old_X_Value_Pacman, Old_Y_Value_Pacman - Moving_Draw_Contant_Pacman, Radius_Pacman, Radius_Pacman, Pacman_Colour_Pacman)

	    Initial_Y := Initial_Y - Y_Value_Pacman
	    Eye_Position := 2
	    Draw_Eye_Once := 1

	    %The Pacman Is Moving To The Right
	elsif Get_Key_Input (KEY_RIGHT_ARROW) then
	    for Mouth_Opening : 0 .. 45 by Delay_Mouth_Movement_Pacman
		drawfillarc (Old_X_Value_Pacman, Old_Y_Value_Pacman, Radius_Pacman + 2, Radius_Pacman + 2, 75, 283, white)
		drawfillarc (Old_X_Value_Pacman + X_Value_Pacman, Old_Y_Value_Pacman, Radius_Pacman, Radius_Pacman, 75, 283, Pacman_Colour_Pacman)
		drawfillarc (Initial_X + Y_Value_Pacman, Initial_Y, Clear_Mouth_Pacman, Clear_Mouth_Pacman, 305, 55, white)

		drawfillarc (Initial_X + X_Value_Pacman, Initial_Y, Radius_Pacman, Radius_Pacman, 45 - Mouth_Opening, 315 + Mouth_Opening, Pacman_Colour_Pacman)
		drawfilloval (Initial_X + Eye_Radius_Distance, Initial_Y + Eye_Radius_Distance, Eye_Radius, Eye_Radius, black)
		delay (Delay_On_Movement_Pacman)

		View.Update
	    end for
	    drawfilloval (Old_X_Value_Pacman + Moving_Draw_Contant_Pacman, Old_Y_Value_Pacman, Radius_Pacman, Radius_Pacman, Pacman_Colour_Pacman)

	    Initial_X := Initial_X + X_Value_Pacman
	    Eye_Position := 3
	    Draw_Eye_Once := 1

	    %The Pacman Is Moving To The Left
	elsif Get_Key_Input (KEY_LEFT_ARROW) then
	    for Mouth_Opening : 0 .. 45 by Delay_Mouth_Movement_Pacman
		drawfillarc (Old_X_Value_Pacman, Old_Y_Value_Pacman, Radius_Pacman + 2, Radius_Pacman + 2, 257, 103, white)
		drawfillarc (Old_X_Value_Pacman - X_Value_Pacman, Old_Y_Value_Pacman, Radius_Pacman, Radius_Pacman, 257, 103, Pacman_Colour_Pacman)
		drawfillarc (Initial_X - Y_Value_Pacman, Initial_Y, Clear_Mouth_Pacman, Clear_Mouth_Pacman, 145, 215, white)

		drawfillarc (Initial_X - X_Value_Pacman, Initial_Y, Radius_Pacman, Radius_Pacman, 225 - Mouth_Opening, 135 + Mouth_Opening, Pacman_Colour_Pacman)
		drawfilloval (Initial_X - Eye_Radius_Distance, Initial_Y + Eye_Radius_Distance, Eye_Radius, Eye_Radius, black)
		delay (Delay_On_Movement_Pacman)

		View.Update
	    end for
	    drawfilloval (Old_X_Value_Pacman - Moving_Draw_Contant_Pacman, Old_Y_Value_Pacman, Radius_Pacman, Radius_Pacman, Pacman_Colour_Pacman)

	    Initial_X := Initial_X - X_Value_Pacman
	    Eye_Position := 4
	    Draw_Eye_Once := 1

	    %The Pacman is Not Moving
	    %These if statements draw the pacman if he is not moving since no keys are being pressed
	else
	    if Draw_Eye_Once = 0 then
		%Drawdots so that the score doesn't go up drastically
		drawdot (Initial_X, Initial_Y + Check_Radius_Pacman, white)
		drawdot (Initial_X, Initial_Y - Check_Radius_Pacman, white)
		drawdot (Initial_X + Check_Radius_Pacman, Initial_Y, white)
		drawdot (Initial_X - Check_Radius_Pacman, Initial_Y, white)
		drawdot (Initial_X, Initial_Y + Check_Radius_Pacman + Check_Token_X_Beyond_Pacman, white)
		drawdot (Initial_X, Initial_Y - Check_Radius_Pacman - Check_Token_X_Beyond_Pacman, white)
		drawdot (Initial_X + Check_Radius_Pacman + Check_Token_X_Beyond_Pacman, Initial_Y, white)
		drawdot (Initial_X - Check_Radius_Pacman - Check_Token_X_Beyond_Pacman, Initial_Y, white)
		drawdot (Initial_X + Check_Radius_Pacman + Check_Token_X_Beyond_Pacman, Initial_Y + Check_Token_Y_Beyond_Pacman, white)
		drawdot (Initial_X + Check_Radius_Pacman + Check_Token_X_Beyond_Pacman, Initial_Y - Check_Token_Y_Beyond_Pacman, white)
		drawdot (Initial_X - Check_Radius_Pacman - Check_Token_X_Beyond_Pacman, Initial_Y + Check_Token_Y_Beyond_Pacman, white)
		drawdot (Initial_X - Check_Radius_Pacman - Check_Token_X_Beyond_Pacman, Initial_Y - Check_Token_Y_Beyond_Pacman, white)
		drawdot (Initial_X + Check_Token_X_Beyond_Pacman, Initial_Y + Check_Radius_Pacman + Check_Token_Y_Beyond_Pacman, white)
		drawdot (Initial_X + Check_Token_X_Beyond_Pacman, Initial_Y - Check_Radius_Pacman - Check_Token_Y_Beyond_Pacman, white)
		drawdot (Initial_X - Check_Token_X_Beyond_Pacman, Initial_Y + Check_Radius_Pacman + Check_Token_Y_Beyond_Pacman, white)
		drawdot (Initial_X - Check_Token_X_Beyond_Pacman, Initial_Y - Check_Radius_Pacman - Check_Token_Y_Beyond_Pacman, white)

		%Up
		if Eye_Position = 1 then
		    drawfilloval (Initial_X - Eye_Radius_Distance, Initial_Y, Eye_Radius, Eye_Radius, black)

		    %Down
		elsif Eye_Position = 2 then
		    drawfilloval (Initial_X + Eye_Radius_Distance, Initial_Y, Eye_Radius, Eye_Radius, black)

		    %Right
		elsif Eye_Position = 3 then
		    drawfilloval (Initial_X, Initial_Y + Eye_Radius_Distance, Eye_Radius, Eye_Radius, black)

		    %Left
		elsif Eye_Position = 4 then
		    drawfilloval (Initial_X, Initial_Y + Eye_Radius_Distance, Eye_Radius, Eye_Radius, black)
		end if
	    end if
	end if

	%This sets the old x and y values to the new x and y values so that the pacman can continue
	%to move instead of being reset to his starting position
	Old_X_Value_Pacman := Initial_X
	Old_Y_Value_Pacman := Initial_Y
    end loop
end Key_Input_Pacman

%This procedure directs the player to the next stage once a stage has been completed
procedure Next_Stage_Pacman
    %Stage 1 has been completed
    if Stage_Number_For_Pacman = 1 then
	Stage_Number_For_Pacman := 2
	Count_Loop_Pacman := 0
	Show_Stage_Transition_Stage_2_Pacman := 1

	Set_Values_Stage_Number_Pacman
	Draw_Background_Pacman
	Key_Input_Pacman
	Next_Stage_Pacman

	%Stage 2 has been completed
    elsif Stage_Number_For_Pacman = 2 then
	Stage_Number_For_Pacman := 3
	Count_Loop_Pacman := 0
	Show_Stage_Transition_Stage_3_Pacman := 1

	Set_Values_Stage_Number_Pacman
	Draw_Background_Pacman
	Key_Input_Pacman
	Next_Stage_Pacman
    end if
end Next_Stage_Pacman

%This procedure decides which result screen to display depending on the outcome of the game
procedure Check_To_See_Verdict_Pacman
    if Hit_Wall_Lose_Pacman = 1 then
	%Animation_You_Have_Lost_The_Game
    elsif Finish_Line_Cross_Lose_Pacman = 1 then
	%Animation_You_Have_Lost_The_Game
    elsif Starting_Line_Cross_Lose_Pacman = 1 then
	%Animation_You_Have_Lost_The_Game
    else
	% open : File_Check_Score, "Player_Inputed_Score.dat", put
	% put : File_Check_Score, Name_Of_Player, Score_Count_Pacman, Text_Time_Pacman
	% close : File_Check_Score

	You_Have_Won_Animation_Pacman
	%You_Have_Won_Mission_2
    end if
end Check_To_See_Verdict_Pacman

%Main Program
Choose_The_Pacman_Colour_Pacman
Choose_The_Panel_Colour_Pacman
Stage_Number_For_Pacman := 2
Score_Count_Pacman := 0
Restart_Count_Pacman := 0
Count_Loop_Pacman := 0
Time_Monitor_Pacman := 0
Hit_Wall_Lose_Pacman := 0
Finish_Line_Cross_Lose_Pacman := 0
Starting_Line_Cross_Lose_Pacman := 0

Set_Values_Stage_Number_Pacman
fork Time_Count_Pacman
Draw_Background_Pacman
Key_Input_Pacman
Next_Stage_Pacman
Check_To_See_Verdict_Pacman



