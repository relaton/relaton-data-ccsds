# frozen_string_literal: true

source "https://rubygems.org"

gem "psych", "~> 5.2.6" # to avoid psych 5.3.0 breaking yaml parsing

# relaton-ccsds now ships inside the single combined `relaton` gem in the
# relaton/relaton monorepo (flavors merged into one gem, gemspec at repo root).
# Pull it from the monorepo's main branch (HTTPS so the crawler GH action can
# clone the public repo anonymously, without an SSH key). Its own dependencies —
# including the released pubid 2.x it needs — resolve transitively.
gem "relaton", git: "https://github.com/relaton/relaton.git", branch: "main"
