from src.controller.ClientController  import Client
from src.controller.ProductController import Product
from src.controller.VariantController import Variant

def initialize_endpoints(api):
    api.add_resource(Client,  "/client")
    api.add_resource(Product, "/product")
    api.add_resource(Variant, "/variant")

