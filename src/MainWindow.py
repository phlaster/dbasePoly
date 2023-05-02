from PyQt5.QtWidgets import QMainWindow, QMessageBox
from PyQt5.QtCore import pyqtSlot

from Employees import Model, View, Dialog
from MainMenu import MainMenu

from settings import Locale as loc
from settings import mw_params


class MainWindow(QMainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)

        # Parameters of main window
        self.setWindowTitle(mw_params["title"])
        self.setFixedWidth(mw_params["width"])
        self.setFixedHeight(mw_params["height"])

        # Menubar
        main_menu = MainMenu(parent=self)
        self.setMenuBar(main_menu)

        # slot: Employees
        main_menu.addEmpl.triggered.connect(self.addEmpl)
        main_menu.removeEmpl.triggered.connect(self.removeEmpl)
        main_menu.vacations.triggered.connect(self.vacations)

        # slot: Help
        main_menu.about.triggered.connect(self.about)
        main_menu.about_qt.triggered.connect(self.about_qt)


    @pyqtSlot()
    def addEmpl(self):
        View()
        # pass

    @pyqtSlot()
    def removeEmpl(self):
        pass

    # Blanc box
    @pyqtSlot()
    def vacations(self):
        title = loc.vacationbox_title
        text = loc.vacationbox_blanc
        QMessageBox.about(self, title, text)


    @pyqtSlot()
    def about(self):
        title = loc.helpbox_title
        text = loc.helpbox_about
        QMessageBox.about(self, title, text)

    @pyqtSlot()
    def about_qt(self):
        QMessageBox.aboutQt(self, loc.helpbox_aboutqt)
