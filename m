Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91028C2BF
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242208; cv=none; b=p/DJeGbHdEQXvxF2Tv1tK9WYRe1y53T9t05FE/oUGILXVEm66FGn6dnLUFqYPgQ5NtsI/LnBBW3W8YJewP8T9V3n2+shzA/aE3VovD/wn2Ji+0Rm2qSoHF5bsB6hmRylMsKysZ+9C4mcQfPlpHtQs2roL04OuZdSeqcK+HNqJlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242208; c=relaxed/simple;
	bh=E2tVbOuiL3zZIsrPmoBv2m3MRk4qa7mEJqzNwfTQ4cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XjmNJTW+XrjchI41kDI8jRYsgTONxBGMTVResAnLVTHNgP3lgGHBWftKRRNX1JQkMj7tXqvt1kDinetW7LrfyXqf8yowo9kxc9FQRZGHEOUAuDrwIco0H63VL08UwLQsgFY0ddoImMZhIMSAAH1JMDHg4mjYZyyWwxu/3ReBk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rhV3ZInn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rhV3ZInn"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f707e5d75so2590293f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785242203; x=1785847003; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dx6GWFCsmDgAOCrs6zu5XboEn4YjvCkE11wpK+q8SAw=;
        b=rhV3ZInnWT41ZjG9Chfw+UE5KiCqnsdUXzhDkQwpeB8VKsjoGhyCE7hE+VUmH82xhO
         lo8mcDnvSC4tI8c9j6D5fZQQXwsiMDfjbg5/3K4Rrnjha48SeFk03UGaqkEukw7ktjfr
         96y5E7h2CT89GzqjgbALkKXGxPp6SaAqoRgJ0L/1zhebCuD/OTwnfqen0sfNry3nDqd0
         vxjQgjcjjA2FArr5JarrF0pk6Va9I25AgJC9bQQUzRee/ObM99hPDwHY9L/N+hZnIGxz
         2aNo/W5hG82p0+kkZuTLdeoeugLtnhFQQdTAJBLY3tf7h1Wrf8r0Kzhes9mvYB37A7NP
         KJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242203; x=1785847003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dx6GWFCsmDgAOCrs6zu5XboEn4YjvCkE11wpK+q8SAw=;
        b=HYmO7twW/FT7t3jO+47ZDx5y2WNShfbDpFji7MfPWKylfR02GxCeU1lJ2RLdhfdL2H
         6fgl4Lptj4kjGHmb1OYSnEPOPaW6SviI9xmQ/33xbDq0RE0iXFMJAF+ehoL3hkvnpCrR
         p6HJZTH9XdlfCdKQIdlmreMpCAOzxd9q8gSsV2AvXWv6jqxAdJLY/ctx0nM1t6bCbVG2
         2wYtbmWnalL0d+gsgl1C28MS6KYs7zbqnQPwVhYCIL9J5+jr5ugAJN8hmfd1TB5fGgYx
         iWKeL914JWDDSIg/MojuXRrNjamnhxJfN/vIm6fSHaEkBDdojLA/JuTYGdX7TSGnKwW8
         BOgQ==
X-Gm-Message-State: AOJu0Yw5TdzNnNQ4mkO2yklooezUgfEDxDYr4EbKODjfDlZeNalOgEe6
	v/xVcMDUsxp7MrE5vTCMBofMJRRHX1JvLck7z0JSHztodERECU67RJRzWSZaNrBcKUY=
X-Gm-Gg: AR+sD13H9g+SM2uWSkn+uR7OAaXo/hdYImlyOsr3Dm9NIjwWcUX7biQsWEJCisdVf+V
	mvAymv+kVuT0unQUW2hMG/PGYOC0pgZiMwmfE9ZYL5XMgfwKU9nLsW3bWHHNAlmYAwt0VsRsucE
	Ru9KmI69sw+0cfQZWWtOnTgLx/iq7dqb9ciUuKHAdKPRWD6s3m9u5cHSe4G4KUmWCnyndugKSCf
	jRref8fqTBqk6cykVmgOTPd7jw0+H9yBp6CDmpqy/1l9wke5ssYy28xqsfSNzxabwPGfOPpJc+A
	UmEcbNWzw3wnc51gJ8oQ6l3jQHVvD8ueFhZEgr3zrhNJpqntVY0Wl3tzAacbbMJwQ5lSApl1iYv
	sjBX/N0Y43MyB6aJ8TvrRzHD7HD2/h3kIj/YGN2is1tCsHEZWB9sFui0qZxPvHbpMGkQYgcS3i9
	lLTezkKXhX8XIFbnJJ/ZVWfOCdumlGqu/7YFO7lCtxy24yXUm1F0oVHhmMcv60TLR54zUNCQE2y
	90DaY+x
