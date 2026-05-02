Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030802E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759311; cv=none; b=KPkumb4oFDUs+ARvY++dXrEzZWA9DQycZeK6q7QkPPe5zE5brptcQpfGiLfZZTq1pf1tRHL7IDQerGK/4ZGfO0W3E9I5cFEULBxqtsISu7vmOCrnJthXmOSBpmpB2coxWEhXXBuPbDulItLSVXch0Ik/599PNjM9i8qY1jrfCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759311; c=relaxed/simple;
	bh=PvCwynW0RU/HlqPlApEITddpT5MK1nRyK3vCNuCQJis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjNnHp/boCxskLZWmpCOV4c7lNyOiI0n9LHHR7d71/Pn5mLju9QPOUSTPBr07ec6sB61FUrRWBTRPVuA9jXYgNRCZCuG3usOyFMfLegbOkhrcfeAmUrloqW89VMg22V6BQNN3rVSfANvEQAbhJkTMo4KxXpmJqHrVZDu0Ys6xas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU5R/qXP; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU5R/qXP"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a858881ad2so2358367e87.3
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759308; x=1778364108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu//l2+atAf10Z04xV+cAisRY6hxWOGlUCgmqDvO4cU=;
        b=HU5R/qXPlBloSdluasbOJDq/FBJkNwBrzObicY5Zv6l/SJprN6u5uCw3RbiH9q0jdx
         zWTG3nnqFtMPYsJdLixnZgzRZQx6VEXpleOvrkFbHHrPbAshoYKOPrDs1tpvvDlkRkBH
         CVdvM1IJJBOoOIH38NtyLj+sEiqS1/MwbwdV+7CXoJgoUiuzv5iHomFXnIjGEd4o8+NY
         MXxCCUr/y7tQAk7Fc/ZhA9j4bGz8UsYYmfr3kZwyZrJURtEpkpdf3SR9Nhdl4ejqM7fI
         gJW4KkzO216hJ0Ji6BYqya7fds2uVmJWLYuIM3uggzzuTR7J3Ku9s7wp6CcDj+pXbGPK
         Ge9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759308; x=1778364108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uu//l2+atAf10Z04xV+cAisRY6hxWOGlUCgmqDvO4cU=;
        b=PmeqntMF6A98LRiuUfjWQ8sW6W0o8LAzGLTD6eKc9DqVo+PXfioML8MtEOx6L6fWCV
         5nfvU7pvOhiR3yTuqx4bbimDDkm/LHXpn2KggPHhiiO4eVzn6ke5HTlQG9NU6vWMQFMe
         f6evvu7iaO9nKA9e8qqhUZuLMSjQWLdTv5Ni6N0X1Gsxv1sZQnxrvXsIVxEARnEgQHNq
         MTNeMVziOnm2J50/Dee/vnqD6eTH/99H1YJIEGmKJpk9MfkUjk161I42Piyt1kIpK8rK
         rLdgvTtOHOvVloCodXjKXuw31G64CnIVGct22SuXg2skwKpsPTLwu8cDSC/DpODtB6gV
         Vl6g==
X-Gm-Message-State: AOJu0YxBFzobOakZ8R/LMSEMYFEXsa6xjKadcA7t/tiw9ysrBhOkoSCw
	on2C04ZyvQ648pm+wFWrL9rtvGUu7CtrA1iBqixZeyjtd25WP1HFYGcB
X-Gm-Gg: AeBDieshws0p3ycQb4ZZTuBOR9quRLNMfJYFYntLBdcw8e4x3uArStKprwNLZ8YH9ky
	Ek5ALHqnrDDsHld9DKHvSK1HM3pKo01rZNPjXEOO1+4FthEXXUOvizvEg5go0FSffaC8r3XzFGO
	N9sCSTFm42OkohAxniqX3eyotua2Jj8yU0hU9mGnwJN559yzi9CbSeXeuZdPOgDzfYbNB0ZM1Js
	YLJJWnIjjuxYwJlfdGPR7wrRTDfykimSyIHsT5RdMAmPpQ/s3iJELFjxQSMYxsawgqLyyzWQsNz
	AJ3Z2FOcfrzB5QQN3ZuaNbjwcV2/KwrJ0VcKl3UANs/PtpGMnTF7g6cQU6KqrLL9MatEHXZAUs+
	xBoVENzpJwwUvQkvbbBzJXylCpUr77YYIo7PzThoD5rNhbbYGX0I3kKb4KK7eWBpini6hEcmUcG
	6BjbcpIxTmTuNsGUj0zj7z75+boMduulQPqlM=
X-Received: by 2002:a05:6512:3e05:b0:5a8:6d5d:ca84 with SMTP id 2adb3069b0e04-5a86d5dcb1bmr64330e87.31.1777759308089;
        Sat, 02 May 2026 15:01:48 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:47 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 08/10] staging: rtl8723bs: move normal_chip field to struct hal_com_data
Date: Sun,  3 May 2026 00:55:47 +0300
Message-ID: <20260502220056.59815-9-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502220056.59815-1-nikolayof23@gmail.com>
References: <20260502220056.59815-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'chip_normal' field is the only remaining member of the 'struct
hal_version' that is used.

Move this field to the hal_com_data struct, where other chip information
is already stored. The order of assignments and reads to this variable
remains unchanged. This is purely a data relocation patch.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 drivers/staging/rtl8723bs/include/HalVerDef.h     | 1 -
 drivers/staging/rtl8723bs/include/hal_data.h      | 3 +++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0818034563b1..0c422deed545 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -835,7 +835,7 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	pHalData = GET_HAL_DATA(padapter);
 
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
-	ChipVersion.chip_normal = ((value32 & RTL_ID) ? false : true);
+	pHalData->chip_normal = ((value32 & RTL_ID) ? false : true);
 
 	/*  For regulator mode. by tynli. 2011.01.14 */
 	pHalData->RegulatorMode = ((value32 & SPS_SEL) ? RT_LDO_REGULATOR : RT_SWITCHING_REGULATOR);
@@ -906,7 +906,7 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 
 	/*  ARFB table 9 for 11ac 5G 2SS */
 	rtw_write32(Adapter, REG_ARFR0_8723B, 0x00000010);
-	if (pHalData->VersionID.chip_normal)
+	if (pHalData->chip_normal)
 		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0xfffff000);
 	else
 		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0x3e0ff000);
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index 90ef37b1ddae..ed6925872d56 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -42,7 +42,6 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 };
 
 struct hal_version { /* tag_HAL_VERSION */
-	bool chip_normal;	/* true - normal chip, false - test chip */
 };
 
 /* hal_version			VersionID; */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index ff4383e30322..20b14e665d99 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -391,6 +391,9 @@ struct hal_com_data {
 	/*  Interrupt related register information. */
 	u32 		SysIntrStatus;
 	u32 		SysIntrMask;
+
+	/* Chip version information */
+	bool chip_normal;	/* true - normal chip, false - test chip */
 };
 
 #define GET_HAL_DATA(__padapter)	((struct hal_com_data *)((__padapter)->HalData))
-- 
2.54.0

