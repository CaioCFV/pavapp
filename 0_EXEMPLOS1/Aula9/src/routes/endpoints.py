from src.controller.FuncionarioController import FuncionarioItem, FuncionarioList

def initialize_endpoints(api):
    api.add_resource(FuncionarioItem, "/funcionarios/<int:funcionario_id>")
    api.add_resource(FuncionarioList, "/funcionarios")
