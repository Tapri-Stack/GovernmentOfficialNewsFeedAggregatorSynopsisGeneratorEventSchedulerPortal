from scrapper.GovernmentOfficialNewsFeedFetcher import Scrapper
from scrapper.GovernmentOfficialNewsFeedConsolidator import Consolidator
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


if __name__=='__main__':
    main()