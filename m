Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFAC3FCD
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 22:21:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m2so854273wmm.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 15:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ZSaSzTufTueiywkO3jjUJoO4ic3/O/DqfqX56V8rSIw=;
        b=V+xMq/kaVEIx194lqlk2gnDlDg3VHt9wVehf8aST4EU5+VJAbVDjbxTEsWAAkF9mhQ
         MTD77U4bSCBEqK9XCN9LkhLlVXKUsxI6Z/b5JNMd99rRtmoSk/M1YESgqGUm0yWZxI2S
         sEDzZloORMRE0zaBL0xcVnl+khmTwJn8j+/ht5d920KzkCpW/jK8b1luGY3X3i1T2LsR
         Mq7K1VxzThQIhAnnMKaHj8GERHQT/DVJ8oE0jVzUDvfTrBiGTHtHj1PlB2VTK6oz3wtH
         ulpWWQc5TTO+mPt0aGPIRuUAUqnZYX5swl7dzVTWXy5dMkLz2YNbkk/Eec1AtTpqFld/
         ZFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZSaSzTufTueiywkO3jjUJoO4ic3/O/DqfqX56V8rSIw=;
        b=EmZ65Q+QiZyMxt+p7UkDZ9JiboL7nqxcS1wieEUR1krBB4PfajTlFyXg6t9YKR4GqG
         djabFVEJINJG6zQa+6dTu03lPzDfuOE6OfYuZoQMy4mk/q9NCo5scjI1Guc2G33ArS2W
         0u1v9NWtzBKqLcQRlqzKZ0+7r9GNz0jKVOUxlCRvZUBSVKr8o3gMJE3vnJl9V59wL7pC
         gFuKbMtMgzU9lXijHeco6LtIZU2WqK5j1YhbaWb89vXglDa81NMutcZV3h6nwXc96O1O
         WWMNqBkTUBNIjFcmAg+sNrfA0PHuoUCVRm4vP7t+wocLvPqE7Pr9d7OvcdsFpE+inTDf
         A7SQ==
X-Gm-Message-State: AOAM533wgbTxw6PeE40JwqnstZHh3vKHboXh2WWitEtEz9REPfSgRaTJ
	8EmSmWlNH026k8faKEAVKuI=
X-Google-Smtp-Source: ABdhPJyyKbMzfzXaatiauG7SH/v5aLbcXPvY7+tK/zM8M8xArjxZ7ZzVRhVkqTfRw3gxG85acIP6iw==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr105101wmb.171.1630534893647;
        Wed, 01 Sep 2021 15:21:33 -0700 (PDT)
Received: from panther (190.red-88-4-24.dynamicip.rima-tde.net. [88.4.24.190])
        by smtp.gmail.com with ESMTPSA id z14sm613824wmi.24.2021.09.01.15.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 15:21:33 -0700 (PDT)
Date: Thu, 2 Sep 2021 13:52:15 +0200
From: Krish Jain <krishjain02939@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] Use BIT macro instead of (1 << HSDMA_GLO_BT_SHIFT)
Message-ID: <20210902115215.GA582112@panther>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch replaces (1 << HSDMA_GLO_BT_SHIFT) with the BIT(x) macro, as suggested by checkpatch.pl, for the file drivers/staging/mt7621-dma/hsdma-mt7621.c .

Signed-off-by: Krish Jain <krishjain02939@gmail.com>

---
 drivers/staging/mt7621-dma/hsdma-mt7621.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
index 89b72a802800..a99cec876110 100644
--- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
+++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
@@ -72,7 +72,7 @@
 #define HSDMA_GLO_TX_DMA		BIT(0)
 
 #define HSDMA_BT_SIZE_16BYTES		(0 << HSDMA_GLO_BT_SHIFT)
-#define HSDMA_BT_SIZE_32BYTES		(1 << HSDMA_GLO_BT_SHIFT)
+#define HSDMA_BT_SIZE_32BYTES		BIT(HSDMA_GLO_BT_SHIFT)
 #define HSDMA_BT_SIZE_64BYTES		(2 << HSDMA_GLO_BT_SHIFT)
 #define HSDMA_BT_SIZE_128BYTES		(3 << HSDMA_GLO_BT_SHIFT)
 
@@ -164,8 +164,7 @@ struct mtk_hsdam_engine {
 
 static inline struct mtk_hsdam_engine *mtk_hsdma_chan_get_dev(struct mtk_hsdma_chan *chan)
 {
-	return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine,
-			ddev);
+	return container_of(chan->vchan.chan.device, struct mtk_hsdam_engine, ddev);
 }
 
 static inline struct mtk_hsdma_chan *to_mtk_hsdma_chan(struct dma_chan *c)
-- 
2.25.1

