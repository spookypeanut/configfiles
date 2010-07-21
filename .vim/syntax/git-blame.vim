
  
  

  


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <title>syntax/git-blame.vim at master from the-kenny's git-vim - GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="http://github.com/fluidicon.png" title="GitHub" />

    <link href="http://assets2.github.com/stylesheets/bundle_common.css?8bb84887d6694c5e4fb30c567c17c565c4e14e9a" media="screen" rel="stylesheet" type="text/css" />
<link href="http://assets1.github.com/stylesheets/bundle_github.css?8bb84887d6694c5e4fb30c567c17c565c4e14e9a" media="screen" rel="stylesheet" type="text/css" />

    <script type="text/javascript" charset="utf-8">
      var GitHub = {}
      var github_user = null
      
    </script>
    <script src="http://assets3.github.com/javascripts/jquery/jquery-1.4.2.min.js?8bb84887d6694c5e4fb30c567c17c565c4e14e9a" type="text/javascript"></script>
    <script src="http://assets3.github.com/javascripts/bundle_common.js?8bb84887d6694c5e4fb30c567c17c565c4e14e9a" type="text/javascript"></script>
<script src="http://assets0.github.com/javascripts/bundle_github.js?8bb84887d6694c5e4fb30c567c17c565c4e14e9a" type="text/javascript"></script>

        <script type="text/javascript" charset="utf-8">
      GitHub.spy({
        repo: "the-kenny/git-vim"
      })
    </script>

    
  
    
  

  <link href="http://github.com/the-kenny/git-vim/commits/master.atom" rel="alternate" title="Recent Commits to git-vim:master" type="application/atom+xml" />

        <meta name="description" content="My vim files for Git" />
    <script type="text/javascript">
      GitHub.nameWithOwner = GitHub.nameWithOwner || "the-kenny/git-vim";
      GitHub.currentRef = "master";
    </script>
  

            <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-3769691-2']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script');
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        ga.setAttribute('async', 'true');
        document.documentElement.firstChild.appendChild(ga);
      })();
    </script>

  </head>

  

  <body>
    

    
      <script type="text/javascript">
        var _kmq = _kmq || [];
        function _kms(u){
          var s = document.createElement('script'); var f = document.getElementsByTagName('script')[0]; s.type = 'text/javascript'; s.async = true;
          s.src = u; f.parentNode.insertBefore(s, f);
        }
        _kms('//i.kissmetrics.com/i.js');_kms('//doug1izaerwt3.cloudfront.net/406e8bf3a2b8846ead55afb3cfaf6664523e3a54.1.js');
      </script>
    

    

    

    

    <div class="subnavd" id="main">
      <div id="header" class="pageheaded">
        <div class="site">
          <div class="logo">
            <a href="http://github.com"><img src="/images/modules/header/logov3.png" alt="github" /></a>
          </div>
          
          <div class="topsearch">
  
    <form action="/search" id="top_search_form" method="get">
      <a href="/search" class="advanced-search tooltipped downwards" title="Advanced Search">Advanced Search</a>
      <input type="search" class="search my_repos_autocompleter" name="q" results="5" placeholder="Search&hellip;" /> <input type="submit" value="Search" class="button" />
      <input type="hidden" name="type" value="Everything" />
      <input type="hidden" name="repo" value="" />
      <input type="hidden" name="langOverride" value="" />
      <input type="hidden" name="start_value" value="1" />
    </form>
  
  
    <ul class="nav logged_out">
      
        <li><a href="http://github.com">Home</a></li>
        <li class="pricing"><a href="/plans">Pricing and Signup</a></li>
        <li><a href="http://github.com/explore">Explore GitHub</a></li>
        
        <li><a href="/blog">Blog</a></li>
      
      <li><a href="https://github.com/login">Login</a></li>
    </ul>
  
