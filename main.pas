unit main;

interface

uses
  Windows, Messages,
  Menus, ExtCtrls,
  inifiles, graphics,
  Buttons,
  FileCtrl,
  vSystem,
  ShellAPI, Controls, Forms, Dialogs, Classes, SysUtils,
  ImgList, ComCtrls, StdCtrls, ActnList, StdActns, ExtActns,
  CoolTrayIcon, adpInstanceControl;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    ImageList1: TImageList;
    tree: TTreeView;
    savedialog: TSaveDialog;
    Panel2: TPanel;
    list: TListView;
    Splitter3: TSplitter;
    edit: TRichEdit;
    status: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    KillRoot1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    RevertLeaf1: TMenuItem;
    N4: TMenuItem;
    Exit1: TMenuItem;
    Node1: TMenuItem;
    RenameNode1: TMenuItem;
    N9: TMenuItem;
    NewBranch1: TMenuItem;
    NewLeaf1: TMenuItem;
    N2: TMenuItem;
    RefreshTree1: TMenuItem;
    N10: TMenuItem;
    ExpandAll1: TMenuItem;
    CollapseAll1: TMenuItem;
    N5: TMenuItem;
    DeleteNode1: TMenuItem;
    TrayIcon: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    miTrayIconShowWindow: TMenuItem;
    miTrayIconMinimize: TMenuItem;
    N3: TMenuItem;
    miTrayIconExit: TMenuItem;
    imestamp1: TMenuItem;
    adpInstanceControl1: TadpInstanceControl;
    procedure FormCreate(Sender: TObject);
    procedure error(Text: String);
    function AddRoot(aRoot: String; Alias: String; isNew: Boolean): TTreeNode;
    function AddBranch(Node: TTreeNode; Dir: String): TTreeNode;
    function AddStem(Parent: TTreeNode; Name: String): TTreeNode;
    function AddLeaf(Parent: TTreeNode; Name: String): TTreeNode;
    procedure Prune(Node: TTreeNode);
    procedure invalidateRoot(Node: TTreeNode);
    function isValidRoot(Dir: String; Alias: String): Boolean;
    function isValidNode(Parent: TTreeNode; Name: String): Boolean;
    function isValidBranch(Parent: TTreeNode; Name: String): Boolean;
    function isValidLeaf(Parent: TTreeNode; Name: String): Boolean;
    function isValidFile(Parent: TTreeNode; Name: String): Boolean;
    function isValidNewFile(Parent: TTreeNode; Name: String): Boolean;
    function isBranch(Node: TTreeNode): Boolean;
    function isLeaf(Node: TTreeNode): Boolean;
    procedure treeExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    function GetRootDir(Node: TTreeNode): String;
    function GetRootName(Node: TTreeNode): String;
    function GetTreePath(Node: TTreeNode): String;
    function GetTreePathFull(Node: TTreeNode): String;
    function GetFilePath(Node: TTreeNode): String;
    function GetFileExt(Node: TTreeNode): String;
    function GetFileDir(Node: TTreeNode): String;
    procedure NewBranchExecute(Sender: TObject);
    procedure NewLeafExecute(Sender: TObject);
    procedure PlantRootExecute(Sender: TObject);
    procedure SaveNode(node:TTreeNode);
    procedure DeleteNodeExecute(Sender: TObject);
    function InputOK(Title: String; Text: String): Boolean;
    function ShellDelete(strFilename: string): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RenameNodeExecute(Sender: TObject);
    procedure loadConfig;
    procedure saveConfig;
    procedure KillRootExecute(Sender: TObject);
    procedure RefreshTreeExecute(Sender: TObject);
    procedure openLeaf(Node: TTreeNode);
    procedure treeChange(Sender: TObject; Node: TTreeNode);
    procedure editChange(Sender: TObject);
    procedure setOldLeafEdited(b: boolean);
    procedure Exit1Click(Sender: TObject);
    procedure RevertLeafExecute(Sender: TObject);
    procedure setEditActive(b: boolean);
    procedure ExpandAll1Click(Sender: TObject);
    procedure CollapseAll1Click(Sender: TObject);
    procedure addRecent(Node: TTreeNode);
    procedure listSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure listEnter(Sender: TObject);
    procedure gotoRecent;
    procedure treeCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure treeChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
    procedure SaveLeafExecute(Sender: TObject);
    function CurrText: TTextAttributes;
    procedure treeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure listKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editKeyPress(Sender: TObject; var Key: Char);
    procedure TrayIconClick(Sender: TObject);
    procedure zFileMinimizeExecute(Sender: TObject);
    procedure zTrayShowWindowExecute(Sender: TObject);
    procedure zExit(Sender: TObject);
    procedure TimestampExecute(Sender: TObject);
  private
    Roots: TStringList;
    Foldleafedited: boolean;
    Feditactive: boolean;
    property oldleafedited: boolean read Foldleafedited write setOldLeafEdited;
    property editactive: boolean read Feditactive write setEditActive;
  public
    // public crap
  end;

