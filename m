Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320C5209681
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918042; cv=none; b=SUzWkc8lifTr22/LD+4+KH/3RMVVrtd7chBv5NLJ4yMlrzasDE9mcJXmQnSXaio+3WQ1Gqwe/2tZ9/e8rIK50oMgcBCA3rM+7GhPBh2/JrPKx/7hFs2Uy2Z+LfQRnYfbhkrVYJN/ekydY9oXIpgg40iVCiK4Tr1+EKMwI4EsWic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918042; c=relaxed/simple;
	bh=KfmJMPUsphqIRh7b0IAgOalfl+iFBdDUBMD/8jenYxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzvRwNqGPV8n8kB28Wp3xEL+Sf63IrA94Xhz9aunvrs2oZYsY9Xagh1J4wKexXtj3aoFvPZ49zZUTmqxSFNcpO6s5R/6sX4DWmERyHDI6He7fjWBqn9m4rSzIxl5RWEYqacKoy0u70sFMROaAVfnEk2UFM+9mRZKZKFpr59WhD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNV8qMRm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNV8qMRm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so11031966b.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918038; x=1731522838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+BamNq9Ka/vNcjcRd0qfZ5Er2QEzGn5caaTQCnbdDU=;
        b=kNV8qMRm2Uh0BiDnbTm9LwBZTETQp3tlNrH509LMvqleO9nPSyfLmFStYooxuabGAM
         A1i3r7vFlswhsSn2RcpSAkCRNR1aWTysxzAQ2ZBHXsZau5xqvdNwuwMH+G4fCEAn7yPd
         6tTh/zLKIuaZkKHSqOLLP9bbnk+G7XDuaMKmU2i5O9pS2zdQv1YpGZPqPj5Vo+lxPCLz
         ZWAxMSeVlOGoXzXofvMgiARM5j/eFUhIVMFxLermlS+dsN4rS/bH7wJQY0s6w7ovjTws
         BB+6hhAfWt8F6GL9YQnyu5qCiP7k/ucsW+ucOlaebZNIDAbkTuT236Q/1YyLliHz9l5t
         /IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918038; x=1731522838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+BamNq9Ka/vNcjcRd0qfZ5Er2QEzGn5caaTQCnbdDU=;
        b=JOWKuytW+cBbmiS19usv9Jc7yQQxo6q7DbP/snh15qenVJZRpQxpR18O3dRzEapn+D
         vyxEklr9MXC+Uq6e4fX6AIsxZxOV4zaHwGHB4/dDJHfsjIn2P8y5psxood7Q19JxM4Dk
         RBOh1Cj1dLReB64zLXSvsGXCDzIK0RKNb815nsDZNKbLDH/apu0l1zPuC7kTDPaY/BLU
         9Fm7tDgGL4jxHiuLo+PuAuYyQVDV3Yll/4WfzBXXBzeUvxuysft4ct2ooSZmNKUaOXYy
         8a5FgzLoBI1zimzxglCSk+pTh7inGZkKFLWCTTN0eIhZ7IDg4NNcpr+bLn09RQSCz0xc
         UeAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqIdO9B7uejR7KC3FgAV8qP5ZvGx1kJH6Qk/QM6RKONOtzP5iYP7CAtt0SovbvobMH1a4ATZcEusilwQoV@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm1YuMqaRn4MPmLFy6ULX0dksFXur5CMY2RpXn/qFZoCxgBbk1
	HvpVhmU3GfALMHOKwEqJuMlSdKKyyV5W5yh9+P1cKUvXtQX0u11o2E7jXQ==
X-Google-Smtp-Source: AGHT+IFiOWsnaFQPqNjtsLxnwyXMF5A+F68kG7RMtDz44fbvdi0yYFlh7V52DNVEms8teFIuXfKXmQ==
X-Received: by 2002:a17:906:dc92:b0:a99:f0f4:463d with SMTP id a640c23a62f3a-a9e3a5a5083mr2500921966b.26.1730918038427;
        Wed, 06 Nov 2024 10:33:58 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:58 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 07/16] staging: rtl8723bs: Remove unused function Hal_EfusePgPacketWrite_BT
Date: Wed,  6 Nov 2024 19:33:36 +0100
Message-ID: <d7f6a44ef5e2e9b17d3cc14cd346aff8220a9373.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function pointer Efuse_PgPacketWrite_BT and unused function
Hal_EfusePgPacketWrite_BT.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 30 -------------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 432c2c0aa259..fa6fbf0ddc23 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1365,35 +1365,6 @@ static u8 hal_EfusePgPacketWriteData(
 	return true;
 }
 
-static bool Hal_EfusePgPacketWrite_BT(
-	struct adapter *padapter,
-	u8 offset,
-	u8 word_en,
-	u8 *pData,
-	bool bPseudoTest
-)
-{
-	struct pgpkt_struct targetPkt;
-	u16 startAddr = 0;
-	u8 efuseType = EFUSE_BT;
-
-	if (!hal_EfusePgCheckAvailableAddr(padapter, efuseType, bPseudoTest))
-		return false;
-
-	hal_EfuseConstructPGPkt(offset, word_en, pData, &targetPkt);
-
-	if (!hal_EfusePartialWriteCheck(padapter, efuseType, &startAddr, &targetPkt, bPseudoTest))
-		return false;
-
-	if (!hal_EfusePgPacketWriteHeader(padapter, efuseType, &startAddr, &targetPkt, bPseudoTest))
-		return false;
-
-	if (!hal_EfusePgPacketWriteData(padapter, efuseType, &startAddr, &targetPkt, bPseudoTest))
-		return false;
-
-	return true;
-}
-
 static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 {
 	u32 value32;
@@ -1645,7 +1616,6 @@ void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	/*  Efuse related function */
 	pHalFunc->Efuse_WordEnableDataWrite = &Hal_EfuseWordEnableDataWrite;
-	pHalFunc->Efuse_PgPacketWrite_BT = &Hal_EfusePgPacketWrite_BT;
 
 	pHalFunc->SetHalODMVarHandler = &rtl8723b_SetHalODMVar;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 34cd13e49d8f..282e141616b0 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -165,7 +165,6 @@ struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
 	u8 (*Efuse_WordEnableDataWrite)(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
-	bool	(*Efuse_PgPacketWrite_BT)(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
 
 	s32 (*xmit_thread_handler)(struct adapter *padapter);
 	void (*hal_notch_filter)(struct adapter *adapter, bool enable);
-- 
2.43.0

