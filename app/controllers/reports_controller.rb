class ReportsController < ApplicationController

  layout "reports"
  

  def wimboo_operations
    @error_messages = []
    @service_name = "Wimboo"
    @error_messages = []
    @success_messages = []
    @request = Typhoeus::Request.new("http://41.189.40.193:8080/GATEWAY/rest/BK/Win/1", followlocation: true)
    #@request = Typhoeus::Request.new("http://localhost/infos.xml", followlocation: true)
    @internal_com_request = "@response = Nokogiri.XML(request.response.body)
    @compenses = @response.xpath('//xsi:Compenses//Compense')
    "     
    run_typhoeus_request(@request, @internal_com_request)
  end  
  
  def filter_wimboo_operations
    @error_messages = []
    @service_name = "Wimboo"
    @begin_date = params[:begin_date]
    @end_date = params[:end_date]
    
    # Si aucune des deux dates n'est entrée
    redirect_to :back if(@begin_date.blank? and @end_date.blank?)
      
    # Si une des deux dates n'est entrée ou qu'elles sont égales
    if((@begin_date.blank? or @end_date.blank?) or (@begin_date == @end_date))
      @begin_date.blank? ? (@date_filter = @end_date) : (@date_filter = @begin_date)
      @request = Typhoeus::Request.new("http://41.189.40.193:8080/GATEWAY/rest/BK/Win/1/#{@date_filter}", followlocation: true)
      #@request = Typhoeus::Request.new("http://localhost/infos.xml", followlocation: true)
      @internal_com_request = "@response = Nokogiri.XML(request.response.body)
      @compenses = @response.xpath('//xsi:Compenses//Compense')
      "     
      run_typhoeus_request(@request, @internal_com_request)
    else
      # Si la date de début est supérieure à la date de fin, on inverse les dates avant de faire la requête
      if(Date.parse(@begin_date) > Date.parse(@end_date))
        @temp = @begin_date
        @begin_date = @end_date
        @end_date = @temp
      end
      @request = Typhoeus::Request.new("http://41.189.40.193:8080/GATEWAY/rest/BK/Win/1/#{@begin_date}/#{@end_date}", followlocation: true)
      #@request = Typhoeus::Request.new("http://localhost/infos.xml", followlocation: true)
      @internal_com_request = "@response = Nokogiri.XML(request.response.body)
      @compenses = @response.xpath('//xsi:Compenses//Compense')
      "     
      run_typhoeus_request(@request, @internal_com_request)
    end
  end
  
  def wimboo_ayants_droit
    @service_name = "Wimboo"
    @error_messages = []
    @success_messages = []
    @request = Typhoeus::Request.new("http://localhost:8080/GATEWAY_HUB_NGSER/rest/Back/2/1", followlocation: true)
    @internal_com_request = "@response = Nokogiri.XML(request.response.body)
    @ayants_droit = @response.xpath('//ayDroit')
    "     
    run_typhoeus_request(@request, @internal_com_request)
  end 
  
  def gepci_operations
    @error_messages = []
    @service_name = "E-kiosk"
    @error_messages = []
    @success_messages = []
    #@request = Typhoeus::Request.new("http://localhost/infos.xml", followlocation: true)
    #@request = Typhoeus::Request.new("http://localhost:8080/GATEWAY/BK/Win/2", followlocation: true)
    @request = Typhoeus::Request.new("http://41.189.40.193:8080/GATEWAY/rest/BK/Win/2", followlocation: true)
    @internal_com_request = "@response = Nokogiri.XML(request.response.body)
    @compenses = @response.xpath('//xsi:Compenses//Compense')
    "         
    run_typhoeus_request(@request, @internal_com_request)
  end  
  
  def filter_gepci_operations
    @error_messages = []
    @service_name = "E-kiosk"
    @begin_date = params[:begin_date]
    @end_date = params[:end_date]
    
    # Si aucune des deux dates n'est entrée
    redirect_to :back if(@begin_date.blank? and @end_date.blank?)
    
    # Si une des deux dates n'est entrée ou qu'elles sont égales
    if((@begin_date.blank? or @end_date.blank?) or (@begin_date == @end_date))
      @begin_date.blank? ? (@date_filter = @end_date) : (@date_filter = @begin_date)
      @request = Typhoeus::Request.new("http://41.189.40.193:8080/GATEWAY/rest/BK/Win/2/#{@date_filter}", followlocation: true)
      #@request = Typhoeus::Request.new("http://localhost/infos.xml", followlocation: true)
      @internal_com_request = "@response = Nokogiri.XML(request.response.body)
      @compenses = @response.xpath('//xsi:Compenses//Compense')
      "     
      run_typhoeus_request(@request, @internal_com_request)
    else
      # Si la date de début est supérieure à la date de fin, on inverse les dates avant de faire la requête
      if(Date.parse(@begin_date) > Date.parse(@end_date))
        @temp = @begin_date
        @begin_date = @end_date
        @end_date = @temp
      end
      @request = Typhoeus::Request.new("http://41.189.40.193:8080/GATEWAY/rest/BK/Win/2/#{@begin_date}/#{@end_date}", followlocation: true)
      #@request = Typhoeus::Request.new("http://localhost/infos.xml", followlocation: true)
      @internal_com_request = "@response = Nokogiri.XML(request.response.body)
      @compenses = @response.xpath('//xsi:Compenses//Compense')
      "     
      run_typhoeus_request(@request, @internal_com_request)
    end
  end
  
  def gepci_ayants_droit
    @service_name = "E-kiosk"
    @error_messages = []
    @success_messages = []
    @request = Typhoeus::Request.new("http://localhost:8080/GATEWAY_HUB_NGSER/rest/Back/2/2", followlocation: true)
    @internal_com_request = "@response = Nokogiri.XML(request.response.body)
    @ayants_droit = @response.xpath('//ayDroit')
    "     
    run_typhoeus_request(@request, @internal_com_request)
  end 
  
end
