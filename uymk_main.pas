unit uymk_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  EditBtn, StdCtrls, FileCtrl, CheckLst, Menus, uymk2, IniFiles;

const
  EDGE_FOR_RESIZE = 10;

type

  { TfrmYoloMarker }

  TfrmYoloMarker = class(TForm)
    btnInsertObject: TButton;
    btnDeleteObject: TButton;
    edtImageDir: TDirectoryEdit;
    IMG: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lstObjects: TListBox;
    lstObjectNames: TListBox;
    mnuMoveObjUp: TMenuItem;
    mnuMoveObjDown: TMenuItem;
    mnuMoveObjLeft: TMenuItem;
    mnuMoveObjRight: TMenuItem;
    mnuDecreaseWidth: TMenuItem;
    mnuIncreaseWidth: TMenuItem;
    mnuIncreaseHeight: TMenuItem;
    mnuResizeObject: TMenuItem;
    mnuDecreaseHeight: TMenuItem;
    mnuMoveObject: TMenuItem;
    N4: TMenuItem;
    MNU: TMainMenu;
    memObjects: TMemo;
    mnuImage: TMenuItem;
    mnuAddNewObject: TMenuItem;
    mnuDeleteObject: TMenuItem;
    mnuQuickAddObj: TMenuItem;
    mnuSelectDir: TMenuItem;
    mnuSelectObjNames: TMenuItem;
    mnuPreviousImage: TMenuItem;
    mnuNextImage: TMenuItem;
    mnuPreviousObject: TMenuItem;
    mnuNextObject: TMenuItem;
    mnuExit: TMenuItem;
    mnuObject: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    ObjLbl: TLabel;
    lstFiles: TFileListBox;
    edtObjName: TFileNameEdit;
    lblYoloMarker: TLabel;
    lblSelectImgDir: TLabel;
    lblSelectObjNameFile: TLabel;
    ObjBox: TShape;
    panClient: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    panInnerImg: TPanel;
    panTop: TPanel;
    panLeft: TPanel;
    panImage: TPanel;
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape2: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape3: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape4: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Shape5: TShape;
    Shape50: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Shape53: TShape;
    Shape54: TShape;
    Shape55: TShape;
    Shape56: TShape;
    Shape57: TShape;
    Shape58: TShape;
    Shape59: TShape;
    Shape6: TShape;
    Shape60: TShape;
    Shape61: TShape;
    Shape62: TShape;
    Shape63: TShape;
    Shape64: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    spl01: TSplitter;
    spl02: TSplitter;
    spl03: TSplitter;
    tmrVerifyImageLoading: TTimer;
    tmrChangeObjBoxColor: TTimer;
    tmrLoadFileList: TTimer;
    tmrFileChanged: TTimer;
    procedure btnDeleteObjectClick(Sender: TObject);
    procedure btnInsertObjectClick(Sender: TObject);
    procedure edtImageDirChange(Sender: TObject);
    procedure edtImageDirDblClick(Sender: TObject);
    procedure edtObjNameChange(Sender: TObject);
    procedure edtObjNameDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lstFilesChange(Sender: TObject);
    procedure lstObjectsClick(Sender: TObject);
    procedure memObjectsChange(Sender: TObject);
    procedure memObjectsEnter(Sender: TObject);
    procedure mnuDecreaseHeightClick(Sender: TObject);
    procedure mnuDecreaseWidthClick(Sender: TObject);
    procedure mnuIncreaseHeightClick(Sender: TObject);
    procedure mnuIncreaseWidthClick(Sender: TObject);
    procedure mnuMoveObjDownClick(Sender: TObject);
    procedure mnuMoveObjLeftClick(Sender: TObject);
    procedure mnuMoveObjRightClick(Sender: TObject);
    procedure mnuMoveObjUpClick(Sender: TObject);
    procedure mnuQuickAddObjClick(Sender: TObject);
    procedure mnuPreviousObjectClick(Sender: TObject);
    procedure mnuNextObjectClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuNextImageClick(Sender: TObject);
    procedure mnuPreviousImageClick(Sender: TObject);
    procedure ObjBoxChangeBounds(Sender: TObject);
    procedure ObjBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ObjBoxMouseLeave(Sender: TObject);
    procedure ObjBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure panImageResize(Sender: TObject);
    procedure ShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrVerifyImageLoadingTimer(Sender: TObject);
    procedure tmrChangeObjBoxColorTimer(Sender: TObject);
    procedure tmrFileChangedTimer(Sender: TObject);
    procedure tmrLoadFileListTimer(Sender: TObject);
  private
    AppPath : string;
    FileChanged : boolean;
    ImgWidth,ImgHeight : integer;
    LastObjClass : integer;
    LastFileName : string;
    CurrentMarkFile : string;
    ObjMoveX, ObjMoveY : integer;
    ObjMoveDirection : string;
    PenColor : TColor;
    procedure ChangeBoxVisibility(Visib : Boolean);
    procedure BasicReadImage(FileName : string);
    procedure BasicReadMarkers(FileName : string);
    procedure BasicResizeImageComponent;
    procedure BasicRecalculateShapes;
    procedure BasicOpenObjNamesFile(ObjFile : string);
    procedure AutoSave;
  public

  end;

