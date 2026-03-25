Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DA9388E56
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 23:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482325; cv=none; b=a62cUCjcoEZQhjRTqoDub+u07dbDrDgcCq5YOu3u2iVjRKjhDSiZ7fe6oOiY5yJDY3nAR1AbrkY69mf5Ncf+ER//wSHvNiH+kRUOPJMWaYdZdE8TVWHdyn9MmQr7hnujRSKs5WxwTnZVhtUvceJxQxOTHZAExtnn36qanpQDl2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482325; c=relaxed/simple;
	bh=M4JjzcA95KEOBDK2dbOekWztsLMmCG0MV1/Xu8Iwdzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dc1hJ5B+xcCVSHxnDvY4lIeAezY/ppPxVGOeRMkZMpcqNTKeTabt7/4pETmVhglilnEW3qH69eTxmlVf7Q49ULhLSG+zBdV+Ro3EeJi3Vld/C0D3XY9P/sdrf/jl4pVGODzNadssrRvy3fp+ljWivpF8jhLg+dv5ubVrxMSnjRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krM4aAla; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krM4aAla"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so215010a91.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 16:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774482323; x=1775087123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/ktJSPMGlMHcX20qc5/kT81wgdCXSK687G3oqP4RX8=;
        b=krM4aAlauKAXqN1CR38AXGLID+35hxDMSD0myxFusOQQ6WTl4y39KuVxZIGfl2+jKB
         kW2/DoOSFZ980opPF9usZ54iO7sZ6sX6++uJzMjWvjMKSut5gV6K1niDTfP99E4P7ni2
         K+Lo3/nF16GiCckHrHs1yHW77+N1b/3aEdlgzG1DEN5LtWRUxdLNUIGBkCHp+w3AX9DX
         8dAGDXeuBCpGplTxbrXi6jkJ+9HKJCo4JO9jJdeoLNUIZ1Iw566kJ5DdQJXF+Osa+Zhv
         YSMwnwzQpRX7AvQrgIGoREPkvI3CxtPhQbeIISpO6dojl/3QxJUhroKeGi4EQvUXK4bN
         9a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482323; x=1775087123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/ktJSPMGlMHcX20qc5/kT81wgdCXSK687G3oqP4RX8=;
        b=aV6LkFG4EMFKn9kJ5sYkpkJMxtAJbDKE1BR4SlFkyalAPh4lbJBJU8m0NxnvhQgByl
         1WizCxQcS/yAngN7/AK2LLP+Pbd0uIRa6gBqJAC+FGcK5wSEma6XSAfkGRuPwltw07F6
         uNm01M1CYdcY/04WFJ+NFuvf2qbFelEBb860w4WXgJEhiXl9hiO4n2iEPIvOST4Sw2SX
         4GV1Za8417cwfNIZKvT1zkQ7qKPwAlTWFZJgeFdFoXm3EGhJcfQYU55GXmyDQwru/fzE
         CyN5ad0/CatokA9TPwKitmglaTyMsdsaI1wRtJRgLbP+Mmod+C1k6rgeEUeLQinBKxdj
         xUvA==
X-Gm-Message-State: AOJu0Yw7RxbN4cdZH0MUSoOyKjaK8GviG8cXf8fpPt4rAe/mgq7Y+XCG
	Z4MZSrP+GumbNZiyE1W9lNvd6v7ZIugZcHV0Hjz/jK1q4nXjngnisiPU
X-Gm-Gg: ATEYQzwAIChLqgRpsfnf5xCanEhNfiA4iZQpUgO1sEZi1cK4SpBpqt0VOzoI6f40o8N
	FdSaFgVHXOSXQG0mO1eVRGBpM7BsMPcj7zgAXrz2Q7H1pxK56pA0DmmnuJ9iFlPKKaHRBFwxD0O
	0l7dmZPvlvHxn7UC2/p07968tHrzGjmC9fTF8FD0g5y1tRJW/t2PV02/3mguD43edDwf2V22ZVE
	mVbfugfGFAWrlJpQflJZtBGdSNBIwbtBKnNkpP6UDvI1ZOhgYkWXiqJdxsx2inotmKyOCU9EzCn
	UEXUaZGYRaLuCVFJtDZbsEN2oW+T7+YO28PtHFPtXv6HplPr1lLdcWo0r/5tWJaTpU7CfFGt0n+
	Qd+gv6ObE/MDXh/fITRFurWh161YAXuUlwVdP6G1C0P86w0Yvj12vVeEsryCd41k7rA4qwmk/oI
	HJ5N56kibTEEg6/E564wNoJdk=
X-Received: by 2002:a17:90b:540f:b0:35b:9397:7073 with SMTP id 98e67ed59e1d1-35c0dd9aa90mr4427282a91.30.1774482322609;
        Wed, 25 Mar 2026 16:45:22 -0700 (PDT)
Received: from MrXploisLite ([39.194.5.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03155852sm6526889a91.8.2026.03.25.16.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:45:22 -0700 (PDT)
From: MrXploisLite <arokigaming@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	MrXploisLite <arokigaming@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix checkpatch style issues
Date: Thu, 26 Mar 2026 07:45:11 +0800
Message-ID: <20260325234511.24762-1-arokigaming@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix minor style issues in hal_com.c reported by checkpatch:
- Remove multiple blank lines
- Remove blank line after open brace
- Fix comparison style (constant on right side)

No functional changes, only coding style fixes.

Signed-off-by: MrXploisLite <arokigaming@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 50370b14c..1298ab2e5 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -30,7 +30,6 @@ void rtw_hal_data_deinit(struct adapter *padapter)
 	}
 }
 
-
 void dump_chip_info(struct hal_version	ChipVersion)
 {
 	char buf[128];
@@ -71,7 +70,6 @@ void dump_chip_info(struct hal_version	ChipVersion)
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", ChipVersion.ROMVer);
 }
 
-
 #define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
 
 /*
@@ -107,7 +105,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		AutoLoadFail = true;
 
 	if (!AutoLoadFail) {
@@ -294,7 +292,6 @@ void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg)
 	u8 i, is_brate, brate;
 
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-
 		is_brate = mBratesOS[i] & IEEE80211_BASIC_RATE_MASK;
 		brate = mBratesOS[i] & 0x7f;
 
-- 
2.53.0

