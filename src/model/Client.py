from sqlalchemy import create_engine
from sqlalchemy import Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from src.model.dbmodel import db

class Client(db.Model):
    __tablename__ = "client"

    id   = db.Column("id",Integer,primary_key=True)
    name = db.Column("name", String(150), nullable=False)
    cpf  = db.Column("cpf", String(150), nullable=False)

    def __init__(self, name, cpf):
        self.name = name
        self.cpf = cpf


