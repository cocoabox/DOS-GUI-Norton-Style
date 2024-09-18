Uses WindowsObj,VarConstObj,WinObjA,WinObjB,WinObjC,WinInit,GeneralObj,Crt,Dos,
      ErrorDlg,MouseObj,WinApplObj,TopicHlp,HelpObj;

Const
     CmClose    = 1;

Type

   TMyApp = Object (Application)
      Procedure HandleCommand; Virtual;

      Procedure MainMenu;

   End;



Procedure TMyApp.MainMenu;
Var
   KBytes       :String;
   R            :ProgressBar;
   I            :Byte;
Begin
      WinTextColor:=15;
      WinTextBackGround:=3;
      OpenWindow(12,2,66,23,'Test Window',WinChars+OpenFx+CloseFx+CloseIcon+WinCharsWindow+Movement+Shadow);
      Win^.CloseCommand:=0;
      If HeapErrorCode = 1 Then
         Exit;

      AssignXY((GetWindowMaxX-Length(' ~Button ')) div 2,GetWindowMaxY-1,0,0);
      InitButton(' ~Button ',CmClose,PushButton,BfDefault);
      ButtonHelp('',0);

      WriteTextColor:=6;
      WriteTextBackGround:=WinTextBackGround;

      AssignXY(20,2,50,2);
      InitInputLine(Nocm,30,'');
      InputLineLabel(2,2,'label');

      InitText;
      InsertText('List box',$FF,$FF);
      InsertText('Test Item',$FF,$FF);

      AssignXY(2,4,50,10);
      InitTextBox(Box);
      ShowTextBox(GeneralHeadText,GeneralTailText);



End;

Procedure TMyApp.HandleCommand;
Begin
   Case Event of

      CmClose       :Begin
                      ExitFromProgram:=True;
                      CloseWindow;
                    End;
   End;

End;

Var
   MyApp        :TMyApp;


Begin
      MyApp.init;
      MyApp.MainMenu;
      MyApp.Run;
      MyApp.Done;

End.
