Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991973A1D0D
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100270; cv=none; b=imnoTgN+KVNRNl2mlgHaXNqgJ4H2yn28XOtKTrObs2e0mGkPfgYSG99smiGQj5/PmykMG6XkvN4bzJIUKpVbGJRO1EiMHeptq63oKBdvIu/NMqibk2uCsKNPjoLP+E4Ss/JM1H8b48/k5A/NP1b9tBXM9GY4iWUg0vFQUTVyXgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100270; c=relaxed/simple;
	bh=Hu1091vzxhE20sqe1gKJoS22VIp5NWy5E0LidYNs1HA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJJEXf75Vqx64d7P0KalbQLfZ58U93RTM9Eelh75Y8UU7mWmdhzVjphc01EsDL+raCg6kBqnezLRGXbO9kq0od+UZxSdGStscoLhGZUCwLNiwa+Jb2CKIDyAWYPNZjmcYiWH7wyGbZOAagHNtpSNb0iSpROCltXMIIK7HIU5VTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuGmdykI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuGmdykI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43636c9fd7eso23669f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100265; x=1772705065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRUAZi7JUBdpQxCekrOXt6wfkm10KaCw1Hq23bmKUms=;
        b=MuGmdykIlzXSS7TpgCCIjaWucuC7tmuxiXpNIKFGb2aGcr3RUbzCrs8lDVmAIzZRiE
         18KtM4r7BDyk6sebBkSShpZdTbWXu/PAzWXTlo9gOSp2sEVSDEpUIBIiEhkUhcahkc4e
         KcmMOVtMrxC1FmpX2W0OL7/bqJYBlLeO9acdj+je99ufOM8yt+M3/aMv5ID4FoDVvCFl
         8X7recml7M9Yvd9t8PiG/RwVpSqXno4Z3q1oKlSz5XyXJYWJqkhZZGhmlrcGjvSvlWXG
         HKEVjLWjk9ihggsnKAVim+RcBGAYHAmQPkpTQd5KyaRL1WIBzkVGKK1OUK6BROGNsvZT
         cJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100265; x=1772705065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRUAZi7JUBdpQxCekrOXt6wfkm10KaCw1Hq23bmKUms=;
        b=iQCA7Ck9GhzKji9SxLz3M6lV+dBiNGcsK9Z6C0ItBCglqzktCvUyZrzCTGIZ0CeoVE
         NmlK0HVE4/ozJDW2A8AGNN1hMw7M6lPWVyXiu+x1C/r3H17ljdF7ayjtzzU7uWFRNeFt
         uNNx+/K/qUNra9FW8W/pKB9NFxiek0GhZg847P8aGjwDXc8P8c+S65ZYn7om7L1CWUWh
         A/Ki4IxOMce5TqvKAqIgQ5wasEfEZsvtKz/N5wK61PdkUQF3cRBIx4WVG+SCg+XSxHAX
         Cdt9EXOOsL31LE8ljyNH/w87BK12QCybaTRw+YMnvOCps7i+EzWgb80M9mA8nLkcjEFV
         yFkg==
X-Gm-Message-State: AOJu0YwwFf4VFpR5lbrDO4m1mVXG5VJyMYpkzbMHXlhIZpjka9RwWl2v
	OmTOnI2fYtML+myM15pyEvx0ulVWOp2nPG5pWJnPJ8NdcCvA7cGRmxiSo7DFtO2Qu1I=
X-Gm-Gg: ATEYQzwgLtHJBqBmzKmOhagvsBWnbfI+PLtiV47/L/bqL4uhqfsuZS4qIG6G2DhzKJl
	v8/ABedVZtZGCdgtwXMROT15ilvshBQlki/Hvo3RcZu+HEUvcclXpBtE6p0g6gdeD/tuT9Z/ZQr
	rrgjCQ2Xus2Fgh1+mOKaulyGvQE/D3CIJk/BHSCkBPdsWUQJTyjYgY6LBlOX8vg3GNglbJiWtF2
	qLuq7l8X+OFlGFUbCGBlN/Nl2C0/5m1/Dr4jZeJfda/ww1eUMKDaNKJ4XzwNoYOaspX0FpCFwhH
	H0uw9pOTWRThWCh/oA/VM8uWi8+AmaveJhieZTkoPfHqpwcHOMCkks1L6ERjyVWil1177SKxBdG
	DcB2S29Wd7UpbCSK+R3R6i9zQXD0YjWVPFrKAmrQvBaY4vgwrzpaiOZiLhwi2HWe1agpf5cjbfU
	gTYwhTbUQFu6L78xPeL06UlazP+pjl7fKnM6PiZR4DMg8jkkbyxRZUN4JZCVN84iQuITF1YgQoX
	v9XDW31bF5NhSWaKB1GCdbDQbifL/bkExxtX133cUyQdKflyuN4
X-Received: by 2002:a5d:5d84:0:b0:436:23a2:5e38 with SMTP id ffacd0b85a97d-4396f16d1c4mr19258389f8f.2.1772100264820;
        Thu, 26 Feb 2026 02:04:24 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:24 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 01/12] staging: rtl8723bs: remove unnecessary casts in rtw_ap.c
Date: Thu, 26 Feb 2026 14:02:45 +0400
Message-ID: <20260226100255.167059-3-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 864cd8b6d1f1..274a67ba0043 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -388,7 +388,7 @@ void update_bmc_sta(struct adapter *padapter)
 
 		psta->ieee8021x_blocked = false;
 
-		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
+		memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 		/* prepare for add_ratid */
 		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
@@ -545,7 +545,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 	/* todo: init other variables */
 
-	memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
+	memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 	/* add ratid */
 	/* add_ratid(padapter, psta); move to ap_sta_info_defer_update() */
@@ -2076,9 +2076,7 @@ void stop_ap_mode(struct adapter *padapter)
 	pmlmeext->bstart_bss = false;
 
 	/* reset and init security priv , this can refine with rtw_reset_securitypriv */
-	memset((unsigned char *)&padapter->securitypriv,
-	       0,
-	       sizeof(struct security_priv));
+	memset(&padapter->securitypriv, 0, sizeof(struct security_priv));
 	padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
 	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
 
-- 
2.52.0