var
  frmYoloMarker: TfrmYoloMarker;

implementation

{$R *.lfm}

{ TfrmYoloMarker }
procedure SplitString(SplitChar : char; var S : string; var Initial : string);
var
  p : integer;
begin
  S := Trim(S);
  p := Pos(SplitChar,S);
  if p < 1 then p := Length(S) + 1;
  Initial := Trim(Copy(S,1,p-1));
  S := Trim(Copy(S,p+1,Length(S)));
end;


procedure TfrmYoloMarker.edtImageDirChange(Sender: TObject);
var
  s : string;
begin
  s := edtImageDir.Text;
  if not DirectoryExists(s) then Exit;

  if length(s) > 1
  then
    s := ExcludeTrailingPathDelimiter(s);

  lstFiles.Directory := s;
  tmrLoadFileList.Enabled := True;
end;

procedure TfrmYoloMarker.btnInsertObjectClick(Sender: TObject);
begin
  Application.CreateForm(TForm1, Form1);
  try
    Form1.cmbObjClassName.Items.Text := lstObjectNames.Items.Text;
    if lstObjectNames.Items.Count > 0
    then begin
      if (LastObjClass < 0) or (LastObjClass >= lstObjectNames.Items.Count)
      then
        LastObjClass := 0;
      Form1.cmbObjClassName.ItemIndex := LastObjClass;
    end;
    if Form1.ShowModal = mrOK
    then begin
      LastObjClass := Form1.cmbObjClassName.ItemIndex;
      if Form1.LineToInsert <> ''
      then begin
        memObjects.Lines.Add(Form1.LineToInsert);
        BasicRecalculateShapes;
      end;
    end;
  finally
    Form1.Release;
  end;

end;

procedure TfrmYoloMarker.btnDeleteObjectClick(Sender: TObject);
var
  i,idx : integer;
  LS : string;
begin
  if lstObjects.Items.Count = 0 then Exit;
  idx := lstObjects.ItemIndex;
  if idx = -1 then Exit;
  LS := '';
  for i := 0 to memObjects.Lines.Count - 1 do
  begin
    if i = idx then Continue;
    LS := LS + memObjects.Lines[i] + #10;
  end;
  memObjects.Lines.Text := LS;
  BasicRecalculateShapes;
end;

procedure TfrmYoloMarker.edtImageDirDblClick(Sender: TObject);
begin
  edtImageDir.RunDialog;
end;

procedure TfrmYoloMarker.edtObjNameChange(Sender: TObject);
var
  s : string;
begin
  s := edtObjName.Text;
  lstObjectNames.Clear;
  if not FileExists(s) then Exit;
  BasicOpenObjNamesFile(s);
end;

procedure TfrmYoloMarker.edtObjNameDblClick(Sender: TObject);
begin
  edtObjName.RunDialog;
end;

procedure TfrmYoloMarker.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(AppPath + 'ymarker.ini');
  try
    Ini.WriteString('Files','ImagesDirectory',edtImageDir.Text);
    Ini.WriteString('Files','ObjFile',edtObjName.Text);
    Ini.WriteString('Files','LastImage',LastFileName);
    Ini.WriteInteger('Files','LastObject',LastObjClass);
  finally
    Ini.Free;
  end;
