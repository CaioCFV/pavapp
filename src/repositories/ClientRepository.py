from src.model.Client import Client, db
import sqlalchemy

def add_client(name: str, cpf: str) -> Client:
    client = Client(name=name, cpf=cpf)
    db.session.add(client)
    db.session.commit()

    return client

# def get_funcionarios() -> sqlalchemy.orm.query.Query:
#     """
#     Get all funcionarios stored in the database.

#     Returns:
#         funcionarios (Funcionario) -- contains all funcionarios registered.
#     """
#     funcionarios = db.session.query(Funcionario).all()
#     return funcionarios

# def get_funcionario(id: int) -> Funcionario:
#     """
#     Get funcionario by id stored in the database.

#     Returns:
#         funcionario (Funcionario) -- contains one funcionario registered.
#     """
#     funcionario = db.session.query(Funcionario).get(id)
#     return funcionario

# def delete_funcionario(id: int):
#     """
#     Delete funcionario by id stored in the database.

#     """
#     funcionario = db.session.query(Funcionario).get(id)
#     db.session.delete(funcionario)
#     db.session.commit()

# def update_funcionario(nome: str, id: int) -> Funcionario:
    # """
    # Insert a Funcionario in the database.
    # """
    # funcionario = db.session.query(Funcionario).get(id)
    
    # funcionario.nome = nome

    # db.session.commit()

    # return funcionario