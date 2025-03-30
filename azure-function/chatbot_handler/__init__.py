import logging
import azure.functions as func
from .command_parser import parse_command
from .azure_ops import execute_action

def main(req: func.HttpRequest) -> func.HttpResponse:
    user_input = req.get_json().get('text')
    command = parse_command(user_input)
    result = execute_action(command)
    return func.HttpResponse(result, status_code=200)