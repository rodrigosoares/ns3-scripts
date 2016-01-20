hops1run1 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-1.trace.csv")
hops1run2 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-2.trace.csv")
hops1run3 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-3.trace.csv")
hops1run4 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-4.trace.csv")
hops1run5 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-5.trace.csv")
hops1run6 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-6.trace.csv")
hops1run7 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-7.trace.csv")
hops1run8 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-8.trace.csv")
hops1run9 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-9.trace.csv")
hops1run10 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-1-buffer-2000-run-10.trace.csv")

hops1run1 <- hops1run1[order(hops1run1$packet_id), ]
hops1run2 <- hops1run2[order(hops1run2$packet_id), ]
hops1run3 <- hops1run3[order(hops1run3$packet_id), ]
hops1run4 <- hops1run4[order(hops1run4$packet_id), ]
hops1run5 <- hops1run5[order(hops1run5$packet_id), ]
hops1run6 <- hops1run6[order(hops1run6$packet_id), ]
hops1run7 <- hops1run7[order(hops1run7$packet_id), ]
hops1run8 <- hops1run8[order(hops1run8$packet_id), ]
hops1run9 <- hops1run9[order(hops1run9$packet_id), ]
hops1run10 <- hops1run10[order(hops1run10$packet_id), ]

df <- data.frame(
  packet_id = hops1run1$packet_id,
  hops1_1 = hops1run1$delivered_at,
  hops1_2 = hops1run2$delivered_at,
  hops1_3 = hops1run3$delivered_at,
  hops1_4 = hops1run4$delivered_at,
  hops1_5 = hops1run5$delivered_at,
  hops1_6 = hops1run6$delivered_at,
  hops1_7 = hops1run7$delivered_at,
  hops1_8 = hops1run8$delivered_at,
  hops1_9 = hops1run9$delivered_at,
  hops1_10 = hops1run10$delivered_at
)

hops1mean <- 0
hops1rate <- 0

for (i in 2:ncol(df)) {
  hops1mean <- hops1mean + mean(df[,i], na.rm = TRUE)
  hops1rate <- hops1rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
}

hops1mean <- hops1mean / (ncol(df) - 1)
hops1rate <- hops1rate / (ncol(df) - 1)

hops2run1 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-1.trace.csv")
hops2run2 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-2.trace.csv")
hops2run3 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-3.trace.csv")
hops2run4 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-4.trace.csv")
hops2run5 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-5.trace.csv")
hops2run6 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-6.trace.csv")
hops2run7 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-7.trace.csv")
hops2run8 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-8.trace.csv")
hops2run9 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-9.trace.csv")
hops2run10 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-2-buffer-2000-run-10.trace.csv")

hops2run1 <- hops2run1[order(hops2run1$packet_id), ]
hops2run2 <- hops2run2[order(hops2run2$packet_id), ]
hops2run3 <- hops2run3[order(hops2run3$packet_id), ]
hops2run4 <- hops2run4[order(hops2run4$packet_id), ]
hops2run5 <- hops2run5[order(hops2run5$packet_id), ]
hops2run6 <- hops2run6[order(hops2run6$packet_id), ]
hops2run7 <- hops2run7[order(hops2run7$packet_id), ]
hops2run8 <- hops2run8[order(hops2run8$packet_id), ]
hops2run9 <- hops2run9[order(hops2run9$packet_id), ]
hops2run10 <- hops2run10[order(hops2run10$packet_id), ]

df <- data.frame(
  packet_id = hops2run1$packet_id,
  hops2_1 = hops2run1$delivered_at,
  hops2_2 = hops2run2$delivered_at,
  hops2_3 = hops2run3$delivered_at,
  hops2_4 = hops2run4$delivered_at,
  hops2_5 = hops2run5$delivered_at,
  hops2_6 = hops2run6$delivered_at,
  hops2_7 = hops2run7$delivered_at,
  hops2_8 = hops2run8$delivered_at,
  hops2_9 = hops2run9$delivered_at,
  hops2_10 = hops2run10$delivered_at
)

hops2mean <- 0
hops2rate <- 0