var
  Form1: TForm1;
  shfRecycleBinStruct: TSHFileOpStruct;

const
  silvaversion = 150;
  MAX_RECENT = 10;

implementation

{$R *.DFM}

function TForm1.CurrText: TTextAttributes;
begin
  if edit.SelLength > 0 then Result := edit.SelAttributes
  else Result := edit.DefAttributes;
end;

procedure TForm1.error(Text: String);
begin
  status.simpletext := TimeToStr(Now)+':[ERROR]> '+Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  imagelist1.overlay(6,0);
  fillChar( shfRecycleBinStruct, sizeOf( shfRecycleBinStruct ), 0 );
  Roots := TStringList.Create;
  loadConfig;
  miTrayIconMinimize.Enabled := false;
  windowstate := wsMaximized;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if oldleafedited then
    if inputOK('Save file','Save current edited leaf?') then
      SaveNode(tree.selected);
  saveConfig;
  Roots.free;
end;

function TForm1.AddRoot(aRoot: String; Alias: String; isNew: Boolean): TTreeNode;
begin
  if aRoot <> '' then
//  if isValidRoot(aRoot,Alias) then
  begin
    if isNew then
    begin
      Roots.Add(Alias+'='+aRoot);
    end;
    Result := tree.items.addChild(nil,Alias);
    if isValidRoot(aRoot,Alias) then
    begin
      Result.imageindex := 2;
      Result.selectedindex := 2;
      AddBranch(Result,aRoot);
//      Result.expanded := true;
    end
    else
      invalidateRoot(Result);
  end
  else
  begin
    Result := nil;
  end;
end;

function TForm1.AddBranch(Node: TTreeNode; Dir: String): TTreeNode;
var
  r : TSearchRec;
  oldcurrentdir : String;
begin
  result := nil;
  oldcurrentdir := getcurrentdir;
  if FindFirst(Dir+'\*',faAnyFile,r) = 0 then
  begin
    repeat
      if (r.attr and faDirectory) <> 0 then
        result := AddStem(Node,r.Name)
      else
        result := AddLeaf(Node,r.Name);
    until FindNext(r) <> 0;
    FindClose(r);
  end;
  setcurrentdir(oldcurrentdir);
end;

function TForm1.AddLeaf(Parent: TTreeNode; Name: String): TTreeNode;
begin
  result := nil;
  if isValidLeaf(Parent,Name) then
  begin
    result := tree.items.addchild(Parent,Name);
    result.imageindex := 5;
    result.selectedindex := 5;
  end;
end;

function TForm1.AddStem(Parent: TTreeNode; Name: String): TTreeNode;
begin
  result := nil;
  if isValidBranch(Parent,Name) then
  begin
    result := tree.items.addchild(Parent,Name);
    result.haschildren := true;
    result.imageindex := 4;
    result.selectedindex := 4;
  end;
end;

procedure TForm1.invalidateRoot(Node: TTreeNode);
begin
  Node.imageindex := 1;
  Node.selectedindex := 1;
end;

procedure TForm1.Prune(Node: TTreeNode);
begin
  Node.imageindex := 3;
  Node.selectedindex := 3;
  Node.haschildren := false;
end;

function TForm1.isValidRoot(Dir: String; Alias: String): Boolean;
begin
  // TODO : cant end in \..  \.  /..  /.
  if directoryexists(Dir) then
    result := true
  else
    result := false;
end;

