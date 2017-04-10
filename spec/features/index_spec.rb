require "spec_helper"

describe 'index', type: :feature do
  before do
    visit '/'
  end

  context 'About myself' do
    it 'displays my name' do
      expect(page).to have_selector('.splash', text: 'Roman Rott')
    end

    it 'displays the correct heading' do
      expect(page).to have_selector('h1', text: 'Hello, my name is Roman Rott')
    end

    it 'display message that I am open for job' do
      expect(page).to have_selector('.center',
        text: "Open for remote job opportunities. Contact me if you're interested")
    end

    context 'who I am' do
      it 'displays who I am' do
        expect(page).to have_selector('div',
          text: "I'm a Ukrainian front-end/back-end developer with 10+ years of IT experience and 5+ years experience dedicated to web development and security audit of web applications.")
      end

      it 'displays specialization' do
        expect(page).to have_selector('div',
          text: "I specialize in developing secure and optimised websites as well as in testing websites for security vulnerabilities.")
      end
    end

    context 'languages' do
      it 'displays languages' do
        expect(page).to have_selector('div',
          text: "Ruby is my favorites when it comes to following TDD and OOP best practices, while JavaScript is the best one for front-end and functional programming.")
      end

      it 'displays ' do
        expect(page).to have_selector('div',
          text: "I do enjoy building everything from small OSS libs, business sites, landing pages to rich interactive web apps, single page applications, etc.")
      end
    end
    it 'displays how I work' do
      expect(page).to have_selector('div',
        text: "I'm working remotely on web projects for clients all over the world and from time to time I take part in bug-bounty programs.")
    end
  end

  context 'Web Developer' do
    it 'displays Web Developer section' do
      expect(page).to have_selector('h2', text: "Web Developer")
    end

    it 'displays ruby logo' do
      expect(page).to have_selector('#ruby-logo')
    end

    it 'displays my expirience in dev' do
      expect(page).to have_selector('div',
        text: "Over the 9 years I was working on a various positions and different departments in a big Cloud and Shared Hosting company, Ecommerce.com. 6 of them were in Tech Support(Customer Relation) department and 4 in IT as a Ruby/Rails developer. There I grew up as a web-developer, as a manager, and as a person.")
    end

    it 'displays my expirience in Sphere' do
      expect(page).to have_selector('div p',
        text: "Now I am an Engineer at Sphere Software, a consulting company, where I've got extended expirience in React, Redux and ES6.")
    end

    it 'displays my expirience in secure web dev' do
      expect(page).to have_selector('div p',
        text: "I also design and develop vulnerable applications for CTF hacking games that give an opportunity for researchers to practice their skills. Below is a portfolio that contains a list of such web services.")
    end

    it 'displays languages' do
      expect(page).to have_selector('div p',
        text: "All of these sites were developed using Ruby, CoffeeScript, JavaScript, ES6, React, Backbone, Sinatra, Padrino, and Ruby on Rails frameworks. Some of them handles large amounts of traffic on daily basis.")
    end

    it 'displays portfolio message' do
      expect(page).to have_selector('div p',
        text: "My Full-Stack web developer portfolio is a brief summary of the projects samples that I've accomplished during last 2 years.")
    end

    it 'displays link to Portfolio' do
      expect(page).to have_selector('h4 a[href="/portfolio/"]', text: 'Check out my portfolio')
    end
  end

  context 'Security Researcher' do
    it 'displays Security Researcher section' do
      expect(page).to have_selector('h2', text: "Security Researcher")
    end

    context 'bugcrowd' do
      it 'displays bugcrowd' do
        expect(page).to have_selector('.infosec-text',
          text: "I like to test websites for security vulnerabilities (both white-box and black-box) at BugCrowd and other private bug bounty services. The result of my interest in ethical hacking has resulted in dozens of found and reported security issues in such services as: rubygems.org, ZeroMail, tagged.com, etc")
      end

      it 'displays link to bugcrowd' do
        expect(page).to have_selector('.infosec-text a[href="https://bugcrowd.com/rrott"]', text: 'BugCrowd')
      end
    end

    context 'List of CTF games' do
      it 'displays what I did last year' do
        expect(page).to have_selector('.infosec-text',
          text: "Last year I took part in a CTF(Capture The Flag security game) as a Game Master and designed several vulnerable web applications for CTF hacking games organized by «Berezha Security» for:")
      end

      context 'UISGCon 11(2015)' do
        it 'displays link to UISGCon 11(2015)' do
          expect(page).to have_selector('ul li.link a[href="https://uisgcon.org/en/about-uisgcon"]', text: 'UISGCon #10, #11, #12 (2014-2016)')
        end

        it 'displays info about UISGCon 11(2015)' do
          expect(page).to have_selector('ul li.link',
            text: "Ukrainian InfoSec conference held by Non Government Organisation «Ukrainian Information Security Group»")
        end
      end

      context 'The Cybersecurity Olympiad' do
        it 'displays link to The Cybersecurity Olympiad' do
          expect(page).to have_selector('ul li', text: '«HackIT-2015»')
        end

        it 'displays The Cybersecurity Olympiad' do
          expect(page).to have_selector('ul li.link',
            text: "The Cybersecurity Olympiad")
        end
      end

      context '«Cybersecurity: Ukraine and the world»' do
        it 'displays link to «Cybersecurity: Ukraine and the world»' do
          expect(page).to have_selector('ul li.link a[href="http://cybersecurity.pp.ua/en/Home"]',
            text: '«Cybersecurity: Ukraine and the world»')
        end

        it 'displays The Cybersecurity Olympiad' do
          expect(page).to have_selector('ul li.link',
            text: "International forum «Cybersecurity: Ukraine and the world»")
        end
      end
    end

    it 'does not display picture with me' do
      expect(page).to_not have_selector('.image.hat .roman_rott')
    end
  end

  context 'Community developmetn' do
    it 'displays Community development section' do
      expect(page).to have_selector('h2', text: "Community Development")
    end

    it 'displays Open Source logo' do
      expect(page).to have_selector('img.responsive')
    end

    context 'OSS projects' do
      xit 'displays my oss' do
        expect(page).to have_selector('h5', text: "I have my own open source projects:")
      end

      context 'Grunt Coffee Chain' do
        xit 'displays link to Grunt Coffee Chain' do
          expect(page).to have_selector('ul li.link a[href="/portfolio/oss/"]', text: '«Grunt Coffee Chain» -')
        end

        xit 'displays what it is' do
          expect(page).to have_selector('ul li.link',
            text: "«Grunt Coffee Chain» - grunt plugin inspired by Sprockets to compile CoffeeScripts that has sprockets-style comments to indicate dependencies.")
        end
      end

      context '«Asana God Contact»' do
        xit 'displays link to «Asana God Contact»' do
          expect(page).to have_selector('ul li.link a[href="/portfolio/oss/"]', text: '«Asana God Contact» -')
        end
        xit 'displays what it is' do
          expect(page).to have_selector('ul li.link',
            text: "«Asana God Contact» - A God::Contacts class for sending notifications to Asana. God is an monitoring framework written in Ruby.")
        end
      end
    end

    context 'Contributed to' do
      it 'displays link to gitlab-ce' do
        expect(page).to have_selector('a[href="https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/2690#note_3543658"]', text: 'gitlab-org/gitlab-ce')
      end

      it 'displays link to floere/phony' do
        expect(page).to have_selector('a[href="https://github.com/floere/phony/pull/180"]', text: 'floere/phony')
      end

      it 'displays link to site_prism.vcr' do
        expect(page).to have_selector('a[href="https://github.com/dnesteryuk/site_prism.vcr/pull/3"]', text: 'dnesteryuk/site_prism.vcr')
      end
    end

    context 'Developed local community' do
      context 'Hackathon' do
        it 'displays local comunity' do
          expect(page).to have_selector('h5',
            text: "Developing local community:")
        end

        context 'Hackathon' do
          it 'displays Hackathon' do
            expect(page).to have_selector('ul li.link',
              text: "Partnered with 4 friends of mine to plan and execute several frontend Meetups and the very first")
          end

          it 'displays link to Hackathon' do
            expect(page).to have_selector('ul li.link a[href="https://en.wikipedia.org/wiki/Hackathon"]', text: 'Hackathon')
          end

          it 'displays zp' do
            expect(page).to have_selector('ul li.link',
              text: "in Zaporizhzhya city")
          end

          it 'displays link to info about the Hackathon' do
            expect(page).to have_selector('ul li.link a[href="http://www.vr-online.ru/blog/24hack-khakaton-v-zaporozhe-8785"]', text: '«24Hack»')
          end
        end

        context 'Ruby Meditation' do
          it 'displays Ruby Meditation' do
            expect(page).to have_selector('ul li.link',
              text: "Had a talk on the")
          end

          it 'displays link to Ruby Meditation' do
            expect(page).to have_selector('ul li.link a[href="https://www.facebook.com/RubyMeditation/posts/1122062657874189"]', text: '11th Ruby Meditation')
          end
        end
      end

      context 'blog' do
        it 'displays ' do
          expect(page).to have_selector('h5',
            text: "Recent posts from my blog:")
        end

        context 'recent blogposts' do
          before do
            @app = application
          end

          application.blog.articles[0...3].each do |article|
            it 'displays last 3 blog articles' do
              expect(page).to have_selector("ul li.link article a[href='#{article.url}']",
                text: article.title.to_s)
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
          text: "Contact information")
      end

      it 'displays promo' do
        expect(page).to have_selector('.contacts-description.center',
          text: "If you are a business looking for a web presence or an employer who is eager to add a remote expertise feel free to get in touch with me right away!")
      end

      it 'displays ' do
        expect(page).to have_selector('h3.center',
          text: "Lets build something great!")
      end
    end

    context 'contacts links' do
      context 'Contact Me:' do
        it 'displays contact me links' do
          expect(page).to have_selector('h4', text: "contact me:")
        end

        it 'displays LinkedIn' do
          expect(page).to have_selector('.contacts', text: "linkedin:")
        end

        it 'displays link to linkedIn' do
          expect(page).to have_selector('.link a[href="https://www.linkedin.com/in/rrott"]', text: 'Roman Rott')
        end

        it 'displays skype' do
          expect(page).to have_selector('.contacts', text: "skype:")
        end

        it 'displays link to skype' do
          expect(page).to have_selector('.link a[href="skype:roman.rott?chat"]', text: 'roman.rott')
        end

        it 'displays mail' do
          expect(page).to have_selector('.contacts', text: "mail:")
        end

        it 'displays link to mail' do
          expect(page).to have_selector('.link a[href="mailto:roman@rrott.com"]', text: 'roman@rrott.com')
        end

        it 'displays GPG' do
          expect(page).to have_selector('.contacts', text: "gpg:")
        end

        it 'displays link to gpg' do
          expect(page).to have_selector('.link a[href="https://keybase.io/rrott"]', text: 'keybase.io/rrott')
        end
      end

      context 'My Resume:' do
        it 'displays resume links' do
          expect(page).to have_selector('h4', text: "my resume:")
        end

        it 'displays Pdf' do
          expect(page).to have_selector('.contacts', text: "pdf:")
        end

        it 'displays link to pdf' do
          expect(page).to have_selector('.link a[href="/cv/Roman.Rott.Resume.2017.pdf"]', text: 'resume')
          expect(page).to have_selector('.link a[href="/cv/Roman.Rott.CV.2017.pdf"]', text: 'CV')
        end

        it 'displays odt' do
          expect(page).to have_selector('.contacts', text: "odt:")
        end
        it 'displays link to odt' do
          expect(page).to have_selector('.link a[href="/cv/Roman.Rott.Resume.2017.odt"]', text: 'resume')
          expect(page).to have_selector('.link a[href="/cv/Roman.Rott.CV.2017.odt"]', text: 'CV')
        end

        it 'displays docx' do
          expect(page).to have_selector('.contacts', text: "docx:")
        end
        it 'displays link to docx' do
          expect(page).to have_selector('.link a[href="/cv/Roman.Rott.Resume.2017.docx"]', text: 'resume')
          expect(page).to have_selector('.link a[href="/cv/Roman.Rott.CV.2017.docx"]', text: 'CV')
        end

        it 'displays Google Docs' do
          expect(page).to have_selector('.contacts', text: "google docs")
        end

        it 'displays link to Google Docs' do
          expect(page).to have_selector('.link a[href="https://drive.google.com/open?id=1kE46bBi3kK8m6fO-bnBMEsLja-W2tmHPhHLe_MDhmPc"]', text: 'resume')
          expect(page).to have_selector('.link a[href="https://drive.google.com/open?id=1HcFTcpI1RKlSVDF8WP0AhBAQn9n68VZaCjWIMOrdbRA"]', text: 'CV')
        end
      end

      context 'Social Connections:' do
        it 'displays social links' do
          expect(page).to have_selector('h4', text: "social connections:")
        end

        it 'displays blog' do
          expect(page).to have_selector('.contacts', text: "blog:")
        end

        it 'displays link to blog' do
          expect(page).to have_selector('.link a[href="/blog/"]', text: 'rrott.com/blog')
        end

        it 'displays twitter' do
          expect(page).to have_selector('.contacts', text: "twitter:")
        end

        it 'displays link to twitter' do
          expect(page).to have_selector('.link a[href="https://twitter.com/roman_rott"]', text: 'roman_rott')
        end

        it 'displays github' do
          expect(page).to have_selector('.contacts', text: "GitHub:")
        end

        it 'displays link to github' do
          expect(page).to have_selector('.link a[href="https://github.com/rrott"]', text: 'rrott')
        end

        it 'displays gitlab' do
          expect(page).to have_selector('.contacts', text: "GitLab:")
        end

        it 'displays link to gitlab' do
          expect(page).to have_selector('.link a[href="https://gitlab.com/u/rrott"]', text: 'rrott')
        end
      end

      it 'displays link to Vcard' do
        expect(page).to have_selector('h4 a[href="/roman.rott.vcf"]', text: 'download my VCard')
      end

      it 'displays link to portfolio' do
        expect(page).to have_selector('h4 a[href="/portfolio/"]', text: 'check out my portfolio')
      end

      it 'displays link to RSS' do
        expect(page).to have_selector('h4 a[href="/feed.xml"]', text: 'subscribe to my blog')
      end
    end
  end

  describe 'footer' do
    it 'displays linkedin icon' do
      expect(page).to have_selector('a[href="https://www.linkedin.com/in/rrott"]', count: 3)
      expect(page).to have_selector('.icon.linkedin', count: 2)
    end

    it 'displays github icon' do
      expect(page).to have_selector('a[href="https://github.com/rrott"]', count: 3)
      expect(page).to have_selector('.icon.github', count: 2)
    end

    it 'displays twitter icon' do
      expect(page).to have_selector('a[href="https://twitter.com/roman_rott"]', count: 3)
      expect(page).to have_selector('.icon.twitter', count: 2)
    end

    it 'displays skype icon' do
      expect(page).to have_selector('a[href="skype:roman.rott?chat"]', count: 3)
      expect(page).to have_selector('.icon.skype', count: 2)
    end

    it 'displays mail icon' do
      expect(page).to have_selector('a[href="mailto:roman@rrott.com"]', count: 3)
      expect(page).to have_selector('.icon.email', count: 2)
    end

    it 'displays sitemap' do
      expect(page).to have_selector('a[href="/sitemap/"]', text: 'SiteMap')
    end
  end
end
