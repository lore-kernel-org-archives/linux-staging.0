Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B873FC9
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t8so10456796wrq.4
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2rVSZ1EINx17V4YagxgYe0WT6sqjRu5zz30GSyfrtdk=;
        b=PZWCS+TcjZrrt/Kjgi3o6tr/Oyw5KRXtWpKh6I/LbXem4aqB3cgEJtluOsRr7KppCw
         rchsXxpAC0XUzYShUoA03+wd8oLBR6W734L+xESuDMgYkbvigaUUqyicl7s4dFmbIJWP
         8dpEbuSMVLlqIzR7JN/yC8pFgsey4KaOSS2HtsZiNLVouDmpWOS0YcD0SdGTliw83T6b
         oz4qDpcJx1VDcmld49PWvezABmwuOMfkJefZVzRKZqZyB9MIJ/cR0I3/ZwvqPb36/07F
         yjAXISWqYne9VZs0fiqlh5wrzdSTupzc7CiQ/fhW5kP/ACYCXXcdciYEc1scAvATmQFF
         SsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2rVSZ1EINx17V4YagxgYe0WT6sqjRu5zz30GSyfrtdk=;
        b=VGZDQMxEeev6soxflyF0kiKtersD0fz6cUZJVK9V6KpvdE7B/Uvvkmo4J8sfNWJ0ol
         EfnTHDcTz+C4vksjIpENSh7dM2mc9Wqhzw5RrzXRa4qHwEGDBtTeJ0zam169wkzIBHTj
         H3FLUR17A7+pINlCoS2FciHADHOc29qNv4njPjMhfV//t1hPcHc2cz5f+VCAMEBAv5PI
         xYyGxjM/1424K3dLvM5QjncJl7DrNct2/okr+Yt0zBuTH2cXB3kgpqm7CUQdhgYoErPk
         SdavUzsVCoflWArw/dHb5PwICvnQZ+vJ7mDafMfvtUB07r5bqHZtTv78GiyFdd1NPOmj
         yAKg==
X-Gm-Message-State: AOAM532yzntaAEYWmTIZLB3d6nAdjZkeH/x+6dj0hpgtD44lypVoTJZ/
	hE/FbbB+vws6LUs/2/b6mu+uHEjRYB/D2w==
X-Google-Smtp-Source: ABdhPJyYI0SPRCUY9nk88J86KyZBp7vCSKzwUy+l1CpVky+1PXGtdAesFFjdKpuCLOxMHhg9mPeo1g==
X-Received: by 2002:adf:dcc1:: with SMTP id x1mr845234wrm.415.1632341157179;
        Wed, 22 Sep 2021 13:05:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:56 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 36/47] staging: r8188eu: remove rtw_action_frame_parse()
Date: Wed, 22 Sep 2021 22:04:09 +0200
Message-Id: <20210922200420.9693-37-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_action_frame_parse() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 29 --------------------
 drivers/staging/r8188eu/include/ieee80211.h  |  3 --
 2 files changed, 32 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 29bf3bdb598b..bc7ab84c0e05 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1339,32 +1339,3 @@ u16 rtw_mcs_rate(u8 rf_type, u8 bw_40MHz, u8 short_GI_20, u8 short_GI_40, unsign
 	}
 	return max_rate;
 }
-
-int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *action)
-{
-	const u8 *frame_body = frame + sizeof(struct rtw_ieee80211_hdr_3addr);
-	u16 fc;
-	u8 c, a = 0;
-
-	fc = le16_to_cpu(((struct rtw_ieee80211_hdr_3addr *)frame)->frame_ctl);
-
-	if ((fc & (RTW_IEEE80211_FCTL_FTYPE | RTW_IEEE80211_FCTL_STYPE)) !=
-	    (RTW_IEEE80211_FTYPE_MGMT | RTW_IEEE80211_STYPE_ACTION))
-		return false;
-
-	c = frame_body[0];
-
-	switch (c) {
-	case RTW_WLAN_CATEGORY_P2P: /* vendor-specific */
-		break;
-	default:
-		a = frame_body[1];
-	}
-
-	if (category)
-		*category = c;
-	if (action)
-		*action = a;
-
-	return true;
-}
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index af1e074e0bdf..36c95adb9d85 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1169,7 +1169,4 @@ void rtw_macaddr_cfg(u8 *mac_addr);
 u16 rtw_mcs_rate(u8 rf_type, u8 bw_40MHz, u8 short_GI_20, u8 short_GI_40,
 		 unsigned char *MCS_rate);
 
-int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category,
-			   u8 *action);
-
 #endif /* IEEE80211_H */
-- 
2.33.0

