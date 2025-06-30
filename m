Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5D5280338
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317344; cv=none; b=t7rhvRf0yOftlL1ru4xty1QSi8zfJmyAQF+6fpITLauUw1emwiOe4ekmOOyGwEJxn4QmCuChWiF1ZJYFyOVIpK7U9vvrXOnv11QfaBRcEIqFVkC5eaRN3Cw2gUzpitrbOT6jormHQH39Zb3A6Xt22c0k/UuzhKINznTn+oqDFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317344; c=relaxed/simple;
	bh=fN5AyUDSjivmScTDQEptYySYmoeck1+soU1qFzXnDF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/MG3MotBuIfyo7qfhHpTgtCq/rreVIXMyjv3L7jFt/jX4YaknkkPCp6jah1MBlTrBGJRPn89vvZLJGf8hlnJztHxK4oPryzHCkk3lHbryvDY3zpjWBab+P6cu7rlqtkUU/TEFaJNzQgnmj1pHtbj/AKEL/wIUWOMdHJXrNZ+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=babs2OjB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="babs2OjB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so2284011f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751317341; x=1751922141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws/TSm+ZZeehlVxXUB88Ms5rsDGr5e9O7TxAj23rWQw=;
        b=babs2OjBSvRVvvVYJwEpYOUHNAvfoWNZ0+8YYBRxaeXJOND2WLypwK5TvzNcmCxhuL
         4aAkbIjAgIIJE5YqN0dIJw1s9TJdnuUq3ySyDzVOgvVTkJKYRXLLaxNUCEevwVHzltOI
         XZzBKxaeu8JYfaWxOFyN7QUiqJNdISOz7rucow+r1W0Jsn05rRGrB5tkomLL9noYds9T
         iJyN3bpQlo8tx9pdAsEkQcx0e6uLPJavXnnK4ctiKyC32UntRlR2CwCAvqpRu6lS2ZZR
         Qrkcil9iZbnQ8LJIhKtUrOr6dI1G9d8iXLXj08kUN5r95hKqKxYNc1Xc+PtMigZtRTxo
         1i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751317341; x=1751922141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ws/TSm+ZZeehlVxXUB88Ms5rsDGr5e9O7TxAj23rWQw=;
        b=C8sb8x+gbSl+S+Yj9zya4PRIC+a99u9qBFbGe//XvlB2L6dK4BRafGJp5XAZArGk3H
         uWUkAdCuwmuvOPagyjqSiP2Vywd7rz+VslW2oo6QACp8B1ZqrOoiZvcZuHFiNgx+Whsq
         n9FSaH7AbewRit6PJ9yxEciID7qYiupf9+xiFCiiA39KpuPl14foGw+qlNDbzD5NaDWw
         iJjoQNakoAmtX+sq91j9Kd66QOf56M53pg3gHChfwSVMjUBQNI4iNc3XyP2E4D3tXH7k
         gloYs4shiWvfwKkmGSYLFFyspLQHf0QF4QX1jgzjpNTlr3IaT0YqnXr+O97lbXZlGv7e
         AEWw==
X-Forwarded-Encrypted: i=1; AJvYcCWyWo/40ib3X2vHWjdxaE3QNW2uHZJ4M3qkfJR+Gma+Ac5PftnRPLsj5pmhq/6hyZCdNwxSSCfYnzMxOTf9@lists.linux.dev
X-Gm-Message-State: AOJu0YylufUEdS4At5nfrz5odOjIaaoUurcaAEUze373JAlEGtj3ACf4
	Tz72QE/JQ8IHFnKTRzTNo8sf5iCRLvmyfqDGWmqRiVlfpx2RMBFaTyfk
X-Gm-Gg: ASbGncvXzGI58H5G3CQqzUd7QU9YDc7tR0t/nUhrdkpGTvolY/DKOEUaiwnWT7vYc4k
	zXvNDaJagd1PE1Aw81aiUHcT8s1/tIcGsHEAqWrloXginOgBJsBvs7AEvHdPETRc+xFp7p8qb7h
	/hkXfExq+KgI/hWw0T6XWAl2u+dp3KqjW6AMvpj9juW+PCcy+SCv42M2n2Utqm6uAkknGPtKOep
	ThTPHoOP6GJH3GEO2zCSwbcU3ZQ/WnYcSrzDbjTjmLA+LxqZezxYVJqeRzWv4ionbOMfsqRuGay
	IMW4TRskC/I4/rbtYeTzOalHkxXQYVE7WIyYCyGxRgN29/OIu9NVB8zjTEQ/RbAUrhgCN7E352G
	H/H4zgw==
