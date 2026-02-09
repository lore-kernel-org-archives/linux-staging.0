Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A661FCFFC
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681132; cv=none; b=QNkCe5MKd77Tt4XK8E43n1rptTOx1IyVw/4TodiQJM1Zq3CS69ZOh5yf+c5CyiF+mYHl9ivE0TKy5/R4JJp3l+NsnCNnzB9QTP4Yq93iSZuLFs0rlOhd3xZ9NZwtcZop7/WOyqCU6Zb1AJSohKk3mEMF1MXcjAuQNM/lyqQmnok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681132; c=relaxed/simple;
	bh=okwdrdD8lgpoZ7SGkCLDFlnyyV1j42Lz/LKXWqHBKfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Se6TpSir3nu3MdgiXQWDLHhawx5rT3V6/5DlOChodkXHOFokfNSAXOLNivLW66Ztxex/ky9f07TCG3PXezgcoVzaIWlZNuU6oRchmTok7inL991ZI19NXh3MFPeg/WIPIbnUqTO0WccC0s8qPYKBhsLGi43WkbwaQAgyWRHw2iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDbegTd5; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDbegTd5"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8230d228372so2928117b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770681130; x=1771285930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYuM+Vr4Kloc7D1FBfKI9pNOBsiEqD7j0ggz186C5JM=;
        b=lDbegTd5iv1JzDQE7PpRQqMxIleDYUFYwyFGxyZGGen4Q9opJFvWc19Tnmkg16PFJI
         Q8S+1YA7LlNpJKxSPo07DI5XeDc2HIBBY9LUXTZ7KZGKHQCVix8MueMfgv9I2wlNvJ6N
         smm6KnsD03UjHFQARcaka1kmvlxjJWQt5eyPuH3/jUzZylIbsi6i6UgQLfw4JndfYBwq
         hTuViH3jQNMyBJppXVMRoPwvj1WfwoG0hijVhMlgrSmYGTGNakL2FvPz7M2KPHqe0VoH
         Zr8VHm2EVfBICxjnUobrrqoCeBrGXvuL6rH4Ub18nmI/0DNmkPSF68OnYfqWsrS0aCC7
         PKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681130; x=1771285930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYuM+Vr4Kloc7D1FBfKI9pNOBsiEqD7j0ggz186C5JM=;
        b=twW9jv9/colYoG34BY2T36ud3R0+TYTyCR4uhq21NNwMbRU6kaFvKCwKMzoXzO6vJ1
         lrmmSaSHh4SOX6JZKeb4mbNyJdE21YMGuQnimcbk8gJqhKQ2+V6cpvArQxgRR6Zdof/D
         ata5sve5vWwpO44sxc3Z32hXuCOdkRJK0RGkuTZ0ZXnZZSoFi5pPG9ic8wZ9fw/bd8sn
         ZAYgCYemGAmBlHzw+6+pisusa+zWFYdcn3TgF7kfrh+zqKg8b9nlYex8Ll5b3DRjVSDN
         pis1cZOhf82764GLfmmJyum8HEmhk1liZyZg0deWGwbutOENKa9HnuvkdjD2uF8iBPmX
         iXQA==
X-Gm-Message-State: AOJu0Yyu7lKkdtJ8TIzkyjE77nC4tp1yspTsukKX6B7C5myr8bUmIEri
	r7dFvtPxcMV4knLPWyWzxUsPiAwf2gF44Ht2TNYyhb/NrUaqHztVoi4R
X-Gm-Gg: AZuq6aK+6r5eIf0pV/QOqnO/zyGUa+Qm49zpo1jsL4KKvN49UxmkqR0vHhFaJqiUfVW
	S5lW4btZtkcnrgfZXZmK6o7JcIM2rmJhaUlruk3ebsR6yt3BQdJaXOjGwBvaE+jt8NLbuXyhH+5
	o9ZWeFrtnhV8lj6kE/C40xztRlb3dqQT0qsXoSaAuWc+11VJghPSQzsPQYTyD4TDTXF6lzVao7N
	QCghGXQy6LrL0xZO8hGHgzMSKopNehsxkvtKmftElG0+Mly6L1//x3ZtA4eoNVWb2yxevWoLY3u
	ihqSUR437X64gE2YtsMyPchTDGx2rr4IKy+ok8vG7p/ybScKsV2z0SuYMclYmfzqaTagg+i6hAY
	6G1QEoex4K9yLfwg5QwhE7GiyJpikEBjAWwCbkrHVakp7FcwEDnR/ZzKMISJ6McgGen4OC9c14e
	s4h8ZZQS41mBOc4YMyNwyFsA==
X-Received: by 2002:a05:6a21:6d85:b0:34e:be9b:b67f with SMTP id adf61e73a8af0-393af0c8639mr13362369637.49.1770681129861;
        Mon, 09 Feb 2026 15:52:09 -0800 (PST)
Received: from Horstaufmental ([159.192.34.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb64499fsm11581843a12.31.2026.02.09.15.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:52:09 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 2/7] staging: rtl8723bs: rtw_efuse: remove unnecessary void * casts
Date: Tue, 10 Feb 2026 06:51:28 +0700
Message-ID: <20260209235133.1292161-3-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209235133.1292161-1-horstaufmental@gmail.com>
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 98b15ca10074..d1150da50260 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -69,7 +69,7 @@ u16		Address)
 	u32 k = 0;
 	u16 contentLen = 0;
 
-	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, (void *)&contentLen);
+	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &contentLen);
 
 	if (Address < contentLen) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
@@ -163,7 +163,7 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 
 	Hal_EfusePowerSwitch(padapter, true);
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
+	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
 
 	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
 
@@ -239,7 +239,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u16 mapLen = 0;
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
+	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
 
 	if (pEEPROM->bautoload_fail_flag)
 		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
-- 
2.52.0