</div>

        </div>
      </div>

      
      
        
    <div class="site">
      <div class="pagehead repohead vis-public fork  ">
        <h1>
          <a href="/the-kenny">the-kenny</a> / <strong><a href="http://github.com/the-kenny/git-vim">git-vim</a></strong>
          
            <span class="fork-flag">
              
              <span class="text">forked from <a href="/motemen/git-vim">motemen/git-vim</a></span>
            </span>
          
          
        </h1>

        
    <ul class="actions">
      

      
        <li class="for-owner" style="display:none"><a href="https://github.com/the-kenny/git-vim/edit" class="minibutton btn-admin "><span><span class="icon"></span>Admin</span></a></li>
        <li>
          <a href="/the-kenny/git-vim/toggle_watch" class="minibutton btn-watch " id="watch_button" style="display:none"><span><span class="icon"></span>Watch</span></a>
          <a href="/the-kenny/git-vim/toggle_watch" class="minibutton btn-watch " id="unwatch_button" style="display:none"><span><span class="icon"></span>Unwatch</span></a>
        </li>
        
          
            <li class="for-notforked" style="display:none"><a href="/the-kenny/git-vim/fork" class="minibutton btn-fork " id="fork_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '57b76e84fc97773311d1f161e0d7ba565655d208'); f.appendChild(s);f.submit();return false;"><span><span class="icon"></span>Fork</span></a></li>
            <li class="for-hasfork" style="display:none"><a href="#" class="minibutton btn-fork " id="your_fork_button"><span><span class="icon"></span>Your Fork</span></a></li>
          

          
          <li id="pull_request_item" class='ospr' style="display:none"><a href="/the-kenny/git-vim/pull_request/" class="minibutton btn-pull-request "><span><span class="icon"></span>Pull Request</span></a></li>
          

          <li><a href="#" class="minibutton btn-download " id="download_button"><span><span class="icon"></span>Download Source</span></a></li>
        
      
      
      <li class="repostats">
        <ul class="repo-stats">
          <li class="watchers"><a href="/the-kenny/git-vim/watchers" title="Watchers" class="tooltipped downwards">2</a></li>
          <li class="forks"><a href="/the-kenny/git-vim/network" title="Forks" class="tooltipped downwards">39</a></li>
        </ul>
      </li>
    </ul>


        
  <ul class="tabs">
    <li><a href="http://github.com/the-kenny/git-vim/tree/master" class="selected" highlight="repo_source">Source</a></li>
    <li><a href="http://github.com/the-kenny/git-vim/commits/master" highlight="repo_commits">Commits</a></li>

    
    <li><a href="/the-kenny/git-vim/network" highlight="repo_network">Network (39)</a></li>

    

    
      
      <li><a href="/the-kenny/git-vim/issues" highlight="issues">Issues (0)</a></li>
    

    
      
      <li><a href="/the-kenny/git-vim/downloads">Downloads (0)</a></li>
    

    
      
      <li><a href="http://wiki.github.com/the-kenny/git-vim/">Wiki (1)</a></li>
    

    <li><a href="/the-kenny/git-vim/graphs" highlight="repo_graphs">Graphs</a></li>

    <li class="contextswitch nochoices">
      <span class="toggle leftwards" >
        <em>Branch:</em>
        <code>master</code>
      </span>
    </li>
  </ul>

  <div style="display:none" id="pl-description"><p><em class="placeholder">click here to add a description</em></p></div>
  <div style="display:none" id="pl-homepage"><p><em class="placeholder">click here to add a homepage</em></p></div>

  <div class="subnav-bar">
  
  <ul>
    <li>
      <a href="#" class="dropdown">Switch Branches (1)</a>
      <ul>
        
          
            <li><strong>master &#x2713;</strong></li>
            
      </ul>
    </li>
    <li>
      <a href="#" class="dropdown defunct">Switch Tags (0)</a>
      
    </li>
    <li>
    
    <a href="/the-kenny/git-vim/branches" class="manage">Branch List</a>
    
    </li>
  </ul>