for (i in 2:ncol(df)) {
  hops2mean <- hops2mean + mean(df[,i], na.rm = TRUE)
  hops2rate <- hops2rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
}

hops2mean <- hops2mean / (ncol(df) - 1)
hops2rate <- hops2rate / (ncol(df) - 1)

hops3run1 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-1.trace.csv")
hops3run2 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-2.trace.csv")
hops3run3 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-3.trace.csv")
hops3run4 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-4.trace.csv")
hops3run5 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-5.trace.csv")
hops3run6 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-6.trace.csv")
hops3run7 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-7.trace.csv")
hops3run8 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-8.trace.csv")
hops3run9 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-9.trace.csv")
hops3run10 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-3-buffer-2000-run-10.trace.csv")

hops3run1 <- hops3run1[order(hops3run1$packet_id), ]
hops3run2 <- hops3run2[order(hops3run2$packet_id), ]
hops3run3 <- hops3run3[order(hops3run3$packet_id), ]
hops3run4 <- hops3run4[order(hops3run4$packet_id), ]
hops3run5 <- hops3run5[order(hops3run5$packet_id), ]
hops3run6 <- hops3run6[order(hops3run6$packet_id), ]
hops3run7 <- hops3run7[order(hops3run7$packet_id), ]
hops3run8 <- hops3run8[order(hops3run8$packet_id), ]
hops3run9 <- hops3run9[order(hops3run9$packet_id), ]
hops3run10 <- hops3run10[order(hops3run10$packet_id), ]

df <- data.frame(
  packet_id = hops3run1$packet_id,
  hops3_1 = hops3run1$delivered_at,
  hops3_2 = hops3run2$delivered_at,
  hops3_3 = hops3run3$delivered_at,
  hops3_4 = hops3run4$delivered_at,
  hops3_5 = hops3run5$delivered_at,
  hops3_6 = hops3run6$delivered_at,
  hops3_7 = hops3run7$delivered_at,
  hops3_8 = hops3run8$delivered_at,
  hops3_9 = hops3run9$delivered_at,
  hops3_10 = hops3run10$delivered_at
)

hops3mean <- 0
hops3rate <- 0

for (i in 2:ncol(df)) {
  hops3mean <- hops3mean + mean(df[,i], na.rm = TRUE)
  hops3rate <- hops3rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
}

hops3mean <- hops3mean / (ncol(df) - 1)
hops3rate <- hops3rate / (ncol(df) - 1)

hops5run1 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-1.trace.csv")
hops5run2 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-2.trace.csv")
hops5run3 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-3.trace.csv")
hops5run4 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-4.trace.csv")
hops5run5 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-5.trace.csv")
hops5run6 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-6.trace.csv")
hops5run7 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-7.trace.csv")
hops5run8 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-8.trace.csv")
hops5run9 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-9.trace.csv")
hops5run10 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-5-buffer-2000-run-10.trace.csv")

hops5run1 <- hops5run1[order(hops5run1$packet_id), ]
hops5run2 <- hops5run2[order(hops5run2$packet_id), ]
hops5run3 <- hops5run3[order(hops5run3$packet_id), ]
hops5run4 <- hops5run4[order(hops5run4$packet_id), ]
hops5run5 <- hops5run5[order(hops5run5$packet_id), ]
hops5run6 <- hops5run6[order(hops5run6$packet_id), ]
hops5run7 <- hops5run7[order(hops5run7$packet_id), ]
hops5run8 <- hops5run8[order(hops5run8$packet_id), ]
hops5run9 <- hops5run9[order(hops5run9$packet_id), ]
hops5run10 <- hops5run10[order(hops5run10$packet_id), ]

df <- data.frame(
  packet_id = hops5run1$packet_id,
  hops5_1 = hops5run1$delivered_at,
  hops5_2 = hops5run2$delivered_at,
  hops5_3 = hops5run3$delivered_at,
  hops5_4 = hops5run4$delivered_at,
  hops5_5 = hops5run5$delivered_at,
  hops5_6 = hops5run6$delivered_at,
  hops5_7 = hops5run7$delivered_at,
  hops5_8 = hops5run8$delivered_at,
  hops5_9 = hops5run9$delivered_at,
  hops5_10 = hops5run10$delivered_at
)

