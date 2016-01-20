buffer20run1 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-1.trace.csv")
buffer20run2 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-2.trace.csv")
buffer20run3 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-3.trace.csv")
buffer20run4 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-4.trace.csv")
buffer20run5 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-5.trace.csv")
buffer20run6 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-6.trace.csv")
buffer20run7 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-7.trace.csv")
buffer20run8 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-8.trace.csv")
buffer20run9 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-9.trace.csv")
buffer20run10 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-20-run-10.trace.csv")

buffer20run1 <- buffer20run1[order(buffer20run1$packet_id), ]
buffer20run2 <- buffer20run2[order(buffer20run2$packet_id), ]
buffer20run3 <- buffer20run3[order(buffer20run3$packet_id), ]
buffer20run4 <- buffer20run4[order(buffer20run4$packet_id), ]
buffer20run5 <- buffer20run5[order(buffer20run5$packet_id), ]
buffer20run6 <- buffer20run6[order(buffer20run6$packet_id), ]
buffer20run7 <- buffer20run7[order(buffer20run7$packet_id), ]
buffer20run8 <- buffer20run8[order(buffer20run8$packet_id), ]
buffer20run9 <- buffer20run9[order(buffer20run9$packet_id), ]
buffer20run10 <- buffer20run10[order(buffer20run10$packet_id), ]

df <- data.frame(
  packet_id = buffer20run1$packet_id,
  buffer20_1 = buffer20run1$delivered_at,
  buffer20_2 = buffer20run2$delivered_at,
  buffer20_3 = buffer20run3$delivered_at,
  buffer20_4 = buffer20run4$delivered_at,
  buffer20_5 = buffer20run5$delivered_at,
  buffer20_6 = buffer20run6$delivered_at,
  buffer20_7 = buffer20run7$delivered_at,
  buffer20_8 = buffer20run8$delivered_at,
  buffer20_9 = buffer20run9$delivered_at,
  buffer20_10 = buffer20run10$delivered_at
)

buffer20mean <- 0
buffer20rate <- 0
buffer20mean_error <- 0

for (i in 2:ncol(df)) {
  buffer20mean <- buffer20mean + mean(df[,i], na.rm = TRUE)
  buffer20rate <- buffer20rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
  buffer20mean_error <- buffer20mean_error + sd(df[,i], na.rm = TRUE) / sqrt(nrow(df))
}

buffer20mean <- buffer20mean / (ncol(df) - 1)
buffer20rate <- buffer20rate / (ncol(df) - 1)
buffer20mean_error <- buffer20mean_error / (ncol(df) - 1)

buffer30run1 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-1.trace.csv")
buffer30run2 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-2.trace.csv")
buffer30run3 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-3.trace.csv")
buffer30run4 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-4.trace.csv")
buffer30run5 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-5.trace.csv")
buffer30run6 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-6.trace.csv")
buffer30run7 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-7.trace.csv")
buffer30run8 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-8.trace.csv")
buffer30run9 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-9.trace.csv")
buffer30run10 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-30-run-10.trace.csv")

buffer30run1 <- buffer30run1[order(buffer30run1$packet_id), ]
buffer30run2 <- buffer30run2[order(buffer30run2$packet_id), ]
buffer30run3 <- buffer30run3[order(buffer30run3$packet_id), ]
buffer30run4 <- buffer30run4[order(buffer30run4$packet_id), ]
buffer30run5 <- buffer30run5[order(buffer30run5$packet_id), ]
buffer30run6 <- buffer30run6[order(buffer30run6$packet_id), ]
buffer30run7 <- buffer30run7[order(buffer30run7$packet_id), ]
buffer30run8 <- buffer30run8[order(buffer30run8$packet_id), ]
buffer30run9 <- buffer30run9[order(buffer30run9$packet_id), ]
buffer30run10 <- buffer30run10[order(buffer30run10$packet_id), ]

df <- data.frame(
  packet_id = buffer30run1$packet_id,
  buffer30_1 = buffer30run1$delivered_at,
  buffer30_2 = buffer30run2$delivered_at,
  buffer30_3 = buffer30run3$delivered_at,
  buffer30_4 = buffer30run4$delivered_at,
  buffer30_5 = buffer30run5$delivered_at,
  buffer30_6 = buffer30run6$delivered_at,
  buffer30_7 = buffer30run7$delivered_at,
  buffer30_8 = buffer30run8$delivered_at,
  buffer30_9 = buffer30run9$delivered_at,
  buffer30_10 = buffer30run10$delivered_at
)

