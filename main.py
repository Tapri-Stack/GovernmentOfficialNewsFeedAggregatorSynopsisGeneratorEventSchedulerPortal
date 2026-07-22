from scrapper.GovernmentOfficialNewsFeedFetcher import Scrapper
from scrapper.GovernmentOfficialNewsFeedConsolidator import Consolidator

OUTPUT_DIR = "./out/"

def main():
    scrapper = Scrapper(OUTPUT_DIR)
    images = scrapper.fetch()

    if not images:
        print("No images fetched")

    consolidator = Consolidator(OUTPUT_DIR)
    consolidatedNewsFeed = consolidator.consolidate(images)
    print("PDF Generated in", OUTPUT_DIR)


if __name__=='__main__':
    main()