Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3479D359A65
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698698; cv=none; b=UX44DZDNfKfQL/R6TipG8rnOmQ3ZGwQsUEoCLJKDJ8CqQxB/s3TfMllWgT6BtQCVMHDNNlZ5e7394cASOgniSyCAZLDMBnFROCWPrLiUQcszPd52VOVRqy3eFq0Cm7ptZABmEgxJMXkW/IZBbGVfAFX5pOio1Pab5mVNhJvABQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698698; c=relaxed/simple;
	bh=YDf0vZr4bnJMoapPE03NGmxzvh6KF5ka7pzfxFBWHgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KAHeKrcfRsH/W9rL1xJHlVuj/Sj7X6pB/hzFfM0p7mDiy0he9V6iy0mgt7OVbKI3DQZNb7TDElReldJezz0H26kIM1j89LjxcCKoCvoBU1b07PcxapTXt3RpY+aAdv0oFyc05u7ce6anLxVe5fQgxnx6+7h4PfkIubuCZ8bpkwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xg8vLE2f; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg8vLE2f"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0bb213b16so1797009eec.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773698695; x=1774303495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KC9m9ym2S0i/PiPwmxbORLStDxWF9dLkktnO2ZE6V2c=;
        b=Xg8vLE2fvP1/+9cM0Lx4pVVy5YyZenZbsnafBLwFXf8wVei/40Xg8moYBFGSVUFAOT
         Lwnpb7Gv6Orkqd3t/0lI2oeqfp+OOB5Z952FdS6QkzqBrjVlVpnBmRMbahboJ2AaMeCW
         rAR/KV63saNAp3La7Ohnfg1t0d9f5QvYY+gEVyVhoet2KouUIeCCBVxoydK6UYJwQO5c
         b/PdZVXR6j6/cRaj2zVD/YJTW/dcaq9cZxZEUirl0EKbIoUzEcB4uLAoCAzk8ZsfCow+
         EGw0RuZUaDpTWZm8b/Le/0T6TpHGNUU/kVEm0ff59jbVVNlrbWP8OQriPQP4w5X4yo2k
         fP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773698695; x=1774303495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC9m9ym2S0i/PiPwmxbORLStDxWF9dLkktnO2ZE6V2c=;
        b=lbJntMsZRlGmpyrZC3ahxiSY0BNjP88gt5hZ6ADJUWgUOV8hXAWxVKo3FaR4LTfVyW
         N6MEq30WbDiu7wurknL/z627g6W34met+V4a4drcggYuZ2t3YJDD+0DTOOsDzQEN5qdx
         fK6FEJDGTA0+Y/GxZJ7sW2atmqYnig8vCn4vuD22oHi7v8BbKLHgBGDrW9vfhwPmBIOX
         jmKsbBjrub9SKSkf5W04izRfaAvEWk98U733NhuLKwedpz74pMvMKGVy2SrHgtH2/eAo
         5tZ8DAHvgcsZQACoOaxuFKxkBtq54GPBOEJIo12UCFmHa1FNPukGU5AiY5kYF4gDkul/
         SaXA==
X-Forwarded-Encrypted: i=1; AJvYcCUnJpqbbSmgipiSi20+U5+rc8nlVpJzfDZ2mebf8MN0vQE43eiKl26ND18md1n0OVy/MctWDvyeur/k6jLA@lists.linux.dev
X-Gm-Message-State: AOJu0YwePeSabv3Ja+Sd7Da9iIOnt21ThJ0AUXPD1iHzUPhVr0egpbtk
	vtilf76Y7v7g9H3EVuKdeUMzkkGcch/A+5XIrp+z2y2AaZ/Ox1eX+RdO
