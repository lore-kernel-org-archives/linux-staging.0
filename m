Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393CD481B7
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382467; cv=none; b=H1zjM1nYAJtiAINU3pG1Z20TcZQb3EsafIaPTu8eCq26J+2a+8EA5fsrepkJ8++5y6JWlIiUsB7QIIq1Zxj9KgcJe3AgX8J3ZbUG7v9Di6Hs2QXMlSnDAVo1uE9gFks8Ph/UNm+wF654bSwoApQCjC7dt2A1GKMIBTh2stM40nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382467; c=relaxed/simple;
	bh=a5crjG6Jddq5TLGHeq1dA3OJ6KtrrV01yt8198+rP3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvs8W5BPNzv0J+U80PYHCCGW1RYTMIL0qDdx6I+taVzRfdU2/aR0cak7oqmuDxjad8Fdi6OP3XdiwETMPxWhw8+CSj+LhLLpu31j8ee9MWtshCDr30We1CD7lY+fgCSaZkAvBNekUb5IPAewWuWY3EEz0Az0eDui3xPJ/JIGKTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCXp6CO/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCXp6CO/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c423d496abso1356973a12.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382463; x=1726987263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCKQznBlAnQUXLCvKwjvLEzsYMysS1pH5alHdQhZ4ts=;
        b=KCXp6CO/bjTV/mDz0MZxV2TFldHhIGWRhr+5Qn28Kb2p9QpEdjAkoHFOG4qw30p4Kd
         6MbOOc+E2keg2x8tnEQDxNu/snWKjFcGT32/+dAGfWashzSc7AVYvZUe4KKCFlzyUMw7
         IrOe014edM48koECBe3qq1TwjCiCXtowlv3sNyvlXCcoyqS6yA3N4CHHbdK2bYcF92LE
         xUah0CCIm4pXxuXnWw+rw2dRzBtSUAgKUcEzQqxa9Ef+E7j5APnGWNnrfnafttVAp2sK
         tF522SSCWGuzEbZiKpnhRaIKSzcubcWr7YGMTp2rVF13tZw5NvuSLgSa8YrGb0r3zfmc
         iUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382463; x=1726987263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCKQznBlAnQUXLCvKwjvLEzsYMysS1pH5alHdQhZ4ts=;
        b=KesWiqJl2pKZuSYwym1+ZvF/KE+zQEpzpMcAdZJWI/bYG/Y4D3qm9O/0wi5qmfMc9A
         aoRLbCPWyQoRfMJHuTZdwZV7g7BhIy1T1J8w5qSJ7M72iFfcQytsUGygRHdgvAYA+02c
         co5bKzRHV2YDWQwkvRkTSW1A4retTPIoNdLiyOM3DzGowcYJxBn9CxOXICllh1Bf3omv
         lgu1W3Xi3dlqu1u9cDpwLrA4nieUn2tMLYT44PoFsFwU/mYFdK4gf11x7A/x+0U7ixnU
         Lm7zxWg9lzy3OfSHGniRuStubir3P4NDOeGvsD0LBp5+FQWfu4NJ7sLly7hfj3bDqkRU
         MfiA==
X-Forwarded-Encrypted: i=1; AJvYcCUoBw5nBZlPcBuw0LeMx/iLPPmL6Nym2kFOXdyEJfdSyeiL0+092GYo6UAgQljcRql66nNrY8QnqFDKAQAj@lists.linux.dev
X-Gm-Message-State: AOJu0YyxaTpgbhHmhcwPp0IzarOzH13xemoKSxy7VV+UiqlEGH2ffWHH
	KB9sl8ck9gsbMQnjSEU+1JbLROTCUss3eEUBNS4907TaGpdZyQ1b
X-Google-Smtp-Source: AGHT+IH3Qo3qoVwhy6W6PMQl3cATDFIfgQ+BNIpVB4bG98+aLYnxMKvbrqDUl6pSFw5dnIXDX+YVaw==
X-Received: by 2002:a05:6402:3596:b0:5c4:2e8e:782f with SMTP id 4fb4d7f45d1cf-5c42e8e99f6mr6524506a12.17.1726382463481;
        Sat, 14 Sep 2024 23:41:03 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:03 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 10/17] staging: rtl8723bs: Remove unused function Hal_BT_EfusePowerSwitch
