from pathlib import Path
import img2pdf

class Consolidator:
    def __init__(self, output_dir):
        self.output_dir = output_dir
    
    def consolidate(self, images: list):
        pdf = img2pdf.convert([image.getvalue() for image in images], output=self.output_dir + "output.pdf")
        filepath = Path(self.output_dir + "output.pdf")
        filepath.parent.mkdir(parents=True, exist_ok=True)
        with open(filepath, 'wb') as f:
            f.write(pdf)

if __name__=='__main__':
    consolidator = Consolidator("./")
    consolidator.consolidate()