from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import os.path

app = Flask(__name__)
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
db_path = os.path.join(BASE_DIR, "database.db")
app.config['SQLALCHEMY_DATABASE_URI'] = db_path
db = SQLAlchemy(app)
app.config.update(
    SECRET_KEY = 'public static void main(String[] args)'
)

class Room(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=False, nullable=False)
    text = db.Column(db.String(500), unique=False, nullable=False)

    def __repr__(self):
        return (self.id, self.username, self.text)


#admin = Room(id = 1, username = "mare_quez", text = "fdafsdfadfa")
#db.session.add(admin)
#db.session.commit()
#Room.query.all()

@app.route('/ROOM', methods = ['GET'])
def room():
    data = request.get_json()
    if  data != None:
        room = data.get('room',None)
        person = Room.query(int(room))
        db.session.delete(person)
        db.session.commit()
        return "complete"
    else:
        adding = Room(username = '', text  = '')
        db.session.add(adding)
        db.session.commit()
        room_num = adding.__repr__()[0]
        payload = { 'room' : str(room_num),
                'text' : Room.query.get(id)[2]
                }
        return jsonify(payload)

    



#
#@app.route("/open", methods = ['POST'])
#def initialize








@app.route("/get", methods = ['GET'])
def test():
    payload = {'text': "Hello World"}
    return jsonify(payload)


