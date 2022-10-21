Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6126102
	for <linux-staging@lists.linux.dev>; Fri, 21 Oct 2022 18:10:04 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a14so3383594wru.5
        for <linux-staging@lists.linux.dev>; Fri, 21 Oct 2022 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=de+kk2perbv4KysWHjrNxKnJA8xDIO/vAGvbM/ll1vI=;
        b=Y3zAXEqFcj+wHJiqU7QwFJbdFxqy8zcubpDSGTu9pVPQFf8twhnC8lqwEMMZSRxocG
         HZmZ+41kwbN/V6S1gv+KVsnBgtarfMsXf4GvG/lRy6IF+CQQ6m1BUpvEXYR9RyB43SsH
         RPTKbw1nfgDhFCd/pK3sNF9wI80sfqVj2VPwnb9rPq4vhzUnDVLE8biOBnnP0qx1Vdsa
         YIEqK63fNKJFBP/yHosMwGYHLmPEBZ2U1rUOURNIKqMV8RvT7tGxKYl9e1U1KonncNjU
         VZJtAl7E5k3e2ObsgN6MwNqy1uKPFs2NwPxhzXj75on+/F93k4w70k4eDE32osRJ0tY5
         m0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=de+kk2perbv4KysWHjrNxKnJA8xDIO/vAGvbM/ll1vI=;
        b=g72T5u5H62i88l2wOED+OLWAGd49izd+t0bZzbM+Q+iO0vnkrFKyVJSClvKAo15kZq
         jYU2dKo0Ep490bsJhsD2gjhFAsIW8zx97zwAYHtsRo/sQ89gJwvjFRGgDa0JJAc57dqs
         J/oB+wgFCWK1gbYPhcJjouSnr23KCSNGl+6YFVX9DAKQ+eePYitwHeYyonbcDik9p5Q+
         MB1Y7wrt/YHNtran5U48LnOnLTGwFxkhRsF+obiJSeAtBSPsNEt0PXfc6toeL85rpjbs
         Axib9OF0T7P+0jhfqOYEwjLhuc0Rf8XOxVwtCq/1MCGKjw0wmrhx5JlxuizbWRi4gST4
         VnEQ==
X-Gm-Message-State: ACrzQf0jqnqrjwlZC0tZ7wxNZRs1v934pNzN1selhAS5696r2JYVYDY3
	puYbajrt2EVHWyQ3o8KG9mQNpOq1LsfkP980
X-Google-Smtp-Source: AMsMyM5xiytkEAXxryRE6LfVZ8R06NNlNE/a/bRfWC5q8alyb/pabJRUfgXrO6xhyLXTZk3pQPewTQ==
X-Received: by 2002:a05:6000:1548:b0:22e:3469:b726 with SMTP id 8-20020a056000154800b0022e3469b726mr13087613wry.10.1666375792007;
        Fri, 21 Oct 2022 11:09:52 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id m2-20020adfe0c2000000b0022e6178bd84sm20522348wri.8.2022.10.21.11.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 11:09:51 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Remove variable xcnt
Date: Fri, 21 Oct 2022 19:09:50 +0100
Message-Id: <20221021180950.29139-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable xcnt being incremented but it is never referenced,
it is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index 84a22eba7ebf..4cb01f590673 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -601,7 +601,7 @@ int r8712_xmitframe_complete(struct _adapter *padapter,
 #ifdef CONFIG_R8712_TX_AGGR
 	struct xmit_frame *p2ndxmitframe = NULL;
 #else
-	int res = _SUCCESS, xcnt = 0;
+	int res = _SUCCESS;
 #endif
 
 	phwxmits = pxmitpriv->hwxmits;
@@ -673,7 +673,6 @@ int r8712_xmitframe_complete(struct _adapter *padapter,
 			dump_xframe(padapter, pxmitframe);
 		else
 			r8712_free_xmitframe_ex(pxmitpriv, pxmitframe);
-		xcnt++;
 #endif
 
 	} else { /* pxmitframe == NULL && p2ndxmitframe == NULL */
-- 
2.37.3

