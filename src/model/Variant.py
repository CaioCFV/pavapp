from sqlalchemy.orm import declarative_base
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, ForeignKey
from src.model.dbmodel import db

class Variant(db.Model):
    __tablename__ = "variant"

    # Columns
    id         = Column("id",Integer,primary_key=True)
    name       = Column("name", String(150), nullable=False)
    ean        = Column("ean", String(150), nullable=False)
    quantity   = Column("quantity",Integer, nullable=False)
    price      = Column("price", Integer, nullable=False)
    product_id = Column("product_id", ForeignKey("product.id"), nullable=False)
