import sys

from Application import Application
from MainWindow import MainWindow


if __name__=='__main__':
    app = Application(sys.argv)
    main_window = MainWindow()

    main_window.show()

    result = app.exec()
    sys.exit(result)
