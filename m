Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B510F71
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:51:47 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id y21so2732061plb.4
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yaqSHxaezIY9lDpJVOshFr2LKj7NNyUw2GLUsi5+kqc=;
        b=c67stKUAr73vcfRW1Dd2usP+4E0y6ePTCHpOLdQlp/Cx8FYYa25vHEvzfEpX5JfkKQ
         6mDeh28T+WcaFmAKSfL1vqEv4nKF3u50MmIu9eg22ZTAXr/JN0KlnEb8Sr9C2R5x5M37
         igxpbDhfNQbqFNEtsvhjXMKcGMeNkl9HyDloVrL2BbPm9mkbVuCM7oFSWhwe2HI9g/bA
         B9nfyE5ZosqAn54w+Jpo7xvYxf18xkV66LXZcb857xg9sQNq5Do5rVsDW6o3eQi1w3z6
         wbXVJddb7ZoeJ5RY7Lo5Z9dtkdHvMYfAXOMj79NzhhJwBa4PEfUDD8waK0vjc98ONIyx
         uFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yaqSHxaezIY9lDpJVOshFr2LKj7NNyUw2GLUsi5+kqc=;
        b=tn8S3CHAzNRFrEQ7GVwYteViMBAoLrAP2mk+0LOAAQHFwvFBt9b8T+XW4tJXeQAm1d
         rFCO1zTuNCJqvZrky8uUAjMeN7jGgT5McIFJndS3ojCEcXM7WNQwGLr9P+v0cC2whzfb
         ug4kTXfmxPcK+g/YK8WausRz9j4h6b5gzYzOMmf/WS6CEXLpNMFmKfHgf/j5P5zfqSEV
         nydqiZo8JsZlvhLJAgHjsS9rN59fzOMrNw0u5KSymqQWLVuFdgpBmjXIrk9IQ9ksQ9uv
         z01dbGjW7xsenZX+6TirxPKxO/Zwwrn8MYYFWuYdsA1/SlXsXXuaKKXw5TE+6SKWXLoI
         bfsg==
X-Gm-Message-State: AOAM532iPMdLj8Wg2oLt2ED52jurOy/lSjNbsEjwVd9TSqok2nf/vydN
	toClK2EZPKAPbm1A1/B3DY7KQ/qTb/ff2Evg
X-Google-Smtp-Source: ABdhPJx6nEjz0q2zE0jrdffy18CuqwHoKdgH74Cd1p1ZHJIwyLZ3KgoICDXjpMcnqM0/aS9VnjqHDQ==
X-Received: by 2002:a17:90a:4491:: with SMTP id t17mr24443671pjg.30.1624283507346;
        Mon, 21 Jun 2021 06:51:47 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id u24sm16581779pfm.156.2021.06.21.06.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:51:46 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 16/19] staging: qlge: remove deadcode in qlge_build_rx_skb
Date: Mon, 21 Jun 2021 21:48:59 +0800
Message-Id: <20210621134902.83587-17-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This part of code is for the case that "the headers and data are in
a single large buffer". However, qlge_process_mac_split_rx_intr is for
handling packets that packets underwent head splitting. In reality, with
jumbo frame enabled, the part of code couldn't be reached regardless of
the packet size when ping the NIC.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/TODO        |  6 ---
 drivers/staging/qlge/qlge_main.c | 66 ++++++++------------------------
 2 files changed, 17 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/qlge/TODO b/drivers/staging/qlge/TODO
index 4575f35114bf..0f96186ed77c 100644
--- a/drivers/staging/qlge/TODO
+++ b/drivers/staging/qlge/TODO
@@ -1,9 +1,3 @@
-* commit 7c734359d350 ("qlge: Size RX buffers based on MTU.", v2.6.33-rc1)
-  introduced dead code in the receive routines, which should be rewritten
-  anyways by the admission of the author himself, see the comment above
-  ql_build_rx_skb(). That function is now used exclusively to handle packets
-  that underwent header splitting but it still contains code to handle non
-  split cases.
 * the driver has a habit of using runtime checks where compile time checks are
   possible (ex. ql_free_rx_buffers(), ql_alloc_rx_buffers())
 * remove duplicate and useless comments
diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 904dba7aaee5..e560006225ca 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -1741,55 +1741,23 @@ static struct sk_buff *qlge_build_rx_skb(struct qlge_adapter *qdev,
 			sbq_desc->p.skb = NULL;
 		}
 	} else if (ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL) {
-		if (ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HS) {
-			netif_printk(qdev, rx_status, KERN_DEBUG, qdev->ndev,
-				     "Header in small, %d bytes in large. Chain large to small!\n",
-				     length);
-			/*
-			 * The data is in a single large buffer.  We
-			 * chain it to the header buffer's skb and let
-			 * it rip.
-			 */
-			lbq_desc = qlge_get_curr_lchunk(qdev, rx_ring);
-			netif_printk(qdev, rx_status, KERN_DEBUG, qdev->ndev,
-				     "Chaining page at offset = %d, for %d bytes  to skb.\n",
-				     lbq_desc->p.pg_chunk.offset, length);
-			skb_fill_page_desc(skb, 0, lbq_desc->p.pg_chunk.page,
-					   lbq_desc->p.pg_chunk.offset, length);
-			skb->len += length;
-			skb->data_len += length;
-			skb->truesize += qdev->lbq_buf_size;
-		} else {
-			/*
-			 * The headers and data are in a single large buffer. We
-			 * copy it to a new skb and let it go. This can happen with
-			 * jumbo mtu on a non-TCP/UDP frame.
-			 */
-			lbq_desc = qlge_get_curr_lchunk(qdev, rx_ring);
-			skb = napi_alloc_skb(&rx_ring->napi, QLGE_SMALL_BUFFER_SIZE);
-			if (!skb) {
-				netif_printk(qdev, probe, KERN_DEBUG, qdev->ndev,
-					     "No skb available, drop the packet.\n");
-				return NULL;
-			}
-			dma_unmap_page(&qdev->pdev->dev, lbq_desc->dma_addr,
-				       qdev->lbq_buf_size,
-				       DMA_FROM_DEVICE);
-			skb_reserve(skb, NET_IP_ALIGN);
-			netif_printk(qdev, rx_status, KERN_DEBUG, qdev->ndev,
-				     "%d bytes of headers and data in large. Chain page to new skb and pull tail.\n",
-				     length);
-			skb_fill_page_desc(skb, 0, lbq_desc->p.pg_chunk.page,
-					   lbq_desc->p.pg_chunk.offset,
-					   length);
-			skb->len += length;
-			skb->data_len += length;
-			skb->truesize += qdev->lbq_buf_size;
-			qlge_update_mac_hdr_len(qdev, ib_mac_rsp,
-						lbq_desc->p.pg_chunk.va,
-						&hlen);
-			__pskb_pull_tail(skb, hlen);
-		}
+		netif_printk(qdev, rx_status, KERN_DEBUG, qdev->ndev,
+			     "Header in small, %d bytes in large. Chain large to small!\n",
+			     length);
+		/*
+		 * The data is in a single large buffer.  We
+		 * chain it to the header buffer's skb and let
+		 * it rip.
+		 */
+		lbq_desc = qlge_get_curr_lchunk(qdev, rx_ring);
+		netif_printk(qdev, rx_status, KERN_DEBUG, qdev->ndev,
+			     "Chaining page at offset = %d, for %d bytes  to skb.\n",
+			     lbq_desc->p.pg_chunk.offset, length);
+		skb_fill_page_desc(skb, 0, lbq_desc->p.pg_chunk.page,
+				   lbq_desc->p.pg_chunk.offset, length);
+		skb->len += length;
+		skb->data_len += length;
+		skb->truesize += qdev->lbq_buf_size;
 	} else {
 		/*
 		 * The data is in a chain of large buffers
-- 
2.32.0

