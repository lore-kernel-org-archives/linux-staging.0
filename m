Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319B7325702
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743106; cv=none; b=BBmeTicaZ9UT74BbSUcjW3dK0LSOzaBGS09j5XVbKdxP0Gxv8x6Cjtph54BzOASD7TZZxF9AIOq9DvRnKZ6IkgeynOwivC4CdxOYHsLly6H/LRCb15EOc4fulPJU5+BX2u0A4B8E+QW9HT8TOOVnBwEEEfQu5IQ+rCXplHqdlLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743106; c=relaxed/simple;
	bh=JTGeqIE6flBnr2MWVwyz2Dyk1s/yNb6+1M/j4kiR7kU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIPzQobWgw3TrOsllhx466v6p/u/qbA4PZfieKzpzKNrpICBBC9+FueA8VRZDP6Jtc1BH4G0WpE4lJc5NZblbImZsSjeCpyZTAXvmgB0TJsp4KFxV2rrImeBFTkgV3NK5oKMoyh/3sSmVMs7rKzTOI9MBMO795OjeQ5CeSEDBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BypK0j6N; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BypK0j6N"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b884a84e622so1008264066b.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 09:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770743103; x=1771347903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKMH95g2zFbmX4wIGmKmRh9ohizNBq7eSvsYjPLDOjs=;
        b=BypK0j6NsAvl/DTu27z1EAnxTnicVu26Nknd2QGzd+SGwwSwge3T2nDRNW5iSBlec0
         9aOstxhXML4ewLHs0MwP72JmNYFvAlWKukflYxOR0R8uRPnDArECfXE8eo4HVZx9Igb5
         m/bynOt1TZleWcT3lIF/c2aVT3jVrBgY+O7WqMiVHhW5z0qD4zfG7MqSqewxWl595Rxh
         9yDnm02M4MGwwwnSBSZCqftIRPGUN94EZ45DwdbqH+lQGFTleqL43dSzq8ff75KkYX1e
         5b13wUpjFBZOks0AEhdDaWb7fp4v+NrhpSAEFumg37cELwEXnc/cs59pRMGa913Kq0N1
         zmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770743103; x=1771347903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKMH95g2zFbmX4wIGmKmRh9ohizNBq7eSvsYjPLDOjs=;
        b=w/rUljc8ulOdQvgYmEkcjpJY2yZRV127HJ1LYCXSKzp5yzF0XhVbZdaOPIIWBYmB/k
         L0EQMa6hjzIZGuDsQOD6yNkR+FBZdyzhsgN7MB/+CvsHOk/waW7gY6nKRUajEWm1olC1
         vrhaTdUIuvp5CKT5ZcLR+U7igygTL34apX+dPd3mvJl3PU7jIcXbLn464S7Xq10jYsHf
         0yvXC41AnxNVUjxfXjLT1nK8iYJ9k4YhKgdv87JwFt+Hx5l22HGJZ/63HHhAHSzihIGC
         PUX9adtNPrWznC8xbDeZwo8ZRuFQkRjAwdCAHRE8wEZILvg+fPmT/IeAudHbVlWI/qVd
         Kjsg==
X-Gm-Message-State: AOJu0Yz6ytnJ4h7dZawfsdtUxWOw5l1WopXbyLOVmKcwF1SS6a1FWj71
	7LOaEiaM2SzjVGdswWxBRq7xBicDs5keNmhYgsLV+oRl7XqSS7LMC8vwpYNeLTY+v6c=
X-Gm-Gg: AZuq6aKF2DmNPHOu3oGZQVemL7pTOMLP/T9MFr3hkwxLGS/Wxm0kYOiyfeGcPg0zCS3
	xQVwNcBftdmR3enk5Tk1d4whEykd3cb3BCElL0w7TWSRRR13zmCdDtWHruVsQ24rn3gRWe3Uuzb
	wb2RA+Qi4iKTP1kKYyrZ0cgzlEqvmNoeU07UJL0IHsDRy+hkS8yqRDoPvfdPTCE/rz84uUBAZYC
	cW5lH9TpFKJIwUvgdSwfILhzHBNSuFyFcQfOmA6Gqdt8F7D1N4+SnFQY/Grfh9jsyi1UpCIhQN6
	ETyn6Az5FSVLtqgKzf2DvqfGhKP1y7m3S+Q2RakYGuv4FBhESXjmINhANCmpBWBfq5BQ3iHstn9
	6v1EnZAOrqR4IuTCm5uBRoD20vkDqXj+d8lv6EmFeCJzxncrrcaQrzVFtj93T7YK2CfzBg9EHkZ
	PX13eZ/uIyU1j/G+gnbpmRXqEx3TSL+pCPdHsl0g==
X-Received: by 2002:a17:907:3c8c:b0:b87:3c4a:e68a with SMTP id a640c23a62f3a-b8f5438b063mr145446366b.9.1770743103070;
        Tue, 10 Feb 2026 09:05:03 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3004sm541870866b.15.2026.02.10.09.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 09:05:02 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove shadowed variable in sdio_halinit
Date: Tue, 10 Feb 2026 18:04:57 +0100
Message-ID: <20260210170457.50720-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'bMacPwrCtrlOn' was redeclared in the function
CardEnable, shadowing a variable of the same name declared at the
top of the function (line 21).

Remove the redundant 'u8' type declaration to use the existing outer
variable and resolve a -Wshadow warning.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
Changes in v2:
Removed incorrect blank line after the opening brace that was left
behind when removing the Adapter variable.

 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 1 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index f712d0345b99..0f915589b518 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -208,7 +208,6 @@ void ODM_TxPwrTrackSetPwr_8723B(
 	}
 
 	if (Method == TXAGC) {
-
 		pDM_Odm->Remnant_OFDMSwingIdx[RFPath] = pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
 
 		pDM_Odm->Modify_TxAGC_Flag_PathA = true;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 0fa1b22fdf9a..861d5162de15 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -30,7 +30,7 @@ static u8 CardEnable(struct adapter *padapter)
 
 		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
 		if (ret == _SUCCESS) {
-			u8 bMacPwrCtrlOn = true;
+			bMacPwrCtrlOn = true;
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 		}
 	} else
-- 
2.53.0

