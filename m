Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB963FC9
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 20:48:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u9so3697021wrg.8
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=YtO5RfmSEUHgUxw3hz9c0tESRCB4tsWTWughH3zQrtc=;
        b=Tyjz2h8HEOJwURMA1Ly02sMSPLn8sZKkg9bvgxM0pqbFj0J9h1NRSnveX6vhSzgNq0
         aQdAp49sd+XUM3GJ4ISGH9HALVq3Loy5W4wJYZnUJtIuS9UpGk585QfXOON04zPNdUR7
         NLuk4nByG6ouoIh/qzfmihiUc8vMg5kyRTXVnJhzp0DnlWfeTv/1/CPtOHctewdNd9jV
         qwUs3GH1WkQqIChF4qX3Titf2kxbhkDKviwd2U202lQi5cg1/0+leHTxAkHDSAciFG/T
         L0z5NfCimsIW/la7/dK8ZVlWKd8oiD7sBHqUXKn5vxQhHZHqf6zTiATEVmcJP0IqespH
         gOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=YtO5RfmSEUHgUxw3hz9c0tESRCB4tsWTWughH3zQrtc=;
        b=QirrwOMcyMA/Lm/vs23X84o5D4TRXiA24RxPiyrCjH4ipBK7j0lgzvWdcVKSdlewrr
         CxnXS6H1xpKP9+T0ZUimR2T4TyxP++Kx4AByK/XxX4r5uuryUihJfb26tc6NvP3XG6qP
         8r124iP+4sSeJ2QSlUEPdhg/P0LHDRFDVVEyDi2VUY68LsJX4TE3cORIV5uAwbFMGpYo
         vu+483XB6n1F2/p9wTOLz9aU1iJl6u7UMoWe4dPUtXnJW3+dNL29vB+roxNR3PWfV/5s
         0sLqN0Oq7Z/sxXNdDZBsdNAox5wYFPYRnuDKAe5VREPkX0/f2FWzGs90OvGFMPcApyGb
         h/Vg==
X-Gm-Message-State: AOAM5307XUROygp+XHt+Ct/gIJqrcNhupw9pS1IarNi1lmfLwye/YvV8
	0yIIoiU8Ws3tnK2rWJ7qBrtH1M2s6co=
X-Google-Smtp-Source: ABdhPJwOCJmTlX6L+Lsg40FmvDAXXm1tyZcQ/BHGM5Ee6fw8KH8Zgmok1DYNe9I/uE0Zq3EUqqfUfA==
X-Received: by 2002:adf:c452:: with SMTP id a18mr5411484wrg.225.1630788505773;
        Sat, 04 Sep 2021 13:48:25 -0700 (PDT)
Received: from panther (190.red-88-4-24.dynamicip.rima-tde.net. [88.4.24.190])
        by smtp.gmail.com with ESMTPSA id z17sm3100060wrh.66.2021.09.04.13.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 13:48:25 -0700 (PDT)
Date: Sun, 5 Sep 2021 11:02:01 +0200
From: Krish Jain <krishjain02939@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v2] mt7621-dma: Properly format lines in "hsdma-mt7621.c"
 ending with an open parenthesis
Message-ID: <20210905090201.GA283023@panther>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Krish Jain <krishjain02939@gmail.com>

This patch fixes the format of the code. It properly formats lines that
should not end with a '(' as suggested by checkpath.pl.

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

