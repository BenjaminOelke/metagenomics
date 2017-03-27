#' Visualize topic effects
#'
#' @inheritParams vis.binary
#' @param effects_object An object of class effects, generated by \code{\link{est}}.
#' @param type Type of visualization to perform.
#' @param ... Additional arguments for methods.
#'
#' @references
#' Roberts, M.E., Stewart, B.M., Tingley, D., Lucas, C., Leder-Luis,
#' J., Gadarian, S.K., Albertson, B., & Rand, D.G. (2014). Structural topic
#' models for open-ended survey responses. Am. J. Pol. Sci. 58, 1064–1082.
#'
#' Sievert, C., & Shirley, K. (2014). LDAvis: A method for visualizing and
#' interpreting topics. Proc. Work. Interact. Lang. Learn. Vis. Interfaces.
#'
#' Zhao, T., & Liu., H. (2012) The huge Package for High-dimensional Undirected
#' Graph Estimation in R. Journal of Machine Learning Research.
#'
#' @seealso \code{\link{networkD3}}, \code{\link{huge}}, \code{\link{topicCorr}},
#' \code{\link{Rtsne}}
#'
#' @examples
#' topics <- find_topics(K=30,otu_table=otu_table,rows_are_taxa=FALSE,tax_table=tax_table,formula=group + time,metadata=metadata,refs=c('A'))
#'
#' topic_effects <- est(topics)
#'
#' vis(topic_effects,type='taxa')
#' vis(topic_effects,type='binary')
#' vis(topic_effects,type='continuous',moderator='group')
#' vis(topic_effects,type='functions')
#' @export
vis <- function(effects_object,type=c('taxa','binary','continuous','functions'),...) UseMethod('vis')

#' @export
vis.effects <- function(effects_object,type=c('taxa','binary','continuous','functions'),...){

  type <- match.arg(type)
  class(effects_object) <- type

  vis(effects_object,...)

}