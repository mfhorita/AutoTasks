import os

try:

    from wx.lib import masked
    import wx  # wxPython
    import wx.adv

    from datatable import f
    import datatable as dtb

    from threading import Thread
    import win32com.client
    import datetime as dt
    import keyboard as kb
    import time
    import sys

except Exception as ex:
    print('ERRO: ', ex)
    os.system('pause')

global win
global path
global thread
global dt_arq
global list_dias
global txt_executar
global cbo_tarefas
global chk_tarefa
global cbo_dias
global msk_horario
global chk_min_telas


class ClockWindow(wx.Frame):

    def __init__(self):
        wx.Frame.__init__(self, None)

        self.timer = wx.Timer(self)
        self.Bind(wx.EVT_TIMER, self.OnTimer)

    @staticmethod
    def OnTimer(event):

        def ExecPrograma(dt_exec):
            if dt_exec[:, 'DesabilitarTarefa'][0, 0] == 0:
                if dt_exec[:, 'MinimizarTelas'][0, 0] == 1:
                    kb.send('windows+m')
                os.system(dt_exec[:, 'Programa'][0, 0])

        lst_horarios = [dt_arq[:, 'Horario'][i, 0] for i in range(dt_arq.nrows)]
        hora_atual = str(time.strftime('%H:%M', time.localtime()))

        if hora_atual in lst_horarios:
            dt_exec = dt_arq[f.Horario == hora_atual, :]

            if list_dias[dt.datetime.now().weekday()] == dt_exec[:, 'DiasExecucao'][0, 0]:
                ExecPrograma(dt_exec)
            elif dt_exec[:, 'DiasExecucao'][0, 0] == 'Segunda à Sexta' \
                    and dt.datetime.now().weekday() in [0, 1, 2, 3, 4]:
                ExecPrograma(dt_exec)
            elif dt_exec[:, 'DiasExecucao'][0, 0] == 'Todos':
                ExecPrograma(dt_exec)

        return event


class CustomTaskBarIcon(wx.adv.TaskBarIcon):

    def __init__(self, frame):
        """Constructor"""
        wx.adv.TaskBarIcon.__init__(self)
        self.frame = frame

        if os.path.isfile(path + '\\' + 'autotasks.ico'):
            img = wx.Image(path + '\\' + 'autotasks.ico', wx.BITMAP_TYPE_ANY)
            bmp = wx.Bitmap(img)
            self.icon = wx.Icon()
            self.icon.CopyFromBitmap(bmp)
        else:
            self.icon = wx.Icon()
        self.SetIcon(self.icon, "AutoTasks")
        self.Bind(wx.adv.EVT_TASKBAR_LEFT_DOWN, self.OnTaskBarLeftClick)

    def OnTaskBarActivate(self, event):
        pass

    def OnTaskBarClose(self, event):
        """
        Destroy the taskbar icon and frame from the taskbar icon itself
        """
        self.frame.Close()

        return event

    def OnTaskBarLeftClick(self, event):
        """
        Create the right-click menu
        """
        self.frame.Show()
        self.frame.Restore()

        return event


class MainFrame(wx.Frame):

    def __init__(self):
        """Constructor"""
        wx.Frame.__init__(
            self, None, title="AutoTasks (Agenda de Tarefas)", size=(730, 250),
            style=wx.DEFAULT_FRAME_STYLE & ~(wx.RESIZE_BORDER | wx.MAXIMIZE_BOX))
        self.tbIcon = CustomTaskBarIcon(self)

        self.Bind(wx.EVT_ICONIZE, self.onMinimize)
        self.Bind(wx.EVT_CLOSE, self.onClose)

        # self.Show()

    # ----------------------------------------------------------------------
    def onClose(self, event):
        """
        Destroy the taskbar icon and the frame
        """
        if wx.MessageBox('Confirma fechar o AutoTasks?', 'AutoTasks: Fechar Tela',
                         wx.YES_NO | wx.ICON_QUESTION) == wx.YES:
            self.tbIcon.RemoveIcon()
            self.tbIcon.Destroy()
            self.Destroy()
            quit()

        return event

    # ----------------------------------------------------------------------
    def onMinimize(self, event):
        """
        When minimizing, hide the frame so it "minimizes to tray"
        """
        if self.IsIconized():
            self.Hide()

        return event


def fechar_tela(event):
    win.onClose(event)


def minimizar_tela(event):
    win.Show(False)
    return event