function TForm1.isValidFile(Parent: TTreeNode; Name: String): Boolean;
begin
  if (pos(name,'/') <> 0) or (pos(name,'\') <> 0) then
  begin
    result := false;
    exit;
  end;
  if (Name = '.') or (Name = '..') then
    result := false
  else
    result := true;
end;

function TForm1.isValidNewFile(Parent: TTreeNode; Name: String): Boolean;
var path: String;
begin
  path := GetFilePath(Parent) + '\' + Name;
  result := isValidFile(Parent,Name) and not (fileexists(path) or directoryexists(path));
end;

function TForm1.isValidNode(Parent: TTreeNode; Name: String): Boolean;
begin
  result := isValidFile(Parent,Name);
end;

function TForm1.isValidBranch(Parent: TTreeNode; Name: String): Boolean;
begin
  result := isValidNode(Parent,Name);
end;

function TForm1.isValidLeaf(Parent: TTreeNode; Name: String): Boolean;
begin
  result := isValidNode(Parent,Name);
end;

function TForm1.isBranch(Node: TTreeNode): Boolean;
begin
  result := directoryExists(GetFilePath(Node));
end;

function TForm1.isLeaf(Node: TTreeNode): Boolean;
begin
  if Node = nil then begin
    result := false;
  end else begin
    result := fileExists(GetFilePath(Node));
  end;
end;

procedure TForm1.treeExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
var
  validNodeCount,i: Integer;
begin

  if Node.HasChildren and (Node.Count = 0) then
    AddBranch(Node,GetFilePath(Node));

  validNodeCount := 0;
  i := 0;
  while (i < Node.Count) do begin
    if (isValidNode(Node,Node.Item[i].Text)) then begin
      inc(validNodeCount);
    end;
    inc(i);
  end;

  if (validNodeCount = 0) then
    prune(node);

end;

function TForm1.GetRootDir(Node: TTreeNode): String;
begin
  while node <> nil do
  begin
    if node.level = 0 then
      result := Roots.values[node.text];
    node := node.parent;
  end;
end;

function TForm1.GetRootName(Node: TTreeNode): String;
begin
  while node <> nil do
  begin
    if node.level = 0 then
      result := node.text;
    node := node.parent;
  end;
end;

function TForm1.GetTreePath(Node: TTreeNode): String;
begin
  while node.level <> 0 do
  begin
    Result := '\' + Node.Text + Result;
    Node := Node.Parent;
  end;
end;

function TForm1.GetTreePathFull(Node: TTreeNode): String;
begin
  if Node <> nil then begin
    result := getrootname(node)+gettreepath(node);
  end else begin
    error('Nil Node (GetTreePathFull)');
  end;
end;

function TForm1.GetFilePath(Node: TTreeNode): String;
begin
  if Node <> nil then begin
    result := GetRootDir(Node) + GetTreePath(Node);
  end else begin
    error('Nil Node (GetFilePath)');
  end;
end;

function TForm1.GetFileExt(Node: TTreeNode): String;
var i,x: integer;
begin
  if Node.level = 0 then
    exit;
  result := Node.text;
  x := 0;
  i := length(result);
  while i > 0 do
  begin
    if result[i] = '.' then
    begin
      x := i;
      break;
    end;
    dec(i);
  end;
  result := copy(result,x+1,length(result)-x);
  if x = 0 then
    result := '';
end;

function TForm1.GetFileDir(Node: TTreeNode): String;
var
  i,x: integer;
begin
  // root node
  if Node.level = 0 then
  begin
    result := GetRootDir(Node);
    x := 0;
    i := length(result);
    while i > 3 do // dont count first three chars, the third is a slash, eg C:\
    begin
      if result[i] = '\' then
      begin
        x := i;
        break;
      end;
      dec(i);
    end;
    result := copy(result,1,x-1);
  end
  // other node
  else
  begin
    result := GetTreePath(Node);
    x := 0;
    i := length(result);
    while i > 1 do // dont count first char, its always a slash
    begin
      if result[i] = '\' then
      begin
        x := i;
        break;
      end;
      dec(i);
    end;
    result := GetRootDir(Node) + copy(result,1,x-1); // x-1, don't include the slash itself
  end;
end;

procedure TForm1.NewBranchExecute(Sender: TObject);
var
  name,path: String;
  parent: TTreeNode;
begin
  if tree.selected = nil then
    Exit;
  if isLeaf(tree.selected) then
    parent := tree.selected.parent
  else if isBranch(tree.selected) then
    parent := tree.selected
  else
  begin
    error('New Branch: Invalid Parent');
    exit;
  end;

  if InputQuery('New Branch','Name',name) then
  begin
    path := GetFilePath(parent)+'\'+name;
    if isValidNewFile(parent,name) then
    begin
      if CreateDir(path) then
      begin
        tree.selected := AddStem(parent,name);
        tree.selected.expanded := true;
      end
      else
        error('New Branch: Error Creating Directory');
    end
    else
      error('New Branch: Invalid Directory');
  end;

end;

procedure TForm1.NewLeafExecute(Sender: TObject);
var
  name,path: String;
  parent: TTreeNode;
  f: TextFile;
begin
  if tree.selected = nil then
    Exit;
  if isLeaf(tree.selected) then
    parent := tree.selected.parent
  else if isBranch(tree.selected) then
    parent := tree.selected
  else
  begin
    error('New Leaf: Invalid Parent');
    exit;
  end;

  if InputQuery('New Leaf','Name',name) then
  begin
    path := GetFilePath(parent)+'\'+name;
    if isValidNewFile(parent,name) then
    begin
      try
        AssignFile(f,path);
        Rewrite(f);
        Writeln(f,'Empty Leaf');
        CloseFile(f);
        tree.selected := AddLeaf(parent,name);
      except on E: Exception do
        error('New Leaf: Exception> '+path);
      end;
    end
    else
      error('New Leaf: Invalid File> '+path);
  end;

end;

procedure TForm1.PlantRootExecute(Sender: TObject);
var
  Dir: String;
  oldcurrentdir: String;
begin
  Dir := GetRootDir(tree.selected);
  if not isvalidroot(Dir,tree.selected.text) then
    Dir := ''; // set to null for invalid roots so the selectDirectory dialog doesnt error when it tries to find an invalid root
  oldcurrentdir := getcurrentdir;
  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],1000) then
  begin
    tree.selected := AddRoot(Dir,InputBox('Select a name for this tree...','Plant Root',''),true);
  end;
  setcurrentdir(oldcurrentdir);
