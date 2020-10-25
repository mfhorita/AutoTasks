VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmTasks 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "AutoTasks (Agenda de Tarefas)"
   ClientHeight    =   2085
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7890
   ControlBox      =   0   'False
   Icon            =   "AutoTasks.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2085
   ScaleWidth      =   7890
   Begin VB.CommandButton cboMinimizar 
      Cancel          =   -1  'True
      Caption         =   "&Minimizar"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   6
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5520
      TabIndex        =   1
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton cmdFechar 
      Caption         =   "&Fechar"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   6
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6705
      TabIndex        =   14
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Frame fraTasks 
      Height          =   1395
      Left            =   30
      TabIndex        =   11
      Top             =   45
      Width           =   7815
      Begin VB.ComboBox cboDiasExecucao 
         Height          =   315
         Left            =   3045
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   930
         Width           =   1695
      End
      Begin VB.CheckBox chkDesabilitarTarefa 
         Height          =   195
         Left            =   120
         TabIndex        =   16
         Tag             =   "Opção de horário para uma segunda execução."
         Top             =   1080
         Width           =   225
      End
      Begin VB.ComboBox cboItem 
         Height          =   315
         Left            =   6240
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   465
         Width           =   615
      End
      Begin VB.CheckBox chkMinimizar 
         Height          =   195
         Left            =   120
         TabIndex        =   15
         Tag             =   "Opção de horário para uma segunda execução."
         Top             =   840
         Width           =   225
      End
      Begin VB.CommandButton cmdRemover 
         Caption         =   "-"
         Enabled         =   0   'False
         Height          =   300
         Left            =   7320
         TabIndex        =   5
         Top             =   480
         Width           =   375
      End
      Begin VB.CommandButton cmdAdicionar 
         Caption         =   "+"
         Height          =   300
         Left            =   6900
         TabIndex        =   4
         Top             =   480
         Width           =   375
      End
      Begin MSMask.MaskEdBox mskHorario 
         Height          =   300
         Left            =   5520
         TabIndex        =   9
         Top             =   930
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   529
         _Version        =   393216
         ClipMode        =   1
         MaxLength       =   5
         Mask            =   "##:##"
         PromptChar      =   "_"
      End
      Begin VB.CommandButton cmdTestar 
         Caption         =   "&Executar"
         BeginProperty Font 
            Name            =   "Terminal"
            Size            =   6
            Charset         =   255
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   6375
         TabIndex        =   10
         Top             =   885
         Width           =   1335
      End
      Begin VB.TextBox txtPrograma 
         Height          =   285
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   6015
      End
      Begin VB.Label lblDiasExecucao 
         AutoSize        =   -1  'True
         Caption         =   "Dias:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   2505
         TabIndex        =   19
         Top             =   1005
         Width           =   450
      End
      Begin VB.Label lblDesabilitarTarefa 
         AutoSize        =   -1  'True
         Caption         =   "Tarefa desativada"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   360
         TabIndex        =   7
         Top             =   1065
         Width           =   1560
      End
      Begin VB.Label lblMinimizarTelas 
         AutoSize        =   -1  'True
         Caption         =   "Minimizar telas"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   360
         TabIndex        =   6
         Top             =   825
         Width           =   1260
      End
      Begin VB.Label lblExecucao 
         AutoSize        =   -1  'True
         Caption         =   "Hora:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   4980
         TabIndex        =   13
         Top             =   975
         Width           =   480
      End
      Begin VB.Label lblPrograma 
         AutoSize        =   -1  'True
         Caption         =   "Executar:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   180
         TabIndex        =   12
         Top             =   255
         Width           =   825
      End
   End
   Begin VB.CommandButton cmdAplicar 
      Caption         =   "&Aplicar"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   6
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4320
      TabIndex        =   0
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Timer TimerIcon 
      Left            =   1080
      Top             =   2520
   End
   Begin VB.Label lblVersao 
      AutoSize        =   -1  'True
      Caption         =   "AutoTasks - Versão: 1.0.0"
      ForeColor       =   &H00000040&
      Height          =   195
      Left            =   120
      TabIndex        =   18
      Top             =   1800
      Width           =   1845
   End
   Begin VB.Label lblDesenvolvidoPor 
      AutoSize        =   -1  'True
      Caption         =   "Desenvolvido por Marcelo F. Delgado Horita"
      ForeColor       =   &H00000040&
      Height          =   195
      Left            =   120
      TabIndex        =   17
      Top             =   1560
      Width           =   3150
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   360
      Top             =   2520
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   21
      ImageHeight     =   21
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   10
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":000C
            Key             =   ""
            Object.Tag             =   "Vazio"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":019A
            Key             =   ""
            Object.Tag             =   "Chegou"
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":0334
            Key             =   ""
            Object.Tag             =   "Olho"
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":064E
            Key             =   ""
            Object.Tag             =   "CartaP"
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":0968
            Key             =   ""
            Object.Tag             =   "CartaM"
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":0C82
            Key             =   ""
            Object.Tag             =   "CartaG"
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":0F9C
            Key             =   ""
            Object.Tag             =   "ON"
         EndProperty
         BeginProperty ListImage8 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":14CA
            Key             =   ""
            Object.Tag             =   "OFF"
         EndProperty
         BeginProperty ListImage9 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":1A6C
            Key             =   ""
            Object.Tag             =   "AUT"
         EndProperty
         BeginProperty ListImage10 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "AutoTasks.frx":200E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTasks 
      Caption         =   "Tasks"
      Visible         =   0   'False
      Begin VB.Menu mnuAbrir 
         Caption         =   "Abrir AutoTasks"
      End
      Begin VB.Menu mnuRestaurar 
         Caption         =   "Restaurar Telas"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFechar 
         Caption         =   "Fechar AutoTasks"
      End
   End
