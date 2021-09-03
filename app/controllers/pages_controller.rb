class PagesController < ApplicationController
    def contacts
        @contacts = Array['<a href="vk.com/sherlok6"> << ВК >> </a>', 
            '<a href="instagram/snd_zero"> << Instagram >> </a>']
    end
end
