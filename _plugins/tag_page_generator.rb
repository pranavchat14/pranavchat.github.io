module Jekyll
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      puts "Starting tag page generation"
      tags = site.posts.docs.flat_map { |post| post.data['tags'] || [] }.uniq
      puts "Found #{tags.length} unique tags"

      tags.each do |tag|
        puts "Generating tag page for: #{tag}"
        tag_dir = File.join(site.source, 'tag', tag)
        puts "Tag directory: #{tag_dir}"
        FileUtils.mkdir_p(tag_dir) unless File.exist?(tag_dir)
        site.pages << TagPage.new(site, site.source, File.join('tag', tag), tag)
      end
      puts "Finished tag page generation"
    end
  end

  class TagPage < Page
    def initialize(site, base, dir, tag)
      puts "Initializing TagPage for: #{tag}"
      @site = site
      @base = base
      @dir = dir
      @name = "index.html"

      puts "Processing file: #{@name}"
      self.process(@name)
      puts "Reading YAML from: #{File.join(base, '_layouts', 'tagspage.html')}"
      self.read_yaml(File.join(base, '_layouts'), 'tagspage.html')
      self.data['title'] = ""
      self.data['tag'] = tag
      
      puts "Created tag page: #{@dir}/#{@name}"
    end
  end
end
