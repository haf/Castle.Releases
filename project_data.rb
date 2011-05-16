# Stand alone file that specifies project details.

# the Projects hash should only contain strings relating to the projects.
Projects = {
	:proj => {
		:id => "My.Project", # this will also become the nuget and owrap key
		:dir => "My.Project", # the directory (under /src/XXX) where the project is
		:test_dir => "My.Project.Tests", # the directory of the tests assembly.
		:title => "My Project Things", # the title of the project denoted by 'proj'-key
		:description => "XXX", # the description of the project denoted by they 'proj'-key
		:copyright => "Place license/copyright in here.", 
		:authors => "Place authors in here.",
		:company => "Place your company name in here in a readable form.",
		:guid => "xxxxxxxx-fa2c-4630-a087-abd28f77af28 - generate a new guid" # not necessary unless you actually use the assembly guid
	}
}