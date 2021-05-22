# coding=UTF-8

import sys
from cx_Freeze import setup, Executable

include_files = ['AutoTasks.ico', 'AutoTasks.png', 'AutoTasks.pdf']

base = None
if sys.platform == "win32":
    base = "Win32GUI"
elif sys.platform == 'win64':
    base = "Win64GUI"
# base = "Console"   # terminal (util para debug)

setup(name="AutoTasks",
      version="3.1.0",
      description="AutoTasks (Agenda de Tarefas)",
      author="Marcelo F Delgado Horita",
      author_email="mfhorita@gmail.com",
      url="https://github.com/mfhorita/AutoTasks",
      options={"build_exe": {"packages": ["os", "wx", "datatable", "threading",
                                          "warnings", "pandas", "win32com",
                                          "datetime", "keyboard", "time", "sys"],
                             "include_files": include_files,
                             "excludes": []}},
      executables=[Executable("AutoTasks.pyw", base=base, icon='AutoTasks.ico')])
