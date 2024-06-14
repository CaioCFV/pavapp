from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from .Base import Base


class Funcionario(Base):
    __tablename__ = "funcionario"

    # Columns
    id = Column(
        "id",
        Integer,
        primary_key=True,
    )
    nome = Column("nome", String(150), nullable=False)

    funcionario_endereco = relationship("Endereco", back_populates="funcionario", passive_deletes="all")
