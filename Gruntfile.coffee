module.exports = (grunt) =>

	watchTasks = ['less','uglify']

	grunt.initConfig
		less:
			production:
				options:
					compress: true
				files: [
					src: ['styles/*.less']
					dest: 'styles/main.min.css'
				]
		uglify:
			production:
				files:
					'scripts/main.min.js':'scripts/main.js'

		watch:
			less:
				files: ['styles/*.less', 'styles/blocks/*.less', "*.html", "scripts/main.js"]
				tasks: watchTasks
		imagemin:
			production:
				optimizationLevel:7
				expand: true
				cwd: 'images/'
				src: ['**/*.{png,jpg,gif}']
				dest: 'images/'


	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.registerTask 'default', watchTasks.concat ['watch']
