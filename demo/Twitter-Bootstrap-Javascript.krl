ruleset a169x476 {
  meta {
    name "Twitter-Bootstrap-Javascript"
    description <<
      Twitter Bootstrap on KRL
    >>
    author "Ed Orcutt, LOBOSLLC"
    logging on

    use javascript resource "http://edo.krlcode.com/kquery/prettify.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-modal.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-alerts.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-twipsy.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-popover.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-dropdown.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-scrollspy.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-tabs.js"
    use javascript resource "http://edo.krlcode.com/kquery/bootstrap-buttons.js"
}
  
  dispatch {
    domain ".*"
  }

  rule demo {
    select when pageview ".*"
    {
      emit <<
        $K(function() {
          var btn = $K('#fat-btn').click(function () {
            btn.button('loading')
            setTimeout(function () {
              btn.button('reset')
            }, 3000)
          })
        })
      >>;

      emit <<
        $K(function () {
          $K("a[rel=twipsy]").twipsy({
            live: true
          })
        })
      >>;

      emit <<
        $K(function () {
          $K("a[rel=popover]")
            .popover({
              offset: 10
            })
            .click(function(e) {
              e.preventDefault()
            })
        })
      >>;

      emit <<
        $K(function () { prettyPrint() })
      >>;
    }
  }
}