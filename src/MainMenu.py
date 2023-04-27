from PyQt5.QtWidgets import QMenuBar
from Locale import Locale
loc = Locale()

class MainMenu(QMenuBar):

    def __init__(self, parent=None):
        super().__init__(parent)

        help_menu = self.addMenu(loc.menubar_help)

        self.__about = help_menu.addAction(loc.menubar_about)
        self.__about_qt = help_menu.addAction(loc.menubar_aboutqt)

    @property
    def about(self):
        return self.__about

    @property
    def about_qt(self):
        return self.__about_qt