require 'json'

module TaskwarriorWeb::Parser::Json
  def self.parse(json)
    return [] if json.strip == '[No matches.]'

    out = []
    json.lines.each do |line|
      begin
        out << ::JSON.parse(line)
      rescue JSON::ParserError
        next
      end
    end
    out
  end
end