end;

procedure TfrmYoloMarker.FormCreate(Sender: TObject);
var
  Ini : TIniFile;
begin
  AppPath := IncludeTrailingPathDelimiter(ExtractFilePath(ExpandFileName(
    Application.ExeName)));

  IMG.Picture.Clear;
  Ini := TIniFile.Create(AppPath + 'ymarker.ini');
  try
    LastObjClass := Ini.ReadInteger('Files','LastObject',0);
    LastFileName := Ini.ReadString('Files','LastImage','');
    edtObjName.Text := Ini.ReadString('Files','ObjFile','');
    edtImageDir.Text := Ini.ReadString('Files','ImagesDirectory',AppPath);
  finally
    Ini.Free;
  end;
end;

procedure TfrmYoloMarker.lstFilesChange(Sender: TObject);
begin
  FileChanged := True;
  tmrFileChanged.Enabled := True;
end;

procedure TfrmYoloMarker.lstObjectsClick(Sender: TObject);
var
  idx : integer;
  sh : TShape;
  objName,dummy : string;
begin
  ChangeBoxVisibility(False);
  idx := lstObjects.ItemIndex;
  if idx < 0 then Exit;

  objName := lstObjects.Items[idx];
  SplitString(':',objName,dummy);

  Inc(idx);
  sh := FindComponent('Shape'+IntToStr(idx)) as TShape;

  ChangeBoxVisibility(True);

  ObjBox.SetBounds(sh.Left,sh.Top,sh.Width,sh.Height);
  ObjLbl.Caption := objName;
end;

procedure TfrmYoloMarker.memObjectsChange(Sender: TObject);
begin
  AutoSave;
  if ActiveControl = memObjects
  then begin
    BasicRecalculateShapes;
  end;
end;

procedure TfrmYoloMarker.ChangeBoxVisibility(Visib : Boolean);
begin
  ObjBox.Visible := Visib;
  ObjLbl.Visible := Visib;
  mnuMoveObject.Visible := Visib;
  mnuResizeObject.Visible := Visib;
end;

procedure TfrmYoloMarker.memObjectsEnter(Sender: TObject);
begin
  lstObjects.ItemIndex := -1;
  ChangeBoxVisibility(False);
end;

procedure TfrmYoloMarker.mnuDecreaseHeightClick(Sender: TObject);
begin
  if not ObjBox.Visible then Exit;

  if ObjBox.Height > 1
  then
    ObjBox.SetBounds(ObjBox.Left, ObjBox.Top, ObjBox.Width, ObjBox.Height - 1);
end;

procedure TfrmYoloMarker.mnuDecreaseWidthClick(Sender: TObject);
begin
  if not ObjBox.Visible then Exit;

  if ObjBox.Width > 1
  then
    ObjBox.SetBounds(ObjBox.Left, ObjBox.Top, ObjBox.Width - 1, ObjBox.Height);

end;

procedure TfrmYoloMarker.mnuIncreaseHeightClick(Sender: TObject);
begin
  if not ObjBox.Visible then Exit;

  if ObjBox.Top + ObjBox.Height < panInnerImg.Height
  then
    ObjBox.SetBounds(ObjBox.Left, ObjBox.Top, ObjBox.Width, ObjBox.Height + 1);

end;

procedure TfrmYoloMarker.mnuIncreaseWidthClick(Sender: TObject);
begin
  if not ObjBox.Visible then Exit;

  if ObjBox.Left + ObjBox.Width < panInnerImg.Width
  then
    ObjBox.SetBounds(ObjBox.Left, ObjBox.Top, ObjBox.Width + 1, ObjBox.Height);
end;

//if ObjBox.Width > 2 then ObjBox.SetBounds(ObjBox.Left+1,ObjBox.Top,ObjBox.Width-2,ObjBox.Height);
//if ObjBox.Height > 2 then ObjBox.SetBounds(ObjBox.Left,ObjBox.Top+1,ObjBox.Width,ObjBox.Height-2);

