ruleset a169x475 {
  meta {
    name "Twitter-Bootstrap"
    description <<
      Twitter Bootstrap on KRL
    >>
    author "Ed Orcutt, LOBOSLLC"
    logging on

    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-twipsy.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-dropdown.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-scrollspy.js"
    use javascript resource "http://edo.krlcode.com/kquery/prettify.js"
    use javascript resource "http://edo.krlcode.com/kquery/kobj.tablesorter.min.js"
}
  
  dispatch {
    domain ".*"
  }

  rule demo {
    select when pageview ".*"
    {
      emit <<
       // table sort example
       // ==================
       $K("#sortTableExample").tablesorter( { sortList: [[ 1, 0 ]] } );
      >>;

      emit <<
        // add on logic
        // ============

        $K('.add-on :checkbox').click(function () {
          if ($K(this).attr('checked')) {
            $K(this).parents('.add-on').addClass('active')
          } else {
            $K(this).parents('.add-on').removeClass('active')
          }
        });
      >>;
     
      emit <<
        // Disable certain links in docs
        // =============================
        // Please do not carry these styles over to your projects, it's merely
        // here to prevent button clicks form taking you away from your spot on page

        $K('ul.tabs a, ul.pills a, .pagination a, .well .btn, .actions .btn, .alert-message .btn, a.close').click(function (e) {
          e.preventDefault()
        })

        // Copy code blocks in docs
        $K(".copy-code").focus(function () {
          var el = this;
          // push select to event loop for chrome :{o
          setTimeout(function () { $K(el).select(); }, 0);
        });
      >>;

      emit <<
        // ----------------------------------------
        // position static twipsies
        $K(window).bind( 'load resize', function () {
          $K(".twipsies a").each(function () {
             $K(this)
              .twipsy({
                live: false
              , placement: $K(this).attr('title')
              , trigger: 'manual'
              , offset: 2
              })
              .twipsy('show')
            })      
          })      
      >>;

      emit <<
        $K(function () { prettyPrint() })
      >>;
    }
  }
}