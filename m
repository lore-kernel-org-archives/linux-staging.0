Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5E171
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 01:35:50 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id j7so3584718plx.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 18:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=vd8lMgu3zkr2z6g7xcisDVvdvTxxf93W5Kur6M5AgCE=;
        b=pjWwg+1y5IL9DISwRYtHV5mqgLMoNyUUSI8L2ZaCDgnAhgNKtgmpczwGAoAaM/YHNO
         piGExD3Hsl+9zazWBVqpupyQCmTNh79HGaoxKii5uU0HJ7/t+w58yg55KeyaRgiQtRbV
         D0H+xf7lDtYr2nX4QDJ64y/26kijC+/9PvAFnyJZUJhhiasMVmfZdSpFo4D4CpFc/27Q
         0qg2OvRUI1z81wiG+wgKYpyif+j8kvZ8ehtbCas7oNcRUqLIeArCQZjPYzo3utaeA2l6
         tY8TRx1h4i16MQjOl7Paa2tzI97k/jWcJHZo2G6ENcJp3ODzygwviwRjQ4e49dRk0TrW
         vlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=vd8lMgu3zkr2z6g7xcisDVvdvTxxf93W5Kur6M5AgCE=;
        b=mphLe5R8IN8Qv3yccSLX1EUvJD8mqgrGZ8ZwjvP/qoCMh9EmgsHXldFqlOO1emNqJ8
         dMdLvqGJ6JmxHhyd6zM+UXTLHyEpU7Ian40wBgt0mNjp8jQI06gtBxgNSPqB18VGpQA+
         susY5yyvqbZdHuOAK25Nr7XZ1om9o0lcqARc4Mn0Chm2XQiMpd77n/TCg0XH5nu6MCKU
         bI2sS+2LIkPP6XNb0PmctTmJH+naROKNKAPHOopDEmrl4mbFkLX1unc8nlt+61Z6/aOA
         Ij2UloeXRF5Xy9ak9mD7n1UHPM25kx9Yzv5FQDvlsbr10rKFeRkkAncmBdhxo252Q3V7
         hDyA==
X-Gm-Message-State: AOAM531wIER7iJI61ErS3Tb0A+dMn7afkywE54luY6MA9StHlm05tHp3
	zwxB33uHrKTtTpzHDJ8nA6g=
X-Google-Smtp-Source: ABdhPJyAXgEMAGxMzgkToJGpihLSoY6PKV6GJHaGOCDQSsp2uyZk0f3r9/ddmsDUQ7rTG+g32bs4sg==
X-Received: by 2002:a17:903:2306:b029:e7:1c8d:63fc with SMTP id d6-20020a1709032306b02900e71c8d63fcmr15769758plh.35.1618018550053;
        Fri, 09 Apr 2021 18:35:50 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id e68sm3126832pfa.78.2021.04.09.18.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 18:35:49 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:05:44 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 6/6] staging: rtl8192e: align statements properly
Message-ID: <YHEA8CgeJAXI8z93@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Aligned the statements properly in one line to make code neater and to
improve readability.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 2b9e275f42bb..65202dd53447 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -155,8 +155,8 @@ bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
 		retValue = true;
 	else if (!memcmp(net->bssid, UNKNOWN_BORADCOM, 3) ||
 		 !memcmp(net->bssid, LINKSYSWRT330_LINKSYSWRT300_BROADCOM, 3) ||
-		!memcmp(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM, 3) ||
-		(net->broadcom_cap_exist))
+		 !memcmp(net->bssid, LINKSYSWRT350_LINKSYSWRT150_BROADCOM, 3) ||
+		 (net->broadcom_cap_exist))
 		retValue = true;
 	else if (net->bssht.bd_rt2rt_aggregation)
 		retValue = true;
@@ -809,7 +809,7 @@ void HTUseDefaultSetting(struct rtllib_device *ieee)
 				ieee->dot11HTOperationalRateSet);
 		ieee->HTHighestOperaRate = HTGetHighestMCSRate(ieee,
 							       ieee->dot11HTOperationalRateSet,
-					   MCS_FILTER_ALL);
+							       MCS_FILTER_ALL);
 		ieee->HTCurrentOperaRate = ieee->HTHighestOperaRate;
 
 	} else {
-- 
2.30.2