procedure TfrmYoloMarker.mnuMoveObjDownClick(Sender: TObject);
begin
  if not ObjBox.Visible then Exit;

  if ObjBox.Top + ObjBox.Height < panInnerImg.Height
  then
    ObjBox.SetBounds(ObjBox.Left, ObjBox.Top + 1, ObjBox.Width, ObjBox.Height);
end;

procedure TfrmYoloMarker.mnuMoveObjLeftClick(Sender: TObject);
begin
  if not ObjBox.Visible then Exit;

  if ObjBox.Left > 0
  then
    ObjBox.SetBounds(ObjBox.Left - 1, ObjBox.Top, ObjBox.Width, ObjBox.Height);
end;

procedure TfrmYoloMarker.mnuMoveObjRightClick(Sender: TObject);
begin
  if not ObjBox.Visible then Exit;

  if ObjBox.Left + ObjBox.Width < panInnerImg.Width
  then
    ObjBox.SetBounds(ObjBox.Left + 1, ObjBox.Top, ObjBox.Width, ObjBox.Height);
end;

procedure TfrmYoloMarker.mnuMoveObjUpClick(Sender: TObject);
begin
  if not ObjBox.Visible then Exit;

  if ObjBox.Top > 0
  then
    ObjBox.SetBounds(ObjBox.Left, ObjBox.Top - 1, ObjBox.Width, ObjBox.Height);
end;

procedure TfrmYoloMarker.mnuQuickAddObjClick(Sender: TObject);
var
  L : string;
begin
  if (LastObjClass < 0) or (LastObjClass >= lstObjectNames.Count)
  then
    LastObjClass := 0;
  L := IntToStr(LastObjClass) + ' 0.5 0.5 0.2 0.2';
  memObjects.Lines.Add(L);
  BasicRecalculateShapes;
end;

procedure TfrmYoloMarker.mnuPreviousObjectClick(Sender: TObject);
var
  idx : integer;
begin
  if lstObjects.Items.Count = 0 then Exit;
  idx := lstObjects.ItemIndex;
  if idx > -1 then Dec(idx);
  if idx = -1 then idx := lstObjects.Items.Count - 1;
  lstObjects.ItemIndex := idx;
  lstObjects.Click;
end;

procedure TfrmYoloMarker.mnuNextObjectClick(Sender: TObject);
var
  idx : integer;
begin
  if lstObjects.Items.Count = 0 then Exit;
  idx := lstObjects.ItemIndex + 1;
  if idx >= lstObjects.Items.Count then idx := 0;
  lstObjects.ItemIndex := idx;
  lstObjects.Click;
end;

procedure TfrmYoloMarker.mnuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmYoloMarker.mnuNextImageClick(Sender: TObject);
var
  idx : integer;
begin
  if lstFiles.Items.Count = 0 then Exit;
  idx := lstFiles.ItemIndex + 1;
  if idx >= lstFiles.Items.Count then idx := 0;
  lstFiles.ItemIndex := idx;
  lstFiles.Click;
end;

procedure TfrmYoloMarker.mnuPreviousImageClick(Sender: TObject);
var
  idx : integer;
begin
  if lstFiles.Items.Count = 0 then Exit;
  idx := lstFiles.ItemIndex;
  if idx > -1 then Dec(idx);
  if idx = -1 then idx := lstFiles.Items.Count - 1;
  lstFiles.ItemIndex := idx;
  lstFiles.Click;
end;

procedure TfrmYoloMarker.ObjBoxChangeBounds(Sender: TObject);
var
  idx : integer;
  sh : TShape;
  L,dummy : string;
  px,py,pw,ph : double;
