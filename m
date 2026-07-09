Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3215C13DDAE
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621663; cv=none; b=ntxiEEcKLKjpDtu+BaywDxGIE01Dn1zBU/c+pMUf5tLbA+Z2PKRT0789g19Xy/LDKGRnl+ls+dNvZbDwvJ5O55go7i+FFNLGH5hvgPQwHx2wQS0EjcujSx32Mi5dlht99UCQSqygyvPMRGoHutlzehfJQAEAEeQ3oBxdHa9sIDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621663; c=relaxed/simple;
	bh=tq48yuDXn7ejSCTaKWOeLNpRNxQr1INpoG3fRWtp3P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbTOPy37YkgK0lz/NXJeI3gX1wz4e2mYck+oY5qQjQA5ETywKv856ue1it57T2LrLjnkS4CxvPWldAtrGHV3eZtXFVycOrUHJNvxdUKHcv8obpbWen10Z6rNz3yRRifd7WvzqY706BSK4mOf0jxn2FsTvL4Y1s1oSLFm882JwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/HLl637; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/HLl637"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15fd3a299eso24654366b.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621660; x=1784226460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDXLRZnFW6fyrE8NYIZytWre40K58X4li+dEitoZfyo=;
        b=o/HLl637BYUQUxlyE20hss6lC3vCWNHKNNVdl7UtjkxgT3hMk5IvKigR168beID3qt
         dojS1dJUE/FFM5jho0NocV/r4cSBiVLvt+RTgNbIbioSp4+IBuTSpUtBUb+JVRLXXc0n
         h/oe1H+jLUXRzDrP8gg7odO+BWs0i0qSyTZ85ofNpqDt/FTyNvCl9MPePFh1RsGdbqTU
         BRPu64mwg1e7VWsi6UW+KT1MZojfvyuP+8fNYojM8to22BNHijJoEw8bitNz8/8ACAQR
         NIi92b1CpXd7RujXCfbIGsuqSk8GxPldx3tmlevcpcjwyEDCwWNj7/blDDshcxHGqY7O
         zeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621660; x=1784226460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDXLRZnFW6fyrE8NYIZytWre40K58X4li+dEitoZfyo=;
        b=RKxu8CZeZAQvZYOqe2YZ/TfiTe8suYE7/s+zPFU/R/jheGcvDEUIPjLYGdaCr2bETq
         IqzAGP8soXgwRG6buIieka6rankEdOUPxuh/DciEXlxwbdWTX7YP8MizbZqeL+/Jz3YF
         +9GlFhWZPLQ9CZJUMxrsXxQxw/HI2sFy+jvCXsDSLtTl68F2ZlAbO9L4/kY63uLBor5B
         zIPlrHLACL6mj8k24V6+5dP3CiysL0WBoeaqMY/baA0RFF75MWoqs3TsI3s8vh3jjBcC
         B4AUex+rN8U0zBpz3wjjyQjX/XcUaLO4NbM9ySHNv8bZ2wG34m8raBongqarxvBLgD6x
         Sesg==
X-Gm-Message-State: AOJu0Ywx0eeOvawfFvjdLro97HyHVQGpyqikHtjzhUOQ/10d6BV5EMjg
	lbo9fFJbERl8bYs1h10SCv91HsHdqc0o4RC4n7M9W9gFkYbx68qnQxWa
X-Gm-Gg: AfdE7cknsF/e4olNli6+yBHmsqZKoavwzGjTdH10uruQ7Vbu8do4NqrzqAKhMBfxwVD
	uf6cE5KJr9xvn2R0sphXDB3iC4fTF5b82qe9MhBDs7ITZQalQVJorMo0gxEN1TzTvjk2cmRlTsS
	pQcRKoSWT7MbDrlvw+1aa1XUV3WYdaQVHNchyJhtN6p/HiYFP0Stv512MhWF2b9gbkv/Q8INGIz
	nOU1gbxtljTmPQEhX1L+csOOpIktlwEjCLZVzvLPTLe9J3pbqUrKvtjyeQtQoDjGwdvgmgGoxFz
	TFL4/EgCzUKm33vwY9dwUtWQXC++Rldu4qwHnOkxV8osMXtpAq1EEfU/k68Nit3oRj7RPqwFXBN
	0ezv8UjAkOtWDe90MbBb1D50eZJeaa5VgUe7j0X36vKNwuk5NSugYymVdfHw+xYbkEVGzU5Ghfr
	DnZFHUrHcqwg==
X-Received: by 2002:a17:906:ef09:b0:c12:7fac:c0e with SMTP id a640c23a62f3a-c15cded0093mr416242466b.1.1783621660382;
        Thu, 09 Jul 2026 11:27:40 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:40 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 9/9] staging: rtl8723bs: remove unused 'bTXPowerDataReadFromEEPORM'
Date: Thu,  9 Jul 2026 21:15:16 +0300
Message-ID: <20260709182627.16327-10-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709182627.16327-1-nikolayof23@gmail.com>
References: <20260709182627.16327-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'bTXPowerDataReadFromEEPORM' field of the struct hal_com_data is set
but never used; remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 2ab456a806b8..48b96bbf4fab 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1215,8 +1215,6 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 		return;
 	}
 
-	pHalData->bTXPowerDataReadFromEEPORM = true;		/* YJ, move, 120316 */
-
 	for (rfPath = 0; rfPath < MAX_RF_PATH; rfPath++) {
 		/* 2 2.4G default value */
 		for (group = 0; group < MAX_CHNL_GROUP_24G; group++) {
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index f4d4127ed5a1..df0c3248a4e1 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -165,7 +165,6 @@ struct hal_com_data {
 	u8 EEPROMThermalMeter;
 	u8 EEPROMBluetoothCoexist;
 	u8 EEPROMBluetoothAntNum;
-	u8 bTXPowerDataReadFromEEPORM;
 	u8 bDisableSWChannelPlan; /*  flag of disable software change channel plan */
 
 	bool		EepromOrEfuse;
-- 
2.54.0