def incluir_tarefa(event):
    s_tarefa = '00'
    for item in range(1, 99):
        s_tarefa = f'{item:02}'
        if s_tarefa not in cbo_tarefas.Items:
            cbo_tarefas.Append(s_tarefa)
            cbo_tarefas.SetValue(s_tarefa)
            break

    novo_conteudo = {'Nro': [s_tarefa], 'Programa': ['calc.exe'], 'DiasExecucao': ['Todos'],
                     'Horario': ['09:00'], 'DesabilitarTarefa': [0], 'MinimizarTelas': [0]}
    dt_arq_novo = dtb.Frame(novo_conteudo)
    dt_arq.rbind(dt_arq_novo)

    salvar_tarefa('inclusão')
    atualizar_tela(s_tarefa)
    txt_executar.SetFocus()
    return event


def excluir_tarefa(event):
    s_tarefa = cbo_tarefas.GetValue()
    if wx.MessageDialog(None, 'Confirmar exclusão da tarefa ' + s_tarefa + '?',
                        'AutoTasks: Exclusão', wx.YES_NO | wx.ICON_QUESTION).ShowModal() == wx.ID_YES:
        del dt_arq[f.Nro == s_tarefa, :]
        salvar_tarefa('exclusão')

    return event


def salvar_tarefa(event):
    if event == 'inclusão':
        s_tarefa = cbo_tarefas.GetValue()
    elif event == 'exclusão':
        s_tarefa = ''
    else:
        s_tarefa = cbo_tarefas.GetValue()
        del dt_arq[f.Nro == s_tarefa, :]

        novo_conteudo = {'Nro': [s_tarefa], 'Programa': [txt_executar.GetValue()],
                         'DiasExecucao': [cbo_dias.GetValue()], 'Horario': [msk_horario.GetValue()],
                         'DesabilitarTarefa': [int(chk_tarefa.GetValue())],
                         'MinimizarTelas': [int(chk_min_telas.GetValue())]}
        dt_arq_novo = dtb.Frame(novo_conteudo)
        dt_arq.rbind(dt_arq_novo)

    dt_arq.sort("Nro").to_pandas().to_csv(path + '\\' + 'autotasks.cfg', sep=';', index=False)
    atualizar_tela(s_tarefa)

    wx.MessageDialog(None, 'Alteração concluída com sucesso!', 'AutoTasks',
                     wx.OK_DEFAULT | wx.ICON_EXCLAMATION).ShowModal()

    return event


def selecionar_tarefa(event):
    atualizar_tela(cbo_tarefas.GetValue())
    return event


def carregar_arquivo():
    file = path + '\\' + 'autotasks.cfg'

    if os.path.isfile(file):
        dt_arq = dtb.fread(file, columns={'Nro': str, 'Programa': str, 'DiasExecucao': str,
                                          'Horario': str, 'DesabilitarTarefa': int, 'MinimizarTelas': int})
        if dt_arq.nrows != 0:
            return dt_arq

    conteudo_minimo = {'Nro': ['01'], 'Programa': ['calc.exe'], 'DiasExecucao': ['Todos'],
                       'Horario': ['09:00'], 'DesabilitarTarefa': [0], 'MinimizarTelas': [0]}
    dt_arq = dtb.Frame(conteudo_minimo)

    return dt_arq


def atualizar_tela(s_tarefa=''):
    dt_arq = carregar_arquivo()

    cbo_tarefas.Clear()
    list_nros = [dt_arq[:, 'Nro'][i, 0] for i in range(dt_arq.nrows)]
    for item in list_nros:
        cbo_tarefas.Append(item)

    if s_tarefa == '':
        s_tarefa = dt_arq[:, 'Nro'][0, 0]

    dt_arq = dt_arq[f.Nro == s_tarefa, :]
    cbo_tarefas.SetValue(s_tarefa)  # Seta Tarefa
    txt_executar.SetValue(dt_arq[0, 1])  # Programa
    chk_tarefa.SetValue(bool(dt_arq[0, 4]))  # Desabilitar Tarefa
    cbo_dias.SetValue(dt_arq[0, 2])  # Dias Escolhidos
    msk_horario.SetValue(dt_arq[0, 3])  # Horário
    chk_min_telas.SetValue(dt_arq[0, 5])  # Minimizar Telas


def paralelizar_execucoes():
    if int(chk_min_telas.GetValue()) == 1:
        kb.send('windows+m')
    os.system(txt_executar.GetValue())


def executar_tarefa(event):
    thread[cbo_tarefas.GetValue()] = Thread(target=paralelizar_execucoes)
    thread[cbo_tarefas.GetValue()].start()
    return event


def exibir_sobre(event):
    wx.MessageBox('Desenvolvido por Marcelo F. Delgado Horita', 'AutoTasks 3.0.0', wx.OK | wx.ICON_INFORMATION)
    return event


