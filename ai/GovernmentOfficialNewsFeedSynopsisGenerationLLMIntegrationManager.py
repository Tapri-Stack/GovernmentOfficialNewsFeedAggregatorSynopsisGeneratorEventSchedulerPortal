from google import genai
from pathlib import Path
import base64
import os
from dotenv import load_dotenv

PROMPT_FILE=f"{os.path.dirname(__file__)}/PROMPT.md"
MODEL="gemini-3.6-flash"

class SynopsisGenerator():
    def __init__(self, api_key, output_dir):
        self.output_dir = output_dir
        self.client = genai.Client(api_key=api_key)
        self.prompt = None
        self.pdf_bytes = None

    def generate(self, epaper_path = ""):
        with open(PROMPT_FILE, 'r') as f:
            self.prompt = f.read()
        
        with open(epaper_path, 'rb') as f:
            self.pdf_bytes = f.read()

        interaction = self.client.interactions.create(
            model=MODEL,
            input=[
                {
                    "type": "document",
                    "data": base64.b64encode(self.pdf_bytes).decode("utf-8"),
                    "mime_type": "application/pdf"
                },
                {
                    "type": "text", 
                    "text": self.prompt
                }
            ]
        )

        filepath = Path(self.output_dir + "llm_output.md")
        filepath.parent.mkdir(parents=True, exist_ok=True)
        with open(filepath, 'w') as f:
            f.write(interaction.output_text)

        return filepath

if __name__=='__main__':
    load_dotenv()
    synopsisGenerator = SynopsisGenerator(os.environ.get("GOVERNMENT_OFFICIAL_NEWS_FEED_SYNOPSIS_GENERATOR_LLM_API_KEY"), "./")
    synopsisGenerator.generate()