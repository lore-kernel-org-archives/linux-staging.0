Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAD41F585E
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786137; cv=none; b=MOidwLMdLf4X3TSIStUw0EMrkIKCy7c4JvknhCFfxjyn73exUD8YoTjQ9/QO1OGCLVTRfLCcqFGYzexuLvnQeqdyH6K48VGjxEkTuuY+jweNRQaSg3fnl08m54zNQiq0dgUmbYeS0HUH5Ki9OxWSP38U2mUvJYMNOWcuIFsdjRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786137; c=relaxed/simple;
	bh=YAdt10EKqZnTSbx22QnFbqqLVkByFk/br1WnjmqVLU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajS+eUJoMJdMs7qYixp1zT6/Rm8ffrsvu9Lm4Eg+Wa7n1FtEOiPLZc4hRk40PuD+OKw2ZK09lXME2bEtfSpS0vgiPREvc9TRqS6euQReiXzuP/u3l6LTYPR65pn8oSOToOHoPZrcYY6wIZeGNqXHrpBG0sEBQmQpOblGBEz2lJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxzlIe0t; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxzlIe0t"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9e8522c10bso391588566b.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786132; x=1731390932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogLkc/HIhn4oQotIbLwf5N87GIAE2Iivlj7UzKe+4uQ=;
        b=KxzlIe0tcLes7v56WTBec/2YSsrocotuJRixJ6gTwcrKoqHyA4NObPVSf6EXJEaAKl
         1wCvgXoH0lNsyeXbp6TLO70neWr0FKtjK8uDmKNH+MpZ6zVclqawzJDKlc6vhUvXrIeF
         rWsJedRYkoWyEEVnAkcVxP4+gAQRo4P2J97V/q4H9B4Fkt2OynaOBGrPGZ5dqPUgM8Ez
         g7FmJ3nqpbvXdl+7oI8ixHTyS3cRb0rgaHk17XxhO8woW9PJgXbYek8FpcfbgFO5+GI/
         +QN/q9I/W3P06vfK165VgqvWz7cdXcQZIj6t/Lp/SJTEGNIZzBQ5KpELCyAn3ZC2B9j7
         p4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786132; x=1731390932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogLkc/HIhn4oQotIbLwf5N87GIAE2Iivlj7UzKe+4uQ=;
        b=RNz+UUxX8VbfZRb5PXS/O4z0vSN71yQ/7F62+ccitZOgmystx5moG1GHarNnzDxPqQ
         hwsf6P8SuImoxPjd2tW7TgoHCMREwlvJKWKNuxnsxx0lAfwZfyHmnIIhswhGkOIbY6tV
         9+0eeIs42xZrBKxo7QOF/Nn5nvmFGWqrO5den74/SDCTG3+ICrek/rrixL8V/9zGjIrq
         99dq+MINXTETonrckmNt8TjcadUG5EJTE3if4o7zrwRqfFULOizYy+vxXaM58HY9uC3x
         3WzZG+HOgFlhJyJmtMCQPn0yY+yHoQyUmU47DZoCnffBw8FMqEKcEEjV2jLaTsSVfB4N
         kgcA==
X-Forwarded-Encrypted: i=1; AJvYcCV4M0e43UTiiIndTxtkNypknojuBUniPraoXCdrGbQ7tRYveOFgt063ClhCGiFgjvlTZ+o1b9HGg4qsXs2y@lists.linux.dev
X-Gm-Message-State: AOJu0YzWHa4WfHWqBEAoBq7xHviyNU6qNsoGVConXB70E7h1bxymL0cU
	917P0weOR1XBK7v34uogUxxlXx05Zlz8hRcoWAzrsEwWoSwMMvVJ
X-Google-Smtp-Source: AGHT+IGsG3Xwr1iFVxlgkNa0xbYHo4XUeCWlg32yEp8sbLS4Hy0fxzu0ihDwtfCDLs3SuGdY0d9LEQ==
X-Received: by 2002:a17:906:dace:b0:a9e:670f:9485 with SMTP id a640c23a62f3a-a9e670f9594mr1381412166b.30.1730786132028;
        Mon, 04 Nov 2024 21:55:32 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:31 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 08/16] staging: rtl8723bs: Remove function pointer Add_RateATid
Date: Tue,  5 Nov 2024 06:54:55 +0100
Message-ID: <c7d1c02e570b7779f059bad6f3a45177176fe9e5.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
References: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer Add_RateATid and use rtl8723b_Add_RateATid
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 483f0c163bef..46da566106ae 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -227,8 +227,7 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 
 void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level)
 {
-	if (padapter->HalFunc.Add_RateATid)
-		padapter->HalFunc.Add_RateATid(padapter, bitmap, arg, rssi_level);
+	rtl8723b_Add_RateATid(padapter, bitmap, arg, rssi_level);
 }
 
 /*Start specifical interface thread		*/
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 64eb1786d8db..66c2a8fb2454 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,8 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->Add_RateATid = &rtl8723b_Add_RateATid;
-
 	pHalFunc->run_thread = &rtl8723b_start_thread;
 	pHalFunc->cancel_thread = &rtl8723b_stop_thread;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 2df25c1e7b5d..dc5bb61294b0 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,8 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*Add_RateATid)(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level);
-
 	void (*run_thread)(struct adapter *padapter);
 	void (*cancel_thread)(struct adapter *padapter);
 
-- 
2.43.0

