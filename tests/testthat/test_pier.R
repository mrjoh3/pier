
pd <- data.frame(label = c('Environment','Education','Business','Community'),
                 value = c(104,119,638,1250),
                 color = c("#D7191C", "#FDAE61", "#ABDDA4", "#2B83BA"))

p <- pier(pd)

test_that("a simple pier works", {
    expect_is(p, "pier")
    expect_is(p, "htmlwidget")
})

test_that('small segment group option can be modified',{

    psmg <- pier(pd, smallSegmentGrouping = TRUE, value = 5)
    ps <- psmg$x$data$smallSegmentGrouping

    expect_equal(ps$enabled, TRUE)
    expect_equal(ps$value, 5)
    expect_equal(ps$valueType, 'percentage')
    expect_equal(ps$label, 'Other')
    expect_equal(ps$color, '#cccccc')

    expect_is(ps, 'list')
    expect_is(psmg, "pier")
    expect_is(psmg, "htmlwidget")

})

test_that("pie.size works", {

    p_size <- pie.size(p, outer = 80, inner = 50, width = 200, height = 200)

    sz <- p_size$x$size
    expect_equal(sz$canvasWidth, 200)
    expect_equal(sz$canvasHeight, 200)
    expect_equal(sz$pieInnerRadius, '50%')
    expect_equal(sz$pieOuterRadius, '80%')

    expect_is(sz, 'list')
    expect_is(p_size, "pier")
    expect_is(p_size, "htmlwidget")
})

test_that("pie.header works", {

    p_header <- pie.header(p, text = 'My New Title', font = 'Impact',
                           size = 18, colour = 'grey',
                           location = 'top-center')

    hd <- p_header$x$header$title
    expect_equal(hd$text, 'My New Title')
    expect_equal(hd$font, 'Impact')
    expect_equal(hd$fontSize, 18)
    expect_equal(hd$color, 'grey')
    expect_equal(p_header$x$header$location, 'top-center')

    expect_is(p_header$x$header, 'list')
    expect_is(p_header, "pier")
    expect_is(p_header, "htmlwidget")
})

test_that("pie.subtitle works", {

    p_subtitle <- pie.subtitle(p, text='by Type')

    expect_equal(p_subtitle$x$header$subtitle$text, "by Type")

    expect_is(p_subtitle, "pier")
    expect_is(p_subtitle, "htmlwidget")
})

test_that("pie.tootips works", {

    p_tootips <- pie.tooltips(p)

    expect_true(p_tootips$x$tooltips$enabled)

    expect_is(p_tootips, "pier")
    expect_is(p_tootips, "htmlwidget")
})

test_that("pie.effects works", {

    p_effects <- pie.effects(p, load  = list(effect = 'default',
                                             speed = 1000))

    pe <- p_effects$x$effects$load

    expect_equal(pe$effect, 'default')
    expect_equal(pe$speed, 1000)

    expect_is(pe, 'list')
    expect_is(p_effects, "pier")
    expect_is(p_effects, "htmlwidget")
})

test_that("pie.footer works", {

    p_footer <- pie.footer(p,
                           location = "bottom-center",
                           text = 'with some additional explanation',
                           size = 28,
                           font = 'courier',
                           colour = "#ABDDA4")

    pf <- p_footer$x$footer
    expect_equal(pf$text, 'with some additional explanation')
    expect_equal(pf$font, 'courier')
    expect_equal(pf$fontSize, 28)
    expect_equal(pf$color, '#ABDDA4')
    expect_equal(pf$location, 'bottom-center')

    expect_is(pf, 'list')
    expect_is(p_footer, "pier")
    expect_is(p_footer, "htmlwidget")
})