begin
  ObjLbl.Left := ObjBox.Left + 4;

  if ObjBox.Height <= ObjLbl.Height + 16
  then begin
    if ObjBox.Top + ObjBox.Height + ObjLbl.Height + 4 > panInnerImg.Height
    then begin
      if ObjBox.Top - ObjLbl.Height - 4 < 0
      then
        ObjLbl.Top := ObjBox.Top + ObjBox.Height - 4 - ObjLbl.Height
      else
        ObjLbl.Top := ObjBox.Top - ObjLbl.Height - 4;
    end
    else begin
      ObjLbl.Top := ObjBox.Top + ObjBox.Height + 4;
    end;
  end
  else
    ObjLbl.Top := ObjBox.Top + (ObjBox.Height div 2) - (ObjLbl.Height div 2);

  idx := lstObjects.ItemIndex;
  if idx = -1 then Exit;
  sh := FindComponent('Shape'+IntToStr(idx+1)) as TShape;
  with ObjBox do
  begin
    sh.SetBounds(Left,Top,Width,Height);
    px := (Left + (Width / 2)) / panInnerImg.Width;
    py := (Top + (Height / 2)) / panInnerImg.Height;
    pw := Width / panInnerImg.Width;
    ph := Height / panInnerImg.Height;
  end;
  L := memObjects.Lines[idx];
  SplitString(' ',L,dummy);
  L := dummy
    + ' ' + FormatFloat('0.000000',px)
    + ' ' + FormatFloat('0.000000',py)
    + ' ' + FormatFloat('0.000000',pw)
    + ' ' + FormatFloat('0.000000',ph);
  memObjects.Lines[idx] := L;
end;

procedure TfrmYoloMarker.ObjBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift
  then begin
    ObjMoveX := X;
    ObjMoveY := Y;

    ObjMoveDirection := '';
    if X > ObjBox.Width - EDGE_FOR_RESIZE - 1
    then ObjMoveDirection := 'E'
    else if X < EDGE_FOR_RESIZE then ObjMoveDirection := 'W';

    if Y > ObjBox.Height - EDGE_FOR_RESIZE - 1
    then ObjMoveDirection := 'S' + ObjMoveDirection
    else if Y < EDGE_FOR_RESIZE then ObjMoveDirection := 'N' + ObjMoveDirection;
  end;
end;

