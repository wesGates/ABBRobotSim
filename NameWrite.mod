MODULE Module1
    CONST robtarget Home:=[[300.022993432,150.000002947,314.707147681],[0.000000011,0,1,0],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !***********************************************************
    !
    ! Module:  Module1
    !
    ! Description:
    !   <Insert description here>
    !
    ! Author: ander
    !
    ! Version: 1.0
    !
    !***********************************************************


    !***********************************************************
    !
    ! Procedure main
    !
    !   Smart Component example, Pick and Place application.

    !
    !***********************************************************
    PROC main()


        WHILE TRUE DO
            SetDO doConveyor, 1; ! Make sure conveyor is running

            WaitDI diBoxInPos,1;
            ! Wait until box is in position
            SetDO doConveyor,0;
            ! Stop the conveyor
            SetDO doPaint,1;
            ! Turn on the paint applicator
            Path_S;
            ! Home the 'S' character
            SetDO doPaint,0;
            ! Turn of the paint applicator
            WaitRob\InPos;
            ! Wait for the robot to be done before moving on.

            SetDO doConveyor, 1; ! Make sure conveyor is running
            ! Resume conveyor motion for next character
            WaitTime 0.6;


            WaitDI diBoxInPos,1;
            ! Wait until box is in position
            SetDO doConveyor,0;
            ! Stop the conveyor
            SetDO doPaint,1;
            ! Turn on the paint applicator
            Path_E;
            ! Draw the 'S' character
            SetDO doPaint,0;
            ! Turn of the paint applicator
            WaitRob\InPos;
            ! Wait for the robot to be done before moving on.

            WaitDI diBoxInPos,1;
            ! Wait until box is in position
            SetDO doConveyor,0;
            ! Stop the conveyor
            SetDO doPaint,1;
            ! Turn on the paint applicator
            Path_W;
            ! Draw the 'S' character
            SetDO doPaint,0;
            ! Turn of the paint applicator
            WaitRob\InPos;
            ! Wait for the robot to be done before moving on.

            SetDO doConveyor, 1; ! Make sure conveyor is running

        ENDWHILE
    ENDPROC



    PROC Path_S()
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        ! Move to the starting point of 'S'
        MoveL Offs(Home,0,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Adjust the offsets as needed to position the start of 'S'

        ! Top part of 'S'
        MoveL Offs(Home,-20,60,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move up and to the left to start the top curve
        MoveL Offs(Home,0,40,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move down and to the right, continuing the top curve
        MoveL Offs(Home,20,60,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move up and to the right to finish the top curve

        ! Middle transition
        MoveL Offs(Home,0,30,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move down to start the middle part of 'S'

        ! Bottom part of 'S'
        MoveL Offs(Home,-20,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move down and to the left to start the bottom curve
        MoveL Offs(Home,0,-20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move up and to the right, continuing the bottom curve
        MoveL Offs(Home,20,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move down and to the right to finish the bottom curve

        ! Return to the draw position or to a safe position before drawing the next letter
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position
    ENDPROC

    PROC Path_W()
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        ! Move to the starting point of 'W'
        MoveL Offs(Home,70,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Adjust the offsets as needed to position the start of 'W'

        ! First leg of 'W'
        MoveL Offs(Home,70,60,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move up to the top left start of 'W'
        MoveL Offs(Home,85,30,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move down to the middle of 'W'

        ! Second leg of 'W'
        MoveL Offs(Home,100,60,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move up to the top middle of 'W'
        MoveL Offs(Home,115,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move down to the bottom right end of 'W'

        ! Return to the draw position or to a safe position before drawing the next letter
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position
    ENDPROC

    PROC Path_E()
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        ! Move to the starting point of 'E'
        MoveL Offs(Home,140,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Adjust the offsets as needed to position the start of 'E'

        ! Vertical spine of 'E'
        MoveL Offs(Home,140,60,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move up to the top start of 'E'

        ! Top horizontal line of 'E'
        MoveL Offs(Home,180,60,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move right to draw the top line

        ! Move to the start of the middle line
        MoveL Offs(Home,140,30,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the spine and halfway down

        ! Middle horizontal line of 'E'
        MoveL Offs(Home,170,30,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move right to draw the middle line

        ! Move to the start of the bottom line
        MoveL Offs(Home,140,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the bottom of the spine

        ! Bottom horizontal line of 'E'
        MoveL Offs(Home,180,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move right to draw the bottom line

        ! Return to the draw position or to a safe position before drawing the next letter
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position
    ENDPROC


ENDMODULE