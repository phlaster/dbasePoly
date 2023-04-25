import sys

from Application import Application
from MainWindow import MainWindow

# if '__name__'=='__main__':
app = Application(sys.argv)

main_window = MainWindow()

#Do not maximize window on Wayland session
main_window.showMaximized()

result = app.exec()
sys.exit(result)
