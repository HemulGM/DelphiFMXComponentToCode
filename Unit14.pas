unit Unit14;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm14 = class(TForm)
    MemoInput: TMemo;
    MemoOutput: TMemo;
    procedure MemoInputChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses
  System.Generics.Collections;

{$R *.fmx}

{
object MemoInput: TMemo
  Touch.InteractiveGestures = [Pan, LongTap, DoubleTap]
  DataDetectorTypes = []
  Lines.Strings = (
    'object MemoInput: TMemo'
    '  Touch.InteractiveGestures = [Pan, LongTap, DoubleTap]'
    '  DataDetectorTypes = []'
    'end')
  StyledSettings = [Size, Style, FontColor]
  TextSettings.Font.Family = 'Courier New'
  OnChange = MemoInputChange
  Align = Left
  Size.Width = 473.000000000000000000
  Size.Height = 605.000000000000000000
  Size.PlatformDefault = False
  TabOrder = 2
  Viewport.Width = 469.000000000000000000
  Viewport.Height = 601.000000000000000000
end

}

procedure TForm14.MemoInputChangeTracking(Sender: TObject);
var
  i: Integer;
  line, tmp, spcs, self_str: string;
  Parents: TDictionary<string, string>;

  procedure AddLine(const Value: string);
  begin
    MemoOutput.Lines.Add(spcs + Value);
  end;

  procedure AddTop(const Value: string);
  begin
    MemoOutput.Lines.Insert(0, Value);
  end;

begin
  MemoOutput.Lines.Clear;
  MemoOutput.Lines.Add('');
  spcs := '';
  Parents := TDictionary<string, string>.Create;
  Parents.Add('', 'Self');
  for i := 0 to Pred(MemoInput.Lines.Count) do
  begin
    line := MemoInput.Lines[i].Trim([' ']);
    if line.StartsWith('object ') then
    begin
      tmp := line.Remove(0, 'object '.Length);
      AddTop(tmp + ';');
      tmp := tmp.Replace(':', ' :=') + '.Create(Self);';
      AddLine(tmp);
      tmp := line.Remove(0, 'object '.Length);
      self_str := tmp.Substring(0, tmp.IndexOf(':'));
      AddLine('with ' + self_str + ' do ');
      AddLine('begin');

      if Parents.ContainsKey(spcs) then
      begin
        AddLine('  Parent := ' + Parents.Items[spcs] + ';');
      end;
      spcs := spcs + '  ';
      Parents.AddOrSetValue(spcs, self_str);
    end
    else if line.StartsWith('end') then
    begin
      spcs := spcs.Remove(0, 2);
      AddLine('end;');
    end
    else
    begin
      tmp := line.Replace('.000000000000000000', '');
      tmp := tmp.Replace('Color := x', 'Color := $');
      tmp := tmp.Replace('=', ':=') + ';';
      tmp := tmp.Replace('Align := ', 'Align := TAlignLayout.');
      AddLine(tmp);
    end;
  end;
  Parents.Free;
end;

end.