end;

procedure TForm1.DeleteNodeExecute(Sender: TObject);
var
  filename: String;
  parent: TTreeNode;
begin
  if tree.selected = nil then
    Exit;
  if inputOK('Delete Node','Are you sure you wish to delete this node?') then
  begin
    filename := getfilepath(tree.selected);
    if ShellDelete(filename) then // Shell
    begin
      if tree.selected.level = 0 then
        invalidateRoot(tree.selected)
      else
      begin
        parent := tree.selected.parent;
        tree.Items.Delete(tree.selected);
        tree.selected := parent;
      end;
    end
    else
    begin
      error('DeleteNode:Failed:'+filename+':'+tree.selected.text);
    end;
  end;
end;

procedure TForm1.RenameNodeExecute(Sender: TObject);
var
  filename,newname,newpath: String; // Shell : newpath
begin
  if tree.selected = nil then
    Exit;
  newname := tree.selected.text;
  if inputQuery('Rename Node','What would you like to rename this node to?',newname) then
  begin
    filename := getfilepath(tree.selected);
    newpath := GetFileDir(tree.selected) + '\' + newname;
    if RenameFile(filename,newpath) then
    begin
      // root
      if tree.selected.level = 0 then
      begin
        roots[roots.indexofname(tree.selected.text)] := newname+'='+newpath;
      end;
      tree.selected.text := newname;
    end
    else
    begin
      error('RenameNode:Failed:'+filename+':'+newname);
    end;
  end;
end;

function TForm1.ShellDelete(strFilename: string): Boolean;
var
//  shfRecycleBinStruct: TSHFileOpStruct;
  intresult: Integer;
