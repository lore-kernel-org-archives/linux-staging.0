Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A7F20BB4D
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918048; cv=none; b=IfEVO4f6JQ1XMRn9u8iecIn1iKOeCszy3V/UgTW0QrVemlIuMcNbCjZmK/Vjo2lH7lGczNiO3wA0pGIJGEn/qJY5lSKwEkLjH2wlZH6pi89rkN251dZi76aQubKycxpXDAQrPt73iMi7IeRR6PTjngPyPzQC6QWCwyKK+XImB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918048; c=relaxed/simple;
	bh=IpCwHFvHWB+SD+q5t4kipYkhT8ePEI9get/CWHBF4bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zvl5rzcs1ryQePcW+5uQm0VueTS5ePqqN/vpChcfmyWXg8rRQaVxz2PPwB51Kv0ZTp+9790P10rEzWwKj94YZi5ceCjnUonQhYMw2em+V1TbeI+jLQMmtNgtpdMLZ8RFBVOoCxyRlPtIG7LBTdnbLXuteMUJe2J9iIQx2xyo8uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHK3O9Th; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHK3O9Th"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso11060166b.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918044; x=1731522844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1eOJY0eG7JqZEoh7Tdg13wcvziWr11zSxZYpyAV4F4=;
        b=CHK3O9ThysI1HC/3XbA4XRR10WU6SWsraOMlS7Nm9YzChyDLNnPkOvsN5McSk+Ji7R
         RYNvb4DKcf1kmsP01ZkHIYAUdyZ8DwgwBDH/QgB9AtONvUoNoG0HlzHq0YhM2Q1g0afI
         r9qwsvBErXTN9n45fp9b6eIhRbMdI+onrX1R27x3aGISBEku8qDN/Js3rxGJMKeny9Hp
         eMNzp9KeJfvGn3O3Thtmao3UlNkwaFAfHJAI/UG910h3PHHuHAz+G5Gs6s5j87pPs8Ky
         +owVKYqqrUCk+owINUFOlknnb8MZDOFu6UkpiJfwrHY7TK7dDQZbvszPD2FVj68vQvJp
         y4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918044; x=1731522844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1eOJY0eG7JqZEoh7Tdg13wcvziWr11zSxZYpyAV4F4=;
        b=sN96izITKWrmBndEogamz0zdgE8bAT+YXHFYbrtVsWmHXQOq+8hyhSb5EAhpLNRmmg
         KWkC/54s0F/QbY1aeSQQaI5FykDlIRxnPT8FZ8zNDMG8x5S3PV1sZ25XIZ7QtpKyTEGY
         ngmcdkC6YKjucdjxr7avGh1O44G1p36e//9uEvOMMRQ1rnD5wxtZ1UVKhF0RXunmzoLB
         rIAm66kbqAAd7RhPE71Q8JsyWCWLa8X+bxKQ5MHVTDVBXz6MYkgSDFDaN/vg1myuMkaJ
         t3bEO/ECvFffQDoYsODaBNLzyskYrtCPfxAfH8Ou4UwEamCVZOXokbqmZRxrE+E393/7
         WXng==
X-Forwarded-Encrypted: i=1; AJvYcCUgIHwI8OeWILG+jRtvInGt0Yh1imBaspzLSvBGV4MzH+A/gnxNwt7ARmU2pNFM+v0okRMx2Q6T+t8s6jcV@lists.linux.dev
X-Gm-Message-State: AOJu0YxzydVKqWVa0qoxTWCLvKhBgPgBQBZ9/Tj3uD0V/Cfel6/EAWGC
	+uU7iM2Z3woDKIG5FUb8Mh/fT4iy6Q7+Q2m3CZfMSQ2BWpTAtEec
X-Google-Smtp-Source: AGHT+IHUzxOH6GOnntZOQ1br9NTnROwPUrcqBcX4UJSACwGyMDoF2IPXfgk/bCk8lXpR8GaC2HjNtA==
X-Received: by 2002:a17:907:9815:b0:a99:e326:53f2 with SMTP id a640c23a62f3a-a9de5f67a62mr3580583566b.28.1730918044153;
        Wed, 06 Nov 2024 10:34:04 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:34:03 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 16/16] staging: rtl8723bs: Remove unused function Efuse_GetCurrentSize
Date: Wed,  6 Nov 2024 19:33:45 +0100
Message-ID: <d1b8cb38670b99a75b0e916adde389ed13c15935.1730916582.git.philipp.g.hortmann@gmail.com>
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

Remove unused function Efuse_GetCurrentSize to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 25 -------------------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index fcd9ac58b96f..7a74b011dedc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -80,31 +80,6 @@ u8 PwrState)
 	Hal_EfusePowerSwitch(padapter, bWrite, PwrState);
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	Efuse_GetCurrentSize
- *
- * Overview:	Get current efuse size!!!
- *
- * Input:       NONE
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- * When			Who		Remark
- * 11/16/2008	MHC		Create Version 0.
- *
- *---------------------------------------------------------------------------*/
-u16
-Efuse_GetCurrentSize(
-	struct adapter *padapter,
-	u8	efuseType,
-	bool		bPseudoTest)
-{
-	return Hal_EfuseGetCurrentSize(padapter, efuseType, bPseudoTest);
-}
-
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
 u8
 Efuse_CalculateWordCnts(u8 word_en)
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 5f72be256acf..d6ea8a4a856f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -90,7 +90,6 @@ extern u8 fakeBTEfuseInitMap[];
 extern u8 fakeBTEfuseModifiedMap[];
 /*------------------------Export global variable----------------------------*/
 
-u16 Efuse_GetCurrentSize(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
 u8 Efuse_CalculateWordCnts(u8 word_en);
 void EFUSE_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type, void *pOut, bool bPseudoTest);
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 bPseudoTest);
-- 
2.43.0

