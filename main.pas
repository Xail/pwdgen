unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ActnList, Spin, ComCtrls;

type
  TfrmMain = class(TForm)
    actlst: TActionList;
    StdSymSetAction: TAction;
    UsrSymSetAction: TAction;
    pgcMode: TPageControl;
    tsGenerator: TTabSheet;
    grpUserChars: TGroupBox;
    rbUseStandard: TRadioButton;
    grdpnlCharsets: TGridPanel;
    chkDigits: TCheckBox;
    chkLatLow: TCheckBox;
    chkLatUpp: TCheckBox;
    chkSymbols: TCheckBox;
    chkCyrLow: TCheckBox;
    chkCyrUpp: TCheckBox;
    rbUseCustom: TRadioButton;
    pnlSelectedChars: TPanel;
    mmoSelectedChars: TMemo;
    grpLength: TGroupBox;
    lblFrom: TLabel;
    lblTo: TLabel;
    lblChars: TLabel;
    seMin: TSpinEdit;
    seMax: TSpinEdit;
    grpAdditional: TGroupBox;
    lblPrefix: TLabel;
    lblSuffix: TLabel;
    edtPrefix: TEdit;
    edtSuffix: TEdit;
    grpButtons: TGroupBox;
    PathLabel: TLabel;
    Button1: TButton;
    Button2: TButton;
    tsConverter: TTabSheet;
    grpDictionary: TGroupBox;
    Button3: TButton;
    DicLabel: TLabel;
    grpParams: TGroupBox;
    Label6: TLabel;
    UINEdit: TEdit;
    grpProcess: TGroupBox;
    Button4: TButton;
    procedure StdSymSetActionExecute(Sender: TObject);
    procedure UsrSymSetActionExecute(Sender: TObject);
    procedure seMinChange(Sender: TObject);
    procedure seMaxChange(Sender: TObject);
    procedure chkDigitsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
  	symbols: string;
    procedure StdPanelEnabled(isEnabled: boolean);
    procedure GenerateSymbolSet;


  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation uses strutils;

{$R *.dfm}
{$POINTERMATH ON}
procedure TfrmMain.Button1Click(Sender: TObject);
var
	sd: TSaveDialog;
begin
	sd := TSaveDialog.Create(self);
  if sd.Execute then
  	PathLabel.Caption := sd.FileName;
  FreeAndNil(sd);
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
	symnum: array of integer;
  symcnt: integer;
  wordlen: integer;
  output: textfile;
  buf: string;
  idx, shift, x, symlen: integer;
begin
	GenerateSymbolSet;
  symlen := Length(symbols)-1;
//	output := TFileStream.Create(PathLabel.Caption, fmCreate or fmOpenWrite or fmShareDenyWrite);
	{I-}
	AssignFile(output, PathLabel.Caption);
  {I+}
  Rewrite(output);
  for wordlen := seMin.Value to seMax.Value do
  begin
  	SetLength(symnum, wordlen);
    for symcnt := 0 to wordlen - 1 do
    	symnum[symcnt] := 0;
    repeat
    	buf := '';
    	for idx := 0 to wordlen do
      begin
        buf := buf + MidStr(symbols, symnum[idx]+1, 1);
      end;
      buf := edtPrefix.Text + ReverseString(buf) + edtSuffix.Text;
      writeln(output, buf);
      shift := 1;
      idx := 0;
      repeat
        x := symnum[idx];
        x := x + shift;
        if x > symlen then
        begin
          shift := x-symlen;
          x := 0;
        end
        else
          shift := 0;
        symnum[idx] := x;
        inc(idx);
      until (shift=0) or (idx>wordlen);
    until shift <> 0;
  end;
  CloseFile(output);
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  od: TOpenDialog;
begin
  od := TOpenDialog.Create(self);
  if od.Execute then
  begin
    DicLabel.Caption := od.FileName;
  end;
  freeandnil(od);
end;

procedure TfrmMain.Button4Click(Sender: TObject);
var
  f: TStringList;
  idx, cnt: integer;
begin
  if DicLabel.Caption = '' then
    exit;
  f := TStringList.Create;
  f.LoadFromFile(DicLabel.Caption);
  cnt := f.Count - 1;
  for idx := 0 to cnt do
    f[idx]:=UINEdit.Text+';'+f[idx];
  f.SaveToFile(DicLabel.Caption);
  FreeAndNil(f);
end;

procedure TfrmMain.chkDigitsClick(Sender: TObject);
begin
	GenerateSymbolSet;
end;

procedure TfrmMain.GenerateSymbolSet;
var
	idx, cnt: integer;
begin
	if rbUseStandard.Checked then
  begin
    mmoSelectedChars.Lines.Clear;
    if chkDigits.Checked then
      mmoSelectedChars.Lines.Add('0123456789');
    if chkLatLow.Checked then
      mmoSelectedChars.Lines.Add('abcdefghijklmnopqrtuvwxyz');
    if chkLatUpp.Checked then
      mmoSelectedChars.Lines.Add('ABCDEFGHIJKLMNOQRSTUVWXYZ');
    if chkSymbols.Checked then
      mmoSelectedChars.Lines.Add('`~!@#$%^&*()_+=-[]{}\|/?.>,<;:''"');
    if chkCyrLow.Checked then
      mmoSelectedChars.Lines.Add('àáâãäå¸æçèéêëìíîïðñòóôõö÷øùúûüýþÿ');
    if chkCyrUpp.Checked then
      mmoSelectedChars.Lines.Add('ÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß');
  end;
  symbols := '';
  cnt := mmoSelectedChars.Lines.Count - 1;
  for idx := 0 to cnt do
  	symbols := Symbols + mmoSelectedChars.Lines[idx];
end;

procedure TfrmMain.seMaxChange(Sender: TObject);
begin
	seMin.MaxValue := seMax.Value;
  if seMin.Value > seMin.MaxValue then
  	seMin.Value := seMin.MaxValue;
end;

procedure TfrmMain.seMinChange(Sender: TObject);
begin
	seMax.MinValue := seMin.Value;
  if seMax.Value < seMax.MinValue then
  	seMax.Value := seMax.MinValue;
end;

procedure TfrmMain.StdPanelEnabled(isEnabled: boolean);
begin
	chkDigits.Enabled := isEnabled;
  chkLatLow.Enabled := isEnabled;
  chkLatUpp.Enabled := isEnabled;
  chkSymbols.Enabled := isEnabled;
  chkCyrLow.Enabled := isEnabled;
  chkCyrUpp.Enabled := isEnabled;
  mmoSelectedChars.Enabled := not isEnabled;
end;

procedure TfrmMain.StdSymSetActionExecute(Sender: TObject);
begin
	StdPanelEnabled(true);
end;

procedure TfrmMain.UsrSymSetActionExecute(Sender: TObject);
begin
  StdPanelEnabled(false);
end;

end.
