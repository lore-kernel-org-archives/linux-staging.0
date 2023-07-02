Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DC21C04
	for <linux-staging@lists.linux.dev>; Sun,  2 Jul 2023 12:16:16 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b7f2239bfdso28551305ad.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Jul 2023 05:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688300176; x=1690892176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LI5xtyL2k2cBitbepn6US1F6e5Ej9j9z5n1WZ2zQtfs=;
        b=cAi0AivaoyBUmInw7KpCb/jsQAYZS+Rq+v2vjn8Jtq2wlacDU2vUHAwaSlPNyzDod4
         UTJWJy7s0Xa3OhUh5xMPWzhh27yf4/vp2lzAe6JJz5Q8+POegERnqiY1hd5jXN8UwV1i
         pUwapcc6ttM7NjnGdnIzxJQzZlKH13KBiK1+nh4/YEZ37jtPS8baOjBViZJ0Jud3bQ3V
         HZdMrSYkfhePqAAurgUQTa9HtJHBhULxOUSQnS/xfPh6Hdwg1xuCo+N1ao7XCq5Ucncm
         LcZR7JRR5cFbQY1XTqHX5UhosyhAMeFEWBTd2YF6fWZY40ZEjQyXR5SThR44aFi1QaQx
         0C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688300176; x=1690892176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI5xtyL2k2cBitbepn6US1F6e5Ej9j9z5n1WZ2zQtfs=;
        b=CJmqhzK/O0fMbEgwftktRMRUWSOq56ARd3EMTbZJ1aPX5xVm9LWgA1hIuDftA0FlZP
         I2tAC9GV7v0xQYIzXTbSRgf4bXa+cw8pw/+AHXviCVqiQQqm01w58+eEWRC8+LYcYIWH
         6iNWBUt7WFmiF9IBuWCH90rzUGOExvLJubnjnznlRFlJo7Z02aVDrsCCliQIonGxl2SQ
         DVrJR64HaSLFe1GuCLOLLh/i3fICWViGWtG1vLf3kWxNyqH9QAKxIJKbI1v3EOL7g/m4
         nH1xvyEwlkNZuD9pfazRFT+/Z0TXbFcIq7gmecA2+7jXeKNc4ymdJEyF4U8XWUaacf1c
         EA8A==
X-Gm-Message-State: ABy/qLYxdS9C/+wPLbLtDY/9e0XCNQZ1Pa8Icx7Ia0YPDBISXojEejLJ
	pzDHqysqbdb2hKNUhR/s5aE=
X-Google-Smtp-Source: APBJJlHF4Wdd3nuQiVZBSb9dYApRmcLqlVqkm3nVD3k3QUQGvK3mgSNWcWdCX2B2hqCBuE/YtMC0RQ==
X-Received: by 2002:a17:902:e9d1:b0:1b5:361:cefe with SMTP id 17-20020a170902e9d100b001b50361cefemr7811279plk.52.1688300175778;
        Sun, 02 Jul 2023 05:16:15 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709027b8500b001ab2592ed33sm13580074pll.171.2023.07.02.05.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 05:16:15 -0700 (PDT)
Date: Sun, 2 Jul 2023 17:46:10 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH 3/4] staging: rtl8192e: Rename variable LowRSSIThreshForRA
Message-ID: <ebea3e75dc84a6d77750c0598ab12d04ad55c676.1688299890.git.yogi.kernel@gmail.com>
References: <cover.1688299890.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1688299890.git.yogi.kernel@gmail.com>

Rename variable LowRSSIThreshForRA to low_rssi_thresh_for_ra to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index a535a63ce9f7..d266d2d047ca 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -278,7 +278,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	struct rt_hi_throughput *ht_info = priv->rtllib->ht_info;
 	struct rate_adaptive *pra = &priv->rate_adaptive;
 	u32 current_ratr, target_ratr = 0;
-	u32 LowRSSIThreshForRA = 0, HighRSSIThreshForRA = 0;
+	u32 low_rssi_thresh_for_ra = 0, HighRSSIThreshForRA = 0;
 	bool bshort_gi_enabled = false;
 	static u8 ping_rssi_state;
 
@@ -320,15 +320,15 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 
 		if (pra->ratr_state == DM_RATR_STA_HIGH) {
 			HighRSSIThreshForRA = pra->high2low_rssi_thresh_for_ra;
-			LowRSSIThreshForRA = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
+			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low_rssi_thresh_for_ra40M) : (pra->low_rssi_thresh_for_ra20M);
 		} else if (pra->ratr_state == DM_RATR_STA_LOW) {
 			HighRSSIThreshForRA = pra->high_rssi_thresh_for_ra;
-			LowRSSIThreshForRA = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
+			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low2high_rssi_thresh_for_ra40M) : (pra->low2high_rssi_thresh_for_ra20M);
 		} else {
 			HighRSSIThreshForRA = pra->high_rssi_thresh_for_ra;
-			LowRSSIThreshForRA = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
+			low_rssi_thresh_for_ra = (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) ?
 					(pra->low_rssi_thresh_for_ra40M) : (pra->low_rssi_thresh_for_ra20M);
 		}
 
@@ -337,7 +337,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 			pra->ratr_state = DM_RATR_STA_HIGH;
 			target_ratr = pra->upper_rssi_threshold_ratr;
 		} else if (priv->undecorated_smoothed_pwdb >=
-			   (long)LowRSSIThreshForRA) {
+			   (long)low_rssi_thresh_for_ra) {
 			pra->ratr_state = DM_RATR_STA_MIDDLE;
 			target_ratr = pra->middle_rssi_threshold_ratr;
 		} else {
-- 
2.34.1