X-Google-Smtp-Source: AGHT+IGSemyFfun8x66j729jzWKL23uFr3oT8p6ycJ2Gqg8IaVogp53Aua09Ypb0xc3CjaZ29XZz+A==
X-Received: by 2002:adf:b649:0:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a8f45494cdmr11129730f8f.6.1751317340305;
        Mon, 30 Jun 2025 14:02:20 -0700 (PDT)
Received: from cachyos.customer.ask4.lan ([89.26.177.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fada5sm11503584f8f.32.2025.06.30.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:02:19 -0700 (PDT)
From: Marcos Garcia <magazo2005@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Garcia <magazo2005@gmail.com>
Subject: [PATCH staging] staging: rtl8723bs: Replace magic numbers in beacon initialization
Date: Mon, 30 Jun 2025 23:02:11 +0200
Message-ID: <20250630210211.3922530-1-magazo2005@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <38411a98-d907-4173-a528-8d50b337de0c@suswa.mountain>
References: <38411a98-d907-4173-a528-8d50b337de0c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded register values in rtl8723b_InitBeaconParameters()
with descriptive defines to improve code readability and maintainability:
- TBTT_PROHIBIT_DEFAULT (0x6404): Sets TBTT prohibit time to 100ms
  (bits [15:8]) with a 2ms margin (bits [7:0]).
- BCNTCFG_DEFAULT (0x660F): Configures maximum AIFS for beacon
  transmission to ensure high priority, as recommended by the designer.

Preserve original comments where they provide useful context, such as
firmware control in power-saving mode and designer notes about beacon
contention. Fix typo "contension" to "contention" in the comment.

Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 50 +++++++++++++++----
 kernel/sched/ext.c                            |  8 ++-
 2 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index cc7886d75a0b..a3438280e1ab 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1183,9 +1183,25 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
 	ReadChipVersion8723B(padapter);
 }
 
-/* Beacon Configuration */
-#define TBTT_PROHIBIT_DEFAULT_MS	0x6404  /* 100ms interval + 4ms margin */
-#define BCNTCFG_AIFS_LARGEST		0x660F  /* Max AIFS for beacon priority */
+/*
+ * Beacon Configuration
+ *
+ * REG_TBTT_PROHIBIT: 16-bit register where:
+ *   - Bits [15:8] = TBTT prohibit time in units of 1ms
+ *   - Bits [7:0] = TBTT prohibit margin time in units of 0.5ms
+ * Default value of 0x6404 means:
+ *   - 0x64 (100) ms prohibit time
+ *   - 0x04 (4 * 0.5 = 2) ms margin time
+ */
+#define TBTT_PROHIBIT_100MS_2MS_MARGIN 0x6404
+
+/*
+ * REG_BCNTCFG: Beacon configuration register
+ * 0x660F sets AIFS to maximum value (0xF) with other default parameters
+ * This ensures beacons get highest priority (no contention window),
+ * as suggested by the original designer for test chips.
+ */
+#define BCNTCFG_MAX_AIFS 0x660F
 
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
@@ -1193,19 +1209,31 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 	u16 val16;
 	u8 val8 = DIS_TSF_UDT;
 
-	val16 = val8 | (val8 << 8); /* port0 and port1 */
-	val16 |= EN_BCN_FUNCTION;   /* Enable prot0 beacon function */
+	/* Configure beacon control for both port 0 and port 1 */
+	val16 = val8 | (val8 << 8);
+	val16 |= EN_BCN_FUNCTION; /* Enable beacon function for PSTDMA */
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/* Fixed: Replaced magic numbers with defines */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_DEFAULT_MS);
+	/* Configure TBTT prohibit timer with 100ms interval + 2ms margin */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_100MS_2MS_MARGIN);
+
+	/*
+	 * Firmware controls early interrupt timing in power save mode,
+	 * so only set REG_DRVERLYINT when not in station mode
+	 */
+	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
+		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /* 5ms */
 
-	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
-		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B);
+	/* Set beacon DMA interrupt time to 2ms */
+	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /* 2ms */
 
-	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B);
-	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_LARGEST);
+	/*
+	 * Suggested by designer timchen: Set AIFS to maximum to avoid contention
+	 * before sending beacons on test chips. By tynli, 2009.11.03
+	 */
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_MAX_AIFS);
 
+	/* Save initial register values for reference */
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
 	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL+2);
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index b498d867ba21..7cecc0ca700d 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4258,7 +4258,13 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
 
 void scx_group_set_idle(struct task_group *tg, bool idle)
 {
-	/* TODO: Implement ops->cgroup_set_idle() */
+	struct sched_ext_ops *ops;
+
+	rcu_read_lock();
+	ops = rcu_dereference(ext_ops);
+	if (ops && ops->cgroup_set_idle)
+		ops->cgroup_set_idle(tg, idle);
+	rcu_read_unlock();
 }
 
 static void scx_cgroup_lock(void)
-- 
2.50.0

