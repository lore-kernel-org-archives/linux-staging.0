Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41159519938
	for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687258; cv=none; b=cc99xeoogLUARXGWMNH6zdLydIGJDrCWKzTM60Blw8MjXSsDKAHO1Ww1nggv8fl7NBlNIzJ6eiVPT5veA+i2A+HfqXWVBoCBKfpaoEcvUVgFpa/r3BcoqxrRSjANqf5DbMccm6amB4AKzNmK9UoyPjyqUK/7fBPWk8+HnGJ9fhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687258; c=relaxed/simple;
	bh=OdfK6zPQifeqrDI7Dk172xxCzy7BT3/xi+HCCHXocTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aWYTB5sFGmqQuEczuPhYrgX5VazFK/57cx+9kjU3f7Ldyku+qVqM/geuUFXgamu6F9QAnVaAeAL5CH5m9yOJ1saPEsr0PQk9/fpHBSD4YAvQIBveZHsFFAi6zkgugUIMneqI1BPGnS1OsoSG3nuGLuGWeQVAUtI1wi67LyWaD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drejHuJo; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drejHuJo"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-49b0dd21eb8so9655735e9.0
        for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687254; x=1791292054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6HCpdBVY9gbUFJh3MVkCjOH6d5f1ORSf0MCQzzTdUQ=;
        b=drejHuJo36EbZLdsp4JNwKRQ2EYTepo/BUIdAe968tjEsbnIplMfNTIcBXVySB5tE4
         0BKMI9SC3MQMZjZ0K7w/OWpNfWctRywBxnbvLechHws6L5RbCTYqSL4J82c7VOe1LyXT
         MGGJZU9cfQkTX625ZmLIOORNj5eni2YPPoSKfRq1eogZRdvclVHqqOquVie3hKpFxTcZ
         bEQ7K34fGsj7xYGyfVLrTHzRyUF6XPdcMoxqLQszmmMHz0Gvz5iQRBU/b41Y+ZB6y/vI
         iws8KmhQ2uHzdSKvLgFItnkTPDR8Yuwc1zZ+p8UTxc3GnFb0RheflW6x1ySJMRmtZn/t
         AbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687254; x=1791292054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6HCpdBVY9gbUFJh3MVkCjOH6d5f1ORSf0MCQzzTdUQ=;
        b=uSVPXMR4fnoFQVql0tNfey/hpRW4jDUJqHayB9Zy5YBEcNofHaWKvhfyK6kd3zUMfh
         1EGqmsEtA0uLRbtVl+pX8dhIodBqrxQPzwTiVy49JqbZaX9WyoOV5eVsWxOCdRlO0uuA
         5niqM9gSaUI2Ki/WXt+gC/Rv5ZNJ+3nhkK5sR6ml+0dHMZ/w6e+oUnVHpmPErpYlVZ4J
         CDP7ld300fs7m0ji4heNUxlOYCYomowUhbXT4Adt2rPK8kyH3p14U4evbNBUGQ4VUCDu
         /VAUMZahk6oWpGxaUb8WCtis07XygdTC78/HfPlRf/PGMtsqV3CauoSnFdQa7HCfPmAb
         AsWg==
X-Gm-Message-State: AFuF++lp8RjKGRyOqmO9DqP5BKv9eugOA9tUqWtLGaqeeR4kXu6IF/8m
	0mBKX31jP+mIqg9WXy94llvvMh3S4Vx0KeVQL0cTf/b1zEy1EhM9csM+4Ex5t3nVgQ7fNZSvufg
	=
X-Gm-Gg: AYBFou3Uy5UzYe/18xnjWzAZVHFraNjA1+iYtiaB277TY1sdY64nv7TeEXNWDhZx/Vh
	RRH4R7MAqrtvzRrWyteiIUoyrS3iSls3lHWyRCQMMBhe4RRnaoTpK0ENbSTgSt4BlaRZO7Zs149
	/q08sTmhTe3ldgrtKg/WTgxuyk8b/RJ7GNA4BbwhMpvm7Y2eo79XlxlfueXH98e1uuUQNn8u3x0
	UTd1Gl+e0afxquOKh65wjzT6GXyAoDhZBKPhoAXdgNNDQI/89iNcvxUQHsWCUHnHpcIYECmIzJ8
	1LuL1ah2JKWQg1M9cdc84cYFC3ARIDJz3s29fHgwcgQJn+2G/QW1IfPlBf8eQgo0sPrSocjlWhD
	9XUIjSzNCkgwzaBWIibIOpDdwwCXG81n0RN9kJvbzhe7BoRfMZaQ7m3FmAb0zBt/a+zF9WrDfCS
	oMiJo2VRfE3Ux4R8gbsGeShkasBFTSuLZzT7a+daj2CbfmS0Z4xJGrZ67ihQ==
X-Received: by 2002:a05:600c:a15:b0:49e:7c7e:274c with SMTP id 5b1f17b1804b1-49ff06bdedamr225747385e9.14.1790687253920;
        Tue, 29 Sep 2026 06:07:33 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013d2d048sm1584475e9.3.2026.09.29.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:07:33 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH] staging: rtl8723bs : remove dead commented-out 8192e code
Date: Tue, 29 Sep 2026 15:07:16 +0200
Message-ID: <20260929130716.61119-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8723bs_hal_init.c file contains a commented-out
call to rtw_write(8) referencing REG_DWBCN1_CTRL_8192E.

A grep of the driver in the rtl8723bs codebase shows that
REG_DWBCN1_CTRL_8192E isn't defined anywhere else,
meaning it could never be uncommented without breaking the build.
Remove it to clean up the driver.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6a4a13544ca1..748567059af8 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1903,7 +1903,6 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 			rtw_write8(padapter, REG_BCN_CTRL, (DIS_TSF_UDT|EN_BCN_FUNCTION|EN_TXBCN_RPT|DIS_BCNQ_SUB));
 
 			/* SW_BCN_SEL - Port0 */
-			/* rtw_write8(Adapter, REG_DWBCN1_CTRL_8192E+2, rtw_read8(Adapter, REG_DWBCN1_CTRL_8192E+2) & ~BIT4); */
 			rtw_hal_set_hwreg(padapter, HW_VAR_DL_BCN_SEL, NULL);
 
 			/*  select BCN on port 0 */
-- 
2.55.0

