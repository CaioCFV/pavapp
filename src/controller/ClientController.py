from flask_restful import Resource, abort, fields, marshal_with, reqparse
from sqlalchemy.exc import IntegrityError, OperationalError
from sqlalchemy.orm.exc import UnmappedInstanceError
#from src.repositories.ClientRepository import get_funcionarios, get_funcionario, delete_funcionario, update_funcionario
from src.service.ClientService import add
from flask import Flask, request, jsonify

response_fields = {
    "id": fields.Integer,
    "name": fields.String,
    "cpf": fields.String
}

request_parser = reqparse.RequestParser(bundle_errors=True)
request_parser.add_argument("id", type=int, help="")
request_parser.add_argument("name", type=str, help="", required=True)
request_parser.add_argument("cpf", type=str, help="", required=True)


class Client(Resource):
    # @marshal_with(response_fields)
    # def get(self, funcionario_id):
    #     try:
    #         funcionario = get_funcionario(funcionario_id)
    #         if not funcionario:
    #             abort(404, message="Resource not found")
    #         return funcionario, 200
    #     except OperationalError:
    #         abort(500, message="Internal Server Error")

    # def delete(self, funcionario_id):
    #     try:
    #         delete_funcionario(funcionario_id)
    #         return "", 204
    #     except UnmappedInstanceError:
    #         abort(404, message="Resource not found")
    #     except (OperationalError, IntegrityError):
    #         abort(500, message="Internal Server Error")

    # @marshal_with(response_fields)
    # def put(self, funcionario_id):
    #     try:
    #         #args = request_parser.parse_args(strict=True)
    #         funcionario = update_funcionario(**request.form, id=funcionario_id)
    #         return funcionario, 200
    #     except (OperationalError, IntegrityError):
    #         abort(500, message="Internal Server Error")
        # def get(self, funcionario_id):
    #     try:
    #         funcionario = get_funcionario(funcionario_id)
    #         if not funcionario:
    #             abort(404, message="Resource not found")
    #         return funcionario, 200
    #     except OperationalError:
    #         abort(500, message="Internal Server Error")

    def post(self):
        try:
            data = request.json
            client = add(data['name'], data['cpf'])
            return {'id': client.id, 'name': client.name, 'cpf': client.cpf}, 201

        except (OperationalError, IntegrityError):
            abort(500, message="Internal Server Error")


