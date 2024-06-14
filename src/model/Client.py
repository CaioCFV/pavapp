from sqlalchemy.orm import declarative_base
from sqlalchemy import create_engine
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from src.model.Endereco import Endereco

Base = declarative_base()
db = SQLAlchemy()

class Client(Base):
    __tablename__ = "client"

    # Columns
    id = Column("id",Integer,primary_key=True)
    name = Column("name", String(150), nullable=False)
    cpf = Column("cpf", String(150), nullable=False)

    # funcionario_endereco = relationship("Endereco", back_populates="funcionario", passive_deletes="all")

    # __tablename__ = "endereco"

    # # Columns
    # id = Column(
    #     "id",
    #     Integer,
    #     primary_key=True,
    # )
    # rua = Column("rua", String(50), nullable=False)
    # bairro = Column("bairro", String(20), nullable=False)
    # idfuncionario = Column(Integer, ForeignKey("funcionario.id"), nullable=False)

    # funcionario = relationship("Funcionario", back_populates="funcionario_endereco")