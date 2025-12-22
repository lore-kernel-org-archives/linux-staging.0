Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C302D4B57
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766409906; cv=none; b=k6wF90yGLuMH/nL6ZImjIWNSTByqj/j3avavG6NDsnj8iUm0SVTHyX9i+s3HRdLLqa7cymD6JmtUz7Oz19sJUSWCGx3BLMl3NdvCZDMgPIvpll9/r6RqIrVUWRN9HH6AE9vloIvEKg3Cr85y8etqG5fXCsJCb3L76S7sV7lXETA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766409906; c=relaxed/simple;
	bh=+pZO1su9nhOc/LM/jtS46Y1zh8DfXqeWbCbVmpqTRCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0n/RW4tSKzw8T++eMmAkUT/G7qiq3A9fht5qPx6IZ8HQNbmRJSm+8HxQyDWAEYWRQi1i2TPTiG/CPOFtcNT3BPZcyGGoD0iYVcrs7oH39XPV9TSZBQatUqGmWMZtn0EKO0JPsAlQGfkf+X5Xnn4k9FGH4ysVwEponcORqm4wOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayAApOyF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayAApOyF"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a2dced861so49235531fa.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 05:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766409902; x=1767014702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0B84mzxYDoB5DNmz/qA3S37IqGDBh9R9i3W6A9vkIB8=;
        b=ayAApOyFzq4DRIfuqJsKegZHQaIFNk/DLzMbeqn7zHQfktJGUDHJ0STWDW/1UW0Nfq
         pv+siQeUZLuQZNhu4RXhABdqZW4hHR8Fkm5BpogS6p8PjAsI1mYjQnDFrLCHk4JdWtcD
         5vtYRxqzhquuUu9X7LoyEOXE7E9+IJ5ZK1eZ7kr56ASLnr5lZq9/SFhpG+yjW4de0HrK
         hMaua17YO2cBAGCnjEyPSp3y9RY3o76YKTT88R4qo5m1MK5QKn0T/Osm89vBdJ4mki7f
         BdqkUloYeZrwon0EykZrFeM6C3VDuQic8CkbcsqaiJk8MDkxLFXloiZRSiryASLF3CvH
         AbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766409902; x=1767014702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B84mzxYDoB5DNmz/qA3S37IqGDBh9R9i3W6A9vkIB8=;
        b=u0BeIJsmj6Bn95DPRVLXE9GGTGgr0wchtLO49/zANudaO6Ay7SBSbjsU6xKdKyD7Z2
         svG52fq/F/1t39mtrn4/rN6T/qBhkFjatXI2arYV/s/pvjimrMGfcLuTuB+tWm+0uBRa
         wHmqoahk3W+Lvxxy3BMI8VtbfH0b0UUciELxK2ESH7Y0uBbv0EEHH1tGuXVuLbF/g7hW
         N0pG7obAzsRdFA+pVk3AUYPgDVpDY8Jcx4GEwXe6yhnFF5CGtqgDHacQjURhBFdf4MpS
         bHRnWXTixEVhkzxddBxBblnjXoF3CslgidtX6R3afAakRVTrnWq6fGWjFykKMTHxGi50
         BTyQ==
X-Gm-Message-State: AOJu0YxVeNYnDE/i6QSln8P4QlkwwAXSILtcwKGOwXpjU8l9CpPRWl++
	Ko/bO8q0g0d6ld6rnidXEbnqdWp5cHn0N4Myi7+75kEle2ianPPe0Dv2
X-Gm-Gg: AY/fxX5JzX7d0pkH0sEEU5rga1jN9Yh7BSlLndrtDt87YtGN1Wknp+4PxuzlKZzbSH4
	kNU+gLrcQ2zQUf4QblAYAO6Vug/d5PY9JxVXyYbvmRX41PEj/vrN1R1Q3nvKfWEsogNYp5a1qb9
	MibBrBn4xd+TKVR9NL4llNifgJ/CkSA8ySvdWuIYl8qtUmJPHRepjp/1K0/AtdEhi4j6wUHqQm/
	bSMdrLlqBNc7crjREDpothePxtHzkB7/R8n1T4itz52AcZFR8nLhKexQhr/HMBqFNNyVrMySsZZ
	GaH6N5j3ivC4gty4AZRsWJmk/n0ZB1+XURmwTmHT2L/4BmoqJSzNu4Uay5o02MG2HIo/UpjRIz3
	34IouNuyKf+NOkVIHyWbOQX6AWuu4Zn/G9Low/OKbeBVQHxjAdIb6t2UThtPNfGYT3e+sMASuz+
	HkmBfWEDWkVHlM+gCFxljerOVf8N66taQCM5XxqKbNgBKtEjPtmg==
X-Google-Smtp-Source: AGHT+IFUxc/jqW5o2JS+PqVnm5eGJ+dW0KEiDCCdleRG7GaiiP0fbPLVNzmIud52APN3qIH/d5n5uA==
X-Received: by 2002:a05:651c:2124:b0:36b:9ecc:cb5a with SMTP id 38308e7fff4ca-3812087df6dmr36661191fa.22.1766409902213;
        Mon, 22 Dec 2025 05:25:02 -0800 (PST)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b2cdsm27548851fa.25.2025.12.22.05.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:25:01 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename shortGIrate to short_gi_rate
Date: Mon, 22 Dec 2025 15:24:30 +0200
Message-ID: <20251222132430.24491-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CamelCase variable 'shortGIrate' to 'short_gi_rate'
to comply with Linux kernel coding style guidelines.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..e1f76612c96c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -320,7 +320,7 @@ void expire_timeout_chk(struct adapter *padapter)
 
 void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 {
-	unsigned char sta_band = 0, shortGIrate = false;
+	unsigned char sta_band = 0, short_gi_rate = false;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex
@@ -335,7 +335,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 	rtw_hal_update_sta_rate_mask(padapter, psta);
 	tx_ra_bitmap = psta->ra_mask;
 
-	shortGIrate = query_ra_short_GI(psta);
+	short_gi_rate = query_ra_short_GI(psta);
 
 	if (pcur_network->configuration.ds_config > 14) {
 		sta_band |= WIRELESS_INVALID;
@@ -358,7 +358,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 
 		arg[0] = psta->mac_id;
 		arg[1] = psta->raid;
-		arg[2] = shortGIrate;
+		arg[2] = short_gi_rate;
 		arg[3] = psta->init_rate;
 
 		rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, rssi_level);
-- 
2.43.0

