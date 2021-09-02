Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB752FAF
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 21:38:41 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id u9so1712175wrg.8
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 14:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=1UqelwOIW4rRogtjnWjm8nkumANrfwZLvotA8MVovNQ=;
        b=blweDPs5Ym26j1kB1I5flBDfYzvZuEUVmcx5ZMmZQ9kYJ63fCxZkteFAghiSxuAIdd
         x2egUaG5MZeb4a2mL/0DOfAOCC+Rc95smYMXUPIcuFq1Ia0thvYZP9lXucGsT3vxiNbl
         6kliOt7HwEtcH4uT2f+fJXtU9Ak6eWORQHIWo/+MynGkFdv6cGyom02WntCP3zN21ML0
         aiJXaGvbbGzhmJWVrjAaDO/3WXaSq1MVAwgA4nxSZTs/y1RaYNubpejNkals/1X+2Edy
         ho7WImVbnoh7cZRWQaVcfkPQb7T7WEamj6ee0209SLrv531hRcgmKtlx5ThZZiZ4Yiqp
         SsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=1UqelwOIW4rRogtjnWjm8nkumANrfwZLvotA8MVovNQ=;
        b=oxDiXrdj0co1HIGs5dk9xcQe9yoI+LWGfsa6dKasfjCbK2VcKXnKWXWWqlZcM5FCe9
         36vlpHGnXn7+fterk1grRzjcFLJxVJXmHX8ZO6nm9c4ooW+Qw+5FPR83IMvMuFIwKCeb
         sjsY/P1gGF1h8C8CNo7itfS9NnFu40hT6N3mvUG9+XO6WgCk6XuaiN1KMqXqvTUq/bxA
         /K5zYIjePNv8BWZ/RAIxJns73jdXuHvqrQS8xPizNQQKpaxjrERTc6wYU/r5pcPUv75J
         lX+IY+66UluS8DXyPgz8kG3zDXCgq+w7eU/rd9w/s6Y8Ja+vVdUz0qAnTQzPZAyEKfOI
         AbcA==
X-Gm-Message-State: AOAM533UOZWI41XtYKFWuremcU5quh7lI+hpBHolPKYl+tN50Fz/GreC
	Av7IgjlpSgswOWT4BjJi0m4OI6/+F38=
X-Google-Smtp-Source: ABdhPJxNhJZrUUQqBGUlgTA0fYhCJbiVa9kJ/dooYPRvP7iuyNnCpT30IkcRaAZwfPAUeZkp6zEIxA==
X-Received: by 2002:adf:cd0f:: with SMTP id w15mr5526wrm.346.1630532320272;
        Wed, 01 Sep 2021 14:38:40 -0700 (PDT)
Received: from panther (190.red-88-4-24.dynamicip.rima-tde.net. [88.4.24.190])
        by smtp.gmail.com with ESMTPSA id c13sm582537wru.73.2021.09.01.14.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 14:38:39 -0700 (PDT)
Date: Thu, 2 Sep 2021 13:13:39 +0200
From: Krish Jain <krishjain02939@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] Fix formatting for file "hsdma-mt7621.c"
Message-ID: <20210902111339.GA577108@panther>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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

