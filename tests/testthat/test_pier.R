
pd <- data.frame(label = c('Environment','Education','Business','Community'),
                 value = c(104,119,638,1250),
                 color = c("#D7191C", "#FDAE61", "#ABDDA4", "#2B83BA"))

p <- pier(pd)
p_size <- pie.size(p, outer = 80, inner = 50, width = 200, height = 200)
p_header <- pie.header(p, text = 'My New Title', font = 'Impact',
                       size = 18, colour = 'grey',
                       location = 'top-center')

test_that("a simple pier works", {
    expect_is(p, "pier")
    expect_is(p, "htmlwidget")
})

test_that("pie.size works", {
    sz <- p_size$x$size
    expect_equal(sz$canvasWidth, 200)
    expect_equal(sz$canvasHeight, 200)
    expect_equal(sz$pieInnerRadius, '50%')
    expect_equal(sz$pieOuterRadius, '80%')

    expect_is(sz, 'list')
    expect_is(p, "pier")
    expect_is(p, "htmlwidget")
})

test_that("pie.header works", {
    hd <- p_header$x$header$title
    expect_equal(hd$text, 'My New Title')
    expect_equal(hd$font, 'Impact')
    expect_equal(hd$fontSize, 18)
    expect_equal(hd$color, 'grey')
    expect_equal(p_header$x$header$location, 'top-center')

    expect_is(p_header$x$header, 'list')
    expect_is(p, "pier")
    expect_is(p, "htmlwidget")
})
