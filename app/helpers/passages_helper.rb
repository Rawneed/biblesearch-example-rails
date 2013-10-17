module PassagesHelper
	def chapter_link_from_verse_id(verse_id)
		c = verse_id.split(/[\:\.]/)
		link_to "...", show_chapter_path(c[0], c[1], c[2])
	end
end
