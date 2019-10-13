from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/chairman.db'
db = SQLAlchemy(app)
app.config.update(
    SECRET_KEY = 'public static void main(String[] args)'
)
messages = []
i = 0
class Room(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=False, nullable=False)
    text = db.Column(db.String(500), unique=False, nullable=False)

    def __repr__(self):
        return "{}".format(self.text)

db.create_all()
adding = Room(username = '', text  = '')
db.session.add(adding)
db.session.commit()


@app.route('/ROOM', methods = ['GET'])
def room():
    data = request.get_json()
    if  data != None:
        group = data.get('room',None)
        person = Room.query.filter_by(id = int(group)).first()
        db.session.delete(person)
        db.session.commit()
        return "complete"
    else:
        messages.append("")
        adding = Room(username = '', text  = 'a')
        db.session.add(adding)
        db.session.commit()
        entry = adding.id
        payload = { 'room' : str(len(messages)-1),
                'text' : ""
                }
        return jsonify(payload)

    
@app.route("/TEXT", methods = ['GET'])
def getText():
    iden = request.args.get('id')
    payload = {'room' : iden,
               'text' : messages[int(iden)]
               }
    return jsonify(payload)

@app.route("/PUSH", methods = ['POST'])
def putText():
    data = request.get_json()
    messages[int(data['id'])] = data['message']
    group = Room.query.filter_by(id=(int(data['id']))).first()
    #group.text = data['message']
    db.session.commit()
    
    return ""
#
#@app.route("/open", methods = ['POST'])
#def initialize








@app.route("/get", methods = ['GET'])
def test():
    payload = {'text': "Hello World"}
    return jsonify(payload)


