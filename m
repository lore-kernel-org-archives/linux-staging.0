Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA19926058D
	for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756029521; cv=none; b=DyBXSaR4vW9j0jjpPhSDum5TS+v+hRrK8meyACjpqz66J9hiXhS0EROw415G1EFuV9Vi0VwiWvy/mmDkMVwpZjq8afhxRa5XZoPvm009nAo7/WwBWoV1QzJhlSDpEw3K71IeQCUXxntXVfG51HPjr3P0fwCd4WuxKrmK+72jp5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756029521; c=relaxed/simple;
	bh=9vKO6y/q0kB3TamnCzON4DvVOC9PmEnOciXyI0pj7zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZSlrMy5lA434Byj7xE70cXemOaYjFA//YcS5pYkslhxpjwpDtdl0o62VKByMaqTf78Xjz22ACpA9YpEkfd/WuTcN8JkZQKYPKrOApsGT3Aa9JTDq7PVhMIjKFyJDSpnLj4r/HgJzqaN9Wwuazqlf+ehwtpY7ljsbsPU58Juaos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLTynTSX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLTynTSX"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78f5df4so586926466b.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756029518; x=1756634318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZKX5iGNtzUg18kwP/R5sStYV/khRElhDeGAve6BvqI=;
        b=kLTynTSXXPYXXMo1YloqKXVUfhfZ/cllVuRA2Q5/GtAb+74nn2/hVic2/aqyfJy1EN
         c2uDJMtGB9fgNMjjwFvAxrKrhS8TwnRApYjLnvcEykfZZfSCNHsPV6tHNDuY00/AadAt
         i2/RZECHbTYeSxBd2Zv7orM9Gk7DsSQKGW0WJZjaaRzHw0KYIqWzfNpcMJeohU3HUZof
         FAcGwVutg4wWo4T2aVcJprIyZbg/nwFvO4LhM+vRHlCtVBGWGvVLm2kjv6CRciym21Wy
         44yBaaG6CnZc6RV97Mc0v7/zmFeblpot0dRAjqUrLPmENVJ/CEusaD0VSHyaUDu5aEg+
         2WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756029518; x=1756634318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZKX5iGNtzUg18kwP/R5sStYV/khRElhDeGAve6BvqI=;
        b=rGVvkGWozcoWhogBITar+gFsJPBOmj/+ATPPiT76rfn1Z30KORuU+5BNfg0RZe3u6f
         paqnE1McHczV3aGSkX8xYzzmpT3qVFYu1tmk244rAgDV6n9pRskHtEEBEnSMG/48YS/3
         5Cr47SVsjk59Zt0ix/phPIzAaL32tgO3S+SC/Cxfdguz0TXhCizz3uz0WbGVAlyBVyYd
         iAEXgKnZgDCKmQVwvBtnal7D+0JUlWAbqCoKSkZ7PJ/7rHFKAvHyr1twtyEa+Djm8c2J
         VsppSN15RSMdM8dIrd+VS0cjAx8fQ3fG2A+QALpFRbIucMt96AK07f8oJHs2JBlIuunJ
         fzAw==
X-Forwarded-Encrypted: i=1; AJvYcCXw/RoBr1GLRy04esLFjpx1187+Eshax5cfvwrGIRDNvozVrbjRVqU1FFnQgqKXGK1nZd6Srajw1o/+47QU@lists.linux.dev
X-Gm-Message-State: AOJu0YwB6dc9wAclF1C3J11KCOGsB68QylZDEvitkuQgKFi/Q6FkAUuu
	vH4+HGImWJ6GqFLOtUtk+ApY8NtNPFIsuWs36BAUKI5Mi+D4hcA4+qOR
X-Gm-Gg: ASbGnct9t/JVO1sYaRKYzz54JL+1Kb1jjn5tfA7BwPADc2Ug3tqSxCo7AIv+6O1/u3y
	B0GNiBtiCxvWjOVwVZBACB7H/j0+8mcONvAICm06Kq61KGhsoguNxEwFsfWsHRFHVPcZ1tR14vi
	ul1wBTbrj3/qm11eKqtspXJI7gQcQjB6VrJDNLl2b/qfP7Kz6fdJXAmiOU477uMaCsb4On+7uaV
	KK0wH1v5Pd8Coyx6vFr9/Y7wCF7WnQmfOVQtt7aKPT/9t9jYVB32N2TkwN6Ai01oQc9lz5DjVhO
	0fd39UNxgf28mIKkgA2GLWX4CO3tCHKvVHjAradPBrTdPy+mCUDif50dvd2t6t6zq1Phtki8qog
	B5CcvKGkYMduzKhWVBDzEAGbwfA==
X-Google-Smtp-Source: AGHT+IElT045z23ULaqJLlbU6nriQbkGsElcteR0wlVYWXnPAJOezIwza8EGMC5PaY11b8LoP6Xbhg==
X-Received: by 2002:a17:907:6d27:b0:afd:d9e4:5a4b with SMTP id a640c23a62f3a-afe296bce93mr854042666b.63.1756029517762;
        Sun, 24 Aug 2025 02:58:37 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe79fba62dsm41314766b.100.2025.08.24.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 02:58:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: remove wrapper Efuse_PowerSwitch
Date: Sun, 24 Aug 2025 11:58:27 +0200
Message-ID: <20250824095830.79233-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250824095830.79233-1-straube.linux@gmail.com>
References: <20250824095830.79233-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function Efuse_PowerSwitch is just a wrapper around
Hal_EfusePowerSwitch. Remove the wrapper and use Hal_EfusePowerSwitch
directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 31 ++-----------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 +--
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  2 --
 3 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index e39032b45c35..f0c705ccdbdc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -29,33 +29,6 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
 
-/*-----------------------------------------------------------------------------
- * Function:	Efuse_PowerSwitch
- *
- * Overview:	When we want to enable write operation, we should change to
- *			pwr on state. When we stop write, we should switch to 500k mode
- *			and disable LDO 2.5V.
- *
- * Input:       NONE
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- * When			Who		Remark
- * 11/17/2008	MHC		Create Version 0.
- *
- */
-void
-Efuse_PowerSwitch(
-struct adapter *padapter,
-u8 bWrite,
-u8 PwrState)
-{
-	Hal_EfusePowerSwitch(padapter, bWrite, PwrState);
-}
-
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
 u8
 Efuse_CalculateWordCnts(u8 word_en)
@@ -191,13 +164,13 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 {
 	u16 mapLen = 0;
 
-	Efuse_PowerSwitch(padapter, false, true);
+	Hal_EfusePowerSwitch(padapter, false, true);
 
 	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
 
 	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
 
-	Efuse_PowerSwitch(padapter, false, false);
+	Hal_EfusePowerSwitch(padapter, false, false);
 }
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 94492743ea34..66ba3bcd22e4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1474,9 +1474,9 @@ void Hal_EfuseParsePackageType_8723B(
 	u8 package;
 	u8 efuseContent;
 
-	Efuse_PowerSwitch(padapter, false, true);
+	Hal_EfusePowerSwitch(padapter, false, true);
 	efuse_OneByteRead(padapter, 0x1FB, &efuseContent);
-	Efuse_PowerSwitch(padapter, false, false);
+	Hal_EfusePowerSwitch(padapter, false, false);
 
 	package = efuseContent & 0x7;
 	switch (package) {
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 5251ecc855d7..904369705ed7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -93,8 +93,6 @@ extern u8 fakeBTEfuseModifiedMap[];
 u8 Efuse_CalculateWordCnts(u8 word_en);
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
 
-void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
-
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
-- 
2.51.0