hops5mean <- 0
hops5rate <- 0

for (i in 2:ncol(df)) {
  hops5mean <- hops5mean + mean(df[,i], na.rm = TRUE)
  hops5rate <- hops5rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
}

hops5mean <- hops5mean / (ncol(df) - 1)
hops5rate <- hops5rate / (ncol(df) - 1)

hops8run1 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-1.trace.csv")
hops8run2 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-2.trace.csv")
hops8run3 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-3.trace.csv")
hops8run4 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-4.trace.csv")
hops8run5 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-5.trace.csv")
hops8run6 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-6.trace.csv")
hops8run7 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-7.trace.csv")
hops8run8 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-8.trace.csv")
hops8run9 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-9.trace.csv")
hops8run10 <- read.csv("~/Apps/NS3/traces/epidemic/hop_count/rss-benchmark-range-100-hops-8-buffer-2000-run-10.trace.csv")

hops8run1 <- hops8run1[order(hops8run1$packet_id), ]
hops8run2 <- hops8run2[order(hops8run2$packet_id), ]
hops8run3 <- hops8run3[order(hops8run3$packet_id), ]
hops8run4 <- hops8run4[order(hops8run4$packet_id), ]
hops8run5 <- hops8run5[order(hops8run5$packet_id), ]
hops8run6 <- hops8run6[order(hops8run6$packet_id), ]
hops8run7 <- hops8run7[order(hops8run7$packet_id), ]
hops8run8 <- hops8run8[order(hops8run8$packet_id), ]
hops8run9 <- hops8run9[order(hops8run9$packet_id), ]
hops8run10 <- hops8run10[order(hops8run10$packet_id), ]

df <- data.frame(
  packet_id = hops8run1$packet_id,
  hops8_1 = hops8run1$delivered_at,
  hops8_2 = hops8run2$delivered_at,
  hops8_3 = hops8run3$delivered_at,
  hops8_4 = hops8run4$delivered_at,
  hops8_5 = hops8run5$delivered_at,
  hops8_6 = hops8run6$delivered_at,
  hops8_7 = hops8run7$delivered_at,
  hops8_8 = hops8run8$delivered_at,
  hops8_9 = hops8run9$delivered_at,
  hops8_10 = hops8run10$delivered_at
)

hops8mean <- 0
hops8rate <- 0

for (i in 2:ncol(df)) {
  hops8mean <- hops8mean + mean(df[,i], na.rm = TRUE)
  hops8rate <- hops8rate + (1 - (sum(is.na(df[,2])) / nrow(df)))
}

hops8mean <- hops8mean / (ncol(df) - 1)
hops8rate <- hops8rate / (ncol(df) - 1)

df_latency <- data.frame(
  hop_count = c('1 salto', '2 saltos', '3 saltos', '5 saltos', '8 saltos'),
  latency = c(hops1mean, hops2mean, hops3mean, hops5mean, hops8mean)
)

hops_latency_graph <- ggplot(data = df_latency, aes(x = hop_count, y = latency, fill = hop_count)) +
  geom_bar(stat = "identity") +
  guides(fill = FALSE) +
  xlab("Número de saltos") +
  ylab("Tempo de entrega (s)") +
  scale_fill_manual(values = c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442"))
hops_latency_graph

df_rate <- data.frame(
  hop_count = c('1 salto', '2 saltos', '3 saltos', '5 saltos', '8 saltos'),
  delivery_rate = c(hops1rate, hops2rate, hops3rate, hops5rate, hops8rate)
)
hops_rate_graph <- ggplot(data = df_rate, aes(x = hop_count, y = delivery_rate, fill = hop_count)) +
  geom_bar(stat = "identity") +
  guides(fill = FALSE) +
  xlab("Número de saltos") +
  ylab("Taxa de entrega (%)") +
  scale_fill_manual(values = c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442"))
hops_rate_graph