End
Attribute VB_Name = "frmTasks"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

    'Declarações de API para Ler e Gravar em um arquivo TXT
    Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nsize As Long, ByVal lpFileName As String) As Long
    Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
    
    'Declarações de API para configurar ícone no Systray
    Private Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
    
    Private Type NOTIFYICONDATA
        cbSize As Long
        hwnd As Long
        uId As Long
        uFlags As Long
        uCallBackMessage As Long
        hIcon As Long
        szTip As String * 64
    End Type
    
    Const NIM_ADD = &H0
    Const NIM_MODIFY = &H1
    Const NIM_DELETE = &H2
    Const WM_MOUSEMOVE = &H200
    Const NIF_MESSAGE = &H1
    Const NIF_ICON = &H2
    Const NIF_TIP = &H4
    Const WM_LBUTTONDOWN = &H201
    Private NID As NOTIFYICONDATA
    
    'Declarações de API para enviar comando de teclas para o windows (SendKey)
    Private Declare Function SendInput Lib "user32.dll" (ByVal nInputs As Long, pInputs As GENERALINPUT, ByVal cbSize As Long) As Long
    Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)

    Private Const KEYEVENTF_KEYUP = &H2
    Private Const INPUT_KEYBOARD = 1
    
    Private Type KEYBDINPUT
    wVk As Integer
    wScan As Integer
    dwFlags As Long
    time As Long
    dwExtraInfo As Long
    End Type
    
    Private Type GENERALINPUT
    dwType As Long
    xi(0 To 23) As Byte
    End Type

Private Sub CarregaDiasDeExecucao()

    cboDiasExecucao.Clear

    cboDiasExecucao.AddItem "<Todos>"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 0
    
    cboDiasExecucao.AddItem "Domingo"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 1
    
    cboDiasExecucao.AddItem "Segunda-feira"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 2
    
    cboDiasExecucao.AddItem "Terça-feira"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 3
    
    cboDiasExecucao.AddItem "Quarta-feira"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 4
    
    cboDiasExecucao.AddItem "Quinta-feira"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 5
    
    cboDiasExecucao.AddItem "Sexta-feira"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 6

    cboDiasExecucao.AddItem "Sábado"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 7

    cboDiasExecucao.AddItem "Segunda-Sexta"
    cboDiasExecucao.ItemData(cboDiasExecucao.NewIndex) = 8
    