Date: Sun, 15 Sep 2024 08:38:24 +0200
Message-ID: <2768736f969eaf935df1492ffd5afd98b05db11e.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function Hal_BT_EfusePowerSwitch and belonging unused
function pointer in struct hal_ops BTEfusePowerSwitch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 40 -------------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 2 files changed, 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ea0a9849d28b..4c6d9f1fa895 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -604,45 +604,6 @@ static void Hal_GetEfuseDefinition(
 #define EFUSE_ACCESS_ON_8723			0x69	/*  For RTL8723 only. */
 #define REG_EFUSE_ACCESS_8723			0x00CF	/*  Efuse access protection for RTL8723 */
 
-/*  */
-static void Hal_BT_EfusePowerSwitch(
-	struct adapter *padapter, u8 bWrite, u8 PwrState
-)
-{
-	u8 tempval;
-	if (PwrState) {
-		/*  enable BT power cut */
-		/*  0x6A[14] = 1 */
-		tempval = rtw_read8(padapter, 0x6B);
-		tempval |= BIT(6);
-		rtw_write8(padapter, 0x6B, tempval);
-
-		/*  Attention!! Between 0x6A[14] and 0x6A[15] setting need 100us delay */
-		/*  So don't write 0x6A[14]= 1 and 0x6A[15]= 0 together! */
-		msleep(1);
-		/*  disable BT output isolation */
-		/*  0x6A[15] = 0 */
-		tempval = rtw_read8(padapter, 0x6B);
-		tempval &= ~BIT(7);
-		rtw_write8(padapter, 0x6B, tempval);
-	} else {
-		/*  enable BT output isolation */
-		/*  0x6A[15] = 1 */
-		tempval = rtw_read8(padapter, 0x6B);
-		tempval |= BIT(7);
-		rtw_write8(padapter, 0x6B, tempval);
-
-		/*  Attention!! Between 0x6A[14] and 0x6A[15] setting need 100us delay */
-		/*  So don't write 0x6A[14]= 1 and 0x6A[15]= 0 together! */
-
-		/*  disable BT power cut */
-		/*  0x6A[14] = 1 */
-		tempval = rtw_read8(padapter, 0x6B);
-		tempval &= ~BIT(6);
-		rtw_write8(padapter, 0x6B, tempval);
-	}
-
-}
 static void Hal_EfusePowerSwitch(
 	struct adapter *padapter, u8 bWrite, u8 PwrState
 )
@@ -1906,7 +1867,6 @@ void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->write_rfreg = &PHY_SetRFReg_8723B;
 
 	/*  Efuse related function */
-	pHalFunc->BTEfusePowerSwitch = &Hal_BT_EfusePowerSwitch;
 	pHalFunc->EfusePowerSwitch = &Hal_EfusePowerSwitch;
 	pHalFunc->ReadEFuse = &Hal_ReadEFuse;
 	pHalFunc->EFUSEGetEfuseDefinition = &Hal_GetEfuseDefinition;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index be52288a2f1a..d41f458d117e 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -230,7 +230,6 @@ struct hal_ops {
 	void (*write_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask, u32 Data);
 
 	void (*EfusePowerSwitch)(struct adapter *padapter, u8 bWrite, u8 PwrState);
-	void (*BTEfusePowerSwitch)(struct adapter *padapter, u8 bWrite, u8 PwrState);
 	void (*ReadEFuse)(struct adapter *padapter, u8 efuseType, u16 _offset, u16 _size_byte, u8 *pbuf, bool bPseudoTest);
 	void (*EFUSEGetEfuseDefinition)(struct adapter *padapter, u8 efuseType, u8 type, void *pOut, bool bPseudoTest);
 	u16 (*EfuseGetCurrentSize)(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
-- 
2.43.0

