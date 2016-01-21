class Task
    attr_reader :content, :id
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = false
        @created_at = Time.now.asctime
    end

    def created_at
    	@created_at = Time.now.asctime
    end

    def complete?
    	@complete
    end

    def completed!
    	@complete = true
    	@complete
    end

    def make_incomplete!
    	@complete = false
    	@complete
    end

    def update_content!(update)
    	@content = update
    	@content
    end
end