begin
//  fillChar( shfRecycleBinStruct, sizeOf( shfRecycleBinStruct ), 0 );

  with shfRecycleBinStruct do begin
    wFunc := FO_DELETE;
    pFrom := PChar(strFilename+#0);
    fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
  end;

  intresult := ShFileOperation(shfRecycleBinStruct);
  result := 0 = intresult;
end;

function TForm1.InputOK(Title: String; Text: String): Boolean;
begin
  result := IDYES = messageBox(handle, PChar(Text), PChar(Title), MB_YESNO or MB_ICONQUESTION);
end;

//==============================================================================
procedure TForm1.loadConfig;
var
  i: integer;
  filename: string;
begin
  filename := getcurrentdir+'\Silva.ini';

  if fileexists(filename) then
    roots.loadfromfile(filename);

  for i := 0 to Roots.Count - 1 do
    AddRoot(roots.values[roots.names[i]],roots.names[i],false);
end;

procedure TForm1.saveConfig;
var
  filename : string;
begin
  filename := getcurrentdir+'\Silva.ini';
  roots.savetofile(filename);
end;

procedure TForm1.KillRootExecute(Sender: TObject);
begin
  if tree.selected.level <> 0 then
  begin
    exit;
  end;
{  if isValidRoot(getfilepath(tree.selected),tree.selected.text) then
  begin
    error('KillRoot:Valid roots can not be killed');
    exit;
  end;}
  roots.delete(roots.indexofname(tree.selected.text));
  tree.items.delete(tree.selected);
end;

procedure TForm1.RefreshTreeExecute(Sender: TObject);
var Node: TTreeNode;
begin
  if isBranch(tree.selected) then
    node := tree.selected
  else
    node := tree.selected.parent;

  node.deletechildren;
  node.haschildren := true;
  node.expanded := true;
  tree.selected := node;
end;

procedure TForm1.treeChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
  AllowChange := true;
  SaveNode(tree.selected);
end;

procedure TForm1.treeChange(Sender: TObject; Node: TTreeNode);
begin
  form1.caption := 'Silva - ['+getrootname(tree.selected)+gettreepath(tree.selected)+']';
  editActive := false;
  openleaf(node);
end;

procedure TForm1.SaveNode( node:TTreeNode );
var
  filename:string;
begin
  if not oldleafedited then exit;

  if isLeaf(node) then begin
    filename := getfilepath(node);
    edit.lines.savetofile(filename);
    oldleafedited := false;
    addRecent(node);
  end;
end;

procedure TForm1.openleaf(Node: TTreeNode);
var
  ext: String;
  doLoad: boolean;
begin

  if not isLeaf(node) then
    exit;

  doLoad := false;

  ext := getfileext(node);
  if (ext = 'txt') or (ext = '') then begin
    doLoad := true;
  end else if (ext = 'rtf') then begin
    doLoad := true;
  end;

  if doLoad then
  begin
    edit.lines.loadfromfile(getfilepath(node));
    oldleafedited := false;
    editActive := true;
  end;
end;

procedure TForm1.editChange(Sender: TObject);
begin
  oldleafedited := true;
end;

procedure TForm1.setOldLeafEdited(b: boolean);
begin
  if tree.selected = nil then exit;
  Foldleafedited := b;
  if b then
    tree.selected.overlayindex := 0
  else
    tree.selected.overlayindex := -1;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  zExit(Sender);
end;

procedure TForm1.RevertLeafExecute(Sender: TObject);
begin
  if not inputOK('Revert Leaf','Are you sure you wish to discard all changes to this leaf?') then
    exit;
  oldleafedited := false;
  openleaf(tree.selected);
end;

procedure TForm1.setEditActive(b: boolean);
begin
  Feditactive := b;
  if b then begin
    edit.readonly := false;
  end else begin
    edit.lines.clear; // do NOT put this before saveleaf dummy
    edit.readonly := true;
    oldleafedited := false;
  end;
end;

procedure TForm1.ExpandAll1Click(Sender: TObject);
begin
  tree.fullexpand;
end;

procedure TForm1.CollapseAll1Click(Sender: TObject);
begin
  tree.fullcollapse;
end;

procedure TForm1.addRecent(Node: TTreeNode);
var
  li: TListItem;
  i: integer;
  treepathfull: String;
begin
  treepathfull := gettreepathfull(node);

  // if this exists in list, dont add it
  for i := 0 to list.items.count-1 do
    if list.items[i].subitems[0] = treepathfull then
      exit;

  // add leaf to recent list
  li := list.items.insert(0);
  li.caption := node.text;
  li.subitems.add(treepathfull);

  // only keep so many recents
  if list.items.count > MAX_RECENT then
    list.items.delete(MAX_RECENT);

end;

procedure TForm1.gotoRecent;
var i: integer;
begin
  // if none selected, dont do anything.
  if list.selected = nil then exit;

  //loop over items and find matching treepathfull, then select that one.
  for i := 0 to tree.items.count-1 do
  begin
    if gettreepathfull(tree.items.item[i]) = list.selected.subitems[0] then
      tree.selected := tree.items.item[i];
  end;
end;

procedure TForm1.listSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  gotoRecent;
end;

procedure TForm1.listEnter(Sender: TObject);
begin
  gotoRecent;
end;

procedure TForm1.treeCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin

  with tree.Canvas do begin

    // background
    if isBranch(node) then
    begin
      font.style := [fsBold];
//      font.color := $00444444;
    end;

    if node.level = 0 then
    begin
      font.style := [fsBold];
//      font.color := clBlack
    end;

    if node.selected then
    begin
//      brush.color := clWindow;
//      font.color := $002118CE;
    end;

  end;

end;

procedure TForm1.SaveLeafExecute(Sender: TObject);
begin
  SaveNode(tree.selected);
end;

procedure TForm1.treeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift=[ssCtrl]) and (Key=VK_TAB) then begin
    if not edit.readonly and edit.visible then begin
      Key := 0;
      edit.setfocus;
    end;
  end;
