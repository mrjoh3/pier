HTMLWidgets.widget({

  name: "pier",

  type: "output",

  factory: function(el, width, height) {

    var pie;
    var instance = {};
    var draw_pie = function(x) {

            pie = new d3pie(x.id, {
                header: x.header,
                size: x.size,
                footer: x.footer,
                tooltips: x.tooltips,
                labels: x.labels,
                effects: x.effects,
                misc: x.misc,
                data: x.data
            });

    }


    return {

          renderValue: function(x) {

            //console.log(x.size);
            // if size not set get window dimensions
            if (x.size) {
                if (x.size.canvasWidth == null) {
                    x.size.canvasWidth = el.getBoundingClientRect().width;
                }
                if (x.size.canvasHeight == null) {
                    x.size.canvasHeight = el.getBoundingClientRect().height;
                }
                if (x.size.pieOuterRadius == null) {
                    x.size.pieOuterRadius = '90%';
                }

            } else {
                x.size = {
                    canvasWidth: el.getBoundingClientRect().width,
                    canvasHeight: el.getBoundingClientRect().height,
                    pieOuterRadius: '90%'
                };
            }

            x.id = el.id;
            instance.x = x;

            draw_pie(x);

            },

          resize: function(width, height) {

            //pie.destroy()
            //pie.redraw()
            x = instance.x;

            // when chart on hidden div ensure that height is not 0
            x.size.canvasHeight = (height === 0) ? height : width * 0.8;
            x.size.canvasWidth = width;

            draw_pie(x);

          }

    };

  }//,
  //p: pie

});
