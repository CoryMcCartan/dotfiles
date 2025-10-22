# colors
.RAINIER = c("#465177", "#E4C22B", "#965127", "#29483A", "#759C44", "#9FB6DA", "#DF3383")
.GOP = "#A0442C"
.DEM = "#0064B0"
.GOP_DEM = c("#A0442C", "#B25D4C", "#C27568", "#D18E84", "#DFA8A0", "#EBC2BC",
             "#F6DCD9", "#F9F9F9", "#DAE2F4", "#BDCCEA", "#9FB6DE", "#82A0D2",
             "#638BC6", "#3D77BB", "#0063B1")
.scale_color_sound_sunset_c = function(...) {
    ggplot2::scale_color_gradientn(..., colours=c("#001E36", "#0F2649", "#352C5A",
                "#533369", "#6E3D71", "#814C74", "#925C78",
                "#A26D7C", "#BC7A7D", "#D08B79", "#DE9F71",
                "#E7B565", "#EBCC5C", "#E7E55C", "#DCFF6C"))
}
.scale_fill_sound_sunset_c = function(...) {
    ggplot2::scale_fill_gradientn(..., colours=c("#001E36", "#0F2649", "#352C5A",
                "#533369", "#6E3D71", "#814C74", "#925C78",
                "#A26D7C", "#BC7A7D", "#D08B79", "#DE9F71",
                "#E7B565", "#EBCC5C", "#E7E55C", "#DCFF6C"))
}
.scale_fill_party = function(...) {
    ggplot2::scale_fill_gradient2(..., low=.GOP_DEM[1], high=.GOP_DEM[15])
}
.scale_color_party = function(...) {
    ggplot2::scale_color_gradient2(..., low=.GOP_DEM[1], high=.GOP_DEM[15])
}


options(
    repos = c(CRAN = "http://cran.rstudio.com"),

    digits=5,
    scipen=1,
    max.print=200,

    pillar.bold=TRUE,
    pillar.print_max=30,
    pillar.advice=FALSE,

    pkg.build_extra_flags=FALSE,
    tidyverse.quiet=TRUE,
    dplyr.summarise.inform=FALSE,
    readr.show_types=FALSE,

    ggplot2.continuous.colour=.scale_color_sound_sunset_c,
    ggplot2.continuous.fill=.scale_fill_sound_sunset_c,
    ggplot2.discrete.colour=.RAINIER,
    ggplot2.discrete.fill=.RAINIER,

    tigris_use_cache = TRUE,
    tinytiger.use_cache = TRUE,
    alarm.use_cache = TRUE,
    geocoder.use_cache = TRUE,

    noaakey=Sys.getenv("NOAA_KEY"),

    usethis.full_name = "Cory McCartan",
    styler.cache_root = "styler",
    usethis.protocol  = "ssh",
    usethis.description = list(
        "Authors@R" = utils::person(
            "Cory", "McCartan",
            email = "mccartan@psu.edu",
            role = c("aut", "cre"),
            comment = c(ORCID = "0000-0002-6251-669X")
        ),
        Version = "0.0.0.9000"
    ),

    mc.cores = parallel::detectCores(),
    shiny.port = 8080L,
    rgl.printRglwidget = TRUE
)


if (interactive() && requireNamespace("colorout", quietly=TRUE) && Sys.getenv("RSTUDIO") != "1") {
    suppressWarnings(require("colorout", quietly=TRUE))
    setOutputColors(normal=146, verbose=FALSE)
}
if (interactive() && requireNamespace("beepr", quietly=TRUE)) {
    .beep = function() beepr::beep(1)
}
if (interactive() && requireNamespace("desc", quietly=TRUE)) {
    .alldeps = function(package=NULL, ignore=character(0), linking=TRUE) {
        dfile = desc::desc(package=package)
        deps = gsub(" ?\\(.+\\)", "", c(
            dfile$get_list("Depends", default=character(1)),
            dfile$get_list("Imports", default=character(1)),
            if (linking) dfile$get_list("LinkingTo", default=character(1)) else character(0)
        ))
        base = c("R", "base", "compiler", "datasets", "grDevices",
                 "graphics", "grid", "methods", "parallel", "splines",
                 "stats", "stats4", "tcltk", "tools", "utils", ignore)
        recc = c("KernSmooth", "MASS", "Matrix", "boot", "class", "cluster", 
                 "codetools", "foreign", "lattice", "mgcv", "nlme", "nnet",
                 "rpart", "spatial", "survival")

        deps = setdiff(deps, c(base, recc))
        unique(c(deps, unlist(lapply(deps, .alldeps, ignore=c(ignore, deps), linking=linking))))
    }
}
if (interactive()) {
    .save_vars <- function() {
        env = parent.frame()
        lapply(ls(envir=env), function(o) {
            assign(x = o, value = get(o, envir=env), envir = .GlobalEnv)
        })
    }

    hist <- function(x, ...) {
        if (is.numeric(x)) 
            graphics::hist(x, ..., border="white", col="gray")
        else
            graphics::hist(x, ...)
    }


    .venn <- function(x, y) {
        str_pad <- stringr::str_pad
            both = intersect(x, y)
            x_only = setdiff(x, both)
            y_only = setdiff(y, both)
            x_lab = deparse(substitute(x))
            y_lab = deparse(substitute(y))
            ls = c(length(both), length(x_only), length(y_only))
            ws = pmin(c(max(nchar(both)), max(nchar(x_only)), max(nchar(y_only))), 25)
            both_col = c(str_pad("both", ws[1], side="both"), str_pad("", ws[1], pad="-"),
                    format(both), rep(str_pad("", ws[1]), max(ls) - min(ls)))
            x_col = c(str_pad(x_lab, ws[2], side="both"), str_pad("", ws[2], pad="-"),
                    format(x_only), rep(str_pad("", ws[2]), max(ls) - min(ls)))
            y_col = c(str_pad(y_lab, ws[3], side="both"), str_pad("", ws[3], pad="-"),
                    format(y_only), rep(str_pad("", ws[3]), max(ls) - min(ls)))
            cat(stringr::str_c(
                        stringr::str_trunc(x_col[seq_len(max(ls))], ws[2]),
                        " | ",
                        stringr::str_trunc(both_col[seq_len(max(ls))], ws[1]),
                        " | ",
                        stringr::str_trunc(y_col[seq_len(max(ls))], ws[3]),
                        collapse="\n"
                        ))
    }

    .init_proj <- function() {
      c(".Rproj.user", ".Rhistory", ".RData", ".Ruserdata")
    }
}
#if (interactive() && Sys.getenv("RSTUDIO") == "1") thematic::thematic_on()

