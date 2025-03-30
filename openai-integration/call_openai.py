import openai
import os

def generate_command(user_input):
    prompt_path = "openai-integration/prompt_template.txt"
    with open(prompt_path) as f:
        prompt = f.read()

    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": prompt},
            {"role": "user", "content": user_input}
        ]
    )
    return response.choices[0].message['content']