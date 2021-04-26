# DelphiFMXComponentToCode
 Primitive Components (Design) To Code

 From
 ```Pascal
 object LayoutMenu: TLayout
  Anchors = [akLeft, akTop, akRight, akBottom]
  Size.Width = 50.000000000000000000
  Size.Height = 578.000000000000000000
  Size.PlatformDefault = False
  TabOrder = 0
  object SpeedButtonMenu: TSpeedButton
    StaysPressed = True
    Align = Top
    GroupName = 'Menu'
    Hint = #1052#1077#1085#1102
    Images = ImageListIcons
    ImageIndex = 7
    Margins.Bottom = 5.000000000000000000
    Position.X = 2.000000000000000000
    Size.Width = 46.000000000000000000
    Size.Height = 46.000000000000000000
    Size.PlatformDefault = False
    ParentShowHint = False
    ShowHint = True
    StyleLookup = 'speedbutton_style_pro'
    Text = 'SpeedButtonMenu'
    OnClick = SpeedButtonMenuClick
  end
  object FloatAnimationMenuOp: TFloatAnimation
    Duration = 0.200000002980232200
    PropertyName = 'Position.X'
    StartValue = -50.000000000000000000
    StopValue = 0.000000000000000000
  end
end
```
To
```Pascal
FloatAnimationMenuOp: TFloatAnimation;
SpeedButtonMenu: TSpeedButton;
LayoutMenu: TLayout;

LayoutMenu := TLayout.Create(Self);
with LayoutMenu do
begin
  Parent := Self;
  Anchors := [akLeft, akTop, akRight, akBottom];
  Size.Width := 50;
  Size.Height := 578;
  Size.PlatformDefault := False;
  TabOrder := 0;
  SpeedButtonMenu := TSpeedButton.Create(Self);
  with SpeedButtonMenu do
  begin
    Parent := LayoutMenu;
    StaysPressed := True;
    Align := TAlignLayout.Top;
    GroupName := 'Menu';
    Hint := #1052#1077#1085#1102;
    Images := ImageListIcons;
    ImageIndex := 7;
    Margins.Bottom := 5;
    Position.X := 2;
    Size.Width := 46;
    Size.Height := 46;
    Size.PlatformDefault := False;
    ParentShowHint := False;
    ShowHint := True;
    StyleLookup := 'speedbutton_style_pro';
    Text := 'SpeedButtonMenu';
    OnClick := SpeedButtonMenuClick;
  end;
  FloatAnimationMenuOp := TFloatAnimation.Create(Self);
  with FloatAnimationMenuOp do
  begin
    Parent := LayoutMenu;
    Duration := 0.200000002980232200;
    PropertyName := 'Position.X';
    StartValue := -50;
    StopValue := 0;
  end;
end;
```
