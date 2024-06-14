from flask_restful import Resource
from sqlalchemy.exc import IntegrityError, OperationalError
from src.service.ClientService import add
from flask import Flask, request


class Client(Resource):
    def post(self):
        try:
            data = request.json
            client = add(data['name'], data['cpf'])
            return {'id': client.id, 'name': client.name, 'cpf': client.cpf}, 201

        except (OperationalError, IntegrityError):
            abort(500, message="Internal Server Error")


