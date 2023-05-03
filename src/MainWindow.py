from PyQt5.QtWidgets import QMainWindow, QMessageBox
from PyQt5.QtSql import QSqlQuery

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

        # Create an instance of the View class and set it as the central widget
        self.view = View()
        self.setCentralWidget(self.view)


    @pyqtSlot()
    def addEmpl(self):
        dialog = Dialog(parent=self)
        if dialog.exec_() == dialog.Accepted:
            name = dialog._Dialog__name_edit.text()
            birthday = dialog._Dialog__birthday_edit.text()
            prof = dialog._Dialog__prof_edit.text()
            query = QSqlQuery()
            query.prepare('INSERT INTO staff (name, birthday, prof) VALUES (:name, :birthday, :prof)')
            query.bindValue(':name', name)
            query.bindValue(':birthday', birthday)
            query.bindValue(':prof', prof)
            if query.exec_():
                QMessageBox.information(self, loc.n_employee, loc.a_addition)
                self.view.model().setQuery('SELECT id, name, birthday, prof FROM staff')
            else:
                QMessageBox.warning(self, loc.n_employee, query.lastError().text())


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
