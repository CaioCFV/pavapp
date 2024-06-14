from flask_restful import Resource
from sqlalchemy.exc import IntegrityError, OperationalError
from src.service.ProductService import add
from flask import Flask, request


class Product(Resource):
    def post(self):
        try:
            data = request.json
            product = add(data['name'], data['description'])
            return {'id': product.id, 'name': product.name, 'description': product.description}, 201

        except (OperationalError, IntegrityError):
            abort(500, message="Internal Server Error")


