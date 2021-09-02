Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C43FCD
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 21:36:05 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x6so1669712wrv.13
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 14:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=6jo/SeRsF0/cH1rEbtARKHrr8bYBF5vAMrnioOdOcqQ=;
        b=kcawKE7dK1XBMjPvYGNt5OcITyjpgqhuF2z9kPluF6RDUum4EKMn2jTJ4IFW1F+z2V
         hsQuVXCnQlSi4sOFvYvrulgCrFGYzUF0sblIcVnoRo/dlA4SCxxGp7mpvHm8Rdkzz5YG
         3tv4AvdIBaDydCZ73J4K728v+fpJ67+dL7SX8Fvxe24Gal3azzwQv8G7/OVfCrGguj39
         sK9JYSN48Pjn0cVCsWUAc+c00sLf0tbk0D/27gRYozcLubSFqIUz7jEsibDoKnZsdumY
         5+dOt1ZTwmDmGCGhvwB5TEt7R7NNhYHej23I87K+rUK30WYRvsrycetGRSYdxeeKuQ9N
         WSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=6jo/SeRsF0/cH1rEbtARKHrr8bYBF5vAMrnioOdOcqQ=;
        b=kj1sOTSFBPODK+FZgJtmhQcmW3IMAKPKv/kBEiqlhc4nvbX5RGativud12pBtT0Cwn
         1v0oeQ8cGKYng88Ho3wl1RSNzXk/0F5gcW+oj4kSgJve7FJcsJ+dV5j7bFWOaWkTOGEJ
         V1YP76s6MnLxv7kxqktqChFrgq0D3/rzVdp+tf9fJzDnc0tqbWgY4kYTseI7LE7Z7dsl
         ODic6/PeBi1MrK+Hbf0o2djwPQ8m6YYNZRlp9l5YK/wGFsm3GqB5GrXuYgKajxEoObgY
         ejPpmrxOR0xr0Fx3QapIAXBcdVYOQhedncbBVBHB3F2oYRSM0gHMAX9NSZna6AZbq9OU
         YrBA==
X-Gm-Message-State: AOAM5331aEhIqPmodwywgHDO5QA3i+Qbwg2gSFn9u09MEfbamYCIcC2X
	5NyNEnF7pyLw/HTW7m48LwW7zoxZllQ=
X-Google-Smtp-Source: ABdhPJxHeEfrOjPdDzxdv2Sy+lM1bbzM8y9Of+IebgNrxFytgbvvHzFPT+/XlqeL8Ti/2awBejdsbw==
X-Received: by 2002:adf:c40d:: with SMTP id v13mr1542062wrf.388.1630532163791;
        Wed, 01 Sep 2021 14:36:03 -0700 (PDT)
Received: from panther (190.red-88-4-24.dynamicip.rima-tde.net. [88.4.24.190])
        by smtp.gmail.com with ESMTPSA id q14sm600655wrc.31.2021.09.01.14.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 14:36:03 -0700 (PDT)
Date: Thu, 2 Sep 2021 13:11:18 +0200
From: Krish Jain <krishjain02939@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] Fix formatting for file "hsdma-mt7621.c"
Message-ID: <20210902111118.GA576891@panther>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Krish Jain <krishjain02939@gmail.com>

This patch fixes the format of the code. It properly formats lines that should not end with a '(' as suggested by checkpath.pl.

Signed-off-by: Krish Jain <krishjain02939@gmail.com>

---
 drivers/staging/mt7621-dma/hsdma-mt7621.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
index b0ed935de7ac..89b72a802800 100644
--- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
+++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
@@ -162,8 +162,7 @@ struct mtk_hsdam_engine {
 	struct mtk_hsdma_chan chan[1];
 };
 
-static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(
-		struct mtk_hsdma_chan *chan)
+static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
 {
 	return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
 			ddev);
@@ -174,8 +173,7 @@ static inline struct mtk_hsdma_chan *to_mtk_hsdma_chan(struct dma_chan *c)
 	return container_of(c, struct mtk_hsdma_chan, vchan.chan);
 }
 
-static inline struct mtk_hsdma_desc *to_mtk_hsdma_desc(
-		struct virt_dma_desc *vdesc)
+static inline struct mtk_hsdma_desc *to_mtk_hsdma_desc(struct virt_dma_desc *vdesc)
 {
 	return container_of(vdesc, struct mtk_hsdma_desc, vdesc);
 }
@@ -457,9 +455,7 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
 	spin_unlock_bh(&chan->vchan.lock);
 }
 
-static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
-		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
-		size_t len, unsigned long flags)
+static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src, size_t len, unsigned long flags)
 {
 	struct mtk_hsdma_chan *chan = to_mtk_hsdma_chan(c);
 	struct mtk_hsdma_desc *desc;
-- 
2.25.1

