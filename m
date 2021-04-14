Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B866D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u17so32838036ejk.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xTcLgnCxrmrAp2YagBVz8UAjAg6NhAzgiWybjY6w54g=;
        b=pEsjFqcXquXT0cCMsm3LLus74cWhhbhd7Mq23Y6Cs2x6v2lQ1CkGiySHaltF0w0V/z
         g8+TBusoCiTu+ZLZfRLNSPlV75fj0hWsV/2Pk+PzdT570AYAvAO8KuJqtBdicoaflVvJ
         3ghbfrLGP++YLE1KNU8rZRlpFvGhfWlHAmkwCb0HP5ddG0txWCy/AiCGR/2zACw9IUlh
         Ob0zW4yfJNZfAIsgdXfIZfzt6DpPxPVUyzxBaX3ECzMSl/QD+71Lzm14Jp1psGdNf9MS
         PSRyjhDkf7UyMG1M7esgdqU+0/HTgg+1B5PzIo8zpOqK4Cmhd1/JflnORQQKLxhqTBQi
         bMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xTcLgnCxrmrAp2YagBVz8UAjAg6NhAzgiWybjY6w54g=;
        b=UysAOIDbyjP+JSfeSYynCe+t5klqfsBOgcfAg0rT34DSZbiLiBnsRn7eqXiS1JPsCT
         XjJjR/7bOdu5I7bA7zlkKhCoXPDfr7V2t9iwiamV3MIxKycDJ3FIpz9W0B2z5GNUi/ev
         domds8LZY6+xtBAux6AqG8Su+RoRgtvchWXVR0J38zX6g1Y04JracgmLgOmv/Lmf/ym8
         gBflUr1NWNfnUSDiJC7nW5PfiLhW9mFyAyKQc8+vDO9Xaa0Zq0BoMeUV33QeCv6sIuLY
         QlnopLbpbQicXosv70hpOrDtg1PPZSIuxE0rgmaB0WfbF2fX8D0hOJanZVia3Z6nj3cL
         vomg==
X-Gm-Message-State: AOAM531uGzP276R4nTAJvccKFPkOYeobtEAhyCMvSF8VKmjiPtBUEjuw
	KXvrsICi6t83cJN8X6qEwM/SPg==
X-Google-Smtp-Source: ABdhPJzF5ziEKnFqMe6mRBwP2qeuVMWb9sbYzt8yaKPbYT/q3wgNXts2PxfzqzdR56sSSmCQxd3jbA==
X-Received: by 2002:a17:907:94ca:: with SMTP id dn10mr139954ejc.123.1618423898668;
        Wed, 14 Apr 2021 11:11:38 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:38 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrea Merello <andrea.merello@gmail.com>,
	Jerry chuang <wlanfae@realtek.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/57] staging: r8192U_core: Do not use kernel-doc formatting for !kernel-doc headers
Date: Wed, 14 Apr 2021 19:10:36 +0100
Message-Id: <20210414181129.1628598-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8192u/r8192U_core.c:3714: warning: Function parameter or member 'dev' not described in 'UpdateRxPktTimeStamp8190'
 drivers/staging/rtl8192u/r8192U_core.c:3714: warning: Function parameter or member 'stats' not described in 'UpdateRxPktTimeStamp8190'
 drivers/staging/rtl8192u/r8192U_core.c:3714: warning: expecting prototype for Function(). Prototype was for UpdateRxPktTimeStamp8190() instead
 drivers/staging/rtl8192u/r8192U_core.c:4314: warning: Function parameter or member 'dev' not described in 'UpdateReceivedRateHistogramStatistics8190'
 drivers/staging/rtl8192u/r8192U_core.c:4314: warning: Function parameter or member 'stats' not described in 'UpdateReceivedRateHistogramStatistics8190'
 drivers/staging/rtl8192u/r8192U_core.c:4314: warning: expecting prototype for Function(). Prototype was for UpdateReceivedRateHistogramStatistics8190() instead

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrea Merello <andrea.merello@gmail.com>
Cc: Jerry chuang <wlanfae@realtek.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8192u/r8192U_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 643769e32e433..932b942ca1f30 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -3694,7 +3694,7 @@ static u8 HwRateToMRate90(bool bIsHT, u8 rate)
 	return ret_rate;
 }
 
-/**
+/*
  * Function:     UpdateRxPktTimeStamp
  * Overview:     Record the TSF time stamp when receiving a packet
  *
@@ -4294,7 +4294,7 @@ static void TranslateRxSignalStuff819xUsb(struct sk_buff *skb,
 	rtl8192_record_rxdesc_forlateruse(pstats, &previous_stats);
 }
 
-/**
+/*
  * Function:	UpdateReceivedRateHistogramStatistics
  * Overview:	Record the received data rate
  *
-- 
2.27.0