buffer30mean <- 0
buffer30rate <- 0
buffer30mean_error <- 0

for (i in 2:ncol(df)) {
  buffer30mean <- buffer30mean + mean(df[,i], na.rm = TRUE)
  buffer30rate <- buffer30rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
  buffer30mean_error <- buffer30mean_error + sd(df[,i], na.rm = TRUE) / sqrt(nrow(df))
}

buffer30mean <- buffer30mean / (ncol(df) - 1)
buffer30rate <- buffer30rate / (ncol(df) - 1)
buffer30mean_error <- buffer30mean_error / (ncol(df) - 1)

buffer60run1 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-1.trace.csv")
buffer60run2 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-2.trace.csv")
buffer60run3 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-3.trace.csv")
buffer60run4 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-4.trace.csv")
buffer60run5 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-5.trace.csv")
buffer60run6 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-6.trace.csv")
buffer60run7 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-7.trace.csv")
buffer60run8 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-8.trace.csv")
buffer60run9 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-9.trace.csv")
buffer60run10 <- read.csv("~/Apps/NS3/traces/epidemic/buffer_length/rss-benchmark-range-100-hops-10-buffer-60-run-10.trace.csv")

buffer60run1 <- buffer60run1[order(buffer60run1$packet_id), ]
buffer60run2 <- buffer60run2[order(buffer60run2$packet_id), ]
buffer60run3 <- buffer60run3[order(buffer60run3$packet_id), ]
buffer60run4 <- buffer60run4[order(buffer60run4$packet_id), ]
buffer60run5 <- buffer60run5[order(buffer60run5$packet_id), ]
buffer60run6 <- buffer60run6[order(buffer60run6$packet_id), ]
buffer60run7 <- buffer60run7[order(buffer60run7$packet_id), ]
buffer60run8 <- buffer60run8[order(buffer60run8$packet_id), ]
buffer60run9 <- buffer60run9[order(buffer60run9$packet_id), ]
buffer60run10 <- buffer60run10[order(buffer60run10$packet_id), ]

df <- data.frame(
  packet_id = buffer60run1$packet_id,
  buffer60_1 = buffer60run1$delivered_at,
  buffer60_2 = buffer60run2$delivered_at,
  buffer60_3 = buffer60run3$delivered_at,
  buffer60_4 = buffer60run4$delivered_at,
  buffer60_5 = buffer60run5$delivered_at,
  buffer60_6 = buffer60run6$delivered_at,
  buffer60_7 = buffer60run7$delivered_at,
  buffer60_8 = buffer60run8$delivered_at,
  buffer60_9 = buffer60run9$delivered_at,
  buffer60_10 = buffer60run10$delivered_at
)

buffer60mean <- 0
buffer60rate <- 0
buffer60mean_error <- 0

for (i in 2:ncol(df)) {
  buffer60mean <- buffer60mean + mean(df[,i], na.rm = TRUE)
  buffer60rate <- buffer60rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
  buffer60mean_error <- buffer60mean_error + sd(df[,i], na.rm = TRUE) / sqrt(nrow(df))
}

buffer60mean <- buffer60mean / (ncol(df) - 1)
buffer60rate <- buffer60rate / (ncol(df) - 1)
buffer60mean_error <- buffer60mean_error / (ncol(df) - 1)

df_latency <- data.frame(
  buffer_size = c('20 pacotes', '30 pacotes', '60 pacotes'),
  latency = c(buffer20mean, buffer30mean, buffer60mean),
  std_err = c(buffer20mean_error, buffer30mean_error, buffer60mean_error)
)

buffer_latency_graph <- ggplot(data = df_latency, aes(x = buffer_size, y = latency, fill = buffer_size)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = latency - std_err, ymax = latency + std_err), width = .2) +
  guides(fill = FALSE) +
  xlab("Tamanho do buffer") +
  ylab("Tempo de entrega (s)")
buffer_latency_graph

df_rate <- data.frame(
  buffer_size = c('20 pacotes', '30 pacotes', '60 pacotes'),
  delivery_rate = c(buffer20rate, buffer30rate, buffer60rate)
)

buffer_rate_graph <- ggplot(data = df_rate, aes(x = buffer_size, y = delivery_rate, fill = buffer_size)) +
  geom_bar(stat = "identity") +
  guides(fill = FALSE) +
  xlab("Tamanho do buffer") +
  ylab("Taxa de entrega (%)")
buffer_rate_graph
