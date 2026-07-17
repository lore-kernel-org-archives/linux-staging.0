Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463E345741
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314460; cv=none; b=gJa//eAm3QwKxpbYOBz2wbdEp4QE3Y5Cy14JBIOSLZk0HNJVGcKdZvpijqSKzXRQThvk/zWA8UtQCI5LCwxpugNht/NV1/ZNIWhAP3QMlN+zlZtlaxNBPtZtHM6UGl+Smc53u8P7agmG3p9/zuDiFtusMNKCO2BB1SNQdPG+JUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314460; c=relaxed/simple;
	bh=bMu2j02n6Y5ykqp3bMRHxyZkhjpbWWvrKz4i6NDTA+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvvHXGAcold6TBCTmAQ6+p1sEcYdPsJEH1Xi0q+y2ZNgQtFmZuL8gCJ2fmi2HJCN+iReUFziP83Fzj2XBtaJWe2qKrnRU9zXjOEgSRK7kk+tJkWogMBBDuq+najWF3a5ssdbdgj9zXLLoanp8Ek+pfaSrjrWNQhSEvh1dXppnxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIbPt8JO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIbPt8JO"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15e592da74so1008408266b.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314457; x=1784919257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eJc503q6aC6SjQgPfr4xwzVraTuiP4kIDU6rORsb/Q=;
        b=IIbPt8JOR3nRxWAmPzWPnMIwxvK++T3ZXyb9/bxqCXfL8aRYEXsxysIArkFBBqut6t
         3syaeY0HZhPR/FsUqlkyulnUu5VNgJg7doE7dT4KHg8BxFhVZmeZDeJopWTElxrlTCc/
         bT5woWlD1KIIUy35eoYWG+qLrzpV1FbXMebqQH5dp1ITkHwkp3xWJtqdm3OWP+1go2yP
         u6EDh/rrlzJED2vFQcuz9IrNG/akFik6XKgSVonetWuoloPwV7f7Bfa6/sjOj2+9Vhtk
         qnUMvc3WUNBpA/i7NyGgFIRGflspHsyeSWQbnjGqtyMiOg9IZeMdBkhEoOLSnI7VQi+5
         37fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314457; x=1784919257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eJc503q6aC6SjQgPfr4xwzVraTuiP4kIDU6rORsb/Q=;
        b=XgkMNRdb7mXl9ktH160/bAGXKFpuUWYFo64dl3c/tyzgEFRCehbcZgjjKjt9mRQ+/w
         YaoD8c6KjeXxFecD8+yB6DP6+OskfMaxh2iWRKrUBGjpZOz/pIZfe7hK2sLAdP5nrO0y
         3lQlyVJmRAglyvBXmb4rGRBST5K8BSkw/Jl4R0FgeIFFJNtj76EmPiJ1L5X4ajzFkedu
         LEcp43XHA3G9YqI9RIMPIv2RQJfonYsq0+BJvMkXIL/FREe9WTyn8rUS2uQC30jAAj1a
         eoV+6bGTzFpOJmre2+8ujem+CbRUgLaQo4x6lFunTgGgze5Uz5Br8RTyRRzuF19l7zgp
         SeJA==
X-Gm-Message-State: AOJu0YxNw/mGoLYjHMM3djelwxv7AjzN+5G07mwPjMqE9SyGqsHoA5mE
	ob3OtYcOXSiOCrGPlcIseA6K09NR1SPly1B1s2whEYRbHyEUxv2C4W9y
X-Gm-Gg: AfdE7clUMG17DI/H/PSPzKqg7589RIZ2dbFDWGndoX0EKuniNhzP+YWv2APRF/oIih3
	69ZDX+juBVAILLDViXQw9SYI0cd4cOLPEqj0SlkJE/tyJbVZ+KWnk2C0aawyfsGGiY0lzzqYVPg
	8p/AW1VB3n1nPwdeiBA6E6UAQbX5w1sxA4HKErayEmmYkaSph5WRrtUUbOkDrosafUgalNWRM3e
	jEPMeLMMXvLpul9M4ZWEeaYmegdBV5OPsqRBGCi5UJdWmDdT2uYLp+P3Qn4Q616pFod/1f3MIsJ
	X7BF/sZYHybNJKTfzldRe/aXy8i3Y2AaJLjbT9FWYZcquY7lx48xYsi1XoNvj+YbcFtlMDWsL6V
	KSVcXgnRou0yByt2X+XvxgH0Kv8xWysoPKulelsMwsO3m2kk1DT33ApVjBIUWxMcJyBKhFchEXk
	ZRkz0eWclTDE8=
X-Received: by 2002:a17:907:e1d3:20b0:c15:b67b:523e with SMTP id a640c23a62f3a-c16b46f14c6mr124064966b.19.1784314456785;
        Fri, 17 Jul 2026 11:54:16 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:16 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/9] staging: rtl8723bs: remove unused 'CCK_24G_Diff' from hal_com_data
Date: Fri, 17 Jul 2026 21:52:00 +0300
Message-ID: <20260717185407.56513-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717185407.56513-1-nikolayof23@gmail.com>
References: <20260717185407.56513-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Values are written to this array, but they are never used.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 3dac9a8fe5d8..83e05693b5b7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1311,7 +1311,6 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 		}
 
 		for (TxCount = 0; TxCount < MAX_TX_COUNT; TxCount++) {
-			pHalData->CCK_24G_Diff[rfPath][TxCount] = pwrInfo24G.CCK_Diff[rfPath][TxCount];
 			pHalData->OFDM_24G_Diff[rfPath][TxCount] = pwrInfo24G.OFDM_Diff[rfPath][TxCount];
 			pHalData->BW20_24G_Diff[rfPath][TxCount] = pwrInfo24G.BW20_Diff[rfPath][TxCount];
 			pHalData->BW40_24G_Diff[rfPath][TxCount] = pwrInfo24G.BW40_Diff[rfPath][TxCount];
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index df0c3248a4e1..b88ae2eb1072 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -176,7 +176,6 @@ struct hal_com_data {
 	u8 Index24G_CCK_Base[MAX_RF_PATH][CHANNEL_MAX_NUMBER];
 	u8 Index24G_BW40_Base[MAX_RF_PATH][CHANNEL_MAX_NUMBER];
 	/* If only one tx, only BW20 and OFDM are used. */
-	s8	CCK_24G_Diff[MAX_RF_PATH][MAX_TX_COUNT];
 	s8	OFDM_24G_Diff[MAX_RF_PATH][MAX_TX_COUNT];
 	s8	BW20_24G_Diff[MAX_RF_PATH][MAX_TX_COUNT];
 	s8	BW40_24G_Diff[MAX_RF_PATH][MAX_TX_COUNT];
-- 
2.55.0

