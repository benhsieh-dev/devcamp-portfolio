module DefaultPageContent
     extend ActiveSupport::Concern

    # Jordan has before_filter in the included method that was throwing error to the server suggesting before_action instead
    included do 
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_page_defaults = "Portfolio App | My Portfolio Website"
        @seo_keywords = "Ben Hsieh portfolio"
    end
    
end