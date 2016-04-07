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

  context 'Community developmetn' do
    it 'displays Community development section' do
      expect(page).to have_selector('h2', text: "Community development")

    end
    it 'displays Open Source logo' do
      expect(page).to have_selector('img.pure-img-responsive')
    end

    context 'OSS projects' do
      it 'displays my oss' do
        expect(page).to have_selector('h5', text: "I do maintain my own open source projects:")
      end

      context 'Grunt Coffee Chain' do
        it 'displays link to Grunt Coffee Chain' do
          expect(page).to have_selector('ul li.link a[href="/portfolio/oss/"]', text: '«Grunt Coffee Chain» -')
        end

        it 'displays what it is' do
          expect(page).to have_selector('ul li.link',
            text: "«Grunt Coffee Chain» - grunt plugin inspired by Sprockets to compile CoffeeScripts that has sprockets-style comments to indicate dependencies."
          )
        end
      end

      context '«Asana God Contact»' do
        it 'displays link to «Asana God Contact»' do
          expect(page).to have_selector('ul li.link a[href="/portfolio/oss/"]', text: '«Asana God Contact» -')
        end
        it 'displays what it is' do
          expect(page).to have_selector('ul li.link',
            text: "«Asana God Contact» - A God::Contacts class for sending notifications to Asana. God is an monitoring framework written in Ruby."
          )
        end
      end
    end

    context 'Contributed to' do
      it 'displays link to «Asana God Contact»' do
        expect(page).to have_selector('ul li.link a[href="https://github.com/rack/rack/pull/992"]', text: 'rack/rack')
      end

      it 'displays link to «Asana God Contact»' do
        expect(page).to have_selector('ul li.link a[href="https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/2690#note_3543658"]', text: 'gitlab-org/gitlab-ce')
      end

      it 'displays link to «Asana God Contact»' do
        expect(page).to have_selector('ul li.link a[href="https://github.com/floere/phony/pull/180"]', text: 'floere/phony')
      end

      it 'displays link to «Asana God Contact»' do
        expect(page).to have_selector('ul li.link a[href="https://github.com/dnesteryuk/site_prism.vcr/pull/3"]', text: 'dnesteryuk/site_prism.vcr')
      end
    end

    context 'Developed local community' do
      it 'displays ' do
        expect(page).to have_selector('h5.content-subhead',
          text: "Developed local community:"
        )
      end

      context 'Hackathon' do
        it 'displays ' do
          expect(page).to have_selector('ul li.link',
            text: "Partnered with 4 friends of mine to plan and execute several frontend Meetups and the very first"
          )
        end

        it 'displays link to «Asana God Contact»' do
          expect(page).to have_selector('ul li.link a[href="https://en.wikipedia.org/wiki/Hackathon"]', text: 'Hackathon')
        end

        it 'displays ' do
          expect(page).to have_selector('ul li.link',
            text: "in Zaporizhzhya city -"
          )
        end

        it 'displays link to «Asana God Contact»' do
          expect(page).to have_selector('ul li.link a[href="http://www.vr-online.ru/blog/24hack-khakaton-v-zaporozhe-8785"]', text: '«24Hack»')
        end
      end

      context 'blog' do
        it 'displays ' do
          expect(page).to have_selector('h5.content-subhead',
            text: "Recent posts from my blog:"
          )
        end

      context 'recent blogposts' do
        before do
          @app = application
        end

        application.blog.articles[0...3].each do |article|
          it 'displays last 3 blog articles' do

              expect(page).to have_selector("ul li.link article a[href='#{article.url}']",
                text: "#{article.title}"
              )
            end
          end
        end
      end

      it 'displays link to blog' do
        expect(page).to have_selector('ul li.link a[href="/blog"]', text: 'Read more...')
      end
    end

    context 'Contact information' do
      it 'displays Contact information section' do
        expect(page).to have_selector('h2',
          text: "Contact information"
        )
      end

      it 'displays promo' do
        expect(page).to have_selector('.pure-u-1.is-center',
          text: "If you are a business looking for an expanded web presence or your an employer who is eager to add some remote expertise feel free to contact me."
        )
      end

      it 'displays ' do
        expect(page).to have_selector('h3.is-center',
          text: "Lets build something great!"
        )
      end
    end

    context 'contacts links' do

      context 'Contact Me:' do
        it 'displays contact me links' do
          expect(page).to have_selector('h4', text: "Contact Me:")
        end

        it 'displays LinkedIn' do
          expect(page).to have_selector('.contacts', text: "LinkedIn:")
        end

        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="https://www.linkedin.com/in/rrott"]', text: 'Roman Rott')
        end

        it 'displays contact me links' do
          expect(page).to have_selector('.contacts', text: "Skype:")
        end

        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="skype:roman.rott?chat"]', text: 'roman.rott')
        end

        it 'displays contact me links' do
          expect(page).to have_selector('.contacts', text: "Mail:")
        end

        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="mailto:roman.rott@gmail.com"]', text: 'roman.rott@gmail.com')
        end
      end

      context 'My Resume:' do
        it 'displays resume links' do
          expect(page).to have_selector('h4', text: "My Resume:")
        end

        it 'displays LinkedIn' do
          expect(page).to have_selector('.contacts', text: "Pdf:")
        end

        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="/cv/roman.rott.cv.2016.pdf"]', text: 'open/download')
        end

        it 'displays LinkedIn' do
          expect(page).to have_selector('.contacts', text: "Odt:")
        end
        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="/cv/roman.rott.cv.2016.odt"]', text: 'download')
        end

        it 'displays LinkedIn' do
          expect(page).to have_selector('.contacts', text: "Docx:")
        end
        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="/cv/roman.rott.cv.2016.docx"]', text: 'download')
        end
      end

      context 'Social Connections:' do
        it 'displays social links' do
          expect(page).to have_selector('h4', text: "Social Connections:")
        end

        it 'displays LinkedIn' do
          expect(page).to have_selector('.contacts', text: "Blog:")
        end

        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="/blog/"]', text: 'rrott.com/blog')
        end

        it 'displays LinkedIn' do
          expect(page).to have_selector('.contacts', text: "Twitter:")
        end

        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="https://twitter.com/roman_rott"]', text: 'roman_rott')
        end

        it 'displays LinkedIn' do
          expect(page).to have_selector('.contacts', text: "GitHub:")
        end
        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="https://github.com/rrott"]', text: 'rrott')
        end
      end

      it 'displays link to Vcard' do
        expect(page).to have_selector('h4 a[href="/roman.rott.vcf"]', text: 'Download my VCard')
      end

      it 'displays link to portfolio' do
        expect(page).to have_selector('h4 a[href="/portfolio/"]', text: 'Check out my portfolio')
      end

      it 'displays link to RSS' do
        expect(page).to have_selector('h4 a[href="/feed.xml"]', text: 'Subscribe to my Blog')
      end
    end
  end
 
  describe 'footer' do
    it 'displays linkedin icon' do
      expect(page).to have_selector('a[href="https://www.linkedin.com/in/rrott"]', count: 3)
      expect(page).to have_selector('em.icon-linkedin', count: 2)
    end

    it 'displays github icon' do
      expect(page).to have_selector('a[href="https://github.com/rrott"]', count: 3)
      expect(page).to have_selector('em.icon-github-circled', count: 2)
    end

    it 'displays twitter icon' do
      expect(page).to have_selector('a[href="https://twitter.com/roman_rott"]', count: 3)
      expect(page).to have_selector('em.icon-twitter.size3', count: 2)
    end

    it 'displays skype icon' do
      expect(page).to have_selector('a[href="skype:roman.rott?chat"]', count: 3)
      expect(page).to have_selector('em.icon-skype.skype', count: 2)
    end

    it 'displays mail icon' do
      expect(page).to have_selector('a[href="mailto:roman.rott@gmail.com"]', count: 3)
      expect(page).to have_selector('em.icon-mail-alt', count: 2)
    end

    it 'displays sitemap' do
      expect(page).to have_selector('a[href="/sitemap/"]', text: 'SiteMap')
    end
  end
end