Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7735C419FD8
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551555; cv=none; b=i641cbeT1dTAieX77TXT05Pr64PM5xKrBVQhVbe5Sss41itBuDfY7DDFCLxLFyRxL0rMUaGoavPKiU78yhAMkrRAb/Z3LhMRxfqcnV6MpHhMT0vAxPqkkTUhsWDXnraobt+mB33sC0NV4krboX/7a6y+C6EjS/dX/0O291pxNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551555; c=relaxed/simple;
	bh=a+Nu4iWUh97KiGwqB4fi8zZL5vDj5ZgP1hiKY5rslJU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OoPsqtf2eQA9DlH77kfQTVKJlGeFT9/m9Af9HuWSHFjv9XrSqEVMFIMIFrpSBlAQHLR5NLDsdyutZJhCXAGum0ECtMXRfFlVfeVIwWma9fRSp+ppSzeGBuGfnTEjHCDJsLNXVzrx+jzm1esxr4ZcwVakVqmydpeyendbcUe6pLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw+5DoS2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw+5DoS2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4720f3bf164so2009734f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784551552; x=1785156352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZcIQdAMNk+1CA6HPJikiCQtvztUMhg2TSoJor+KqKw=;
        b=Yw+5DoS2dW/mAIEt6PpSLJRzByGbZ98IotnXi9ySrmNcFz2q2IDECYPVffJQggte6X
         f3Tn5rdV5vTcPQcz1DITVq3fCd9s8N4gjoH6mX3IIzN41RSOSSIYbFSIQA7IQm9xNdwm
         MvNhXU4jJLMPQ7Ipb81NoUZu4Zfh+WN+kTK3Fke+beVbfm/XJq+Q3W64lKhBxHvPMS+Z
         +OamAFm9WHjhjVQ7LS+9EQtF/z41cONRfSCduepyl1hY2Pkso3onwprAn5T/2gswkojI
         uO1RNJP1xKt9BFV8NWiDW4P6Ee+241WaftCWD5lXAlJMd7712iVpYIKNe3LNdFqeauGn
         sfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784551552; x=1785156352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZcIQdAMNk+1CA6HPJikiCQtvztUMhg2TSoJor+KqKw=;
        b=iF2pU763fRgcdGp7K8SdcysBzVy5OXCUBIaEeflqPixTVd4c4lm/C1jKS2GCx9iRQE
         aZIho+qKmVIYLuTJ/2zf5N/EgjA/22TTW+xcHjR7AY6NZqiXAHklm6Rp7LaUCywWjleZ
         QHDm5z9q3TzlexXZ6tJeG3KDwqTP0J7qn2f6OlenPnFHsJPxupoaO2IC/x3G3qjGWY82
         IWyre86DnNaeICiDpZlESOC2uR/M7lWGLnU6W2d6/tC7hMNkN+ajCsvaDxSNs/LGN13f
         KRz9SSs42T+RC35Z8vlkkMKhxHTVCWeyGIxtww2b+nDrp9pbcfHuhyTpbajxmQdPHW7T
         GKJw==
X-Gm-Message-State: AOJu0YwyEuaQ0Hc+AS3sMEgfxnZmBZexNikcPFL4i6Ve8Lbt8YX7anFH
	EPNIx+CuXJMYMZysSOyMLgpnZAVsKkkgtEe7naZi4wvYakDys/GNBveo
X-Gm-Gg: AR+sD11XzOAo55gim4OTBn5wMpNhcFW7a6Tk5lG+MrDqtpZ2+zSHXvACq/A34b8aTGB
	sFTHvdokMCH6c8mmXUtOkbAygLZKB68tWmEFTUJaCDVClzoqPWy1uzWvU794sOVbtc0kv3oIk/I
	X2pC8XbwrwhJQlGrj1J5HkYQfON7JEujL07/rM/3LbVWNC/9j1hWtu3bo8ZcmOpCehayaIzlguk
	860eXPssRR8z/KJ38gb2h4HcHN71XMZRSPuvrS7VIE4ajho39hcoVkD14IuVVzhVeFOkH4+3aSX
	/m9YBtz2bWV8nhYdGFFWoebh032JrGqPDjkd5wc71cuU9RSHjNwogN/dOGfcXAdEt63WrI0cjhb
	oJ3Oi4qv8VIyCgNqSoLQvkJcqIl6gSKKU43RkM22NitF66kll+6rd/zVboz66c4/lD/2iwrp0Fp
	IBWpMDhLu/grXT9EldSjuBi25a4iq9+RGpVi8NS2Q9l1kudUfS
