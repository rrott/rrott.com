require "spec_helper"

describe 'index', type: :feature do
  before do
    visit '/'
  end

  context 'About myself' do
    it 'displays my name' do
      expect(page).to have_selector('.splash-head', text: 'Roman Rott')
    end

    it 'displays the correct heading' do
      expect(page).to have_selector('h1', text: 'Hello, my name is Roman Rott')
    end

    it 'displays message that I am open for job' do
      expect(page).to have_selector('.is-center',
        text: "Open for remote job opportunities. Contact me if you're interested"
      )
    end

    context 'who I am' do
      it 'displays who I am' do
        expect(page).to have_selector('.pure-u-1',
          text: "I'm a Ukrainian front-end/back-end developer with 10+ years of IT experience and about 4 years experience dedicated to web development and security audit of web applications."
        )
      end

      it 'displays specialization' do
        expect(page).to have_selector('.pure-u-1',
          text: "I specialize in developing secure and optimised websites as well as in testing websites for security vulnerabilities."
        )
      end
    end

    context 'languages' do
      it 'displays languages' do
        expect(page).to have_selector('.pure-u-1',
          text: "CoffeeScript and Ruby are among my favorites when it comes to following TDD and OOP best practices."
        )
      end

      it 'displays ' do
        expect(page).to have_selector('.pure-u-1',
          text: "I do enjoy building everything from small OSS libs, business sites, Landing Pages to rich interactive web apps, single page applications."
        )
      end
    end
    it 'displays how I work' do
      expect(page).to have_selector('.pure-u-1',
        text: "I'm working remotely on web projects for clients all over the world and from time to time I take part in bug-bounty programs."
      )
    end
  end

  context 'Web Developer' do
    it 'displays Web Developer section' do
      expect(page).to have_selector('h2',text: "Web Developer")
    end

    it 'displays ruby logo' do
      expect(page).to have_selector('#ruby-logo')
    end

    it 'displays my expirience in dev' do
      expect(page).to have_selector('.pure-u-md-3-4',
        text: "During last 3+ years, I have been developing, supporting and maintaining web-projects for the US hosting company - Ecommerce.com. The company services high-level world-wide shared and cloud hosting products to its customers. There I grew up as a web-developer, as a manager, and as a person."
      )
    end

    it 'displays my expirience in secure web dev' do
      expect(page).to have_selector('.pure-u-md-3-4 p',
        text: "I also design and develop vulnerable applications for CTF hacking games that give an opportunity for researchers to practice their skills. Below is a portfolio that contains a list of such web services."
      )
    end

    it 'displays languages' do
      expect(page).to have_selector('.pure-u-md-3-4 p',
        text: "All of these sites were developed using Ruby, CoffeeScript, Javascript, Backbone, Sinatra, Padrino, and Ruby on Rails frameworks. Some of them handles large amounts of traffic on daily basis."
      )
    end

    it 'displays portfolio message' do
      expect(page).to have_selector('.pure-u-md-3-4 p',
        text: "My Full-Stack web developer portfolio is a brief summary of the projects samples that I've accomplished in 2015."
      )
    end

    it 'displays link to Portfolio' do
      expect(page).to have_selector('h3 a[href="/portfolio/"]', text: 'Check out my portfolio')
    end

  end

  context 'Security Researcher' do
    it 'displays Security Researcher section' do
      expect(page).to have_selector('h2',text: "Security Researcher")
    end

    context 'bugcrowd' do
      it 'displays bugcrowd' do
        expect(page).to have_selector('.infosec-text',
          text: "I like to test websites for security vulnerabilities (both white-box and black-box) at BugCrowd and other private bug bounty services. The result of my interest in ethical hacking has resulted in dozens of found and reported security issues in such services as: rubygems.org, ZeroMail, tagged.com, etc"
        )
      end

      it 'displays link to bugcrowd' do
        expect(page).to have_selector('.infosec-text a[href="https://bugcrowd.com/rrott"]', text: 'BugCrowd')
      end
    end

    context 'List of CTF games' do
      it 'displays what I did last year' do
        expect(page).to have_selector('.infosec-text',
          text: "Last year I took part in a CTF(Capture The Flag security game) as a Game Master and designed several vulnerable web applications for CTF hacking games organized by «Berezha Security» for:"
        )
      end

      context 'UISGCon 11(2015)' do
        it 'displays link to UISGCon 11(2015)' do
          expect(page).to have_selector('ul li.link a[href="https://11.uisgcon.org/en/about-uisgcon"]', text: 'UISGCon 11(2015) -')
        end

        it 'displays info about UISGCon 11(2015)' do
          expect(page).to have_selector('ul li.link',
            text: "Ukrainian InfoSec conference held by Non Government Organisation «Ukrainian Information Security Group»"
          )
        end
      end

      context 'The Cybersecurity Olympiad' do
        it 'displays link to The Cybersecurity Olympiad' do
          expect(page).to have_selector('ul li.link a[href="http://www.hackit-ukraine.com/#content"]', text: '«HackIT-2015»')
        end

        it 'displays The Cybersecurity Olympiad' do
          expect(page).to have_selector('ul li.link',
            text: "The Cybersecurity Olympiad"
          )
        end
      end

      context '«Cybersecurity: Ukraine and the world»' do

        it 'displays link to «Cybersecurity: Ukraine and the world»' do
          expect(page).to have_selector('ul li.link a[href="http://cybersecurity.pp.ua/en/Home"]', 
            text: '«Cybersecurity: Ukraine and the world»')
        end

        it 'displays The Cybersecurity Olympiad' do
          expect(page).to have_selector('ul li.link',
            text: "International forum «Cybersecurity: Ukraine and the world»"
          )
        end
      end

      it 'displays link to UISGCon 10(2014)' do
        expect(page).to have_selector('ul li.link',
          text: "UISGCon 10(2014) - Ukrainian InfoSec conference"
        )
      end
    end

    it 'displays picture with me' do
      expect(page).to have_selector('.image.hat .roman_rott')
    end

  end

    # it 'displays ' do
    #   expect(page).to have_selector('',
    #     text: ""
    #   )
    # end
  # it 'displays the "New Blog" blog post' do
  #   expect(page).to have_selector('ul li a[href="/blog/2014/08/20/new-blog/"]', text: 'New Blog')
  # end

  # it 'properly links to the "New Blog" blog post' do
  #   click_link 'New Blog'

  #   expect(page).to have_selector('h2', text: 'New Blog')
  # end
end