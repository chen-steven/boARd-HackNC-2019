from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///chairman2.db'
db = SQLAlchemy(app)
app.config.update(
    SECRET_KEY = 'public static void main(String[] args)'
)
class Room(db.Model):
    iden = db.Column(db.Integer, primary_key=True)
    #username = db.Column(db.String(80), unique=False, nullable=False)
    text = db.Column(db.String(500), unique=False, nullable=False)

    def __repr__(self):
        return "{}".format(self.text)

db.create_all()
"""
#adding = Room(iden = 10, username = 'test', text  = 'fuck this')
#db.session.add(adding)
#db.session.commit()
a = Room.query.filter_by(iden =10).first()
print(a.text)
a.text = "fuck this"
db.session.commit()
b = Room.query.filter_by(iden =10).first()
print(b.text)
"""

@app.route('/ROOM', methods = ['GET'])
def room():
    data = request.get_json()
    if  data != None:
        group = data.get('room',None)
        person = Room.query.filter_by(iden = int(group)).first()
        db.session.delete(person)
        db.session.commit()
        return "complete"
    else:
        adding = Room(text  = 'test of the system')
        db.session.add(adding)
        db.session.commit()
        entry = adding.iden
        print(entry)
        payload = { 'room' : str(entry),
                'text' : adding.text
                }
        return jsonify(payload)
    
@app.route("/TEXT", methods = ['GET'])
def getText():
    user_id = request.args.get('id')
    print(user_id)
    text = Room.query.filter_by(iden = int(user_id)).first().text
    print(text)
    payload = {'room' : user_id,
               'text' : text
               }
    return jsonify(payload)

@app.route("/PUSH", methods = ['POST'])
def putText():
    data = request.get_json()
    test = data['message']
    user_id=data['id']
    print(user_id + test)
    group = Room.query.filter_by(iden = int(user_id)).first()
    group.text = data['message']
    db.session.commit()
    
    return ""

