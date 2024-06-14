from src.model.Product import Product, db
import sqlalchemy

def add_product(name: str, description: str) -> Product:
    product = Product(name=name, description=description)
    db.session.add(product)
    db.session.commit()

    return product