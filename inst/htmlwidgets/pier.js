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

    };


    return {

          renderValue: function(x, width, height) {

            console.log(height);
            console.log(width);


             if(instance.lastValue){
                  pie.destroy();
             }
             instance.lastValue=x;

//            if (HTMLWidgets.shinyMode) {
//                console.log('shiny');
//                x.size.canvasHeight = height;
//                x.size.canvasWidth = width;
//            } else {

//            }


                if (x.size.canvasWidth == null) {
                   console.log('width null');
                    x.size.canvasWidth = width;//el.getBoundingClientRect().width;
                }
                if (x.size.canvasHeight == null) {
                    console.log('height null');
                    x.size.canvasHeight = height;//el.getBoundingClientRect().height,
                }
                if (x.size.pieOuterRadius == null) {
                    console.log('outer radius null');
                    x.size.pieOuterRadius = '90%';
                }


            x.id = el.id;
            instance.x = x;


            console.log(x);

            draw_pie(x);

            console.log('initial render');

            },

          resize: function(width, height) {

            console.log('enter resize');
            console.log(width);
            console.log(height);

            pie.destroy();
            //pie.redraw()
            x = instance.x;

            // when chart on hidden div ensure that height is not 0
            //x.size.canvasHeight = (height === 0) ? height : width * 0.8;
            x.size.canvasHeight = height;
            x.size.canvasWidth = width;

            draw_pie(x);

          }

    };

  }//,
  //p: pie

});
