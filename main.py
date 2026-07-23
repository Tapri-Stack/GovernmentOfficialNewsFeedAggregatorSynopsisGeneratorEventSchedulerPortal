from scrapper.GovernmentOfficialNewsFeedFetcher import Scrapper
from scrapper.GovernmentOfficialNewsFeedConsolidator import Consolidator
from ai.GovernmentOfficialNewsFeedSynopsisGenerationLLMIntegrationManager import SynopsisGenerator
import os
from dotenv import load_dotenv

OUTPUT_DIR = "./out/"

def main():
    load_dotenv()

    scrapper = Scrapper(os.environ.get("GOVERNMENT_OFFICIAL_NEWS_SOURCE_URL"))
    images = scrapper.fetch()

    if not images:
        print("No images fetched")

    consolidator = Consolidator(OUTPUT_DIR)
    consolidatedNewsFeed = consolidator.consolidate(images)
    print("PDF Generated in", OUTPUT_DIR)

    synopsisGenerator = SynopsisGenerator(os.environ.get("GOVERNMENT_OFFICIAL_NEWS_FEED_SYNOPSIS_GENERATOR_LLM_API_KEY"), OUTPUT_DIR)
    generatedSynopsisOutput = synopsisGenerator.generate(consolidatedNewsFeed)
    print("LLM Output generated in", generatedSynopsisOutput)


if __name__=='__main__':
    main()