Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F91361
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 17:04:38 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id pq9-20020a17090b3d8900b001df622bf81dso2595153pjb.3
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TNdJuu/j5yzS384N3qJa/cn4HaocjvrZKpgiycrMSE8=;
        b=PZlOUNOXNlmBxzG7nR6dSG+2VCKRNkVBKqtPYaplvKqer51/5O8yOBuJDF6tJPh4iX
         xajX0cn/4BdAdNtEIlpFvRFG8OOJatpQsMUyZqPOqwGwrv2LJu1A4vYIQ1ypDYeb7vcT
         rm2RqpbGUExYba7PU+ZtWt4o1UKRGebNz3O0ExulG6Re7IsHiFQQUlBMTfAYbEid2oc6
         VDBCDCSsGCBom/jUp7PAW6kM3wYWuBR9w5mOGRzPPoKyZssyxIlVBZj6s0LQaajU1QSC
         UCnJWDstWbNYvJiSsHPUslpdEcNy1NCOOK0SuZTuTzH+/9WL5Ky+CIW44A2BRioLCy3U
         k0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TNdJuu/j5yzS384N3qJa/cn4HaocjvrZKpgiycrMSE8=;
        b=QYMrMKWtcDotAK1qURHCidv1eqZYRcN9/HFY5Xq8qsIAXgcLTX9t7dKIbJZK04Q/pP
         nwhhL6n8rdciPZ+mst56dQGG7EoFQxa7lBdzLCiqxgqscxj+WQosx1ll46NPFwIvDhe4
         FzjlqjgmfvbM9C0dLzffylMCSn4Z24VeRc9GUjCaZax0zZnUfUIK1yiQXDrjD3xrf2dy
         3MZADe7DiYSH0fUSn9SLE5Hk0SNhJRAlzSOAT/yrWcyJ7EmiyekwiLvbuHZTwQBg3cQb
         nvqsTD1Ln1zVFPSH3GyT+exrASpfgbrqeRhLrzwtGsiWT8N7Ixk7XJlBIvrxr8VF/lZG
         Q7og==
X-Gm-Message-State: AOAM531jHxGpjLyhoJvO13QiWVZi3Y7D/zi+lZswBvNd1LjUYDdEXv1q
	1GtALSBBYwM/te/uGi6ROeIzF9BOJbEXOQ==
X-Google-Smtp-Source: ABdhPJz/4b2AS2O4bLSWm2ww2lQNwPjfQEwn1NaT0WLvPrZ/c6u4o9dib0dEG4WtvDLYdNYiEDWD9w==
X-Received: by 2002:a17:903:244d:b0:15e:a3a2:5a6f with SMTP id l13-20020a170903244d00b0015ea3a25a6fmr18106103pls.72.1652720677944;
        Mon, 16 May 2022 10:04:37 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:1:6465:4732:de67:bb26])
        by smtp.gmail.com with ESMTPSA id b190-20020a621bc7000000b0050dc762819csm7141292pfb.118.2022.05.16.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 10:04:37 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: fix checkpatch.pl warnings in rtw_wlan_util
Date: Mon, 16 May 2022 22:33:06 +0530
Message-Id: <20220516170306.6008-4-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516170306.6008-1-makvihas@gmail.com>
References: <20220516170306.6008-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the code to fix following warnings:
    WARNING: Comparisons should place the constant on the right side of the test
    CHECK: Comparison to NULL could be written "p"

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 27035eac6..3f4456901 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -962,7 +962,7 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len)
 	else
 		hidden_ssid = false;
 
-	if ((NULL != p) && (false == hidden_ssid && (*(p + 1)))) {
+	if (p && (!hidden_ssid && (*(p + 1)))) {
 		memcpy(bssid->Ssid.Ssid, (p + 2), *(p + 1));
 		bssid->Ssid.SsidLength = *(p + 1);
 	} else {
-- 
2.30.2

