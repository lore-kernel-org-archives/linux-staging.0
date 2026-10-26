Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048234;
	b=X6GqerryQYukOJVxLun/0v2Awe9NI2efXdC8FUUugrx3lDwxtJk3CF1Nd4+0aXWuKdpX
	 oxxaRndQRqpQmfeLV6VwOqUvATcAuZIybvuwB3ezxdx+R42BIfgnG4gqQm1o5GuzI92ub
	 T4SOTIbOsyNDlyywM4Ir6BqiPH/8xG80xTgBqXCJAU9hZW2Ka3Od2mSjYyCds8Mhy4AEV
	 DuIQVrdrWMOIga4WWZmTqsYckl/O3svS22WgeTuoxNNWpl77TctWH3BbTSzvwunPxiQsS
	 yF8omVNLFPOm3yn117Mb3x/kArJBQwrQaDwo8IqCfMFHzblkYiSQr4OWdifTCPg5Iww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6zx1IAqmKNRN7Fxw3sfUqWx5HaiwX1Bvs6i7QcBjxaQ=;
	b=draR18VQ61Jse/WCE1OlA52dKeCqACtKrulQkfcgh8Hmr2RAZjrNy1frxSM/ob8WJx+d
	 SMbymskeoHTo6ehERr58Gh74RMK9LiS/RtpZ6RVMQ70N6mGl/+yfo7BdPSxHVaRi3kF95
	 4EdUQmm3RsFyY14CvDGzhxF0FOFvydAp5MeFwd3Ymn85xltXVvYu8C3Ol2AOe4dpTuB0Y
	 ZED8wFXTMmnID6nbpS00bZwW/XyioRmlQdFwTpp5a9Yaiy0JO5PM/UwG95sSTB+lNPyy9
	 IQzbO15smyA4D4HxWcJ755Z5C5LqdL4ejjStbCSXIYB3O0rWzSSYhHTLmuH8MzlekqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DHlXg3O7;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E6606A322
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 20:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C75E6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DHlXg3O7
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so26382095e9.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048232; x=1793653032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zx1IAqmKNRN7Fxw3sfUqWx5HaiwX1Bvs6i7QcBjxaQ=;
        b=DHlXg3O7p0Zsbi9XK0NHIJf9tx1+V3F6E7TbgSxu6IlbdTsGH8lX1Q/5qcRbetzbGO
         DfltUmZGJaRxpeK+K49XAS7ncBkjLs1QumNnibTPs/PQbVyR5TipODHExogGh6OIwMw4
         ja7JFQskDjlLeuV9baA1zndyV2wXE7ZqwAcc1vl8yD+fbc4FxeJvdTQ5SEOoZDr5pXOH
         mFRVBXxIYd8P67eEqvebbd9Kowx5QZ7Vv99IZCLh+HqvUX3MIu5Q71HgD41LwFsaVqi7
         SZXtqfXPPYyc7oV+SiqboP3tq87hlpBnIjEAeZHasclvauU9Jg5XDaluffvbpt1z4R6K
         GbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048232; x=1793653032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zx1IAqmKNRN7Fxw3sfUqWx5HaiwX1Bvs6i7QcBjxaQ=;
        b=OlfkD5tX3IvMCeiRy6qukRrOIPU6Cvg2M+DrFXjkjaW62JPFDqTc+UP2VOsd/QUBU5
         eR9eYjkKWo2vOPhtP8GQiGitIt8Cx5CGWqte8jlWfE4UgYsk3KHAgIrJoxOjhFBXn4zx
         5Y8EhO+gnsttu0yG3Kp3Gry2BUZdOuOKiqs3f34U2rZN0U3HDWEYOyDjkaKSn8oeL445
         2LMx7fb6vfSYY6N4F6AgNA8ZIRhuRtdPbf3FKqlgvPL39AhNih8qyMCHdvz/jV6zobvc
         7eXx3wLU5M3PGSCBXylgB9qRb7cwpZZvSWxo6VsSpvqocgJ4npgirmI5j5NA78kUnJTd
         luKA==
X-Gm-Message-State: AFq9FYI8cvR3ViTZUN3njQg26Pv9KOMKHJA2Z7v4vil6pLueG2ucobPm
	kYEuNCakTecZEaF0R8q2OAer1jbGrGH8qXWv6bF3NOHEIsocJOi5LMkObURKsixtpGA=