end;

procedure TForm1.editKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift=[ssCtrl]) and (Key=VK_TAB) then begin
    Key := 0;
    tree.setfocus();
  end;

  if (Shift=[ssCtrl]) and (Key=Ord('B')) then begin
    Key := 0;
    if fsBold in edit.SelAttributes.Style then begin
      CurrText.Style := CurrText.Style - [fsBold];
    end else begin
      CurrText.Style := CurrText.Style + [fsBold];
    end;
  end;

  if (Shift=[ssCtrl]) and (Key=Ord('I')) then begin
    Key := 0;
    if fsItalic in edit.SelAttributes.Style then begin
      CurrText.Style := CurrText.Style - [fsItalic];
    end else begin
      CurrText.Style := CurrText.Style + [fsItalic];
    end;
  end else if Key = VK_TAB then edit.SelText := #9;

  if (Shift=[ssCtrl]) and (Key=Ord('U')) then begin
    Key := 0;
    if fsUnderline in edit.SelAttributes.Style then begin
      CurrText.Style := CurrText.Style - [fsUnderline];
    end else begin
      CurrText.Style := CurrText.Style + [fsUnderline];
    end;
  end;
end;

procedure TForm1.listKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift=[ssCtrl]) and (Key=VK_TAB) then begin
    if not edit.readonly and edit.visible then begin
      Key := 0;
      edit.setfocus;
    end;
  end;
end;

procedure TForm1.editKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^I then Key := #0;
end;

procedure TForm1.TrayIconClick(Sender: TObject);
begin
  if Form1.Showing then
    zFileMinimizeExecute(self)
  else
    zTrayShowWindowExecute(self);
end;

procedure TForm1.zFileMinimizeExecute(Sender: TObject);
begin
  miTrayIconShowWindow.Enabled := true;
  miTrayIconMinimize.Enabled := false;
  TrayIcon.HideMainForm;
end;

procedure TForm1.zTrayShowWindowExecute(Sender: TObject);
begin
  miTrayIconShowWindow.Enabled := false;
  miTrayIconMinimize.Enabled := true;
  TrayIcon.ShowMainForm;
end;

procedure TForm1.zExit(Sender: TObject);
begin
  close();
end;

procedure TForm1.TimestampExecute(Sender: TObject);
var
  timestamp : string;
begin
  if not edit.readonly and edit.visible then begin
    edit.setfocus();
    edit.SelStart;
    // format to match metapad?
    // 5:03 PM 1/11/2005
    DateTimeToString(timestamp,'h:nn AM/PM m/d/yyyy',Now());
    edit.SelText := timestamp;
  end;
end;

end.
