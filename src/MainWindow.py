from PyQt5.QtWidgets import QMainWindow, QMessageBox
from PyQt5.QtCore import pyqtSlot
from MainMenu import MainMenu
from Locale import Locale
loc = Locale()


class MainWindow(QMainWindow):

    def __init__(self, parent=None):
        super().__init__(parent)

        main_menu = MainMenu(parent=self)
        self.setMenuBar(main_menu)

        main_menu.about.triggered.connect(self.about)
        main_menu.about_qt.triggered.connect(self.about_qt)

    @pyqtSlot()
    def about(self):
        title = loc.helpbox_title
        text = loc.helpbox_about
        QMessageBox.about(self, title, text)

    @pyqtSlot()
    def about_qt(self):
        QMessageBox.aboutQt(self, loc.helpbox_aboutqt)

