module Squall
  class Role < Base
    def list
      response = request(:get, '/roles.json')
      response.collect { |role| role['role']}
    end

    def show(id)
      response = request(:get, "/roles/#{id}.json")
      response.first[1]
    end

    def edit(id, options = {})
      # params.required(:label, :permission).validate!(options)
      response = request(:put, "/roles/#{id}.json", default_options(options))
    end

    def default_options(*options)
      options.empty? ? {} : {:query => {:role => options.first}}
    end
  end
end