library(ggplot2)

range25run1 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-1.trace.csv")
range25run2 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-2.trace.csv")
range25run3 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-3.trace.csv")
range25run4 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-4.trace.csv")
range25run5 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-5.trace.csv")
range25run6 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-6.trace.csv")
range25run7 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-7.trace.csv")
range25run8 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-8.trace.csv")
range25run9 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-9.trace.csv")
range25run10 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-25-hops-10-buffer-2000-run-10.trace.csv")

range25run1 <- range25run1[order(range25run1$packet_id), ]
range25run2 <- range25run2[order(range25run2$packet_id), ]
range25run3 <- range25run3[order(range25run3$packet_id), ]
range25run4 <- range25run4[order(range25run4$packet_id), ]
range25run5 <- range25run5[order(range25run5$packet_id), ]
range25run6 <- range25run6[order(range25run6$packet_id), ]
range25run7 <- range25run7[order(range25run7$packet_id), ]
range25run8 <- range25run8[order(range25run8$packet_id), ]
range25run9 <- range25run9[order(range25run9$packet_id), ]
range25run10 <- range25run10[order(range25run10$packet_id), ]

df <- data.frame(
  packet_id = range25run1$packet_id,
  range25_1 = range25run1$delivered_at,
  range25_2 = range25run2$delivered_at,
  range25_3 = range25run3$delivered_at,
  range25_4 = range25run4$delivered_at,
  range25_5 = range25run5$delivered_at,
  range25_6 = range25run6$delivered_at,
  range25_7 = range25run7$delivered_at,
  range25_8 = range25run8$delivered_at,
  range25_9 = range25run9$delivered_at,
  range25_10 = range25run10$delivered_at
)

range25mean <- 0
range25rate <- 0
range25mean_error <- 0

for (i in 2:ncol(df)) {
  range25mean <- range25mean + mean(df[,i], na.rm = TRUE)
  range25rate <- range25rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
  range25mean_error <- range25mean_error + sd(df[,i], na.rm = TRUE) / sqrt(nrow(df))
}

range25mean <- range25mean / (ncol(df) - 1)
range25rate <- range25rate / (ncol(df) - 1)
range25mean_error <- range25mean_error / (ncol(df) - 1)

range50run1 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-1.trace.csv")
range50run2 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-2.trace.csv")
range50run3 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-3.trace.csv")
range50run4 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-4.trace.csv")
range50run5 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-5.trace.csv")
range50run6 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-6.trace.csv")
range50run7 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-7.trace.csv")
range50run8 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-8.trace.csv")
range50run9 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-9.trace.csv")
range50run10 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-50-hops-10-buffer-2000-run-10.trace.csv")

range50run1 <- range50run1[order(range50run1$packet_id), ]
range50run2 <- range50run2[order(range50run2$packet_id), ]
range50run3 <- range50run3[order(range50run3$packet_id), ]
range50run4 <- range50run4[order(range50run4$packet_id), ]
range50run5 <- range50run5[order(range50run5$packet_id), ]
range50run6 <- range50run6[order(range50run6$packet_id), ]
range50run7 <- range50run7[order(range50run7$packet_id), ]
range50run8 <- range50run8[order(range50run8$packet_id), ]
range50run9 <- range50run9[order(range50run9$packet_id), ]
range50run10 <- range50run10[order(range50run10$packet_id), ]

df <- data.frame(
  packet_id = range50run1$packet_id,
  range50_1 = range50run1$delivered_at,
  range50_2 = range50run2$delivered_at,
  range50_3 = range50run3$delivered_at,
  range50_4 = range50run4$delivered_at,
  range50_5 = range50run5$delivered_at,
  range50_6 = range50run6$delivered_at,
  range50_7 = range50run7$delivered_at,
  range50_8 = range50run8$delivered_at,
  range50_9 = range50run9$delivered_at,
  range50_10 = range50run10$delivered_at
)

range50mean <- 0
range50rate <- 0
range50mean_error <- 0