X-Received: by 2002:a5d:64c6:0:b0:47f:9751:cb3d with SMTP id ffacd0b85a97d-47fb1e5d0eemr2530235f8f.8.1785242203081;
        Tue, 28 Jul 2026 05:36:43 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f96b9abc0sm37365418f8f.32.2026.07.28.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:36:42 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: rename mBratesOS to avoid CamelCase
Date: Tue, 28 Jul 2026 14:36:31 +0200
Message-Id: <20260728123633.79735-2-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728123633.79735-1-olivier.tanoh19@gmail.com>
References: <2026072851-foil-womanly-4837@gregkh>
 <20260728123633.79735-1-olivier.tanoh19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding the use of CamelCase:
CHECK: Avoid CamelCase: <mBratesOS>

Rename it to basic_rates, which describes the content of the
variable, rather than keeping the Hungarian notation prefixes.

Signed-off-by: Olivier Tanoh <olivier.tanoh19@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 6 +++---
 drivers/staging/rtl8723bs/hal/hal_com.c          | 6 +++---
 drivers/staging/rtl8723bs/include/hal_com.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 8b0502a1881b..627d778fb093 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -180,14 +180,14 @@ void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask)
 	mcs_set[3] &= mcs_rate_4r;
 }
 
-void update_basic_rate_table(struct adapter *Adapter, u8 *mBratesOS)
+void update_basic_rate_table(struct adapter *Adapter, u8 *basic_rates)
 {
 	u8 i;
 	u8 rate;
 
 	/*  1M, 2M, 5.5M, 11M, 6M, 12M, 24M are mandatory. */
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-		rate = mBratesOS[i] & 0x7f;
+		rate = basic_rates[i] & 0x7f;
 		switch (rate) {
 		case IEEE80211_CCK_RATE_1MB:
 		case IEEE80211_CCK_RATE_2MB:
@@ -196,7 +196,7 @@ void update_basic_rate_table(struct adapter *Adapter, u8 *mBratesOS)
 		case IEEE80211_OFDM_RATE_6MB:
 		case IEEE80211_OFDM_RATE_12MB:
 		case IEEE80211_OFDM_RATE_24MB:
-			mBratesOS[i] |= IEEE80211_BASIC_RATE_MASK;
+			basic_rates[i] |= IEEE80211_BASIC_RATE_MASK;
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 80a775437751..2f472afc5261 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -247,13 +247,13 @@ u8 HwRateToMRate(u8 rate)
 	return ret_rate;
 }
 
-void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg)
+void HalSetBrateCfg(struct adapter *Adapter, u8 *basic_rates, u16 *pBrateCfg)
 {
 	u8 i, is_brate, brate;
 
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-		is_brate = mBratesOS[i] & IEEE80211_BASIC_RATE_MASK;
-		brate = mBratesOS[i] & 0x7f;
+		is_brate = basic_rates[i] & IEEE80211_BASIC_RATE_MASK;
+		brate = basic_rates[i] & 0x7f;
 
 		if (is_brate) {
 			switch (brate) {
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 7bbf62cfd825..17bce0f88bac 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -112,7 +112,7 @@ u8 HwRateToMRate(u8 rate);
 
 void HalSetBrateCfg(
 	struct adapter *Adapter,
-	u8 *mBratesOS,
+	u8 *basic_rates,
 	u16	*pBrateCfg);
 
 bool
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 0c2bd51b6bc2..ed6c5001c68a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -430,7 +430,7 @@ u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta);
 
 void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len);
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
-void update_basic_rate_table(struct adapter *padapter, u8 *mBratesOS);
+void update_basic_rate_table(struct adapter *padapter, u8 *basic_rates);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
 
 void Save_DM_Func_Flag(struct adapter *padapter);
-- 
2.34.1

