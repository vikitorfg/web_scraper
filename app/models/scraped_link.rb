class ScrapedLink < ApplicationRecord
  has_many :individual_links

  enum status: { in_progress: 0, completed: 1, error: 2 }

  validates :link, presence: true
  validates :name, presence: true

  before_validation :set_name, on: :create
  after_initialize :set_default_status, if: :new_record?

  private

  # Set the name based on the domain extracted from the link
  def set_name
    self.name ||= extract_domain_from_link
  end

  # Set the default status to 'in_progress' for new records
  def set_default_status
    self.status ||= :in_progress
  end

  # Extract text between "www." and the top-level domain (TLD) in the link
  def extract_domain_from_link
    # Prepend a default scheme (e.g., http) if the link lacks one
    link_with_scheme = link.start_with?('http://', 'https://') ? link : "http://#{link}"
    uri = URI(link_with_scheme)
    host = uri.host

    if host
      # Remove any subdomains and "www." if present
      host.sub(/^www\./, '').split('.').first
    else
      nil
    end
  end
end