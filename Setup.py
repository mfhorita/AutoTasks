import sys
from cx_Freeze import setup, Executable

include_files = ['AutoTasks.ico', 'AutoTasks.png', 'AutoTasks.pdf']

base = None
if sys.platform == "win32":
    # base = "Console"   # para execuções em terminal
    base = "Win32GUI"
elif sys.platform == 'win64':
    base = "Win64GUI"

setup(name="AutoTasks",
      version="3.0.2",
      description="Prático gerenciador de tarefas para o Windows criado em python.",
      options={"build_exe": {"packages": ["os", "wx", "datatable", "threading",
                                          "win32com", "datetime", "keyboard", "time", "sys"],
                             "include_files": include_files,
                             "excludes": []}},
      executables=[Executable("AutoTasks.pyw", base=base, icon='AutoTasks.ico')])
