Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47E41A765
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551558; cv=none; b=NW8EAgcjAYi5y6Mnlfn5aqrI5WNGh+XhpUXB9Hz7XC4icBJjKHxTANq8kRDh3lVm6g0XEKhGPjilNY7bg5JhFPKPydykt2HuLcWktDoRKBd5DpAV8keVBh0hBIClSZ+tuSX3ckqudHZuN8qevGJQDjOEYRleH06FNI8DUnQZsJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551558; c=relaxed/simple;
	bh=QRQkSjAqzi+Ej/Eqh5AYvwIUVeGAFbN/18tosOMm5oQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A1JIlnYhSyhciYu1+nrYRN/L8o2jcj/3qltq3s6a524/u2mz/Sd3NcIp2kjb4aQdgJQ7EJnomxiZhoQCJkTEni/NzJ9iXfCPladQEnm4lROKYP1EzBTcZIv3yzUG0Dyp3PGbZ/m7wP+fhy/QpoXn1tK8XNyrdvr0Owa+j39xHOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRd76F4N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRd76F4N"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49553515a8bso19943165e9.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784551555; x=1785156355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4ukyTwzdWclb2ozwLJMOO/cyHCyN5gRpojXp5e+hrk=;
        b=LRd76F4N5ldjEsiz4T0i2xJnNaC7jm84lFEfaW0EGqB4rWtq8tEwRudJRpxF9qhXCH
         dRwZ2OZs7wMWHzUOr29eGF1tk3H+/kAzZvTIs8Wq87AI6ofdI9lMlyA6shT3BqLxnu1n
         p7RjDgPfUKrjotqaeYs8qQs3T23ezKjpl3rq/4F40tj4nddfaJjYNQaixEHHTM/QinNV
         Q9a6fStljbtaLhd0PYUkz7tP4Xm3FpYnMqhwokFBM9uDov4u2lP2a0BM3tGLd3MNptnW
         MM65l5k1tj5iclq/yz+hpcLjDpAqDJ/OGzm/jVyMZD0DyXa/9mhxb/syIbLpTrURViwT
         /T6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784551555; x=1785156355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4ukyTwzdWclb2ozwLJMOO/cyHCyN5gRpojXp5e+hrk=;
        b=DGvLptd4BAJgnX3NGPBs5scI5OQ4gpyV1XnA3Ybta+bPCk0SW87/2/Y/aJKk/lkMF4
         Kqo+8wjMO4578PtfGoS3lAjI5+QUOTLzj4CZNJltFmQkJLyV+HZ5hdfPtxy7GIBh1ug8
         r4VFlOYfp/frs2bbMqsu9lCQXw1t4hzZYrOEqItMtXX56sp8nMah6OTNzFOSOmq0iheH
         oEeP5WeQsF+udsdmjv9qUBE5tTuKeO1eZV4u8gXWfNI1FCPHIJQDe0J9km+S7wTIilji
         RJ2kLPdAlHssWS9rwfrkzk1JPeDDuerRJ8hsgZ7gDD+6Wau5FazCcCp0pxue4iXAnA+w
         BJtA==
X-Gm-Message-State: AOJu0Yx3Rj5K4zeXnWFYvz7NcoVOAEBFWj+rmI0vi+BQLhnMf/SfVjYw
	KRPQrzaztatTStSy1PHEyHmBTnn1xyuGiQENBD4GEncqi3INHN/WpfQG
X-Gm-Gg: AfdE7cljrRsevxYxjel7TpKvUXuh+dX2zp5JIeRGg4tjbLBtAjiU/L00cRckU9eNnMj
	QkfMaXKNN1LKIJ4XCyTEsuJOZOUWyKYrHmxi50WkAmG/52MlxBSXb3ZrpXLDW6LEmY/jIqL5kJI
	n8T3IbIcmNrR1ES77WkGxX3hfPB4WoSkOctc7R2vbt1usuM6KI/sBzarply0mVNf6JdpyzFLUnw
	ItyCfu6wOYSBsBnAFaEbCnO9UWhfKFaJnLaApb2coBycuqOHBcE4KbYD6Bt2ynmBFiIHm7CE0PG
	EQ6XwGIpPH5Ektm/sSnisjRLc5DETPPpYJ51fHzgawNnJYnPTFCyLR2jk8aeD+zpvq/dPsQJkb5
	NJUotzH3r/ZveVrJOIs67eonUcgLfY7PFT5NR3+hR1cXKXn11Weg02GtDbr0pdFKArAy+XZwKQB
	qTElkDhuifvwjtYky5gb0h1ceMfZX7/mqujUpy/N1i0DyGdDhDAFlecXSGn6w=
X-Received: by 2002:a05:600c:4f54:b0:495:4815:2c54 with SMTP id 5b1f17b1804b1-4954a41303amr156079345e9.34.1784551554983;
        Mon, 20 Jul 2026 05:45:54 -0700 (PDT)
Received: from XPS-15-9560 (80-15-70-17.ftth.fr.orangecustomers.net. [80.15.70.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm247310535e9.8.2026.07.20.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:45:53 -0700 (PDT)
From: Olivier Tanoh <olivier.tanoh19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Olivier Tanoh <olivier.tanoh19@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: rename Save_DM_Func_Flag  functions to avoid CamelCase
Date: Mon, 20 Jul 2026 14:45:43 +0200
Message-Id: <20260720124544.63457-3-olivier.tanoh19@gmail.com>
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

Rename Save_DM_Func_Flag and Restore_DM_Func_Flag to snake_case
format to comply with the Linux kernel coding style.

Signed-off-by: Olivier Tanoh <olivier.tanoh19@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f5ab94a2d0a0..ff5e5fae3ef2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5144,7 +5144,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		pmlmeinfo->candidate_tid_bitmap = 0;
 
 		/* disable dynamic functions, such as high power, DIG */
-		Save_DM_Func_Flag(padapter);
+		save_dm_func_flag(padapter);
 		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under linking, need to write the BB registers */
@@ -5452,7 +5452,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	if ((pmlmeext->sitesurvey_res.state == SCAN_START) ||
 	    (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
-		Save_DM_Func_Flag(padapter);
+		save_dm_func_flag(padapter);
 		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under scanning, need to write the BB
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 84c7c9e8a748..155564bb7251 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -220,7 +220,7 @@ void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen)
 	}
 }
 
-void Save_DM_Func_Flag(struct adapter *padapter)
+void save_dm_func_flag(struct adapter *padapter)
 {
 	u8 bSaveFlag = true;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 14ba1dc7d7ef..08f8e722fd03 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -433,7 +433,7 @@ void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
 void update_basic_rate_table(struct adapter *padapter, u8 *mb_rates_os);
 void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
 
-void Save_DM_Func_Flag(struct adapter *padapter);
+void save_dm_func_flag(struct adapter *padapter);
 void Restore_DM_Func_Flag(struct adapter *padapter);
 void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable);
 
-- 
2.34.1

