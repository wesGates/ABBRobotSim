MODULE Module1
    CONST robtarget pPick:=[[300.023,150,209.481],[0,-0.707106781,0.707106781,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Draw:=[[300.022993432,150.000002947,314.707147681],[0.000000011,0,1,0],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Confirmed:=[[616.591587907,80,203.883134],[-0.000000001,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
            WaitDI diBoxInPos, 1;
            SetDO doPauseConveyor, 1;
            ! Enable Paint
            ! Path S
            ! Disable Paint
            WaitRob;
            
            SetDO doPauseConveyor, 0;
            WaitTime 0.6;
            SetDO doPauseConveyor, 1;
            ! Enable Paint
            ! Path E
            WaitRob;
            ! Disable Paint
            
            SetDO doPauseConveyor, 0;
            WaitTime 0.6;
            SetDO doPauseConveyor, 1;
            ! Enable Paint
            ! Path W
            ! Disable Paint
            WaitRob;
            
            PickPart;
        ENDWHILE
    ENDPROC

    PROC PickPart()
        !** The robot moves to a wait position 200 mm above the pick position. **
        !** The robot waits for a box to pick at the infeeder stop. **
        !** The robot goes to the pick position. **
        !** To attach the box, the robot turns on the digital output signal "doVacuum" which is connected to the Smart Component "SC_VacuumTool". **
        !** The robot waits for the digital input signal "diVacuum" to goes high, which comes from "SC_VacuumTool" and indicates that the box is attached. **
        !** The robot moves up from the infeeder. **
        !** The robot moves to the drop position above the pallet. **
        !** To detach the box, the robot turns off the digital output signal "doVacuum" which is connected to the Smart Component "SC_VacuumTool". **
        !** The robot waits for the digital input signal "diVacuum" to goes low, which comes from "SC_VacuumTool" and indicates that the box is detached. **
        !** The wait time simulates the time it takes for a real vacuum gripper to loose the vacuum. **
        MoveJ Draw,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
    ENDPROC
    PROC Path_10()
        MoveL Confirmed,v300,fine,Pen_TCP\WObj:=wobjInFeeder;
    ENDPROC
ENDMODULE