</div>

  
  
  
  
  


        
    <div id="repo_details" class="metabox clearfix">
      <div id="repo_details_loader" class="metabox-loader" style="display:none">Sending Request&hellip;</div>

      

      <div id="repository_description" rel="repository_description_edit">
        
          <p>My vim files for Git
            <span id="read_more" style="display:none">&mdash; <a href="#readme">Read more</a></span>
          </p>
        
      </div>
      <div id="repository_description_edit" style="display:none;" class="inline-edit">
        <form action="/the-kenny/git-vim/edit/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="57b76e84fc97773311d1f161e0d7ba565655d208" /></div>
          <input type="hidden" name="field" value="repository_description">
          <input type="text" class="textfield" name="value" value="My vim files for Git">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>

      
      <div class="repository-homepage" id="repository_homepage" rel="repository_homepage_edit">
        <p><a href="http://" rel="nofollow"></a></p>
      </div>
      <div id="repository_homepage_edit" style="display:none;" class="inline-edit">
        <form action="/the-kenny/git-vim/edit/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="57b76e84fc97773311d1f161e0d7ba565655d208" /></div>
          <input type="hidden" name="field" value="repository_homepage">
          <input type="text" class="textfield" name="value" value="">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>

      <div class="rule "></div>

      <div id="url_box" class="url-box">
        <ul class="clone-urls">
          
            
            <li id="http_clone_url"><a href="http://github.com/the-kenny/git-vim.git" data-permissions="Read-Only">HTTP</a></li>
            <li id="public_clone_url"><a href="git://github.com/the-kenny/git-vim.git" data-permissions="Read-Only">Git Read-Only</a></li>
          
        </ul>
        <input type="text" spellcheck="false" id="url_field" class="url-field" />
              <span style="display:none" id="url_box_clippy"></span>
      <span id="clippy_tooltip_url_box_clippy" class="clippy-tooltip tooltipped" title="copy to clipboard">
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="14"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="http://assets3.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=url_box_clippy&amp;copied=&amp;copyto=">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="http://assets3.github.com/flash/clippy.swf?v5"
             width="14"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=url_box_clippy&amp;copied=&amp;copyto="
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      </span>

        <p id="url_description">This URL has <strong>Read+Write</strong> access</p>
      </div>
    </div>


        

      </div><!-- /.pagehead -->

      









<script type="text/javascript">
  GitHub.currentCommitRef = "master"
  GitHub.currentRepoOwner = "the-kenny"
  GitHub.currentRepo = "git-vim"
  GitHub.downloadRepo = '/the-kenny/git-vim/archives/master'

  

  
</script>










  <div id="commit">
    <div class="group">
        
  <div class="envelope commit">
    <div class="human">
      
        <div class="message"><pre><a href="/the-kenny/git-vim/commit/712a9a58a80d8b3a5594088ff3a511d11152b856">Added &lt;TAB&gt;-complete for :GitAdd</a> </pre></div>
      

      <div class="actor">
        <div class="gravatar">
          
          <img src="http://www.gravatar.com/avatar/b670253273fa46b2848b8014dcc3e80f?s=140&d=http%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
        </div>
        <div class="name">Moritz Ulrich <span>(author)</span></div>
        <div class="date">
          <abbr class="relatize" title="2008-12-20 17:00:55">Sat Dec 20 17:00:55 -0800 2008</abbr>
        </div>
      </div>

      

    </div>
    <div class="machine">
      <span>c</span>ommit&nbsp;&nbsp;<a href="/the-kenny/git-vim/commit/712a9a58a80d8b3a5594088ff3a511d11152b856" hotkey="c">712a9a58a80d8b3a5594</a><br />
      <span>t</span>ree&nbsp;&nbsp;&nbsp;&nbsp;<a href="/the-kenny/git-vim/tree/712a9a58a80d8b3a5594088ff3a511d11152b856/syntax" hotkey="t">4dd6fc4113f45e0ab7e7</a><br />
      
        <span>p</span>arent&nbsp;
        
        <a href="/the-kenny/git-vim/tree/2d0de3b86a06def4f8791a72675aa7590eac30f5/syntax" hotkey="p">2d0de3b86a06def4f879</a>
      

    </div>
  </div>

    </div>
  </div>



  
    <div id="path">
      <b><a href="/the-kenny/git-vim/tree/master">git-vim</a></b> / <a href="/the-kenny/git-vim/tree/master/syntax">syntax</a> / git-blame.vim       <span style="display:none" id="clippy_2172">syntax/git-blame.vim</span>
      
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="http://assets3.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=clippy_2172&amp;copied=copied!&amp;copyto=copy to clipboard">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="http://assets3.github.com/flash/clippy.swf?v5"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=clippy_2172&amp;copied=copied!&amp;copyto=copy to clipboard"
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      

    </div>

    <div id="files">
      <div class="file">
        <div class="meta">
          <div class="info">
            <span class="icon"><img alt="Txt" height="16" src="http://assets0.github.com/images/icons/txt.png?8bb84887d6694c5e4fb30c567c17c565c4e14e9a" width="16" /></span>
            <span class="mode" title="File Mode">100644</span>
            
              <span>12 lines (8 sloc)</span>
            
            <span>0.264 kb</span>
          </div>
          <ul class="actions">
            
              <li><a id="file-edit-link" href="#" rel="/the-kenny/git-vim/file-edit/__ref__/syntax/git-blame.vim">edit</a></li>
            
            <li><a href="/the-kenny/git-vim/raw/master/syntax/git-blame.vim" id="raw-url">raw</a></li>
            
              <li><a href="/the-kenny/git-vim/blame/master/syntax/git-blame.vim">blame</a></li>
            
            <li><a href="/the-kenny/git-vim/commits/master/syntax/git-blame.vim">history</a></li>
          </ul>
        </div>
        
  <div class="data syntax type-vim">
    
      <table cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <pre class="line_numbers"><span id="LID1" rel="#L1">1</span>