End Sub

Private Sub cboItem_Change()
    Call cboItem_Click
End Sub

Private Sub cboItem_Click()
    If cboItem.ListIndex <> -1 Then
        Call LeParametros(cboItem.List(cboItem.ListIndex))
    End If
End Sub

Private Sub cboMinimizar_Click()
    Me.WindowState = vbMinimized
End Sub

Private Sub cmdAplicar_Click()

    'Gravar no Arquivo CFG (Config)
    Call WriteIniFile("Programa" & Format(cboItem.ItemData(cboItem.ListIndex), "00"), "Executar", txtPrograma.Text, App.Path & "\AutoTasks.cfg")
    Call WriteIniFile("Programa" & Format(cboItem.ItemData(cboItem.ListIndex), "00"), "Horario", mskHorario.Text, App.Path & "\AutoTasks.cfg")
    Call WriteIniFile("Programa" & Format(cboItem.ItemData(cboItem.ListIndex), "00"), "MinimizarTelas", chkMinimizar.Value, App.Path & "\AutoTasks.cfg")
    Call WriteIniFile("Programa" & Format(cboItem.ItemData(cboItem.ListIndex), "00"), "DesabilitarTarefa", chkDesabilitarTarefa.Value, App.Path & "\AutoTasks.cfg")
    Call WriteIniFile("Programa" & Format(cboItem.ItemData(cboItem.ListIndex), "00"), "DiasExecucao", cboDiasExecucao.ItemData(cboDiasExecucao.ListIndex), App.Path & "\AutoTasks.cfg")
    
    'Desabilita\Habilita remover programas
    Call ControleDeAdicionarOuRemoverItens
    
    'Confirmação do salvamento
    MsgBox "Salvo com sucesso!", vbInformation + vbOKOnly
    
    cboItem.Enabled = True
    cmdRemover.Enabled = True
    cmdAdicionar.Enabled = True
    cmdFechar.Caption = "&Fechar"
    
End Sub

Private Sub cmdAdicionar_Click()

    Dim i As Integer

On Error GoTo errAdicionarTasks
    
    If cboItem.ListIndex <> -1 Then
        
        For i = 1 To 20
            If LerIni("Executar", "Programa" & Format(i, "00")) = vbNullString Then
                cboItem.AddItem Format(i, "00")
                cboItem.ItemData(cboItem.NewIndex) = i
                cboItem.ListIndex = (i - 1)
                Exit For
            End If
        Next i
            
        'Desabilita\Habilita remover programas
        Call ControleDeAdicionarOuRemoverItens
        
        cboItem.Enabled = False
        cmdRemover.Enabled = False
        cmdAdicionar.Enabled = False
        cmdFechar.Caption = "&Cancelar"
                
    End If
    
    Exit Sub
    
errAdicionarTasks:

    Beep
    Screen.MousePointer = vbDefault
    MsgBox Error, vbExclamation + vbOKOnly
    Exit Sub
    Resume
    
End Sub

Private Sub cmdFechar_Click()

    Dim i As Integer
    
On Error GoTo errFecharTasks

    If cmdFechar.Caption = "&Cancelar" Then
    
        If MsgBox("Deseja cancelar as alterações?", vbQuestion + vbYesNo) = vbYes Then
            
            If cboItem.ListIndex <> -1 Then
                
                cboItem.Clear
                
                For i = 1 To 20
                    If LerIni("Executar", "Programa" & Format(i, "00")) <> vbNullString Then
                        cboItem.AddItem Format(i, "00")
                        cboItem.ItemData(cboItem.NewIndex) = i
                    End If
                Next i
                
                cboItem.ListIndex = cboItem.ListCount - 1
                
                cboItem.Enabled = True
                cmdRemover.Enabled = True
                cmdAdicionar.Enabled = True
                cmdFechar.Caption = "&Fechar"
            
            End If
        
        End If
        
    Else
        If MsgBox("Confirma fechar o AutoTasks?", vbQuestion + vbYesNo) = vbYes Then
            Unload Me
        End If
    End If
    
    Exit Sub
    
