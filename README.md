# WD API Test

## dev setup on Mac:

1. Fork the repo in github

2. Clone the forked repo to your mac

3. Install [rvm](http://rvm.beginrescueend.com/ "RVM"): 

		bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )
	
	__Attention__: Be sure to follow post install instructions.
	
4. Install ruby 1.9.2 in rvm:

		rvm install 1.9.2
	
5. Go to project folder:

		cd wd-api-test
	
6. Read the RVM Notice, follow on screen instructions and at the end type:

		yes
	
7. Make sure the proper version of ruby is used:

		ruby -v

7. Install required gems:

		bundle install
	
8. Edit config/database.yml

	You can use `config/database_example.yml` as a skeleton.

9. Start local development server

		rails s thin