<span id="LID2" rel="#L2">2</span>
<span id="LID3" rel="#L3">3</span>
<span id="LID4" rel="#L4">4</span>
<span id="LID5" rel="#L5">5</span>
<span id="LID6" rel="#L6">6</span>
<span id="LID7" rel="#L7">7</span>
<span id="LID8" rel="#L8">8</span>
<span id="LID9" rel="#L9">9</span>
<span id="LID10" rel="#L10">10</span>
<span id="LID11" rel="#L11">11</span>
<span id="LID12" rel="#L12">12</span>
</pre>
          </td>
          <td width="100%">
            
              <div class="highlight"><pre><div class='line' id='LC1'><span class="k">if</span> exists<span class="p">(</span><span class="s2">"b:current_syntax"</span><span class="p">)</span></div><div class='line' id='LC2'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">finish</span></div><div class='line' id='LC3'><span class="k">endif</span></div><div class='line' id='LC4'><br/></div><div class='line' id='LC5'><span class="nb">syn</span> <span class="k">match</span> gitblameSHA1 <span class="sr">/^[0-9a-f]\+/</span> contained</div><div class='line' id='LC6'><span class="nb">syn</span> <span class="k">match</span> gitblameHistory <span class="sr">/^[0-9a-f]\+ ([^)]*)/</span> contains<span class="p">=</span>gitblameSHA1</div><div class='line' id='LC7'><br/></div><div class='line' id='LC8'><span class="nb">hi</span> link gitblameSHA1 Statement</div><div class='line' id='LC9'><span class="nb">hi</span> link gitblameHistory Comment</div><div class='line' id='LC10'><br/></div><div class='line' id='LC11'><span class="k">let</span> <span class="k">b</span>:current_syntax <span class="p">=</span> <span class="c">"gitblame"</span></div><div class='line' id='LC12'><br/></div></pre></div>
            
          </td>
        </tr>
      </table>
    
  </div>


      </div>
    </div>

  


    </div>
  
      

      <div class="push"></div>
    </div>

    <div id="footer">
      <div class="site">
        <div class="info">
          <div class="locales">
            
            
          </div>
          <div class="links">
            <a href="http://github.com/blog"><b>Blog</b></a> |
            <a href="http://support.github.com">Support</a> |
            <a href="http://github.com/training">Training</a> |
            <a href="http://github.com/contact">Contact</a> |
            <a href="http://develop.github.com">API</a> |
            <a href="http://status.github.com">Status</a> |
            <a href="http://twitter.com/github">Twitter</a> |
            <a href="http://help.github.com">Help</a> |
            <a href="http://github.com/security">Security</a>
          </div>
          <div class="company">
            &copy;
            2010
            <span id="_rrt" title="0.33091s from fe4.rs.github.com">GitHub</span> Inc.
            All rights reserved. |
            <a href="/site/terms">Terms of Service</a> |
            <a href="/site/privacy">Privacy Policy</a>
          </div>
        </div>
        <div class="sponsor">
          <div>
            Powered by the <a href="http://www.rackspace.com ">Dedicated
            Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
            Computing</a> of Rackspace Hosting<span>&reg;</span>
          </div>
          <a href="http://www.rackspace.com">
            <img alt="Dedicated Server" src="http://assets0.github.com/images/modules/footer/rackspace_logo.png?8bb84887d6694c5e4fb30c567c17c565c4e14e9a" />
          </a>
        </div>
      </div>
    </div>

    <script>window._auth_token = "57b76e84fc97773311d1f161e0d7ba565655d208"</script>
    

    <script type="text/javascript">
      _kmq.push(['trackClick', 'entice_banner_link', 'Entice banner clicked']);
      
    </script>
    
  </body>
</html>

