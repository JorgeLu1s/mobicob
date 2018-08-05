module ActiveAdmin
  module Views
    class Footer < Component

      def build param
        super :id => "footer"                                                    
        super :style => "text-align: right;"                                     

        div do                                                                   
          small "Copyright #{Date.today.year}"                                       
        end
      end

    end
  end
end