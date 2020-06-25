class Song < ActiveRecord::Base
  
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def notes_content(notes)
    notes.each do |note|
      # byebug
      if note.length > 0
        note = Note.find_or_create_by(content:note)
        self.notes << note
      end
    end
  end

end
