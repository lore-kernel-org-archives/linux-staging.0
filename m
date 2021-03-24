Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E347670
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id x16so24300430wrn.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=51ibm0Jr9f9ovhwTGj8Hk8wfk5wENy9Z+BbC7tJ1o7Q=;
        b=bF/iKE37K4HmnOLzl55qrH6YQgM9VbEcQKLu8e5OdyViZwwGxbng02Y+BPSWjxvFwe
         p6wSiHrtO44704aPlFCRt27PmDgnfewJjTk2JkdOf1P6697+UKgxjc0FDTJ8HZ0RL1F7
         QltJ6xkNpka0LNScrbgGyZZ35uc6+zqf1pPJmLmbOpVUh4apuP+Ht4vYvrVTW81l1ZDI
         UJMMmDVb+W6yqvnwcQjM4PmCe3tGQGuYUeWa4YCI/yzE3rzvFARVkt9SQwna4r3X5ZPo
         j1eXcYK124Zsnp3n/yjoEXDldqsE1P3gLyUeCAJ1bgN1ha7r1DSy2eyvC7h+0Mm8vqLQ
         zH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=51ibm0Jr9f9ovhwTGj8Hk8wfk5wENy9Z+BbC7tJ1o7Q=;
        b=Whipoqe/xzyNKIu/JQiU3lzsFzLCAF4CMcu4W2uDkQeinh+sYZRuuou4Zbm9F1hUAN
         JRLIFkf3hHRWvYZb5mdpMuilneVztOEk2nTCqg5Yt2i6VwopR3hG2I6RSjogeIohkgtK
         GgQdF4HLG5rjsi+M8/m7w8bT0Z/TXsyWXF4Z8P29P4vFScTyi/YYk3loLXVwEW8PLUPd
         Ji6momr8/z3dQDAOu6BJhPolO7grrihN8qhVVajM7PRb8Z7u2BCU/bMMnLy8J39CM5dV
         wjepF+YBEaTcCPts7o+fP+YmCGASZsSMQKwIQojopvUT7vkEONpyeolGSKEVyg9lgrP1
         vG5g==
X-Gm-Message-State: AOAM5307nodzimgKvbPhzU5caybdq5MBBCL8BnbPloppSAEJjv/oIMwS
	1IpxqsV20wBkLRQrtSuJFTQ=
X-Google-Smtp-Source: ABdhPJwrLeA6Neg00/fQKTUZm/bVSYEmf8Ilk+p7Qaq9a0hG3hsmB5gOHFOLaRNPH3/sHeIiqWUzIA==
X-Received: by 2002:adf:f948:: with SMTP id q8mr3360594wrr.296.1616589888395;
        Wed, 24 Mar 2021 05:44:48 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:48 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/33] Staging: rtl8723bs: remove named enums in rtw_mlme.h
Date: Wed, 24 Mar 2021 13:44:24 +0100
Message-Id: <20210324124456.25221-2-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
include/rtw_mlme.h:

	enum dot11AuthAlgrthmNum	[name]
	enum  _band			[name]
	enum DriverInterface		[definition]
	enum scan_result_type		[definition]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 25cfb4cc021b..87a1fa8f347e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -71,7 +71,7 @@
 #define _FW_UNDER_SURVEY	WIFI_SITE_MONITOR
 
 
-enum dot11AuthAlgrthmNum {
+enum {
  dot11AuthAlgrthm_Open = 0,
  dot11AuthAlgrthm_Shared,
  dot11AuthAlgrthm_8021X,
@@ -87,7 +87,7 @@ enum rt_scan_type {
 	SCAN_MIX,
 };
 
-enum  _band {
+enum {
 	GHZ24_50 = 0,
 	GHZ_50,
 	GHZ_24,
@@ -96,18 +96,6 @@ enum  _band {
 
 #define rtw_band_valid(band) ((band) >= GHZ24_50 && (band) < GHZ_MAX)
 
-enum DriverInterface {
-	DRIVER_WEXT =  1,
-	DRIVER_CFG80211 = 2
-};
-
-enum scan_result_type {
-	SCAN_RESULT_P2P_ONLY = 0,		/* 	Will return all the P2P devices. */
-	SCAN_RESULT_ALL = 1,			/* 	Will return all the scanned device, include AP. */
-	SCAN_RESULT_WFD_TYPE = 2		/* 	Will just return the correct WFD device. */
-									/* 	If this device is Miracast sink device, it will just return all the Miracast source devices. */
-};
-
 /*
 
 there are several "locks" in mlme_priv,
-- 
2.30.2

