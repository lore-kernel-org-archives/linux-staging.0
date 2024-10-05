Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C3915DBAB
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160492; cv=none; b=rSWHcouAyWTq7NxOZL2RDEjkDIueugMwQWqZgBkuWfvB7Rk2yyfd8wcDZkO6q3XgxsaVQiXId32GwWPGgWFI/PeXI8FMDLiT97sKd5OSunOi4cvlYuWPA8LXcYG4Y3VoWHymTyoiGX2Kt5MHpvL7/09rvZXUjYqoDD8GbJOBE2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160492; c=relaxed/simple;
	bh=Xlmrw1ICSZSLpyppc3P1wO9DsXKMAXudZrtMHiaVX5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOUoXgSvhXfF7OP4WcOfKGUGxy7OrMcBdmbXGcSZkE7pt5oItxrNbqxuei8/nouEUdIwF8eO4/JtAQcg1iBsmCOLf7VIGimiQRN0AKeIFDNQVeHtj95Hgj6PrRCaFiYTt3bXEBrrLHO+fiBiRRPiNVDT5+AzZSBoP1OlZnfbbQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXlXbbiF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXlXbbiF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so31920855e9.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160489; x=1728765289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqRwvqn5MMZIilIwb7m5L2Gv05WHBymSS5m9I5855dI=;
        b=HXlXbbiFdNfRvyhcFWunGf80q+eU8c8pTZf3xhoYCnNsZyz2PLnPua7RvmZoVKNwTS
         Pp2AQt2Zn48y0t1tZhpcfEiMesn8tGn3VREt5bEcjYmexvcvFHEzzdLWnCMCFqdst57/
         Sn6LHeuiyRd2K+yNJtIlXZo3JWhoBLOtLlwYdzp+D/LSNEZihzbWBXWnsjLDBlnROkNd
         7OzY1cmOBDH6Rzmk7niYEz1SQZyunxzsPA2k8WhoHwmUK5cHPwYjDboXNgz1sDaDphvW
         3yfwIQNdOHo3+1ab2bLbg6vLKA7mZbwWiux98ZUdaSc1YmRoeXFjhG6KlkpZiDuGeEKE
         danw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160489; x=1728765289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqRwvqn5MMZIilIwb7m5L2Gv05WHBymSS5m9I5855dI=;
        b=M4qY6yVwyPXrN2r7Uej9e1UMfW6z+QYL9ezBQTyHl5QHXHCY7SqsbHprJB2F/xn6DM
         hy6YA3iqWNa3BXftq4ybaQfu76lBPsEmxItg2hjep/YEnAunBNVvNrCdT4F0GBQo+2yH
         2dQTo+uE1AedZ1c4jh8FFW88FSg8S8gjZx2qIZwOFOtqQikoJ/aT/Bd0s1+LVxE3rCsv
         yqN7h2nB3JsWTZO3cY8M5zEzrwNYZ2i5U5TMAX0ytPqht0Q7VLsXQQQfJOLq71HG7njL
         jFajduAoR6nkD6HKWzMqfM6vQ0vJWZzGlrJZnmcP73gQZpT6ik6idQalYnqsLv0xGVh3
         5EoA==
X-Forwarded-Encrypted: i=1; AJvYcCW4oo5No+v8w3vXBIF5HJaU/m/XfPhhzsM+TDRmkMQzXfVd/A9J/2wugiy3l7p4u+vpzkzjWQvE1Gw2MDAm@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6DfUArEGR+MJGloCYSaUb5PMDtaEiCYvzANIOgDDEk6+zY8v5
	on6S8UmjN/6I3t61ukMKt9xYtW9xQTx+N0QYYBUDEVXfMglSDjeH
X-Google-Smtp-Source: AGHT+IE9xG3NaWlIuTacg005sDJLyBO3bfMPTr7DCrgTYFT5Ui7ARWgCZ3y9M0L7BfUgJEzvAjwmbA==
X-Received: by 2002:a05:600c:5116:b0:42c:b80e:5e50 with SMTP id 5b1f17b1804b1-42f859ac1ccmr58124885e9.0.1728160489047;
        Sat, 05 Oct 2024 13:34:49 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:48 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 03/15] staging: rtl8723bs: Remove function pointer free_hal_data
Date: Sat,  5 Oct 2024 22:33:46 +0200
Message-ID: <455b7a4645e6652815020635a7b34e56c2b96423.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer free_hal_data and function rtl8723b_free_hal_data
as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 ---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 ------
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 3 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index d9121e13fe69..983218cdbfec 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -35,9 +35,6 @@ void rtw_hal_free_data(struct adapter *padapter)
 {
 	/* free HAL Data */
 	rtw_hal_data_deinit(padapter);
-
-	if (padapter->HalFunc.free_hal_data)
-		padapter->HalFunc.free_hal_data(padapter);
 }
 
 void rtw_hal_dm_init(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 33ae1ae51a30..867021ed31bf 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -439,10 +439,6 @@ void rtl8723b_InitializeFirmwareVars(struct adapter *padapter)
 /* pHalData->H2CStopInsertQueue = false; */
 }
 
-static void rtl8723b_free_hal_data(struct adapter *padapter)
-{
-}
-
 /*  */
 /* 				Efuse related code */
 /*  */
@@ -1827,8 +1823,6 @@ static void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_l
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->free_hal_data = &rtl8723b_free_hal_data;
-
 	pHalFunc->dm_init = &rtl8723b_init_dm_priv;
 
 	pHalFunc->read_chip_version = &rtl8723b_read_chip_version;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 40383d3cdcef..bc2696f23085 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*free_hal_data)(struct adapter *padapter);
-
 	s32	(*init_xmit_priv)(struct adapter *padapter);
 	void (*free_xmit_priv)(struct adapter *padapter);
 
-- 
2.43.0