errFecharTasks:

    Beep
    Screen.MousePointer = vbDefault
    MsgBox Error, vbExclamation + vbOKOnly
    Exit Sub
    Resume
    
End Sub

Private Sub cmdRemover_Click()

    Dim i As Integer

On Error GoTo errRemoverItem

    If cboItem.ListIndex <> -1 Then
    
        If MsgBox("Confirma a remoção do programa de número " & cboItem.List(cboItem.ListIndex) & " ?", vbQuestion + vbYesNo) = vbYes Then
        
            i = cboItem.List(cboItem.ListIndex)
        
            'Remove o item selecionado
            cboItem.RemoveItem cboItem.ListIndex
            cboItem.ListIndex = cboItem.ListCount - 1
            
            'Gravar no Arquivo CFG (Config)
            Call WriteIniFile("Programa" & Format(i, "00"), "Executar", vbNullString, App.Path & "\AutoTasks.cfg")
            Call WriteIniFile("Programa" & Format(i, "00"), "Horario", vbNullString, App.Path & "\AutoTasks.cfg")
            Call WriteIniFile("Programa" & Format(i, "00"), "MinimizarTelas", vbNullString, App.Path & "\AutoTasks.cfg")
            Call WriteIniFile("Programa" & Format(i, "00"), "DesabilitarTarefa", vbNullString, App.Path & "\AutoTasks.cfg")
            Call WriteIniFile("Programa" & Format(i, "00"), "DiasExecucao", vbNullString, App.Path & "\AutoTasks.cfg")
            
            'Desabilita\Habilita remover programas
            Call ControleDeAdicionarOuRemoverItens
            
        End If
    
    End If
    
    Exit Sub
    
errRemoverItem:

    Beep
    Screen.MousePointer = vbDefault
    MsgBox Error, vbExclamation + vbOKOnly
    Exit Sub
    Resume
    
End Sub

Private Sub cmdTestar_Click()

On Error GoTo errTestarPrograma
    If txtPrograma.Text <> vbNullString Then
        Call ExecucaoDoPrograma(txtPrograma.Text, chkMinimizar.Value)
    End If
    
    Exit Sub
    
errTestarPrograma:

    Beep
    Screen.MousePointer = vbDefault
    If Err.Number = 53 Then
        MsgBox "Arquivo inválido.", vbCritical + vbOKOnly
    Else
        MsgBox Error, vbExclamation + vbOKOnly
    End If
    Exit Sub
    Resume

End Sub

Private Sub Form_Load()

    Dim i As Integer

On Error GoTo errAutoTasks

    'Verifica se a instância já está aberta
    If App.PrevInstance = True Then
        Me.WindowState = vbNormal
        Me.Show: End 'Finaliza a instância
    End If
    
    'Carrega combo de Dias
    Call CarregaDiasDeExecucao
    
    For i = 1 To 20
        If LerIni("Executar", "Programa" & Format(i, "00")) <> vbNullString Then
            cboItem.AddItem Format(i, "00")
            cboItem.ItemData(cboItem.NewIndex) = i
        End If
    Next i
    
    cboItem.ListIndex = 0
    Call LeParametros(cboItem.List(cboItem.ListIndex))
    
    'Configura Agenda
    Call ConfiguraAgenda
    
    'Desabilita\Habilita remover programas
    Call ControleDeAdicionarOuRemoverItens
    
    'Apresentação do programa
    Me.lblVersao.Caption = "AutoTasks - Versão " & App.Major & "." & App.Minor & "." & Format$(App.Revision, "00")
    
    'Minimiza o AutoTasks
    Me.WindowState = vbMinimized
    
    Exit Sub
    