X-Gm-Gg: ATEYQzy+NgDvb9ZXyDMJEqCxxhu4gEkg1U8EJigjhGjhhB8UmYXweeiqd7ZarOiHOR5
	KWbmAdmUcI4xcwgz83lfgTxCl8ZSnN8du4OkSBl+WDVYMFCo8ak0q2o5urjCfxwl2pDQoXjfF2j
	6HqqgNctl9wJa5ef1QieoUnTeL8tMFI6BnIF21Moe0mdCqfYJqTCldsUxhJooJ6oGR47TLz/c+n
	Uaya7/ukcvJowcVCrmw4FNT23C1sNI4Uw6nEUsmsvQZ/6w6P6p69ZhG3z8OZ1zyvZFSnTr8czGn
	p9/9ZGaQwQEgZU7o/nZxtMF07/E0Qgz16oUjIIdUWKoW3HppUoGzPdECTtemmiPckAjmcGxtd64
	eRijKyNWC/tA/CVjzKEK4bZgcGgMJVfjFEq3vCUOt6EdMWM+hivP78hB3l/r3KDsGNWYP7FwdSC
	ecua1qI7IQ52igbRE7u19NV5Is7AxTBWmmncnB/dbeDTT2LBo=
X-Received: by 2002:a05:7300:fb86:b0:2ba:931e:7021 with SMTP id 5a478bee46e88-2bea5720289mr6586401eec.34.1773698695168;
        Mon, 16 Mar 2026 15:04:55 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3a0b3fsm17238753eec.5.2026.03.16.15.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:04:54 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unused global efuse variables
Date: Mon, 16 Mar 2026 19:04:35 -0300
Message-ID: <20260316220435.2249-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove several global efuse variables from rtw_efuse.c and their
corresponding extern declarations in rtw_efuse.h.

These variables (fakeEfuseBank, BTEfuseUsedBytes, etc.) are completely
unused legacy code. The driver currently maintains the efuse state
properly within the 'efuse_hal' structure, which is encapsulated
inside 'hal_com_data'.

The removal of this dead code cleans up the global namespace and
resolves multiple checkpatch.pl warnings regarding CamelCase naming
conventions. Verified by compilation that no functional code references
these variables.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
Changes in v2:
 - Collected Reviewed-by tag from Ethan Tidmore.

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 18 ------------------
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 19 -------------------
 2 files changed, 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 98b15ca10..0e550c631 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -8,24 +8,6 @@
 #include <hal_data.h>
 #include <linux/jiffies.h>
 
-
-/* Define global variables */
-u8 fakeEfuseBank;
-u32 fakeEfuseUsedBytes;
-u8 fakeEfuseContent[EFUSE_MAX_HW_SIZE] = {0};
-u8 fakeEfuseInitMap[EFUSE_MAX_MAP_LEN] = {0};
-u8 fakeEfuseModifiedMap[EFUSE_MAX_MAP_LEN] = {0};
-
-u32 BTEfuseUsedBytes;
-u8 BTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-u8 BTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-u8 BTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-
-u32 fakeBTEfuseUsedBytes;
-u8 fakeBTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
 u8
 Efuse_CalculateWordCnts(u8 word_en)
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 936b204b8..191ffdf59 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -68,25 +68,6 @@ struct efuse_hal {
 	u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN];
 };
 
-
-/*------------------------Export global variable----------------------------*/
-extern u8 fakeEfuseBank;
-extern u32 fakeEfuseUsedBytes;
-extern u8 fakeEfuseContent[];
-extern u8 fakeEfuseInitMap[];
-extern u8 fakeEfuseModifiedMap[];
-
-extern u32 BTEfuseUsedBytes;
-extern u8 BTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-extern u8 BTEfuseInitMap[];
-extern u8 BTEfuseModifiedMap[];
-
-extern u32 fakeBTEfuseUsedBytes;
-extern u8 fakeBTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-extern u8 fakeBTEfuseInitMap[];
-extern u8 fakeBTEfuseModifiedMap[];
-/*------------------------Export global variable----------------------------*/
-
 u8 Efuse_CalculateWordCnts(u8 word_en);
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
 
-- 
2.53.0

