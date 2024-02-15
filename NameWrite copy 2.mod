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
            WaitDI diBoxInPos,1;
            Path_S;

            !WaitDI diConveyorPaused,1;
            ! Confirm that the stop signal has been applied in the smart component

            !SetDO doConveyor,1;
            ! Re-enable Conveyor movement

        ENDWHILE
    ENDPROC



    PROC Path_S()
        SetDO doConveyor,0;
        ! Pause Conveyor

        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position
        
        SetDO doPaint,1;
        ! Enable Paint Applicator        

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

        SetDO doPaint,0;

        ! Return to the draw position or to a safe position before drawing the next letter
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        WaitRob\InPos;
    ENDPROC



ENDMODULE