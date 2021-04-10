Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B2970
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:21:07 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id u21so13003959ejo.13
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=70up8zMFHK98mBqYLU707HfdW2OG0jaycv4htN1s4V0=;
        b=UxoIFR1bhd8vbmQC86UCMEjaVHHbGAuG3zr4mCh3EfoQ0v0Wf9Q+pZV91UBqBHlrPT
         gSs4NNbuIR4UQZV9RoFLtlBvuoEDXZor+542UHpQ0B6ziCfDxQOyjHOIJAqQqcU1Z+sj
         bi2ZUUvePoY4dwv/cufJ7awY+nQDdpFmQpbEXJBaV7viPMxzKX+j+teu01H8VqLgJ5PI
         tOMNP9eRWE1LYeZ7OqoyLGrDJp4rAipDVABS5Bx7ppjWEbSUnWAnDkUEhGDfcGZMTEO8
         gSP3DSPE2tH3cVsKYSEARJbhaiFoesH8x2sUcIzugNuF7CyDDPMPbtG0uHtNlNU59+uo
         CTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=70up8zMFHK98mBqYLU707HfdW2OG0jaycv4htN1s4V0=;
        b=jQy76ZrnogqGRQCT/4xo0KT0QaPWBw8POa+CSt+8ss7M0s4/JkiOeg3SiTqAXgdw6+
         tfQJEl8nEo7qcehTPHydVB8aX1oXP6jn9t99FvIthKEwBP3nwgHjjuFPqCFmtl1FL7+w
         zCgSAIppW0zntzzlPQeeMENLCbUh5BYeiNsU3UOxi7UFfIXRhy5owcurPg4+ryih0Uu5
         c+tCZOr/3Pj7RpM4tUtGObfxhAWKCR+Giu+TQ0UI0N14k2pU4iAmxeM8QDLPqk5P1OLy
         DFoLWnqsK1pvMvAb/Bhns2ZwiUNu5Bk2I90/dkTbk5Wj3eDurday5so5m4lybItqTKDC
         Hzwg==
X-Gm-Message-State: AOAM533CQgawjrMX6CSKx+zblFnwhxXzG2sm0KnDpXT2W6hWgvLh4PEJ
	wzxNmgswEfS4n1BLfNnFSdo=
X-Google-Smtp-Source: ABdhPJwd71jUymegSb9eC64dLSXqPTqTphaSVXSAJqPjQhwMfTFzxqvGxWWrMOjTdaD9pZ3iiw78Kg==
X-Received: by 2002:a17:906:4015:: with SMTP id v21mr20929790ejj.433.1618064465775;
        Sat, 10 Apr 2021 07:21:05 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id gb22sm2686324ejc.78.2021.04.10.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:21:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/25] staging: rtl8723bs: put spaces around operators
Date: Sat, 10 Apr 2021 16:20:29 +0200
Message-Id: <65b7cf4b1ae3cea25a316f3c9f56c697ee7be8af.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issues:

CHECK: spaces preferred around that '+' (ctx:VxV)
87: FILE: drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:746:
+	if ((_offset+_size_byte) > EFUSE_MAX_MAP_LEN)
--
CHECK: spaces preferred around that '+' (ctx:VxV)
105: FILE: drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:847:
+	if ((_offset+_size_byte) > EFUSE_BT_MAP_LEN)
--
CHECK: spaces preferred around that '-' (ctx:VxV)
133: FILE: drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:906:
+		if ((eFuse_Addr-1) < total)
--
CHECK: spaces preferred around that '|' (ctx:VxV)
392: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2485:
+	if (check_fwstate(pmlmepriv, (_FW_LINKED|WIFI_AP_STATE)) != true)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 +++---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 44cb4c5be501..00115a0c70be 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -743,7 +743,7 @@ static void hal_ReadEFuse_WiFi(
 	/*  */
 	/*  Do NOT excess total size of EFuse table. Added by Roger, 2008.11.10. */
 	/*  */
-	if ((_offset+_size_byte) > EFUSE_MAX_MAP_LEN)
+	if ((_offset + _size_byte) > EFUSE_MAX_MAP_LEN)
 		return;
 
 	efuseTbl = rtw_malloc(EFUSE_MAX_MAP_LEN);
@@ -844,7 +844,7 @@ static void hal_ReadEFuse_BT(
 	/*  */
 	/*  Do NOT excess total size of EFuse table. Added by Roger, 2008.11.10. */
 	/*  */
-	if ((_offset+_size_byte) > EFUSE_BT_MAP_LEN)
+	if ((_offset + _size_byte) > EFUSE_BT_MAP_LEN)
 		return;
 
 	efuseTbl = rtw_malloc(EFUSE_BT_MAP_LEN);
@@ -903,7 +903,7 @@ static void hal_ReadEFuse_BT(
 			}
 		}
 
-		if ((eFuse_Addr-1) < total)
+		if ((eFuse_Addr - 1) < total)
 			break;
 
 	}
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 601a16074ee3..54c65c125c8c 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2482,7 +2482,7 @@ static int cfg80211_rtw_del_station(struct wiphy *wiphy, struct net_device *ndev
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	const u8 *mac = params->mac;
 
-	if (check_fwstate(pmlmepriv, (_FW_LINKED|WIFI_AP_STATE)) != true)
+	if (check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)) != true)
 		return -EINVAL;
 
 	if (!mac) {
-- 
2.20.1

