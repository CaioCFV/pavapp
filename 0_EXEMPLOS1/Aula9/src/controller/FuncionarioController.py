import re

from flask_restful import Resource, abort, request
from flask_apispec import marshal_with, use_kwargs
from flask_apispec.views import MethodResource
from marshmallow import Schema, ValidationError, fields, validates
from sqlalchemy.exc import IntegrityError, OperationalError
from sqlalchemy.orm.exc import UnmappedInstanceError
from src.repositories.FuncionarioRepository import get_funcionarios, get_funcionario, delete_funcionario, update_funcionario
from src.service.FuncionarioService import addFuncionario


class FuncionarioResponseSchema(Schema):
    id = fields.Int()
    nome = fields.Str()

class FuncionarioRequestSchema(Schema):
    id = fields.Int()
    nome = fields.Str()
    
    @validates("nome")
    def validate_name(self, value):
        if not re.match(pattern=r"^[a-zA-Z0-9_]+$", string=value):
            raise ValidationError(
                "Value must contain only alphanumeric and underscore characters."
            )
        
class FuncionarioItem(MethodResource, Resource):
    @marshal_with(FuncionarioResponseSchema)
    def get(self, funcionario_id):
        try:
            funcionario = get_funcionario(funcionario_id)
            if not funcionario:
                abort(404, message="Resource not found")
            return funcionario, 200
        except OperationalError:
            abort(500, message="Internal Server Error")

    def delete(self, funcionario_id):
        try:
            delete_funcionario(funcionario_id)
            return "", 204
        except UnmappedInstanceError:
            abort(404, message="Resource not found")
        except (OperationalError, IntegrityError):
            abort(500, message="Internal Server Error")

    @use_kwargs(FuncionarioRequestSchema, location=("form"))
    @marshal_with(FuncionarioResponseSchema)
    def put(self, funcionario_id, **kwargs):
        try:
            funcionario = update_funcionario(**kwargs, id=funcionario_id)
            return funcionario, 200
        except (OperationalError, IntegrityError):
            abort(500, message="Internal Server Error")


class FuncionarioList(MethodResource, Resource):
    @marshal_with(FuncionarioResponseSchema)
    def get(self):
        try:
            if request.args:
                pass
                #select_aluno(request.args['name'])
            else:
                return get_funcionarios(), 200
        except OperationalError:
            abort(500, message="Internal Server Error")

    @use_kwargs(FuncionarioRequestSchema, location=("form"))
    @marshal_with(FuncionarioResponseSchema)
    def post(self, **kwargs):
        try:
            funcionario = addFuncionario(**kwargs)
            return funcionario, 201
        except IntegrityError as err:
            abort(500, message=str(err.__context__))
        except OperationalError as err:
            abort(500, message=str(err.__context__))