X-Gm-Gg: AYBFou2DHtd0DnFtlHYsgdQnP29UHnh9qwUcmPg7v9FEqa2ZOomwA68FRfoA+Urb/+i
	TIUkMsoe6RR6AKtPrUYqUThu+T4fdnC+vf+TsKpKHcCYelUr1hBk24QzaVS5pdeYiCdSPI4Yfl9
	7AMin4hiDayyr9LEyTpvE9uySwX6IOnTofQLNSWLv8GlF7YPHo321XaPl6qg6BI+uRnHbUifRYm
	Ef6o6Q/aAmh4TH4Lhn/09sxG1dYZQgnZwAZtZCsEy+qQd+WG0A6Kb1qhFwa4+5+10sb0ZO7iLco
	NTt5do6VNK/vmHkPkBhTUToRrAsXCyhD2duHMg6NzmqcsuRzZL8ddKvhPabkSQatfX5lggRfkui
	f0Xfg9J/QDPxVrkkPsWCGWHhFbwrELTupVz6IZBjxutQFXRQpJzT6ovhbyb14yReAO6NKHvQxnH
	+TpcNgfu4MEFIISb6ba27TXAURThHv11m4zFBrMEWsC8z+CpBUyejCvx2FfYPJ7KZW91D8+7UAb
	ltbtxGd0+7c/tKNCyTNCdZi035nHxQUS9V0IgmViKz8JhI14UPSxrXUzn7Q+5qFcigJ/4AJQHEW
	vKY=
X-Received: by 2002:a05:600c:6095:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a35ac99412mr133099355e9.12.1793048232108;
        Mon, 26 Oct 2026 13:57:12 -0700 (PDT)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm193725085e9.4.2026.10.26.13.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:11 -0700 (PDT)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: use BIT() macro for bit definitions
Date: Mon, 26 Oct 2026 22:56:58 +0200
Message-ID: <20261026205659.181065-3-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026205659.181065-1-albu.victor.m@gmail.com>
References: <20261026205659.181065-1-albu.victor.m@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the "(1 << n)" shifts with BIT(n).

No functional change intended.

