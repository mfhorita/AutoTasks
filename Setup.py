import sys
from cx_Freeze import setup, Executable


base = None
if sys.platform == "win32":
    base = "Console"   # para execuções em terminal

setup(name="AutoTasks",
      version="3.0.2",
      description="Prático gerenciador de tarefas para o Windows criado em python.",
      options={"build_exe": {"packages": ["os", "wx", "datatable", "threading",
                                          "win32com", "datetime", "keyboard", "time", "sys"], "excludes": []}},
      executables=[Executable("AutoTasks.pyw", base=base)])
