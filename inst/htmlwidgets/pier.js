HTMLWidgets.widget({

  name: "pier",

  type: "output",

  initialize: function(el, width, height) {
    //console.log("initialize");
    return {
      // TODO: add instance fields as required
    };

  },

  renderValue: function(el, x, instance) {
    // create pie object and bind it to the element

    // check for size attributes
    //var chkW = ((x || {}).size || {}).canvasWidth,
    //    chkH = ((x || {}).size || {}).canvasHeight,
    //    chkOut = ((x || {}).size || {}).pieOuterRadius;

    if (x.size) {

        if (x.size.canvasWidth === null) {
            x.size.canvasWidth = el.getBoundingClientRect().width
        }
        if (x.size.canvasHeight === null) {
            x.size.canvasHeight = el.getBoundingClientRect().height
        }
        if (x.size.pieOuterRadius === null) {
            x.size.pieOuterRadius = '90%'
        }

    } else {
        x.size = {
            canvasWidth: el.getBoundingClientRect().width,
            canvasHeight: el.getBoundingClientRect().height,
            pieOuterRadius: '90%'
        }
    }


    console.log(x.size);

    var pie = new d3pie(el.id, {
        header: x.header,
        size: x.size,
        footer: x.footer,
        tooltips: x.tooltips,
        labels: x.labels,
        effects: x.effects,
        misc: x.misc,
        data: x.data
    });

    },

  resize: function(el, width, height, instance) {
        // forward resize on to sigma renderers
    //for (var name in pie.renderers)
    //      pie.renderers[name].resize(width, height);
    //  },

      // Make the sigma object available as a property on the widget
      // instance we're returning from factory(). This is generally a
      // good idea for extensibility--it helps users of this widget
      // interact directly with sigma, if needed.
      //s: pie
  }
});
