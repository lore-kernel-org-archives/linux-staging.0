Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F93D71
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:50:58 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id h1so8607158plt.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uk9A7KFysYcvmGVXWYf3VoOwupNCjbKRP8dtymmy4uk=;
        b=pW8zYcf43IiKFrfbxzbQVomcaR0Ob7Y+MWyH3XDrfC3YfHpUFSkPEI+yf7CYE47KSX
         ia1eYRPDWlaqhPLrBXvVILMvwjAGyp+AaDpYYuJAWjBWaRz2SKEqooA/7PfaBgforBxa
         sz372j6FnoLb2Mq1j7Lb8jO6POMs12WSF6JjAy7A/HUyu7WTr7SAjrEnffVQi6nEFADr
         YUNeooyjx3Kf6q8sDe2KfYJok7e7txZoHsp2162YHO6AHct7+PJSqMbHUyUpvOL4Ej9v
         Y+VSvbcL3FOi8kfzaPloftnFNAUYpTro4Dv3KJ8izqARE3oRytl8ED9g3QSkOAdGGdhU
         VrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uk9A7KFysYcvmGVXWYf3VoOwupNCjbKRP8dtymmy4uk=;
        b=Vx2zzwWsyg+p1cq138IsYTxNXW/dmC8myX2esO10uRgzrLPmTYOHUSHYfvX1YPazyv
         XU/N7TpG9p8WHjBxqesfkjGXsItNe2EJA0H30dFz72xGYPLealuFmxtIYpqo5hZq/yVJ
         rrqgG1ZsJNcLHrdse7Sir8he3IjyxoSm8mFNrtr2SlxaD99gKvJZUjtx6pwhHpZQFtTq
         Gg6cQ/sQ+FKAFlQych9GLSE2mr3TnwHFSFExVJ6EJ8wo1B75NNM4ndzk/PREXcarI4Av
         vmg4SbSh2WrtHVYMA4IRLslsSx2WRoptbXQ1DtG5TJixCYw/eTU5EwVEltmuZqtlv4H4
         ZraQ==
X-Gm-Message-State: AOAM532pMe465tTYcasfuCPW+w8wjvBoGUeuHMZSfEStQN8YLm2m/IW3
	yRxxw30sTd1Lh/FcMIH5mjDnIINs92lvZBZp
X-Google-Smtp-Source: ABdhPJwIvYWpAcKpURINZG6U/3N9v106fQ+fXn+eeNs+r+FAdK/vZMuP9iT4PcXEYeV63sW+zIwefw==
X-Received: by 2002:a17:90b:ecf:: with SMTP id gz15mr9419265pjb.131.1624283458189;
        Mon, 21 Jun 2021 06:50:58 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id o189sm9276461pga.78.2021.06.21.06.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:50:57 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 11/19] staging: qlge: the number of pages to contain a buffer queue is constant
Date: Mon, 21 Jun 2021 21:48:54 +0800
Message-Id: <20210621134902.83587-12-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is extented work of commit ec705b983b46b8e2d3cafd40c188458bf4241f11
("staging: qlge: Remove qlge_bq.len & size"). Since the same len is used
for both sbq (small buffer queue) and lbq (large buffer queue), the
number of pages to contain a buffer queue is also known at compile time.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/qlge.h      | 13 ++++++-------
 drivers/staging/qlge/qlge_main.c |  8 ++++----
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index 9177baa9f022..32755b0e2fb7 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -42,16 +42,15 @@
 
 #define DB_PAGE_SIZE 4096
 
-/* Calculate the number of (4k) pages required to
- * contain a buffer queue of the given length.
+/*
+ * The number of (4k) pages required to contain a buffer queue.
  */
-#define MAX_DB_PAGES_PER_BQ(x) \
-		(((x * sizeof(u64)) / DB_PAGE_SIZE) + \
-		(((x * sizeof(u64)) % DB_PAGE_SIZE) ? 1 : 0))
+#define MAX_DB_PAGES_PER_BQ \
+		(((QLGE_BQ_LEN * sizeof(u64)) / DB_PAGE_SIZE) + \
+		(((QLGE_BQ_LEN * sizeof(u64)) % DB_PAGE_SIZE) ? 1 : 0))
 
 #define RX_RING_SHADOW_SPACE	(sizeof(u64) + \
-		MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN) * sizeof(u64) + \
-		MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN) * sizeof(u64))
+		MAX_DB_PAGES_PER_BQ * sizeof(u64) * 2)
 #define LARGE_BUFFER_MAX_SIZE 4096
 #define LARGE_BUFFER_MIN_SIZE 2048
 
diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 94853b182608..7aee9e904097 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3015,8 +3015,8 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
 		shadow_reg_dma += sizeof(u64);
 		rx_ring->lbq.base_indirect = shadow_reg;
 		rx_ring->lbq.base_indirect_dma = shadow_reg_dma;
-		shadow_reg += (sizeof(u64) * MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN));
-		shadow_reg_dma += (sizeof(u64) * MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN));
+		shadow_reg += (sizeof(u64) * MAX_DB_PAGES_PER_BQ);
+		shadow_reg_dma += (sizeof(u64) * MAX_DB_PAGES_PER_BQ);
 		rx_ring->sbq.base_indirect = shadow_reg;
 		rx_ring->sbq.base_indirect_dma = shadow_reg_dma;
 		/* PCI doorbell mem area + 0x18 for large buffer consumer */
@@ -3034,7 +3034,7 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
 			tmp += DB_PAGE_SIZE;
 			base_indirect_ptr++;
 			page_entries++;
-		} while (page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN));
+		} while (page_entries < MAX_DB_PAGES_PER_BQ);
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
 			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
@@ -3051,7 +3051,7 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
 			tmp += DB_PAGE_SIZE;
 			base_indirect_ptr++;
 			page_entries++;
-		} while (page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN));
+		} while (page_entries < MAX_DB_PAGES_PER_BQ);
 		cqicb->sbq_addr = cpu_to_le64(rx_ring->sbq.base_indirect_dma);
 		cqicb->sbq_buf_size = cpu_to_le16(QLGE_SMALL_BUFFER_SIZE);
 		cqicb->sbq_len = cpu_to_le16(QLGE_FIT16(QLGE_BQ_LEN));
-- 
2.32.0