procedure TfrmYoloMarker.ObjBoxMouseLeave(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TfrmYoloMarker.ObjBoxMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Resizing_ : boolean;
  DifX, DifY : integer;

  function TryBounds(NewLeft,NewTop,NewWidth,NewHeight : integer) : integer;
  begin
    Result := 3;
    if (NewLeft < 0)
    or (NewWidth < 2)
    or (NewLeft + NewWidth > panInnerImg.Width)
    then
      Result := Result - 2;

    if (NewTop < 0)
    or (NewHeight < 2)
    or (NewTop + NewHeight > panInnerImg.Height)
    then
      Result := Result - 1;
    if odd(Result)
    then
       with ObjBox do SetBounds(Left, NewTop, Width, NewHeight);
    if Result > 1
    then
      with ObjBox do SetBounds(NewLeft, Top, NewWidth, Height);
  end;

begin
  Resizing_ := ssLeft in Shift;
  if Resizing_
  then begin
    DifX := X - ObjMoveX;
    DifY := Y - ObjMoveY;
  end
  else begin
    ObjMoveDirection := '';
    if X > ObjBox.Width - EDGE_FOR_RESIZE - 1
    then ObjMoveDirection := 'E'
    else if X < EDGE_FOR_RESIZE then ObjMoveDirection := 'W';

    if Y > ObjBox.Height - EDGE_FOR_RESIZE - 1
    then ObjMoveDirection := 'S' + ObjMoveDirection
    else if Y < EDGE_FOR_RESIZE then ObjMoveDirection := 'N' + ObjMoveDirection;
  end;


  if ObjMoveDirection = ''
  then begin
    if Resizing_
    then
      TryBounds(ObjBox.Left + DifX, ObjBox.Top + DifY, ObjBox.Width, ObjBox.Height);
    ObjBox.Cursor:= crSize;
  end
  else if ObjMoveDirection = 'N'
  then begin
    if Resizing_
    then
      TryBounds(ObjBox.Left, ObjBox.Top + DifY, ObjBox.Width, ObjBox.Height - DifY);
    ObjBox.Cursor := crSizeN;
  end
  else if ObjMoveDirection = 'W'
  then begin
    if Resizing_
    then
      TryBounds(ObjBox.Left + DifX, ObjBox.Top, ObjBox.Width - DifX, ObjBox.Height);
    ObjBox.Cursor := crSizeW;
  end
  else if ObjMoveDirection = 'S'
  then begin
    if Resizing_
    then
      if TryBounds(ObjBox.Left, ObjBox.Top, ObjBox.Width, ObjBox.Height + DifY) and 1 = 1
      then
        ObjMoveY := objMoveY + DifY;
    ObjBox.Cursor := crSizeS;
  end
  else if ObjMoveDirection = 'E'
  then begin
    if Resizing_
    then
      if TryBounds(ObjBox.Left, ObjBox.Top, ObjBox.Width + DifX, ObjBox.Height) and 2 = 2
      then
        ObjMoveX := objMoveX + DifX;
    ObjBox.Cursor := crSizeE;
  end
  else if ObjMoveDirection = 'NW'
  then begin
    if Resizing_
    then
      TryBounds(ObjBox.Left + DifX, ObjBox.Top + DifY, ObjBox.Width - DifX, ObjBox.Height - DifY);
    ObjBox.Cursor := crSizeNW;
  end
  else if ObjMoveDirection = 'NE'
  then begin
    if Resizing_
    then
      if TryBounds(ObjBox.Left, ObjBox.Top + DifY, ObjBox.Width + DifX, ObjBox.Height - DifY) and 2 = 2
      then
        ObjMoveX := objMoveX + DifX;
    ObjBox.Cursor := crSizeNE;
  end
  else if ObjMoveDirection = 'SW'
  then begin
    if Resizing_
    then
      if TryBounds(ObjBox.Left + DifX, ObjBox.Top, ObjBox.Width - DifX, ObjBox.Height + DifY) and 1 = 1
      then
        ObjMoveY := objMoveY + DifY;
    ObjBox.Cursor := crSizeSW;
  end
  else if ObjMoveDirection = 'SE'
  then begin
    if Resizing_
    then
      case TryBounds(ObjBox.Left, ObjBox.Top, ObjBox.Width + DifX, ObjBox.Height + DifY) of
        1: ObjMoveY := objMoveY + DifY;
        2: ObjMoveX := objMoveX + DifX;
        3:
          begin
            ObjMoveX := objMoveX + DifX;
            ObjMoveY := objMoveY + DifY;
          end;
      end;
    ObjBox.Cursor := crSizeSE;
  end
end;

procedure TfrmYoloMarker.panImageResize(Sender: TObject);
begin
  BasicResizeImageComponent;
  BasicRecalculateShapes;
end;

procedure TfrmYoloMarker.ShapeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  idx : integer;
  objName : string;
begin
  if ssLeft in Shift
  then begin
    if (Sender is TShape)
    then
      objName := TShape(Sender).Name
    else
      Exit;
    if copy(objName,1,5) <> 'Shape' then Exit;
    idx := StrToInt(Copy(objName,6,Length(objName)-5));
    lstObjects.ItemIndex := idx - 1;
    lstObjects.Click;
  end;
end;

procedure TfrmYoloMarker.tmrVerifyImageLoadingTimer(Sender: TObject);
var
  FileNM : string;
begin
  if ((lstFiles.Items.Count > 0) and (lstFiles.ItemIndex <> -1)) <> (panInnerImg.Visible and (IMG.Picture.Width <> 0))
  then begin
    panInnerImg.Visible := (lstFiles.Items.Count > 0) and (lstFiles.ItemIndex <> -1);
    memObjects.Enabled := panInnerImg.Visible;
    if panInnerImg.Visible
    then begin
      LastFileName := lstFiles.Items[lstFiles.ItemIndex];
      FileNM := IncludeTrailingPathDelimiter(edtImageDir.Text) + LastFileName;
      BasicReadImage(FileNM);
      BasicResizeImageComponent;
      BasicReadMarkers(FileNM);
      BasicRecalculateShapes;
    end
    else begin
      LastFileName := '';
      CurrentMarkFile := '';
    end;
  end;
end;

procedure TfrmYoloMarker.tmrChangeObjBoxColorTimer(Sender: TObject);
begin
  if PenColor = clFuchsia then PenColor := clPurple else PenColor := clFuchsia;
  ObjBox.Pen.Color := PenColor;
  ObjLbl.Color := PenColor;
end;

procedure TfrmYoloMarker.tmrFileChangedTimer(Sender: TObject);
var
  idx : integer;
begin
  if not FileChanged then Exit;

  FileChanged := False;
  tmrFileChanged.Enabled := False;

  idx := lstFiles.ItemIndex;

  if idx = -1
  then LastFileName := ''
  else LastFileName := lstFiles.Items[idx];

  BasicReadImage(lstFiles.FileName);
  BasicResizeImageComponent;
  BasicReadMarkers(lstFiles.FileName);
  BasicRecalculateShapes;
end;

procedure TfrmYoloMarker.tmrLoadFileListTimer(Sender: TObject);
var
  idx : integer;
begin
  tmrLoadFileList.Enabled := False;

  if LastFileName = ''
  then begin
    lstFiles.ItemIndex := -1;
  end
  else begin
    idx := lstFiles.Items.IndexOf(LastFileName);
    lstFiles.ItemIndex := idx;
  end;
  lstFilesChange(nil);
end;

procedure TfrmYoloMarker.BasicReadImage(FileName: string);
var
  OldCursor : TCursor;
begin
  IMG.Picture.Clear;
  IMG.Stretch := False;
  ImgWidth := 0;
  ImgHeight := 0;

  if FileName = '' then Exit;

  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    IMG.Picture.LoadFromFile(FileName);
    ImgWidth  := IMG.Picture.Width;
    ImgHeight := IMG.Picture.Height;
    IMG.Stretch := True;

  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmYoloMarker.BasicReadMarkers(FileName: string);
var
  MarkFileName : string;
  i,j : integer;
  W,H : double;
  L,dummy : string;
  TxtRecognized : boolean;
  SaveMemoChange : TNotifyEvent;
begin
  SaveMemoChange := memObjects.OnChange;
  try
    memObjects.OnChange := nil;
    memObjects.Clear;
    if FileName = '' then Exit;
    MarkFileName := ChangeFileExt(FileName,'.txt');
    CurrentMarkFile := MarkFileName;
    if not FileExists(MarkFileName) then Exit;

    memObjects.Lines.LoadFromFile(MarkFileName);
    TxtRecognized := True;
    for i := 0 to memObjects.Lines.Count - 1 do
    begin
      L := memObjects.Lines[i];
      if L = '' then continue;
      SplitString(' ',L,dummy);
      if StrToIntDef(dummy,-100) = -100 then TxtRecognized := False;
      W := 0;
      H := 0;
      for j := 1 to 4 do
      begin
        W := H;
        SplitString(' ',L,dummy);
        H := StrToFloatDef(dummy,-1000000);
        if Round(H) = -1000000 then TxtRecognized := False;
      end;
      if not TxtRecognized then Break;
      //L := memObjects.Lines[i] + ' > ' + FloatToStr(W * H);
      //memObjects.Lines[i] := L;
    end;

    if not TxtRecognized
    then begin
      ShowMessage('File "' + MarkFileName
        + '" exists, but it''s not a Label Mark File.'#13#10
        + 'Renaming as backup.');
      RenameFile(MarkFileName,MarkFileName+'.backup');
      memObjects.Clear;
      Exit;
    end;

  finally
    memObjects.OnChange := SaveMemoChange;
  end;
end;

procedure TfrmYoloMarker.BasicRecalculateShapes;
var
  i,idx,classNumber,NewLeft,NewTop,NewWidth,NewHeight : integer;
  L,classNumberStr,objClassName,numberStr : string;
  px,py,pw,ph : double;
  sh : TShape;
begin
  ChangeBoxVisibility(False);
  lstObjects.Clear;
  for i := 1 to 64 do
  begin
    sh := FindComponent('Shape'+IntToStr(i)) as TShape;
    sh.Visible := False;
  end;
  classNumberStr := '';
  numberStr := '';
  for i := 0 to memObjects.Lines.Count - 1 do
  begin
    L := memObjects.Lines[i];
    SplitString(' ',L,classNumberStr);
    classNumber := StrToIntDef(classNumberStr,-1);
    if (classNumber < 0) or (classNumber > lstObjectNames.Count-1)
    then
      objClassName := 'Unknown class "' + classNumberStr + '"'
    else
      objClassName := IntToStr(i+1) + ': ' + lstObjectNames.Items[classNumber];

    SplitString(' ',L,numberStr);
    px := StrToFloatDef(numberStr,-1);
    if px < 0 then Continue;

    SplitString(' ',L,numberStr);
    py := StrToFloatDef(numberStr,-1);
    if py < 0 then Continue;

    SplitString(' ',L,numberStr);
    pw := StrToFloatDef(numberStr,-1);
    if pw < 0 then Continue;

    SplitString(' ',L,numberStr);
    ph := StrToFloatDef(numberStr,-1);
    if ph < 0 then Continue;

    NewWidth  := Trunc(pw * panInnerImg.Width);
    NewHeight := Trunc(ph * panInnerImg.Height);
    NewLeft   := Trunc(px * panInnerImg.Width) - (NewWidth div 2);
    NewTop    := Trunc(py * panInnerImg.Height) - (NewHeight div 2);

    lstObjects.Items.Add(objClassName);
    idx := lstObjects.Items.Count;
    sh := FindComponent('Shape'+IntToStr(idx)) as TShape;
    sh.SetBounds(NewLeft,NewTop,NewWidth,NewHeight);
    sh.Visible := True;
    sh.Pen.Width := 1;
    sh.Pen.Color := clWhite;
    sh.Pen.Mode  := pmCopy;
    sh.Brush.Style := bsClear;
    sh.Cursor := crHandPoint;
    sh.OnMouseDown := Shape1.OnMouseDown;
  end;
end;

{
procedure TfrmYoloMarker.BasicRecalculateZOrder;
var
  i,j,idx : integer;
  ShapeArea : array [1..64] of Double;
  ZSort : array [1..64] of integer;
  sh : TShape;
begin
  for i := 0 to lstObjects.Count - 1 do
  begin
    idx := i+1;
    sh := FindComponent('Shape'+IntToStr(idx));
    ZSort[idx] := idx;
    ShapeArea[idx] := sh.Width * sh.Height;
  end;

  for i := 1 to lstObjects.Count do
  begin
    for j :=
      sh.
  end;
end;
}
procedure TfrmYoloMarker.BasicResizeImageComponent;
var
  NewLeft, NewTop, NewWidth, NewHeight : integer;
  MinScale, ScaleWidth, ScaleHeight : Double;
  OldCursor : TCursor;
begin
  if (ImgWidth <= 1) or (ImgHeight <= 1) or (panImage.Width <= 10) or (panImage.Height <= 10)
  then begin
    Exit;
  end;

  OldCursor := Screen.Cursor;

  try
    ScaleWidth  := panImage.Width / ImgWidth;
    ScaleHeight := panImage.Height / ImgHeight;
    if ScaleWidth < ScaleHeight then MinScale := ScaleWidth else MinScale := ScaleHeight;
    NewWidth  := Trunc(MinScale * ImgWidth);
    NewHeight := Trunc(MinScale * ImgHeight);
    NewLeft   := (panImage.Width - NewWidth) div 2;
    NewTop    := (panImage.Height - NewHeight) div 2;

    panInnerImg.SetBounds(NewLeft,NewTop,NewWidth,NewHeight);
    IMG.SetBounds(0,0,NewWidth,NewHeight);

  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmYoloMarker.BasicOpenObjNamesFile(ObjFile: string);
var
  ObjF : TextFile;
  aName : string;
begin
  try
    AssignFile(ObjF,ObjFile);
    Reset(ObjF);
    lstObjectNames.Clear;
    while not Eof(ObjF) do
    begin
      Readln(ObjF,aName);
      lstObjectNames.Items.Add(aName);
    end;
    CloseFile(ObjF);
    panInnerImg.Visible := False;
  except
    ShowMessage('Unable to read Object Names file');
  end;
end;

procedure TfrmYoloMarker.AutoSave;
begin
  if (CurrentMarkFile = '') or not panInnerImg.Visible then Exit;
  memObjects.Lines.SaveToFile(CurrentMarkFile);
end;

end.