for (i in 2:ncol(df)) {
  range50mean <- range50mean + mean(df[,i], na.rm = TRUE)
  range50rate <- range50rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
  range50mean_error <- range50mean_error + sd(df[,i], na.rm = TRUE) / sqrt(nrow(df))
}

range50mean <- range50mean / (ncol(df) - 1)
range50rate <- range50rate / (ncol(df) - 1)
range50mean_error <- range50mean_error / (ncol(df) - 1)

range100run1 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-1.trace.csv")
range100run2 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-2.trace.csv")
range100run3 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-3.trace.csv")
range100run4 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-4.trace.csv")
range100run5 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-5.trace.csv")
range100run6 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-6.trace.csv")
range100run7 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-7.trace.csv")
range100run8 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-8.trace.csv")
range100run9 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-9.trace.csv")
range100run10 <- read.csv("~/Apps/NS3/traces/epidemic/tx_distance/rss-benchmark-range-100-hops-10-buffer-2000-run-10.trace.csv")

range100run1 <- range100run1[order(range100run1$packet_id), ]
range100run2 <- range100run2[order(range100run2$packet_id), ]
range100run3 <- range100run3[order(range100run3$packet_id), ]
range100run4 <- range100run4[order(range100run4$packet_id), ]
range100run5 <- range100run5[order(range100run5$packet_id), ]
range100run6 <- range100run6[order(range100run6$packet_id), ]
range100run7 <- range100run7[order(range100run7$packet_id), ]
range100run8 <- range100run8[order(range100run8$packet_id), ]
range100run9 <- range100run9[order(range100run9$packet_id), ]
range100run10 <- range100run10[order(range100run10$packet_id), ]

df <- data.frame(
  packet_id = range100run1$packet_id,
  range100_1 = range100run1$delivered_at,
  range100_2 = range100run2$delivered_at,
  range100_3 = range100run3$delivered_at,
  range100_4 = range100run4$delivered_at,
  range100_5 = range100run5$delivered_at,
  range100_6 = range100run6$delivered_at,
  range100_7 = range100run7$delivered_at,
  range100_8 = range100run8$delivered_at,
  range100_9 = range100run9$delivered_at,
  range100_10 = range100run10$delivered_at
)

range100mean <- 0
range100rate <- 0
range100mean_error <- 0

for (i in 2:ncol(df)) {
  range100mean <- range100mean + mean(df[,i], na.rm = TRUE)
  range100rate <- range100rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
  range100mean_error <- range100mean_error + sd(df[,i], na.rm = TRUE) / sqrt(nrow(df))
}

range100mean <- range100mean / (ncol(df) - 1)
range100rate <- range100rate / (ncol(df) - 1)
range100mean_error <- range100mean_error / (ncol(df) - 1)

df_latency <- data.frame(
  tx_range = c('25 metros', '50 metros', '100 metros'),
  latency = c(range25mean, range50mean, range100mean),
  std_err = c(range25mean_error, range50mean_error, range100mean_error)
)

df_latency$tx_range <- factor(df_latency$tx_range, levels = c('25 metros', '50 metros', '100 metros'))

range_latency_graph <- ggplot(data = df_latency, aes(x = tx_range, y = latency, fill = tx_range)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = latency - std_err, ymax = latency + std_err), width = .2) +
  guides(fill = FALSE) +
  xlab("Alcance de transmissão") +
  ylab("Tempo de entrega (s)") +
  scale_fill_manual(values = c("#F0E442", "#0072B2", "#D55E00"))
range_latency_graph

df_rate <- data.frame(
  tx_range = c('25 metros', '50 metros', '100 metros'),
  delivery_rate = c(range25rate, range50rate, range100rate)
)

df_rate$tx_range <- factor(df_rate$tx_range, levels = c('25 metros', '50 metros', '100 metros'))

range_rate_graph <- ggplot(data = df_rate, aes(x = tx_range, y = delivery_rate, fill = tx_range)) +
  geom_bar(stat = "identity") +
  guides(fill = FALSE) +
  xlab("Alcance de transmissão") +
  ylab("Taxa de entrega (%)") +
  scale_fill_manual(values = c("#F0E442", "#0072B2", "#D55E00"))
range_rate_graph
