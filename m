Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AD471
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:49:41 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id g22so14218892pgk.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L3aJmS+A5BgPt7scDAGNNWhO+vstoQ9bplelvtban/o=;
        b=aOBfGhsGV/NRRTJeWDNv1z2nkwtvmYnwdFVVgldj0IhV9Q1geXvY7Z9nnZQlwK+Rbc
         qk5YZ5aoOpdkwISZyz4dOCvaldF5KTmZ+mhIWZjtSASooLEyjZE00qBS/Om5znfIqsNV
         JSTF6fEJRVqb2QuyMqjZY/bbeLfCQIvpIj1Jzs4wlyZdH730LJJksdmBL0YRHiDk9J1i
         ekSpgge0OpCm2BLgSJXFpkTMITKLlOh6D8VDjcELFy19cdB8RaHskS9plLqXcWdDa5EJ
         GUVjB7YybpgG43u/RJjRQPpovrMkoG9cXG7DtzBKimJSxcHpV7xIK5fKb9QkXxn5Pmt3
         s0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L3aJmS+A5BgPt7scDAGNNWhO+vstoQ9bplelvtban/o=;
        b=T9ZEaIFs3N5NFgXrJzxSl3OZmVobxaspI+UqSnxZ5J+xWE8L6mEe2jW+ZCsdGwSdO+
         s3t74lVt+tqv4dmRI9/e1bvmaf5nP6qCRhifG0rf6c41rwv0EobLB66RtPEBk+MlMwNX
         nzbaQX6V7OvJxIpQzRMhtDmmBQNrV8q587tmWGImCG0h+eBOujIn6MKPkZ7Pwj2oYBrT
         25ATck8SZqSIrohvDxakfvhwF8GzK1cFZNSyeddQaaRDkgNhAoh7lSvK5bAF4EhSiGho
         lHU7wK0yGaGBEGyNYk8Co2c0NoMUM1+G+1BM1Uqasm1ef2P3ZrxWmkMotwVpaa4tIR+8
         AD9A==
X-Gm-Message-State: AOAM5305pTShSKu3qxT07KalMo4oQUt5gm4j7D22+F/vv4h5LZfYgB9a
	hmXrAzIuuCem+fMOtq9h3RL3nEDfmWSTHN5I
X-Google-Smtp-Source: ABdhPJx6GhFN8rBBIVU5c7BUKeFC5mwf3vsK+P3X25A5+EpaHo0zFKilXMuP9A16UB/t5FJOPr9V4g==
X-Received: by 2002:a63:5705:: with SMTP id l5mr23575883pgb.227.1624283381216;
        Mon, 21 Jun 2021 06:49:41 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id y15sm15913517pji.47.2021.06.21.06.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:49:40 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 03/19] staging: qlge: alloc skb with only enough room for header when data is put in the fragments
Date: Mon, 21 Jun 2021 21:48:46 +0800
Message-Id: <20210621134902.83587-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Data is put in the fragments. No need to alloc a skb with unnecessarily
large data buffer.

Suggested-by: Benjamin Poirier <benjamin.poirier@gmail.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/TODO        | 2 --
 drivers/staging/qlge/qlge_main.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/qlge/TODO b/drivers/staging/qlge/TODO
index 0e26fac1ddc5..49cb09fc2be4 100644
--- a/drivers/staging/qlge/TODO
+++ b/drivers/staging/qlge/TODO
@@ -4,8 +4,6 @@
   ql_build_rx_skb(). That function is now used exclusively to handle packets
   that underwent header splitting but it still contains code to handle non
   split cases.
-* in the "chain of large buffers" case, the driver uses an skb allocated with
-  head room but only puts data in the frags.
 * rename "rx" queues to "completion" queues. Calling tx completion queues "rx
   queues" is confusing.
 * struct rx_ring is used for rx and tx completions, with some members relevant
diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 6dd69b689a58..c91969b01bd5 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -1471,7 +1471,7 @@ static void qlge_process_mac_rx_page(struct qlge_adapter *qdev,
 	struct napi_struct *napi = &rx_ring->napi;
 	size_t hlen = ETH_HLEN;
 
-	skb = netdev_alloc_skb(ndev, length);
+	skb = napi_alloc_skb(&rx_ring->napi, SMALL_BUFFER_SIZE);
 	if (!skb) {
 		rx_ring->rx_dropped++;
 		put_page(lbq_desc->p.pg_chunk.page);
@@ -1765,7 +1765,7 @@ static struct sk_buff *qlge_build_rx_skb(struct qlge_adapter *qdev,
 			 * jumbo mtu on a non-TCP/UDP frame.
 			 */
 			lbq_desc = qlge_get_curr_lchunk(qdev, rx_ring);
-			skb = netdev_alloc_skb(qdev->ndev, length);
+			skb = napi_alloc_skb(&rx_ring->napi, SMALL_BUFFER_SIZE);
 			if (!skb) {
 				netif_printk(qdev, probe, KERN_DEBUG, qdev->ndev,
 					     "No skb available, drop the packet.\n");
-- 
2.32.0

