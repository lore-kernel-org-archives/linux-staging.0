Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D7672
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 20:59:08 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id u9so5186196wrg.8
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=fQMkshjCdoNwEquAo2xLTCXquuKaW4ZqNGjCsNig7vE=;
        b=Zlvg0fHNpDnI3FxUsDmMbD4Pfc+qpLi8jLCP3fV+mdOj06raXl0iIOaXUdKkxjhuKl
         /+p2ZkpsBanvj7Kr0NrlnlxAWq24ayla4QWWgVIbcB7RRDp52qikgrMsjEEIiiTPWrgf
         yPJkIqKltCcveUV24raF1/zazH/4wYcP+TLoY+NOJZlJX+zn5+z16O8+5MTkWlP7RURU
         NC8rMVggLuwH2FiFFa6OIfp+cUM6iR/iGw490eS5KlRyJmM4+3/j/lG6EH4kwHBbkEky
         kktCquagL+eE+eLplC9GJHbxqLKcHL/KrjJkvs0aLE/t2fV3ElKWF8sOe2feHjslpRUE
         fZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=fQMkshjCdoNwEquAo2xLTCXquuKaW4ZqNGjCsNig7vE=;
        b=K+YcP1ifuW0A5R75Y4I9Wqm3J5aZQLjVzJO58e26DQvWT/Ox1AngnMvATBfIljJZv5
         YBl2gL0Qy0GDxbe3Gt1IPfzxyJyuc/PMs1+5S5jXVCZRlUmlEJf0g/u0QXb1TzchbPkg
         riTpGbHMX4zbOCbGvi4O++Q/YzkdM0/ELCcyrIYkX290tG7k06GRIXZbpd7tCWEMaban
         EddmsfCQVOKCDPFcXUmkhfCSm0ZTuSHBCoXcKqwLoRaL2lSrLFk6lF3zOtWEUsRK4QOj
         +gf+nMuuJVJdSB8QV1JgzOBmsGIpcdbHmHkRaYGNSG81GnOf3MCTqX8Ev0VLJA7HtwTC
         vA/w==
X-Gm-Message-State: AOAM530Azd7381XDtQNL5PKJ6V9V3HMFg8aMFmTyMTmuMGgn7W0GA/bV
	EaLotXjAlr1Mwi3h6OmudYk=
X-Google-Smtp-Source: ABdhPJzJT5PsAgPGmjZfZqK7Qm45Dy4s2KVaHZBVwNoubK4Xv0NhQTlrLOPXtsIyZcLN81QFm/KWig==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr270259wre.344.1631134746418;
        Wed, 08 Sep 2021 13:59:06 -0700 (PDT)
Received: from panther (190.red-88-4-24.dynamicip.rima-tde.net. [88.4.24.190])
        by smtp.gmail.com with ESMTPSA id l26sm3037120wmi.13.2021.09.08.13.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 13:59:05 -0700 (PDT)
Date: Wed, 8 Sep 2021 22:59:03 +0200
From: Krish Jain <krishjain02939@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v3] staging/mt7621-dma: Format lines in "hsdma-mt7621.c"
 ending with an open parenthesis
Message-ID: <20210908205903.GA108157@panther>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the format of the code. It properly formats lines that
should not end with a '(' as suggested by checkpath.pl.

Signed-off-by: Krish Jain <krishjain02939@gmail.com>
---
 drivers/staging/mt7621-dma/hsdma-mt7621.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
index b0ed935de7ac..1424d01d434b 100644
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
-- 
2.25.1