Compile tested only.

Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 78 +++++++++----------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9741daef3b87..fc0473ff8a56 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -297,19 +297,17 @@ struct ieee80211_snap_hdr {
 #define IEEE80211_DATA_HDR3_LEN 24
 #define IEEE80211_DATA_HDR4_LEN 30
 
-
-#define IEEE80211_STATMASK_SIGNAL (1<<0)
-#define IEEE80211_STATMASK_RSSI (1<<1)
-#define IEEE80211_STATMASK_NOISE (1<<2)
-#define IEEE80211_STATMASK_RATE (1<<3)
+#define IEEE80211_STATMASK_SIGNAL BIT(0)
+#define IEEE80211_STATMASK_RSSI BIT(1)
+#define IEEE80211_STATMASK_NOISE BIT(2)
+#define IEEE80211_STATMASK_RATE BIT(3)
 #define IEEE80211_STATMASK_WEMASK 0x7
 
+#define IEEE80211_CCK_MODULATION    BIT(0)
+#define IEEE80211_OFDM_MODULATION   BIT(1)
 
-#define IEEE80211_CCK_MODULATION    (1<<0)
-#define IEEE80211_OFDM_MODULATION   (1<<1)
-
-#define IEEE80211_24GHZ_BAND     (1<<0)
-#define IEEE80211_52GHZ_BAND     (1<<1)
+#define IEEE80211_24GHZ_BAND     BIT(0)
+#define IEEE80211_52GHZ_BAND     BIT(1)
 
 #define IEEE80211_CCK_RATE_LEN			4
 #define IEEE80211_NUM_OFDM_RATESLEN	8
@@ -330,18 +328,18 @@ struct ieee80211_snap_hdr {
 #define IEEE80211_OFDM_RATE_54MB		0x6C
 #define IEEE80211_BASIC_RATE_MASK		0x80
 
-#define IEEE80211_CCK_RATE_1MB_MASK		(1<<0)
-#define IEEE80211_CCK_RATE_2MB_MASK		(1<<1)
-#define IEEE80211_CCK_RATE_5MB_MASK		(1<<2)
-#define IEEE80211_CCK_RATE_11MB_MASK		(1<<3)
-#define IEEE80211_OFDM_RATE_6MB_MASK		(1<<4)
-#define IEEE80211_OFDM_RATE_9MB_MASK		(1<<5)
-#define IEEE80211_OFDM_RATE_12MB_MASK		(1<<6)
-#define IEEE80211_OFDM_RATE_18MB_MASK		(1<<7)
-#define IEEE80211_OFDM_RATE_24MB_MASK		(1<<8)
-#define IEEE80211_OFDM_RATE_36MB_MASK		(1<<9)
-#define IEEE80211_OFDM_RATE_48MB_MASK		(1<<10)
-#define IEEE80211_OFDM_RATE_54MB_MASK		(1<<11)
+#define IEEE80211_CCK_RATE_1MB_MASK		BIT(0)
+#define IEEE80211_CCK_RATE_2MB_MASK		BIT(1)
+#define IEEE80211_CCK_RATE_5MB_MASK		BIT(2)
+#define IEEE80211_CCK_RATE_11MB_MASK		BIT(3)
+#define IEEE80211_OFDM_RATE_6MB_MASK		BIT(4)
+#define IEEE80211_OFDM_RATE_9MB_MASK		BIT(5)
+#define IEEE80211_OFDM_RATE_12MB_MASK		BIT(6)
+#define IEEE80211_OFDM_RATE_18MB_MASK		BIT(7)
+#define IEEE80211_OFDM_RATE_24MB_MASK		BIT(8)
+#define IEEE80211_OFDM_RATE_36MB_MASK		BIT(9)
+#define IEEE80211_OFDM_RATE_48MB_MASK		BIT(10)
+#define IEEE80211_OFDM_RATE_54MB_MASK		BIT(11)
 
 #define IEEE80211_CCK_RATES_MASK		0x0000000F
 #define IEEE80211_CCK_BASIC_RATES_MASK	(IEEE80211_CCK_RATE_1MB_MASK | \
@@ -422,15 +420,15 @@ static inline bool IS_OFDM_RATE(uint rate)
  */
 #define IEEE80211_FRAG_CACHE_LEN 4
 
-#define SEC_KEY_1         (1<<0)
-#define SEC_KEY_2         (1<<1)
-#define SEC_KEY_3         (1<<2)
-#define SEC_KEY_4         (1<<3)
-#define SEC_ACTIVE_KEY    (1<<4)
-#define SEC_AUTH_MODE     (1<<5)
-#define SEC_UNICAST_GROUP (1<<6)
-#define SEC_LEVEL         (1<<7)
-#define SEC_ENABLED       (1<<8)
+#define SEC_KEY_1         BIT(0)
+#define SEC_KEY_2         BIT(1)
+#define SEC_KEY_3         BIT(2)
+#define SEC_KEY_4         BIT(3)
+#define SEC_ACTIVE_KEY    BIT(4)
+#define SEC_AUTH_MODE     BIT(5)
+#define SEC_UNICAST_GROUP BIT(6)
+#define SEC_LEVEL         BIT(7)
+#define SEC_ENABLED       BIT(8)
 
 #define SEC_LEVEL_0      0 /* None */
 #define SEC_LEVEL_1      1 /* WEP 40 and 104 bit */
@@ -496,9 +494,9 @@ static inline bool IS_OFDM_RATE(uint rate)
 #define MAX_P2P_IE_LEN (256)
 #define MAX_WFD_IE_LEN (128)
 
-#define NETWORK_EMPTY_ESSID (1<<0)
-#define NETWORK_HAS_OFDM    (1<<1)
-#define NETWORK_HAS_CCK     (1<<2)
+#define NETWORK_EMPTY_ESSID BIT(0)
+#define NETWORK_HAS_OFDM    BIT(1)
+#define NETWORK_HAS_CCK     BIT(2)
 
 #define IEEE80211_DTIM_MBCAST 4
 #define IEEE80211_DTIM_UCAST 2
@@ -520,15 +518,15 @@ static inline bool IS_OFDM_RATE(uint rate)
 #define DEFAULT_FTS 2346
 #define IP_ARG(x) (x)
 
-#define CFG_IEEE80211_RESERVE_FCS (1<<0)
-#define CFG_IEEE80211_COMPUTE_FCS (1<<1)
+#define CFG_IEEE80211_RESERVE_FCS BIT(0)
+#define CFG_IEEE80211_COMPUTE_FCS BIT(1)
 
 #define MAXTID	16
 
-#define IEEE_A            (1<<0)
-#define IEEE_B            (1<<1)
-#define IEEE_G            (1<<2)
-#define IEEE_MODE_MASK    (IEEE_A|IEEE_B|IEEE_G)
+#define IEEE_A            BIT(0)
+#define IEEE_B            BIT(1)
+#define IEEE_G            BIT(2)
+#define IEEE_MODE_MASK    (IEEE_A | IEEE_B | IEEE_G)
 
 /* Action category code */
 enum {
-- 
2.43.0

