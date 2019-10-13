from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/chairman.db'
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

db.create_all()
adding = Room(username = '', text  = '')
db.session.add(adding)
db.session.commit()

#admin = Room(id = 1, username = "mare_quez", text = "fdafsdfadfa")
#db.session.add(admin)
#db.session.commit()
#Room.query.all()

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
        adding = Room(username = '', text  = '')
        db.session.add(adding)
        db.session.commit()
        entry = adding.__repr__()
        payload = { 'room' : str(entry[0]),
                'text' : entry[1]
                }
        return jsonify(payload)

    
@app.route("/TEXT", methods = ['GET'])
def getText():
    iden = str(request.args.get('id'))
    print(iden)
    group = Room.query.filter_by(id = int(iden)).first()
    print(str(group))
    payload = {'room' : str(group[0]),
               'text' : group[1]
               }
    print(payload['text'])
    return jsonify(payload)

@app.route("/PUSH", methods = ['POST'])
def putText():
    data = request.get_json()
    #print(str(data['id']))
    group = Room.query.filter_by(id=(int(data['id']))).first()
    group.text = data['message']
    #print(group.text)
    db.session.commit()
    #print(Room.query.filter_by(id=2).first())
    group = group.__repr__()
    payload = {'room' : str(group[0]),
        'text' : group[1]
            }
    return jsonify(payload)
#
#@app.route("/open", methods = ['POST'])
#def initialize








@app.route("/get", methods = ['GET'])
def test():
    payload = {'text': "Hello World"}
    return jsonify(payload)


