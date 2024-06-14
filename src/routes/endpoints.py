from src.controller.ClientController import Client

def initialize_endpoints(api):
    api.add_resource(Client, "/client")
    # api.add_resource(Client, "/client")
    # api.add_resource(FuncionarioList, "/funcionarios")
