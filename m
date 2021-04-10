Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A1E71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:13:03 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id t23so3759070pjy.3
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 19:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=H4JBybcyVdit3LlCjtiu0PtEyNhtJrRBX+ityRlDmVU=;
        b=lHPkNWnbDZB6hbYSyq11SYll5bNsBsBby70IJDygyWZIhq1PnBkpdLoSGFB4BJoEMj
         JRw0otNXdWNRbA8zI7q6TBdwqMl6aLDdi22xJXgHX/bFmXUnlsLuNr9DLEfieCVhNX44
         Y4ZroOxi03+U0/9zIO7E5l82w+d/0Sefozt+3KT0Kvx49vPEAka7z14w2tAM/ClXeBi8
         8w3M+clmzr5O4FSqbtwbSCKVTcBrmd+hsDnyGjqekX8sKf1A3VMcdpBRFKY1bu09S0R+
         CSWUBUwKo8BZbrmM0zcHY2tshPY1oebGgJmshqWlOaNKDCRLzx+zz+OhdE83ZZ4A4+v+
         97iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=H4JBybcyVdit3LlCjtiu0PtEyNhtJrRBX+ityRlDmVU=;
        b=oZnYz4qt74nQOyylt5iEuTAkj18F0lo9DVXVgjagGMJS0pmPHyLHy8P0RUbk5yONvm
         t0UUfCjBsk9+ISABqxB/W6/zh4tCNhZA9Qk2M7HEUzOkqOPwgQohROxlR7Mk8QM6IYww
         i6oAHxGhZFwZgg+gNIMHoQe7l/2T4NFYuuQHUeBQDylwECN+QBn6sfIGB4KPgLsa+l/n
         k8ozDAvwMAYHa4og1QnssTszpuiBaHeAuk+m33CPxu8kI0Y9XyOPw+0KxVDNJvJplxWX
         L+qZPgYwAlNdeI7SeFcsdFqQR0rI7p/ftnqwT6bksEslgKxr8aGOlAbZTnEdcGXLWZv6
         ohHQ==
X-Gm-Message-State: AOAM531mBgVsQRtmSJZZe+9ESpzrfat73VQ+Afe396ZsBjBmWo4md4F1
	PKcN+j7+SXosRM3mVsbRZlo=
X-Google-Smtp-Source: ABdhPJxafIj4tw0GmNz2zeJOZmshYYQGVBg3ThyjlX6JLgvl6kHBIkx1JqiquMrfEZZ7zWQxjmy+0A==
X-Received: by 2002:a17:902:9f83:b029:e9:3455:44d2 with SMTP id g3-20020a1709029f83b02900e9345544d2mr15741805plq.11.1618020783151;
        Fri, 09 Apr 2021 19:13:03 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id v6sm239697pfb.130.2021.04.09.19.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 19:13:02 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:42:57 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 2/3] staging: rtl8192e: remove unnecessary ftrace-like logging
Message-ID: <YHEJqTJchcKdNMyg@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed unncessary ftrace-like logging by simply deleting that statement
as we have other modes of logging like ftrace.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0b1e92f17805..89d0e9ec188d 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -630,7 +630,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
 	pHTInfo->bCurrentHTSupport = false;
 
 	pHTInfo->bCurBW40MHz = false;
@@ -698,7 +697,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 	u8	bIOTAction = 0;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
 	/* unmark bEnableHT flag here is the same reason why unmarked in
 	 * function rtllib_softmac_new_net. WB 2008.09.10
 	 */
@@ -832,8 +830,6 @@ static void HTSetConnectBwModeCallback(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
 
-	netdev_vdbg(ieee->dev, "%s()\n", __func__);
-
 	if (pHTInfo->bCurBW40MHz) {
 		if (pHTInfo->CurSTAExtChnlOffset == HT_EXTCHNL_OFFSET_UPPER)
 			ieee->set_chan(ieee->dev,
-- 
2.30.2