def CreateShortcut(s_path, s_path_orig, s_path_atalho):
    shell = win32com.client.Dispatch("WScript.Shell")
    shortcut = shell.CreateShortCut(s_path_atalho)
    shortcut.Targetpath = s_path_orig
    shortcut.WorkingDirectory = s_path
    shortcut.save()


def exec_instalacao(event):
    s_path_dest = r'C:\AutoTasks\AutoTasks.exe'
    if os.path.isfile(s_path_dest):
        wx.MessageBox(r'Instalação já existente em C:\AutoTasks\ !', 'AutoTasks', wx.OK | wx.ICON_EXCLAMATION)
    else:
        if wx.MessageBox('Confirma instalação do AutoTasks?', 'AutoTasks', wx.YES_NO | wx.ICON_QUESTION) == wx.YES:
            os.system(r'mkdir c:\AutoTasks')

            os.system('copy ' + path + r'\AutoTasks.exe C:\AutoTasks')
            os.system('copy ' + path + r'\AutoTasks.ico C:\AutoTasks')
            os.system('copy ' + path + r'\AutoTasks.png C:\AutoTasks')

            s_path_atalho = r'C:\AutoTasks\AutoTasks.lnk'
            CreateShortcut(r'C:\AutoTasks', s_path_dest, s_path_atalho)
            os.system('copy /Y ' + s_path_atalho + ' ' + r'%AppData%\Microsoft\Windows\"Start Menu"\Programs\Startup')

            os.system(r'explorer.exe C:\AutoTasks')
            win.tbIcon.RemoveIcon()
            win.tbIcon.Destroy()
            win.Destroy()
            quit()

    return event


