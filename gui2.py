import sys
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QPushButton, QInputDialog, QTextEdit
from pyswip import Prolog, Functor, Variable, Atom, registerForeign, call
from PyQt5.QtCore import Qt, QEvent
from PyQt5.QtGui import QFont, QColor, QPalette

class Restaurant(QWidget):
    def __init__(self):
        super().__init__()

        self.setupProlog()
        self.initUI()

    
    def initUI(self):
        self.setGeometry(100, 100, 820, 600)  # Window size
        self.setWindowTitle('Restaurant Recommendation System')

        # Global stylesheet for the application
        self.setStyleSheet("""
QWidget {
    background-color: #42c4de;
    font-family: 'Montserrat', sans-serif;
}

QLineEdit {
    border: 2px solid #CCD4D0;
    padding: 4px 6px;
    font-size: 20px;  /* Adjusted the font size for better visibility */
    color: black;
    margin: 2px; /* Added margin for spacing */
}

QLineEdit:focus {
    border: 2px solid black;
}

QPushButton {
    background-color: #333333;
    color: white;
    font-size: 20px;
    font-weight: bold;
    border-radius: 3px;
    padding: 12px 20px; /* Padding to adjust the size */
    margin-top: 8px; /* Space between button and other elements */
    border: none;
}

QPushButton:hover {
    background-color: #41c4de;
}

QPushButton:pressed {
    background-color: #f78e56;
}

QTextEdit {
    font-size: 14px;
    color: white;
}
""")


        self.layout = QVBoxLayout()
        self.layout.setSpacing(10)

        self.chatWindow = QTextEdit(self)
        self.chatWindow.setFixedSize(800, 500)
        self.chatWindow.setReadOnly(True)
        self.chatWindow.setAlignment(Qt.AlignTop | Qt.AlignLeft)



        font = QFont("Arial", 12, QFont.Bold)

        self.button = QPushButton('Start', self)
        self.button.setFixedSize(800, 88)
        self.button.setFont(font)
        self.button.clicked.connect(self.queryGenerator)

        self.layout.addWidget(self.chatWindow)
        self.layout.addWidget(self.button)
        self.setLayout(self.layout)


    def setupProlog(self):
        self.prolog = Prolog()
        self.prolog.consult('kb.pl') 
        registerForeign(self.read_py, arity=3)
        registerForeign(self.read_py_menu, arity=3)
        registerForeign(self.write_py, arity=1)
        self.retractall = Functor("retractall")
        self.known = Functor("known", 3)

        self.questions_dict = {}
        self.attributes = ["cuisine", "distance", "price", "spicy", "dietary", "time", "takeaway", "card", "rating"]
        for attribute in self.attributes:
            question = list(self.prolog.query(f"generate_question('{attribute}', Question)"))[0]["Question"]
            self.questions_dict[attribute] = question

    def queryGenerator(self):
        call(self.retractall(self.known))
        query = "restaurant(X)."
        response = [answer for answer in self.prolog.query(query, maxresult=1)]
        if response:
            self.system_response(f"Recommended Restaurant: {response[0]['X']}")
        else:
            self.system_response("No restaurant recommendation found.")

    def system_response(self, response):
        bubble = f'''
        <div style="
            background-color: #f0f0f0;  /* Light grey background */
            color: #2c3e50;            /* Dark blue-grey for text */
            border-radius: 10px; 
            padding: 15px 20px; 
            margin: 10px 30px 10px auto; 
            max-width: 60%; 
            box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
            border-left: 5px solid #2980b9; /* Vibrant blue for contrast */
            font-family: 'Arial', sans-serif;
            ">
            <b>System:</b> {response}
        </div>
        '''
        self.chatWindow.append(bubble)

    def user_response(self, response):
        bubble = f'''
        <div style="
            background-color: #dff7e1;  /* Soft green background */
            color: #2e7d32;            /* Dark green for text */
            border-radius: 10px; 
            padding: 15px 20px; 
            margin: 10px 10px 10px 30%; 
            max-width: 60%; 
            box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
            border-right: 5px solid #43a047; /* Brighter green for definition */
            font-family: 'Arial', sans-serif;
            ">
            <b>You:</b> {response}
        </div>
        '''
        self.chatWindow.append(bubble)

    @staticmethod
    def write_py(message: Atom) -> bool:
        if isinstance(message, Atom):
            text = str(message)
            print(f"Prolog says: {text}")  # Or update the GUI
            return True
        return False


    def read_py(self, A: Atom, V: Atom, Y: Variable) -> bool:
        if isinstance(Y, Variable):
            title = 'Query Input'
            question = self.questions_dict[str(A)]
            self.system_response(question)
            response, ok = QInputDialog.getText(self, title, question)
            if ok:
                self.user_response(response)
                formatted_response = response.strip().lower()
                if formatted_response in ['yes', 'no']:
                    Y.unify(formatted_response)
                    return True
                else:
                    self.system_response("Please answer 'yes' or 'no'.")
        return False



    def read_py_menu(self, A: Atom, Y: Variable, MenuList: list) -> bool:
        if isinstance(Y, Variable):
            items = [str(x) for x in MenuList]
            attribute = str(A)
            question = self.questions_dict.get(attribute, f"Select an option for {attribute}:")
            self.system_response(question)
            response, ok = QInputDialog.getItem(self, "Select an option", question, items, 0, False)
            if ok:
                self.user_response(response)
                Y.unify(str(response))
                return True
        return False


if __name__ == '__main__':
    app = QApplication(sys.argv)
    rest = Restaurant()
    rest.show()
    sys.exit(app.exec_())
