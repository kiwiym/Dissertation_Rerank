import ollama

prompts = [
    # 0
    "Does the following text contain information related to `%s`. Only answer `0` for no and `1` for yes: %s",
    
    # 1
    """Your task is to review the provided text and determine if it contains information related to the specified type. Please respond with ‘0’ for no and ‘1’ for yes.

Type: %s
Text: %s

Does the text contain information related to the type specified above? Only answer 0 for no and 1 for yes.""",
    
    # 2
    """Your task is to determine if the given text contains information related to the specified type. Follow these steps:

1. Read the type of information that needs to be identified.
2. Carefully review the given text.
3. Decide whether the text contains information related to this type.
4. Respond with ‘0’ if the text does not contain the specified information and ‘1’ if it does.

The type of information is: %s
The text to review is: “%s”

Provide your response as a single digit: ‘0’ for no and ‘1’ for yes.""",

    # 3
    """You are a professional linguist tasked with determining if the given text contains information related to a specified type. Follow these instructions:

1. Understand the specified type of information.
2. Carefully review the provided text.
3. Based on your linguistic expertise, ascertain whether the text includes information relevant to the specified type.
4. Respond with ‘0’ if the text does not contain the specified information and ‘1’ if it does.

Type of Information: %s
Text for Review: “%s”

Please provide your response as a single digit: ‘0’ for no and ‘1’ for yes.""",

    # 4
    """Does the following text contain information related to `%s`. Only answer `0` for no and `1` for yes: %s""",

    # 5
    """Your task is to determine if the given text contains information related to the question. Follow these steps:

1. Read the given question.
2. Carefully review the given text.
3. Decide whether the text contains information related to this question.
4. Respond with ‘0’ if the text does not contain the specified information and ‘1’ if it does.

The question is: %s
The text to review is: “%s”

Provide your response as a single digit: ‘0’ for no and ‘1’ for yes."""
]

def create_prompt(prompt_id, qtype, paragraph):
    return prompts[prompt_id] % (qtype, paragraph)

def ask_ollama(prompt, model='phi3'):
    response = ollama.chat(model=model, messages=[
      {
        'role': 'user',
        'content': prompt,
      },
    ])
    return response['message']['content'].strip()