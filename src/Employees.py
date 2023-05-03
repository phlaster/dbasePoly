from PyQt5.QtWidgets import QTableView, QMessageBox, QDialog
from PyQt5.QtWidgets import QLabel, QLineEdit, QTextEdit, QPushButton
from PyQt5.QtWidgets import QVBoxLayout, QHBoxLayout
from PyQt5.QtSql import QSqlQueryModel
from PyQt5.QtCore import pyqtSlot

from settings import Locale as loc


class Model(QSqlQueryModel):
    def __init__(self, parent=None):
        super().__init__(parent)

        sql = ''' 
        select id, name, birthday, prof
        from staff
        '''
        self.setQuery(sql)


class View(QTableView):
    def __init__(self, parent=None):
        super().__init__(parent)

        model = Model(parent=self)
        self.setModel(model)

    @pyqtSlot()
    def add(self):
        dia = Dialog(parent=self)
        dia.exec()
        # QMessageBox.information(self, loc.n_employee, loc.a_addition)

    @pyqtSlot()
    def update(self):
        QMessageBox.information(self, loc.n_employee, loc.a_edit)
    
    @pyqtSlot()
    def delete(self):
        QMessageBox.information(self, loc.n_employee, loc.a_delete)


class Dialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)

        name_label = QLabel(loc.n_fullname, parent=self)
        self.__name_edit = QLineEdit(parent=self)

        birthday_label = QLabel(loc.n_birthday, parent=self)
        self.__birthday_edit = QLineEdit(parent=self)

        prof_label = QLabel(loc.n_prof, parent=self)
        self.__prof_edit = QLineEdit(parent=self)

        ok_btn = QPushButton(loc.ok, parent=self)
        cancel_btn = QPushButton(loc.cancel, parent=self)


        layout1 = QVBoxLayout(self)

        layout1.addWidget(name_label)
        layout1.addWidget(self.__name_edit)
        layout1.addWidget(birthday_label)
        layout1.addWidget(self.__birthday_edit)
        layout1.addWidget(prof_label)
        layout1.addWidget(self.__prof_edit)

        layout2 = QVBoxLayout()
        layout2.addWidget(ok_btn)
        layout2.addWidget(cancel_btn)
        
        layout1.addLayout(layout2)

        cancel_btn.clicked.connect(self.reject)
        ok_btn.clicked.connect(self.accept)

    def get_data(self):
        name = self.__name_edit.text()
        birthday = self.__birthday_edit.text()
        prof = self.__prof_edit.text()
        return name, birthday, prof