def execute_action(command):
    if command["action"] == "restart":
        return f"Simulated restart of VM: {command['target']}"
    return "Unknown action"