X-Received: by 2002:a05:6000:22c9:b0:47d:f508:3364 with SMTP id ffacd0b85a97d-47f5a5486cemr22453903f8f.15.1784551551450;
        Mon, 20 Jul 2026 05:45:51 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm30771194f8f.1.2026.07.20.05.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:45:50 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: rename mBratesOS to avoid CamelCase
Date: Mon, 20 Jul 2026 14:45:42 +0200
Message-Id: <20260720124544.63457-2-olivier.tanoh19@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720124544.63457-1-olivier.tanoh19@gmail.com>
References: <20260720124544.63457-1-olivier.tanoh19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding the use of CamelCase:
CHECK: Avoid CamelCase: <mBratesOS>

Rename the struct member mBratesOS to comply with the
Linux kernel coding style.

Signed-off-by: Olivier Tanoh <olivier.tanoh19@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 6 +++---
 drivers/staging/rtl8723bs/hal/hal_com.c          | 6 +++---
 drivers/staging/rtl8723bs/include/hal_com.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 8b0502a1881b..84c7c9e8a748 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -180,14 +180,14 @@ void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask)
 	mcs_set[3] &= mcs_rate_4r;
 }
 
-void update_basic_rate_table(struct adapter *Adapter, u8 *mBratesOS)
+void update_basic_rate_table(struct adapter *Adapter, u8 *mb_rates_os)
 {
 	u8 i;
 	u8 rate;
 
 	/*  1M, 2M, 5.5M, 11M, 6M, 12M, 24M are mandatory. */
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-		rate = mBratesOS[i] & 0x7f;
+		rate = mb_rates_os[i] & 0x7f;
 		switch (rate) {
 		case IEEE80211_CCK_RATE_1MB:
 		case IEEE80211_CCK_RATE_2MB:
@@ -196,7 +196,7 @@ void update_basic_rate_table(struct adapter *Adapter, u8 *mBratesOS)
 		case IEEE80211_OFDM_RATE_6MB:
 		case IEEE80211_OFDM_RATE_12MB:
 		case IEEE80211_OFDM_RATE_24MB:
-			mBratesOS[i] |= IEEE80211_BASIC_RATE_MASK;
+			mb_rates_os[i] |= IEEE80211_BASIC_RATE_MASK;
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 80a775437751..b3c934833084 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -247,13 +247,13 @@ u8 HwRateToMRate(u8 rate)
 	return ret_rate;
 }
 
-void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg)
+void HalSetBrateCfg(struct adapter *Adapter, u8 *mb_rates_os, u16 *pBrateCfg)
 {
 	u8 i, is_brate, brate;
 
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-		is_brate = mBratesOS[i] & IEEE80211_BASIC_RATE_MASK;
-		brate = mBratesOS[i] & 0x7f;
+		is_brate = mb_rates_os[i] & IEEE80211_BASIC_RATE_MASK;
+		brate = mb_rates_os[i] & 0x7f;
 
 		if (is_brate) {
 			switch (brate) {
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 7bbf62cfd825..95228f19493d 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -112,7 +112,7 @@ u8 HwRateToMRate(u8 rate);
 
 void HalSetBrateCfg(
 	struct adapter *Adapter,
-	u8 *mBratesOS,
+	u8 *mb_rates_os,
 	u16	*pBrateCfg);
 
 bool
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 0c2bd51b6bc2..14ba1dc7d7ef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -430,7 +430,7 @@ u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta);
 
 void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len);
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
-void update_basic_rate_table(struct adapter *padapter, u8 *mBratesOS);
+void update_basic_rate_table(struct adapter *padapter, u8 *mb_rates_os);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
 
 void Save_DM_Func_Flag(struct adapter *padapter);
-- 
2.34.1

