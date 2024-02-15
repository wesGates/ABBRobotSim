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
        SetDO doConveyor,1;
        WHILE TRUE DO
            WaitDI diBoxInPos,1;

            Path_S;
            WaitTime 0.1;
            Path_E;
            WaitTime 0.1;
            Path_W;

        ENDWHILE
    ENDPROC



    PROC Path_S()
        SetDO doConveyor,0;
        ! Pause Conveyor

        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        WaitRob\InPos;
        ! Move back to the Draw position or to a safe position

        SetDO doPaint,1;
        ! Enable Paint Applicator

        ! Move to the starting point of 'S'
        MoveL Offs(Home,0,20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !1
        MoveL Offs(Home,-20,20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !2
        MoveL Offs(Home,-20, 0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !3
        MoveL Offs(Home,-40,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;!4
        MoveL Offs(Home,-40,20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder;!5


        SetDO doPaint,0;

        ! Return to the draw position or to a safe position before drawing the next letter
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        WaitRob\InPos;
        SetDO doConveyor,1;

    ENDPROC

    PROC Path_E()
        SetDO doConveyor,0;
        ! Pause Conveyor

        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        SetDO doPaint,1;
        ! Enable Paint Applicator

        MoveL Offs(Home,0,20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !1
        MoveL Offs(Home,-40,20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !2
        MoveL Offs(Home,-40,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !3

        MoveL Offs(Home,-40,20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !4
        MoveL Offs(Home,-20,20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !5
        MoveL Offs(Home,-20,0,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !6

        SetDO doPaint,0;

        ! Return to the draw position or to a safe position before drawing the next letter
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        WaitRob\InPos;
        SetDO doConveyor,1;

    ENDPROC

    PROC Path_W()
        SetDO doConveyor,0;
        ! Pause Conveyor

        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        SetDO doPaint,1;
        ! Enable Paint Applicator

        MoveL Offs(Home,-40,5,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !1
        MoveL Offs(Home,0,10,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !1
        MoveL Offs(Home,-40,15,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !1
        MoveL Offs(Home,0,20,0),v300,fine,Pen_TCP\WObj:=wobjInFeeder; !1

        SetDO doPaint,0;

        ! Return to the draw position or to a safe position before drawing the next letter
        MoveL Home,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
        ! Move back to the Draw position or to a safe position

        WaitRob\InPos;
        SetDO doConveyor,1;

    ENDPROC
ENDMODULE