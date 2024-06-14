from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from .Base import Base

class Endereco(Base):
    __tablename__ = "endereco"

    # Columns
    id = Column(
        "id",
        Integer,
        primary_key=True,
    )
    rua = Column("rua", String(50), nullable=False)
    bairro = Column("bairro", String(20), nullable=False)
    idfuncionario = Column(Integer, ForeignKey("funcionario.id"), nullable=False)

    funcionario = relationship("Funcionario", back_populates="funcionario_endereco")
