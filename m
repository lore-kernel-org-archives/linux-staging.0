Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DB16FB1
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 20:08:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q10so1264089wrm.4
        for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e3159gyzRYnyKWw0j8EF0nhK1aLDWnlIYkjwkYEv8/0=;
        b=qJ4Uwx/LpirhfkkhaNbEw7UgnQvUkGfwnShlH39beNasN0JvKq0Twaon7yywI92r5w
         wcmcqVKrrgD2ZIb5lHH2sRMo+KPkUEcDMCLfYyfRVik0S6NyIFIdM98kOGTL/b8lWlY4
         vq/ieZXk1x//6+O9bCm1T7uP2Ib9hv8ha1+cn/ng8bd9kkRDj6X/Klh7CH2hVutweWvv
         q6zf4VzIYK/O6lJ575FPZZRVya7ujTLCpD6/MM8D7ypP0Ynn/OEIWGkaANA9Zq2KLiVo
         O/FuqEND8d6YYYzOqdn/qOKUQ+V9DZvgFTsicizungZ/ZHqUGT12+9Xl3VAAR5ymyyKC
         4tdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3159gyzRYnyKWw0j8EF0nhK1aLDWnlIYkjwkYEv8/0=;
        b=WoxONoMAcUEut/IeoEQFXV3HQuamvCM05SeGvR9MtH2hO385tnh0pbrBgym9/W+VBb
         6R9XIFFqMFSKdxhGmszz1Zvcd53h7FY4Bbsuim5sEll+/RWIKdQQux8evvsTCpMiJKah
         L6Nh/k8i5uHQWsPpW1gTvYJtOXcRuLkQOZ+xaxzsjeBuuv8hAqgwE/yFuhZ7Cx3S8JUx
         RETzv7Q6s569mBe1xWnK4Yd+8kWa4LDHyrUWScOO3nBJmWWmBA5J73QXwAe+yefqn58r
         AXrS6wnIN8dVsG/vVXUAcg3boAUrW/ZH/SLWrE0fSyQq0Z3aEPcwHrbHJDIMHHeBs3Hb
         iECw==
X-Gm-Message-State: AFqh2kofkAg3FumFACZoDVhZLCc0BQKGfBoJi9jJDdAYNQvbOkfdPeXb
	sMnOWwyqhtnbkRU7RNsee5A=
X-Google-Smtp-Source: AMrXdXvtUFtCFxHlZsDC0OlmrcZnQBmN47kgB/Rp9Et3pN+lO9A/kzbf8ThueNXsV/QYtezuFBh5Kg==
X-Received: by 2002:a5d:6b0e:0:b0:2be:1672:748b with SMTP id v14-20020a5d6b0e000000b002be1672748bmr5353853wrw.0.1674677322437;
        Wed, 25 Jan 2023 12:08:42 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id x10-20020adfdcca000000b002bbddb89c71sm5121166wrm.67.2023.01.25.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:08:41 -0800 (PST)
Date: Wed, 25 Jan 2023 21:08:40 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/11] staging: rtl8192e: Remove unused variables
 rxcrcerrmin and friends
Message-ID: <4c791fbb3559ce15de60b7bdcabbc50b0ee9adb9.1674675808.git.philipp.g.hortmann@gmail.com>
References: <cover.1674675808.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674675808.git.philipp.g.hortmann@gmail.com>

rxcrcerrmin, rxcrcerrmax and rxcrcerrmid are initialized and increased
but never read. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 10 ----------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  3 ---
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 9260d308e68b..e9273dfb638e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1812,7 +1812,6 @@ static void _rtl92e_update_received_rate_histogram_stats(
 bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 			 struct rx_desc *pdesc, struct sk_buff *skb)
 {
-	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rx_fwinfo *pDrvInfo = NULL;
 
 	stats->bICV = pdesc->ICV;
@@ -1825,15 +1824,6 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 
 	if (stats->bHwError) {
 		stats->bShift = false;
-
-		if (pdesc->CRC32) {
-			if (pdesc->Length < 500)
-				priv->stats.rxcrcerrmin++;
-			else if (pdesc->Length > 1000)
-				priv->stats.rxcrcerrmax++;
-			else
-				priv->stats.rxcrcerrmid++;
-		}
 		return false;
 	}
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index f91a6f7a4e0a..167c4aeea44e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -183,9 +183,6 @@ enum reset_type {
 };
 
 struct rt_stats {
-	unsigned long rxcrcerrmin;
-	unsigned long rxcrcerrmid;
-	unsigned long rxcrcerrmax;
 	unsigned long received_rate_histogram[4][32];
 	unsigned long received_preamble_GI[2][32];
 	unsigned long numpacket_matchbssid;
-- 
2.39.1

