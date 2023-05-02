from PyQt5.QtWidgets import QMenuBar
from settings import Locale as loc


class MainMenu(QMenuBar):
    def __init__(self, parent=None):
        super().__init__(parent)

        employees_menu = self.addMenu(loc.menu_employees)
        self.__addEmpl = employees_menu.addAction(loc.menu_employees_add)
        self.__removeEmpl = employees_menu.addAction(loc.menu_employees_fire)
        self.__vacations = employees_menu.addAction(loc.menu_employees_vacations)


        help_menu = self.addMenu(loc.menu_help)
        self.__about = help_menu.addAction(loc.menu_help_about)
        self.__about_qt = help_menu.addAction(loc.menu_help_aboutqt)


    @property
    def addEmpl(self):
        return self.__addEmpl

    @property
    def removeEmpl(self):
        return self.__removeEmpl

    @property
    def vacations(self):
        return self.__vacations

    @property
    def about(self):
        return self.__about

    @property
    def about_qt(self):
        return self.__about_qt