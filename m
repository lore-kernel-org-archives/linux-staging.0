Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2CB3FCD
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 20:59:07 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so598886pjc.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=vZaPFR910A+peByQ064AQctC74vcmHflxe3uQT3LOKI=;
        b=kCHoTXp68Dh71TAwR2mPmmz1sLUQC/IyjUrgvToj63qxt1KMR0esatlr3Le/TzH+gw
         kaWVKM7+dNqbjVVYQP/yW+J8OrHEILsbDU7f9upQgoSQG9ii+VGFerLrkF3iVnlVveeX
         6oeMRSknNUSWbXZllnF6jSB8PTw8RlIeTNL0DF7yD0KmQf3tPL5LBy0BtA8PVJsH/70A
         sFDJTeXGcXAOL0vrz11kPmFao9bWwkrV1A4a6WYoAUp9jXZDAi3Ut5wJOgLqPvlAeA9f
         iKtt4H8vJmsVf0KMxBVoHgf66rmqRu5WGvP9uyK+iGhkYvhhU+pxQFFgobz9POhmj0UO
         xLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=vZaPFR910A+peByQ064AQctC74vcmHflxe3uQT3LOKI=;
        b=bOJsCwV86cMZj3yFVrfrf5sFlshJKQKEnYl8i8cD3YZoMJhEIO2ta+vlrxpwYOXfp2
         0jtTamPH0M/LRwAVTKaaULTl/XQI3Eiy9S/ev8oypadnFGHhTZudIdSXgFH7GLUtJQgM
         JNOxpCEDEq3qtcarWn7BBNcrLHXpkzpozbcRt99cDMEKFJzrW5lpEhWEov9XhfB/IIcx
         8rTe0fjSH7iXEgEJ3DeOjj1fB/74Jx1kwAdlqL7K/vG48ZEg4/guVbEKzIhkxHD6qoEe
         iUQk88HEsW2NC3y0ffDTOHZwRRe6seV4qtvpEpVD6eOIps99iX/iZO3E3L6E9CqZtP8t
         iLZA==
X-Gm-Message-State: AOAM531DMqh/SJ0xecNzg0PE0MomG+cdqNMm7mDCCJvfGjGeJpsJy65m
	d5+Emg23BqkuRt8UXhsTt+56xEV6vgUbWoFu2Gq3MdGzxI9DxA==
X-Google-Smtp-Source: ABdhPJyuHslppk+qr3pxgIfewgC03RDZGAdXMKXIeFOQTyVRaPbg+eTEKkctaDh/p5H/M2ro/gU0zMAuoehpQfyPFTI=
X-Received: by 2002:a17:90a:520c:: with SMTP id v12mr1303547pjh.105.1630529946799;
 Wed, 01 Sep 2021 13:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Krish Jain <krishjain02939@gmail.com>
Date: Wed, 1 Sep 2021 22:58:55 +0200
Message-ID: <CAPGkw+zcW+mG2hnvQZqPzeS3T2AobYmZkoPKkqHo-KK3MSKTaA@mail.gmail.com>
Subject: [PATCH] Fix formatting for file "hsdma-mt7621.c" by fixing formatting
 of lines ending with "("
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Krish Jain <krishjain02939@gmail.com>

This patch fixes the format of the code. It properly formats lines
that should not end with a '(' as suggested by checkpath.pl.

Signed-off-by: Krish Jain <krishjain02939@gmail.com>

---
 drivers/staging/mt7621-dma/hsdma-mt7621.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c
b/drivers/staging/mt7621-dma/hsdma-mt7621.c
index b0ed935de7ac..89b72a802800 100644
--- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
+++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
@@ -162,8 +162,7 @@ struct mtk_hsdam_engine {
  struct mtk_hsdma_chan chan[1];
 };

-static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(
- struct mtk_hsdma_chan *chan)
+static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct
mtk_hsdma_chan *chan)
 {
  return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
  ddev);
@@ -174,8 +173,7 @@ static inline struct mtk_hsdma_chan
*to_mtk_hsdma_chan(struct dma_chan *c)
  return container_of(c, struct mtk_hsdma_chan, vchan.chan);
 }

-static inline struct mtk_hsdma_desc *to_mtk_hsdma_desc(
- struct virt_dma_desc *vdesc)
+static inline struct mtk_hsdma_desc *to_mtk_hsdma_desc(struct
virt_dma_desc *vdesc)
 {
  return container_of(vdesc, struct mtk_hsdma_desc, vdesc);
 }
@@ -457,9 +455,7 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
  spin_unlock_bh(&chan->vchan.lock);
 }

-static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
- struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
- size_t len, unsigned long flags)
+static struct dma_async_tx_descriptor
*mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest,
dma_addr_t src, size_t len, unsigned long flags)
 {
  struct mtk_hsdma_chan *chan = to_mtk_hsdma_chan(c);
  struct mtk_hsdma_desc *desc;
-- 
2.25.1
