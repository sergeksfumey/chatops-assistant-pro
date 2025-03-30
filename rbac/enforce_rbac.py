def enforce_access(user_email, action):
    with open('rbac/access-control.json') as f:
        rbac = json.load(f)
    roles = rbac['mapping'].get(user_email, [])
    if "admin" in roles or action in roles:
        return True
    return False