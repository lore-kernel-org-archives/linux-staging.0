Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0257364B3
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 21:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQXERgk3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a09b5918b92so27743866b.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 13:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700861463; x=1701466263; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf+BvI0HCoud7UZk/jd1+lnn/zb5QtR4nqSkftIg4Lc=;
        b=CQXERgk3nTGY+CxXqjgnkVj25omDGppOW5JxROAC7Xjn4Tlj1qUaT1xqGUohsezByE
         uceJeNEJWi7jEN4aKapcH11QHspfO8ICF/k5VPLsW7BRwD+Q/yu53dSEsRt6mQW+U49a
         gk9YzSW3L2IurjZQh3pPAl+3wX2QQR/p9z3fB8mIJi2YcLd0s0NKJKPRbdx+7/VoyOnN
         wXktyCq2xhxw7vI1vwS6FVGT/Y5tZ14ryajvTlVz6FPThl60WTqvWDvJtDRprFAm0eEb
         E+Xi1s8aSGFsHThTXZphA/M8P2ZWyGHNu5FG2lplHEXLd4O8IRrQzi2lASXAzUCT/693
         3T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700861463; x=1701466263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf+BvI0HCoud7UZk/jd1+lnn/zb5QtR4nqSkftIg4Lc=;
        b=xJrg7+TS4TZA/PeXbPXS8kvOxqS8OFcaXWsvgpBMqjCZrLHLCtNFvOh6BQWB6UYIzq
         uqY8wyc1MNBVsZbyZH4GYEi4F/p6gE3x8NAs3FivUazHBmLZpFBgD9jngubB8Qap9mjX
         xc3LXf5RpWCaHw16Pm1ouVfD9EFilv4xsg4hwbKAoQZri2Nu4Y20FHavhOSOdSdkp0XZ
         6iPM21AgKURWM3jasOCnisJMjNr+4nnjS2c8TMhv9QmE/hTmY6alEoXnTofj9Q0YHO5c
         rGIbP7n5p2/wWvQ1LSWR6fcbRGtwKjkLjBgwcrH3GEHr9pyM30JsSSFLMGY6ok6uFK3Q
         fVWA==
X-Gm-Message-State: AOJu0YxytmyhPQ2KxnUPjBWsbLpLwOyNfJjqoxM6945pcT2oLxSmsuCB
	wV7uPF++51jqA+TKxRa/2gaEx6DFePM=
X-Google-Smtp-Source: AGHT+IHK17C1vO9U+6o18kae1SZLjDwGP/MMYNJWQnBOz67HwUmYH5p5n4LeoSWvCS+SdGOSsC5/KA==
X-Received: by 2002:a17:906:5812:b0:a01:97e6:6771 with SMTP id m18-20020a170906581200b00a0197e66771mr3351041ejq.0.1700861463124;
        Fri, 24 Nov 2023 13:31:03 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id lv20-20020a170906bc9400b0098884f86e41sm2499299ejb.123.2023.11.24.13.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 13:31:02 -0800 (PST)
Date: Fri, 24 Nov 2023 22:31:01 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: rtl8192e: Remove unused function
 rtllib_send_beacon()
Message-ID: <fca983a276ae67dc9cd124e236fe9d210fd997d3.1700860759.git.philipp.g.hortmann@gmail.com>
References: <cover.1700860758.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700860758.git.philipp.g.hortmann@gmail.com>

Remove unused function rtllib_send_beacon().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 430951c88123..4e33a453f86e 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -351,22 +351,6 @@ static inline struct sk_buff *rtllib_probe_req(struct rtllib_device *ieee)
 	return skb;
 }
 
-static struct sk_buff *rtllib_get_beacon_(struct rtllib_device *ieee);
-
-static void rtllib_send_beacon(struct rtllib_device *ieee)
-{
-	struct sk_buff *skb;
-
-	if (!ieee->ieee_up)
-		return;
-	skb = rtllib_get_beacon_(ieee);
-
-	if (skb) {
-		softmac_mgmt_xmit(skb, ieee);
-		ieee->softmac_stats.tx_beacons++;
-	}
-}
-
 /* Enables network monitor mode, all rx packets will be received. */
 void rtllib_EnableNetMonitorMode(struct net_device *dev,
 		bool bInitState)
-- 
2.42.0

