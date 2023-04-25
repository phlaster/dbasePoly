from PyQt5.QtWidgets import QMenuBar
from Locale import Locale
l = Locale()

class MainMenu(QMenuBar):

    def __init__(self, parent=None):
        super().__init__(parent)

        help_menu = self.addMenu(l.menubar_help)

        self.__about = help_menu.addAction(l.menubar_about)
        
        # Wrong approach to expose inner variables to outside
        self.about_qt = help_menu.addAction(l.menubar_aboutqt)

    # Correct approach: use property to get private variable
    @property
    def about(self):
        return self.__about