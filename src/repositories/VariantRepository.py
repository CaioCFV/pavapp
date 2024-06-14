from src.model.Variant import Variant, db
import sqlalchemy

def add_variant(name: str, ean: str, quantity: int, price: int, product_id: int) -> Variant:
    variant = Variant(name=name, ean=ean, quantity=quantity, price=price, product_id=product_id)
    db.session.add(variant)
    db.session.commit()

    return variant