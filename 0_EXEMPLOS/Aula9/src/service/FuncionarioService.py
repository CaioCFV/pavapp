from src.model.Funcionario import Funcionario
from src.repositories.FuncionarioRepository import add_funcionario

def addFuncionario(id: int, nome: str) -> Funcionario:
    if(id is None or id == '' or nome is None or nome == ''):
        raise Exception
    
    return add_funcionario(id, nome)