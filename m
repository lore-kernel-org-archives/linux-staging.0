Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0F44839A
	for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662463; cv=none; b=CfCdFoNF/1zC0NF5FnzY7DEaTvFheQ9ytOM0YZgYbJCeX98qQZh87vMpuYlsXLhYwJM9t8JsKo17VpSBwLMcH4Hd38IrjiNEepOGN36AygxHdowvYZ2BIHTc51H6QdfKT9B1XBgNCUG6xlsjPaAU2YxZvRaGZjF5MhRlYw6wOlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662463; c=relaxed/simple;
	bh=JgE4s7TnCtsNJp/p+NQGbyLEXgV+DXhJYnOP5DiTIoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnayAuq699SDLIPq/gGdjs0dETtYtNRQF7Ejzktz4r314zL8KAVCusPtcLrPSgkhSiZx4iFA77/POrv/NH54pda/7SZTwURaeEvoThalEshhiHFqtcngdkhWp+RUBQr85ooFUkgmKMHSfLyyv2SItMxeR6zZHZmNhATh9lva6z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJoDQpsT; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJoDQpsT"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-39662b5cde7so112132a91.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787662462; x=1788267262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuVTycujd5+HwneLyLqVtIfZIL5wSc+qs01S1uCZrMU=;
        b=FJoDQpsTtsfDxoL9qSxUEOHz+9WegRVjD3re+u+mY2yvUJVIjPfqTrvEMAHu18mpUg
         TwMzH8yh69PwSKMMdfLl2qIyMimUYTZzTo0ggWkfmjo/oNJ9JlI7Wu0KGFxG10B9JH1Y
         S9/0ECe2LEPPBAEH/Y2u2dQQsdsUpG6Ez+nSDW6hdJyBIrlVwHUDW+Bo3mEskHi6Eao0
         0iIGwcipLQaz0S7JULQDgSN55RGpri+ejsD4xZfGiHeqvavsxXWCi8ChI7bcvBMZQTYm
         VkMxbIcv7JD2t53ZwriKYP59sDwlKPS/DPoASl55Bmo55e00ro2Wcmx3asEtWJr4bflJ
         XZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662462; x=1788267262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuVTycujd5+HwneLyLqVtIfZIL5wSc+qs01S1uCZrMU=;
        b=sWuLHJPs8oiOV5JMWtnnn0tqZCc+yjrIhx0cj+Ye35Rr7K5tefLtnRTHe0z7B+UGxg
         70z/hQYoKSAuIL0kbOuUYy6/u2HLs8paFTm+ph312XNOhXPh4cj+UbW+B93j3xMFqLB/
         GJKDyRbmTqXOl+/NRF+qcLbASMGxqgc69ypLCjwv0H2tOH6oLIkbI06SYi7iv+mguMo5
         QlK0kIp3jAgwC2o6n6onesseyeVL0MXu/4dvgn9UPlZB70CfrAfKjCDAcX1ZtIXg3k8d
         kr/4Ka14ZKHonC1zpRAzmi83LWh1OFKOy3JmBeidGVSu53MsdjD/PokKJZ6lU/bXcJPs
         W9Kg==
X-Forwarded-Encrypted: i=1; AHgh+RrCdBE7ZOX6ShxBtOiveDSpqd1EpW9Gn4CTmFbxx4t8N6PbkYZRmqAvRdBEHyBIh/n311Vyw063yGAblAFW@lists.linux.dev
X-Gm-Message-State: AFuF++kmjCleEEL3qW6YRz1DQayrFCDKQ/iiKCwjp8cDF7+HONFNsFFw
	zDKP4FI5YQ8oVj/sm/wAG6Tf2lRtZPcZPREzeHMKlUHKJxTOCCDk46zT
X-Gm-Gg: AR+sD139kxF7dFQ9PMtGQtyKVeHhiMYZAWSmpEkl4nVf/EYY8G9+SSJRwUPy/ny3I84
	eiMXwLUAcZ/4k9YyH/POOYgP6Z7KTGMv8oOARv/4XWQ9FBBB+PV4lnE1REc3fGK71LxdsdjxjNF
	LgJscx0d0915c5ZQJg1qvBvDaY3W74p7RyFKMsxeq++NJSlW5r6+0N/X1oWn9VeWbG7PoI68n/A
	hLenHA9Sn+p8gSx47WKSovko47+F7ZgDL+cFHtEg2w7KEELinLeFiRxmWgwmwQHZpt4ZHoVI3LY
	4yfuqR6RB4Te2doRuRE6Y9mkfD/4ls+rjJD3Xn6ag+sKxUwLBidIln0TB+E8DIXPi8YsdgreRvA
	pJVbVDbPlyo7RtIRaVo/GDfg3fEVqNJQ7+7BY3Xd0HQi8WfEkTWn7jB3TeqsJSsvICNzbi8Ko/l
	SRotyaC7HqyvSBNkwHB+NRJSd03qer4VByDGJ+GAFCwg68blw2jOVAslOtw2Zl7CGLQv5yYmkdR
	zNDbFgW76nHSzhuA+nJDqyHvfg=
X-Received: by 2002:a17:90a:d605:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-395df5e8fefmr50038307a91.16.1787662461737;
        Tue, 25 Aug 2026 05:54:21 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm37098329eec.27.2026.08.25.05.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:54:21 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: make rtw_free_xmitbuf_ext() return void
Date: Tue, 25 Aug 2026 12:54:05 +0000
Message-ID: <20260825125406.1710-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825125406.1710-1-dennylin0707@gmail.com>
References: <20260825125406.1710-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of rtw_free_xmitbuf_ext() is never checked. Change its
return type to void and remove the redundant _SUCCESS and _FAIL return
values. Also remove the unnecessary extern keyword from its declaration.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 6 ++----
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 81d9e713fc12..a1a0d75d823e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1534,13 +1534,13 @@ struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv)
 	return pxmitbuf;
 }
 
-s32 rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
+void rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
 {
 	unsigned long irqL;
 	struct __queue *pfree_queue = &pxmitpriv->free_xmit_extbuf_queue;
 
 	if (!pxmitbuf)
-		return _FAIL;
+		return;
 
 	spin_lock_irqsave(&pfree_queue->lock, irqL);
 
@@ -1550,8 +1550,6 @@ s32 rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
 	pxmitpriv->free_xmit_extbuf_cnt++;
 
 	spin_unlock_irqrestore(&pfree_queue->lock, irqL);
-
-	return _SUCCESS;
 }
 
 struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv)
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 917e846e9ce2..0dad1349e52b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -403,7 +403,7 @@ extern struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
 #define rtw_alloc_bcnxmitframe(p) __rtw_alloc_cmdxmitframe(p, CMDBUF_BEACON)
 
 extern struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv);
-extern s32 rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
+void rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
 extern struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv);
 extern s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
-- 
2.43.0

