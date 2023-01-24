Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C628F70
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 22:03:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id b7so15295775wrt.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 14:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e3159gyzRYnyKWw0j8EF0nhK1aLDWnlIYkjwkYEv8/0=;
        b=obg3uU8DWV4BQmYLBCIVOFVJxtEtJ/4sLceLV2ZkxWSLZWliGknOA12QmuT99oGa4j
         BDbnqcKyXAiXsmKb+vV8kFq4ZwE8dSvhzeDYPVCJRGBFxnJHjMta4LB5dYzczO+j6JFV
         0PpAGNC3Dgx/b6WfO8orRNTgHVQn3h7+eXPHBCSH18wlk5l5anQle3ZsrM6xkviNbVWC
         OhOB5UewNG/OfTVZlqOnwXXssQaU4PCg1YcDUQbr5njGxdO7yNDtfEEn+WxHW+2qA8ZK
         OSeylPmLYm25mEAVuDBAxhZDsdMznQxUdtnzHb5OLEuVuHg+1K/t4L8MyBZuN+9Wc6NE
         T9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3159gyzRYnyKWw0j8EF0nhK1aLDWnlIYkjwkYEv8/0=;
        b=3aavQrtdZLJ4m1rlQfiIWdPAhC1BN6blp31Sr32AYq+8OhjvPby30BcAOC7EFKvhr0
         20f/cgJHYJsXNrTNjHiEq44XOZwEyHxl/EYw6QXEGaqqwDfXpBzZFLG11jCC3B3W9LAl
         BxzKIAWG3iG9dpY57hYscVVH94KykutW2ENvobdjBE+YByPgDTMoqTvAzOmoCxI0UaXs
         nzMm5VOpdQ6H0uFU3rQ7VEBZYmBvtikcDqpvuPK/m4ctErGX+LuR981MBVzNAN8bhbOH
         RHJ9HAn70MRj4BK6dwzUho1mF40IIfW6DNOLlMXBVmvovKIDizK8Giit4B0HERYlhTqs
         kuyQ==
X-Gm-Message-State: AO0yUKUkWadwbHHqQS3SOMHwwW/SJ9xm12a+m6SS4Fp2X+Q0sJZciNXb
	xI+pigJmqW/pXaSM7s+oCws=
X-Google-Smtp-Source: AK7set+kvm+g6x3biGcGFqnFJwqFUxNNtUgJDEK758Sfdv7XwtT3WxQtOGQ1YigavNIsAm0KpseP2g==
X-Received: by 2002:adf:d239:0:b0:2bf:b2fe:a2c4 with SMTP id k25-20020adfd239000000b002bfb2fea2c4mr408221wrh.7.1674597811807;
        Tue, 24 Jan 2023 14:03:31 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id bj7-20020a0560001e0700b002bfb5618ee7sm1123210wrb.91.2023.01.24.14.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 14:03:29 -0800 (PST)
Date: Tue, 24 Jan 2023 23:03:28 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: rtl8192e: Remove unused variables rxcrcerrmin
 and friends
Message-ID: <4c791fbb3559ce15de60b7bdcabbc50b0ee9adb9.1674596722.git.philipp.g.hortmann@gmail.com>
References: <cover.1674596722.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674596722.git.philipp.g.hortmann@gmail.com>

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