errAutoTasks:

    Beep
    Screen.MousePointer = vbDefault
    MsgBox Error, vbExclamation + vbOKOnly
    Exit Sub
    Resume
    
End Sub

Private Sub Form_Resize()
    If Me.WindowState = vbMinimized Then Me.Hide
End Sub

Public Sub Form_Activate()
    If Me.WindowState <> vbMinimized Then
        Me.Top = (Screen.Height - Me.Height) / 2
        Me.Left = (Screen.Width - Me.Width) / 2
    End If
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

On Error Resume Next
    If X / Screen.TwipsPerPixelX = &H201 Then
        Me.WindowState = vbNormal
        Me.Show
    End If
    
    'Botão Direito
    If Button = 2 Then PopupMenu mnuTasks

End Sub

Private Sub mnuAbrir_Click()
    Me.WindowState = vbNormal
    Me.Show
End Sub

Private Sub mnuFechar_Click()
    Unload Me
End Sub

Private Sub mnuRestaurar_Click()
    
    'Tecla do Windows
    Call SendKeysA(vbKeyShift, True)
    Call SendKeysA(91, True)
    Call SendKeysA(vbKeyM, True)
    DoEvents
    
    'Desliga a tecla Windows
    Call SendKeysA(vbKeyShift, False)
    Call SendKeysA(91, False)
    DoEvents
    
    mnuRestaurar.Visible = False
    
End Sub

Private Sub TimerIcon_Timer()

    Dim i As Integer
    Dim iPosition As Integer

On Error GoTo errTimer

    'Guarda a posição selecionada
    iPosition = cboItem.ListIndex
    
    'Verifica o momento para
    ' executar o programa agendado
    For i = 1 To cboItem.ListCount
        
        cboItem.ListIndex = i - 1
    
        If chkDesabilitarTarefa.Value = 0 Then
            If txtPrograma.Text <> vbNullString And mskHorario.Text <> vbNullString Then
                If Hour(time) = Val(Left(mskHorario.Text, 2)) And Minute(time) = Val(Right(mskHorario.Text, 2)) Then
                    Call ExecucaoDoPrograma(txtPrograma.Text, chkMinimizar.Value)
                End If
            End If
        End If
        
    Next i
    
    'Volta a posição selecionada
    cboItem.ListIndex = iPosition
    
    Exit Sub

errTimer:

    Beep
    Screen.MousePointer = vbDefault
    If Err.Number = 53 Then
        MsgBox "Arquivo inválido.", vbCritical + vbOKOnly
    ElseIf Err.Number = 76 Then
        'Ignora o erro
    Else
        MsgBox Error, vbExclamation + vbOKOnly
    End If
    Exit Sub
    Resume

End Sub

Sub ConfiguraAgenda()
    
    'Icones Animados
    Me.TimerIcon.Interval = 60000 'referente a 60 segundos
    Me.TimerIcon = True
    
    'Adiciona o ícone
    frmTasks.Icon = Me.ImageList1.ListImages(6).Picture
    Call IconAdiciona(Me.Caption, frmTasks)
    DoEvents
    
End Sub

Sub IconAdiciona(sTitulo As String, objForm As Object)
    NID.cbSize = Len(NID)
    NID.hwnd = objForm.hwnd
    NID.uId = vbNull
    NID.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
    NID.uCallBackMessage = WM_MOUSEMOVE
    NID.hIcon = objForm.Icon
    NID.szTip = sTitulo & vbNullChar
    Shell_NotifyIcon NIM_ADD, NID
End Sub

Function LerIni(sParametro As String, sAppName As String) As String

    Dim sReturnString As String
    Dim nSizeBuffer As Long
    Dim nSizeRet As Long
    Dim sFileName As String
   
