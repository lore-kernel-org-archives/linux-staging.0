Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D97351C1C
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085148; cv=none; b=Gko/1I3La4B+6QAQKV5dwYcoNs/dCc9fhevv4CzF7fYCPwxiEwAjEAbSpn6DAOW9ijUBWiMdj4DA2S97QhzG/O429v0ZwL21Jh5yNON9eJPT/Psa9L34ctkMT1yb1OQMoRAlsUAv1VW9t1e4NAI61m16cjC14BivWU9Mhc7HeIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085148; c=relaxed/simple;
	bh=AQcbQtK8PDcrVvOxD78DRdXjCibIc07DB1HOWZERE5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LFFd009TVRQEQl0o8fV82Nc8NOWYx1Qh/W6dQLAhLVv7KGeG+PvThYhn+iPML56oFciip6bL5YGHQjUMFLrwJa+iEZOsEJ6RYyMlddofTG2tB/YxY4bINoe+NhsybdPTCkaZpPY15O319YvuzsBo8carxigHbtiP1OiDojnk2AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg8rI8se; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg8rI8se"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b04d051664so22657985ad.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774085145; x=1774689945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKG5hRLrK+yZKe27MgdnWLJ60ErLlLzJH8m9zqbpSw4=;
        b=Vg8rI8seWawQtQFpSS2YoKh/2NDTxmm/2fu8UScwrv4gY13UjXCGvY+1QH8zKu8/MO
         LDzV8FHXysbl5UdF6nqDVdHLgJEPJMv7IvIz+GsBXmqvgP39wSqp5UbT8TiswV7KfZ85
         xSm21r0UVBKSnSNt0idkbMOwGGA+HuFJb/pSEImFk5c/0HfkGhNB1/Am72lss10taTBP
         Ut0+w717xRY3cSaR2GVBwVPgNg3tz75hVzOcS50gvqPEIXTUDAt030yVAZWCQuv/EtbN
         FqD1/4iKqIc+MH8dLleSpUQgaiEc6hr4i+ts81aw+EXP8Mbf61K9DlogvdFnBpetkUCD
         1pwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085145; x=1774689945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKG5hRLrK+yZKe27MgdnWLJ60ErLlLzJH8m9zqbpSw4=;
        b=rO4s6RxAyNqmAfH1mxdNmK6F6CluVFEubNJJJzNrla99DYtDdRpvHwo04WbJLPfRnr
         8ThsZWFPaLnB9m9a5A0DIQOmScFNWPlDXweqXY9zcFw0qrnY1cISYJkEA4ZXLEbtT2OG
         qoVf50+mNLgNUcS0Ikzhgpopud8m87vQhLXkGnvWI2j1zSLiQYnTzcl2X7n6GKd59nRz
         ZGpNMOG5HTdXi9PcIJ7QXCsD4bodEj+fhXMUOnBjXgJHD+opXSkRfzDMQrLxGicwZsFU
         wmPgyqGEULT6qDAo6wVlyNapy8F0T93kMcY3fegCFUJ4z3pIJfxNUQDy/h6tu7sVf2LI
         KfUw==
X-Gm-Message-State: AOJu0Ywv3tRwNH3fWtW0jNXB6K5/KbQedJcCaRx1pIF8hGSNtxtw0Y1o
	fRDliAfB3BIBGSSyIgDsudahl9/qBPiXzX2nIWZutGwbk3un10T052rq
X-Gm-Gg: ATEYQzxur++9yi6BD7WqIse3HKLZO4JeIsTVhoGUONKwZ2185LRqk+7peVtxkfmEnqO
	RGILb7IZif7A6qVaVrrcOu1zd/h/KDNwKfyowxhXKwXpdnvKIFV699tdgKDU2u/F7mSGD8Cn5lP
	5lp/uDx9lh5b69OqUCQuL3t80PlFbev7gWRApwdusrfh88dW2jmCVeK97JPnn/J+VaxNIIPZ3Oi
	C7PPK2d7SKoI5Sj7Oljqm/+TIkHww5O/Yiomr5r9pZyCGxS27oEKDsbTV4ir7q5l7mmqYiq1YdC
	1QS9Ayx1MZXYsZmDbLbuFpXcMga86LJZmfeaCWVCqW8zsyhoB+k5BH1HKSZZD35mRz7hggMEVxh
	GsIhHYQ3iCfg0xMxcnLNiuIP6PciKbgXc6w4pEpSh0fHr0TCZGf0q+wLVRlFcu0VgWJyIs52lKu
	vcPFFeq5s7FFcnO1FuCeGwp/srsBAi/8Nka1kgMLM=
X-Received: by 2002:a17:902:e551:b0:2b0:6475:73d0 with SMTP id d9443c01a7336-2b0826f4facmr55256815ad.12.1774085145419;
        Sat, 21 Mar 2026 02:25:45 -0700 (PDT)
Received: from localhost.localdomain ([111.125.240.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369617dsm61133405ad.71.2026.03.21.02.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:25:45 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	dan.carpenter@linaro.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: place constant on right side of equality operator
Date: Sat, 21 Mar 2026 14:55:36 +0530
Message-Id: <20260321092536.138499-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place constant 0xFF on right side of equality operator when checking
value of hw_channel_plan to fix checkpatch.pl warning and conform with
the Linux Kernel coding style.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880ae6a..597ba3d283c1 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		AutoLoadFail = true;
 
 	if (!AutoLoadFail) {

base-commit: 42bddab0563fe67882b2722620a66dd98c8dbf33
-- 
2.34.1

