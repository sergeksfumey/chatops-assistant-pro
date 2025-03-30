def parse_command(text):
    if "restart" in text and "vm" in text:
        return {"action": "restart", "target": text.split()[-1]}
    return {"action": "unknown"}