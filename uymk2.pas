unit uymk2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cmbObjClassName: TComboBox;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public
    LineToInsert : string;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if ModalResult = mrOK
  then
    LineToInsert := IntToStr(cmbObjClassName.ItemIndex) + ' 0.5 0.5 0.2 0.2'
  else
    LineToInsert := '';
end;

end.