On Error GoTo errLerArquivoINI

    sReturnString = Space$(128)
    nSizeBuffer = Len(sReturnString)
        
    sFileName = App.Path & "\AutoTasks.cfg"
    
    If Dir$(sFileName) = "" Then
       nSizeRet = WritePrivateProfileString(sAppName, sParametro, "", sFileName)
    End If
    
    On Error GoTo errLerArquivoINI
    
    nSizeRet = GetPrivateProfileString(sAppName, sParametro, "", sReturnString, nSizeBuffer, sFileName)
    On Error Resume Next
    
    LerIni = Trim$(Left$(sReturnString, nSizeRet))
    Exit Function

errLerArquivoINI:

    Beep
    Screen.MousePointer = vbDefault
    MsgBox Error, vbExclamation + vbOKOnly
    Exit Function
    Resume

End Function

Sub WriteIniFile(sTitle As String, sItem As String, sRes As String, sFileName As String)
    Call WritePrivateProfileString(sTitle, sItem, sRes, sFileName)
End Sub

Public Function SendKeysA(ByVal vKey As Integer, Optional booDown As Boolean = False)

    Dim GInput(0) As GENERALINPUT
    Dim KInput As KEYBDINPUT
    
    KInput.wVk = vKey
    If Not booDown Then
        KInput.dwFlags = KEYEVENTF_KEYUP
    End If
    
    GInput(0).dwType = INPUT_KEYBOARD
    CopyMemory GInput(0).xi(0), KInput, Len(KInput)
    Call SendInput(1, GInput(0), Len(GInput(0)))

End Function

Sub ExecucaoDoPrograma(sPrograma As String, bMinimizarTelas As Boolean)

    Dim iDiaCombo As Integer
    iDiaCombo = cboDiasExecucao.ItemData(cboDiasExecucao.ListIndex)
    
    Dim iDiaAtual As Integer
    iDiaAtual = DatePart("w", Date)

    If (iDiaAtual = iDiaCombo Or iDiaCombo = 0) Or (iDiaCombo = 8 And iDiaAtual >= 2 And iDiaAtual <= 6) Then
    
        'Minimizar Telas
        If bMinimizarTelas = True Then
        
            'Tecla do Windows
            Call SendKeysA(91, True)
            Call SendKeysA(vbKeyM, True)
            DoEvents
            
            'Desliga a tecla Windows
            Call SendKeysA(91, False)
            
        End If
        
        'Executar Programa
        Call Shell(sPrograma, vbMaximizedFocus)
        
        'Restaurar Telas
        If bMinimizarTelas = True Then
            mnuRestaurar.Visible = True
        End If
        
    End If
        
End Sub

Sub LeParametros(ByVal iItem As Integer)

    txtPrograma.Text = LerIni("Executar", "Programa" & Format(iItem, "00"))
    
    If LerIni("Horario", "Programa" & Format(iItem, "00")) = vbNullString Then
        mskHorario.Text = "00:00"
    Else
        mskHorario.Text = LerIni("Horario", "Programa" & Format(iItem, "00"))
    End If

    chkMinimizar.Value = Val(LerIni("MinimizarTelas", "Programa" & Format(iItem, "00")))
    chkDesabilitarTarefa.Value = Val(LerIni("DesabilitarTarefa", "Programa" & Format(iItem, "00")))
    cboDiasExecucao.ListIndex = SetaCombo(Val(LerIni("DiasExecucao", "Programa" & Format(iItem, "00"))), cboDiasExecucao)

End Sub

Sub ControleDeAdicionarOuRemoverItens()
    
    'Desabilita\Habilita remover programas
    If cboItem.ListCount = 1 Then
        cmdRemover.Enabled = False
    Else
        cmdRemover.Enabled = True
    End If
    
    'Desabilita\Habilita adicionar programas
    If cboItem.ListCount = 20 Then
        cmdAdicionar.Enabled = False
    Else
        cmdAdicionar.Enabled = True
    End If

End Sub

Private Function SetaCombo(ByVal iItem As Integer, ByRef objComboBox As ComboBox) As Integer

    Dim i As Integer
    
    For i = 0 To objComboBox.ListCount - 1
        If objComboBox.ItemData(i) = iItem Then
            SetaCombo = i: Exit For
        End If
    Next i

End Function
