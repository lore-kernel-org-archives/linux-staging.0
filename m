Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546931E496
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYHvCk/s"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40b3febbce3so4485155e9.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 12:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701204197; x=1701808997; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTvuKmkTJPAvRgA2l6Vxt5PQ3ZQRNuyzzv3L3pAw+UE=;
        b=IYHvCk/s20p+cyl8kUTuJD08kD358dvfifXNpph6eOn3hWrTLTb+RXZgqTq9OIeI7x
         IT9oFCkZ9q5gyjThJD7MOf7pBGG6B1QJIIzfvRR7br7VXdOv5K88GhMCH4WBdb+jUYgL
         F9HeNKDqjwyXLUyn5cQfVRIb/UMdwtKaNR6Kv8LbhGp8zdC4bqggyM8pTM6oI6k96Fne
         Ui2jilPrqCasOAlJ8R6u9P1n3WsBxRcS/ZDu1nT0dFKWVnNo4/aTRLHmLkcybXvj4rkT
         WwGYhwWM6BjtWYKmUI0DL8QvmCLgouPMq0DAPxyv4roUrCyIL2PQGzhTCYhYn0S4ASOU
         hMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204197; x=1701808997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTvuKmkTJPAvRgA2l6Vxt5PQ3ZQRNuyzzv3L3pAw+UE=;
        b=lt4WA/og5qajYjhSUP8345+RZDcJRYA25nyf0dkKkAzEX2QncN7TUHOPSkoT4KVegX
         aRIRVgL7STKtYUle6LSs50rben5yGLi8/tEvWw7Rc5NzLV4vEAcpEc+4SP0WrI5cqaP4
         sJxFULVqpM9rpOsNSFQLv/9aNbXIZ+9S0+fmhro9ssisF/DrHEglE75a9NGBeCFuiJ/6
         eC5b7g/E/GRnCIfQtRySwCHrQOouJeFex7gafuTeZzm4CYMPoXW3H9uwyURgxOOrOoxo
         PxXmS4ZKVTLU60nCB9DlsQp4qf0yGuojWaXsoFTu8I3sFfgbwfNZPgRyxKEhSA0BHle5
         VXwA==
X-Gm-Message-State: AOJu0YyEcKIvWzkYzed0/rckJMkdKigR4WnXWqAUiT79/NBAEYU0+1ue
	iK52CfScVCTxqVa+zKiduEU=
X-Google-Smtp-Source: AGHT+IE8UoUtnPeBJvrSa3kkQbhdQrU8oo5xXMAaG5f0yy8HXCJfuQ38kYaqQSoEVYLSeiiwFXJ2yA==
X-Received: by 2002:adf:fccb:0:b0:332:fb6a:6206 with SMTP id f11-20020adffccb000000b00332fb6a6206mr5716051wrs.2.1701204197330;
        Tue, 28 Nov 2023 12:43:17 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id m17-20020a5d6251000000b0033310d8d0e8sm2371953wrv.63.2023.11.28.12.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:43:17 -0800 (PST)
Date: Tue, 28 Nov 2023 21:43:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] staging: rtl8192e: Remove action block acknowledgment
Message-ID: <b9dd747c517171647038ae9f345790cc1af1e1aa.1701202700.git.philipp.g.hortmann@gmail.com>
References: <cover.1701202700.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701202700.git.philipp.g.hortmann@gmail.com>

Driver does not handle block acknowledgment correctly. Tests with AP have
shown that the AP is giving up after some tries. Remove function
rtllib_process_action().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 30 -----------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d20970652432..1b66e718c59b 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1556,33 +1556,6 @@ void rtllib_ps_tx_ack(struct rtllib_device *ieee, short success)
 }
 EXPORT_SYMBOL(rtllib_ps_tx_ack);
 
-static void rtllib_process_action(struct rtllib_device *ieee,
-				  struct sk_buff *skb)
-{
-	u8 *act = skb->data + RTLLIB_3ADDR_LEN;
-	u8 category = 0;
-
-	category = *act;
-	act++;
-	switch (category) {
-	case ACT_CAT_BA:
-		switch (*act) {
-		case ACT_ADDBAREQ:
-			rtllib_rx_ADDBAReq(ieee, skb);
-			break;
-		case ACT_ADDBARSP:
-			rtllib_rx_ADDBARsp(ieee, skb);
-			break;
-		case ACT_DELBA:
-			rtllib_rx_DELBA(ieee, skb);
-			break;
-		}
-		break;
-	default:
-		break;
-	}
-}
-
 static inline int
 rtllib_rx_assoc_resp(struct rtllib_device *ieee, struct sk_buff *skb,
 		     struct rtllib_rx_stats *rx_stats)
@@ -1789,9 +1762,6 @@ inline int rtllib_rx_frame_softmac(struct rtllib_device *ieee,
 	case IEEE80211_STYPE_DEAUTH:
 		rtllib_rx_deauth(ieee, skb);
 		break;
-	case IEEE80211_STYPE_ACTION:
-		rtllib_process_action(ieee, skb);
-		break;
 	default:
 		return -1;
 	}
-- 
2.42.0