def main():
    global win
    global path
    global dt_arq
    global thread
    global list_dias
    global txt_executar
    global cbo_tarefas
    global chk_tarefa
    global cbo_dias
    global msk_horario
    global chk_min_telas

    try:
        if os.path.isfile(os.getcwd() + '\\Python.exe'):
            path = os.path.dirname(os.path.realpath(__file__))
        else:
            path = os.getcwd()

        thread = dict()

        app = wx.App(False)
        win = MainFrame()

        # Carrega o ícone
        # ------------------------------------------------------------------------------------------------------------
        if os.path.isfile(path + '\\' + 'autotasks.ico'):
            win.SetIcon(wx.Icon(path + "\\" + "AutoTasks.ico"))
        panel = wx.Panel(win)

        # Carrega configurações
        # ------------------------------------------------------------------------------------------------------------
        dt_arq = carregar_arquivo()
        list_nros = [dt_arq[:, 'Nro'][i, 0] for i in range(dt_arq.nrows)]

        # Define a tarefa que será executada
        # ------------------------------------------------------------------------------------------------------------
        wx.StaticText(panel, label="Programa:", pos=(10, 10), style=1)
        # lblTarefa.SetFont(wx.Font(8, wx.DECORATIVE, wx.BOLD, wx.NORMAL))
        txt_executar = wx.TextCtrl(panel, -1, '', size=(560, -1), pos=(10, 30))
        txt_executar.SetInsertionPoint(0)

        # Carrega a lista de tarefas existentes
        # ------------------------------------------------------------------------------------------------------------
        cbo_tarefas = wx.ComboBox(panel, -1, value=list_nros[0], pos=(580, 30),
                                  size=wx.DefaultSize, choices=list_nros, style=wx.CB_READONLY)
        cbo_tarefas.Bind(wx.EVT_COMBOBOX, selecionar_tarefa)

        # Define o botão de inclusão de uma nova tarefa
        # ------------------------------------------------------------------------------------------------------------
        btn_inclusao = wx.Button(panel, label="+", size=(30, 27), pos=(630, 28))
        btn_inclusao.Bind(wx.EVT_BUTTON, incluir_tarefa)

        # Define o botão de exclusão de uma tarefa
        # ------------------------------------------------------------------------------------------------------------
        btn_exclusao = wx.Button(panel, label="-", size=(30, 27), pos=(670, 28))
        btn_exclusao.Bind(wx.EVT_BUTTON, excluir_tarefa)

        # Define se tarefa está ativa / inativa
        # ------------------------------------------------------------------------------------------------------------
        chk_tarefa = wx.CheckBox(panel, label='Tarefa desativada', pos=(10, 60))
        chk_tarefa.SetValue(0)

        # Define se tarefa está ativa / inativa
        # ------------------------------------------------------------------------------------------------------------
        chk_min_telas = wx.CheckBox(panel, label='Minimizar telas', pos=(130, 60))
        chk_min_telas.SetValue(0)

        # Carrefa lista de dias de execução
        # ------------------------------------------------------------------------------------------------------------
        wx.StaticText(panel, label="Dias:", pos=(220, 95))
        list_dias = ["Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira",
                     "Sábado", "Domingo", "Todos", "Segunda à Sexta"]
        cbo_dias = wx.ComboBox(panel, -1, value="Todos", pos=(250, 90),
                               size=wx.DefaultSize, choices=list_dias, style=wx.CB_READONLY)

        # Carrefa horário de execução
        # ------------------------------------------------------------------------------------------------------------
        wx.StaticText(panel, label="Horas:", pos=(420, 95))
        msk_horario = masked.TextCtrl(panel, -1, "06:00", mask='##:##', size=(50, -1), pos=(460, 90))

        # Define o botão de execução da tarefa
        # ------------------------------------------------------------------------------------------------------------
        btn_execucao = wx.Button(panel, label="&Executar", size=(140, 37), pos=(560, 83))
        btn_execucao.Bind(wx.EVT_BUTTON, executar_tarefa)

        # Define o botão para aplicar alteração
        # ------------------------------------------------------------------------------------------------------------
        btn_aplicar = wx.Button(panel, label="&Salvar", size=(140, 37), pos=(260, 130))
        btn_aplicar.Bind(wx.EVT_BUTTON, salvar_tarefa)

        # Define o botão para minimizar a tela
        # ------------------------------------------------------------------------------------------------------------
        btn_minimizar = wx.Button(panel, label="&Minimizar", size=(140, 37), pos=(410, 130))
        btn_minimizar.Bind(wx.EVT_BUTTON, minimizar_tela)

        # Define o botão para fechar a tela
        # ------------------------------------------------------------------------------------------------------------
        btn_maximizar = wx.Button(panel, label="&Fechar", size=(140, 37), pos=(560, 130))
        btn_maximizar.Bind(wx.EVT_BUTTON, fechar_tela)

        # Definir imagem
        # ------------------------------------------------------------------------------------------------------------
        if os.path.isfile(path + '\\' + 'autotasks.png'):
            img_icone = wx.Bitmap(wx.Image(path + "\\" + "AutoTasks.png", wx.BITMAP_TYPE_PNG).Scale(90, 80))
            wx.StaticBitmap(panel, -1, img_icone, pos=(70, 90))

        # Define o botão para fechar a tela
        # ------------------------------------------------------------------------------------------------------------
        tmr_cronometro = ClockWindow()
        tmr_cronometro.timer.Start(60000)

        # Setar configurações
        # ------------------------------------------------------------------------------------------------------------
        atualizar_tela(dt_arq[:, 'Nro'][0, 0])

        # Menu e Sub-menu
        # ------------------------------------------------------------------------------------------------------------
        menu_file = wx.Menu()
        menu_file.Append(1, "&Executar")
        win.Bind(wx.EVT_MENU, executar_tarefa, id=1)
        menu_file.Append(2, "&Salvar")
        win.Bind(wx.EVT_MENU, salvar_tarefa, id=2)
        menu_file.Append(3, "&Minimizar")
        win.Bind(wx.EVT_MENU, minimizar_tela, id=3)
        menu_file.AppendSeparator()
        menu_file.Append(4, "&Fechar")
        win.Bind(wx.EVT_MENU, fechar_tela, id=4)

        menu_editar = wx.Menu()
        menu_editar.Append(5, "&Incluir tarefa")
        win.Bind(wx.EVT_MENU, incluir_tarefa, id=5)
        menu_editar.Append(6, "&Excluir tarefa")
        win.Bind(wx.EVT_MENU, excluir_tarefa, id=6)

        menu_ajuda = wx.Menu()
        menu_ajuda.Append(7, "&Instalar AutoTasks")
        win.Bind(wx.EVT_MENU, exec_instalacao, id=7)
        menu_ajuda.AppendSeparator()
        menu_ajuda.Append(8, "&Sobre...")
        win.Bind(wx.EVT_MENU, exibir_sobre, id=8)

        menu_bar = wx.MenuBar()
        menu_bar.Append(menu_file, "A&rquivo")
        menu_bar.Append(menu_editar, "E&ditar")
        menu_bar.Append(menu_ajuda, "&Ajuda")

        win.SetMenuBar(menu_bar)

        # Status Bar
        # ------------------------------------------------------------------------------------------------------------
        win.CreateStatusBar()
        win.SetStatusText('Python ' + sys.version)

        win.Show(False)
        app.MainLoop()

    except Exception as ex:
        print(ex)


if __name__ == "__main__":
    main()
