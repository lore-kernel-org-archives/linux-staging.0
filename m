Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD6C35F5E3
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786215332; cv=none; b=Re8XTeQznePPCFY/ocEAHNKoT0SYVH5xge3mHc9H4qnjBP0fRqYqDdzVJZe06rEcpjkwZtzSeEpMhiK9BfzeFAElXG/SVhcElK8XX+BM9jb0UvAAqQ7Iy4yvm7IiE6HxRalrBfv+Lca6jCgnuEyO/FBJXZ0PLuZB0Ka7r5nhsj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786215332; c=relaxed/simple;
	bh=Z2x5cpiM96d9JG6+sbFlDid/yXXp2YFYUfRBxkBdmnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdtrzTURhdj/oITwfxvxWWYa0jGUreMrYRJwt2s9cyoGCB1UK011eWrcV88rpbSaHSwIhTVKdM051+PUc7C0fkn4pG21JYVU2xeBiYahFE4fmP2TJolOEbV+8372ONLVnW/g6JJsEdZ/EI6l3v4lUF7ZnfqtctWulLe5L727VV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpDgAizr; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpDgAizr"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39faa67fab8so3667941fa.2
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786215329; x=1786820129; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPXgSQMsgMm+ohmClOQsULhL9ndHBcO1vNa/mkUgZ/0=;
        b=HpDgAizrDE3H4q8U2nk/zVPQxbANKZuB3LB+Nfl8gk+D0OQLdl5ryCpKVkxD6sBG4b
         lYrRKb8oppmAq1SkEYC/lMsQCchg0S6tZ0Oa7t2TipGQgqFXzBGUu9w3aqjq9PRlOIAx
         urOA7V6Q3N++aJDo3f43dQB0Uqw60T03dPTZFz88r8UgMRWE6tu/eXkhCGQOmq5dOrgL
         LwRboIkn0vUcAVLBvfWH1GSuh6QN2V9owz+XCHyXiSpWXwzslA0nkMcLsM0RiYj0H5vy
         dTPDkosDKzn1TfbImAdsmyEyjKP4+Ju/iLn69F+Y00gRV0Pmy8nrBccaEuhvdJUsVPoN
         04kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786215329; x=1786820129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HPXgSQMsgMm+ohmClOQsULhL9ndHBcO1vNa/mkUgZ/0=;
        b=iBc44PBcSc4PlVekssMOh82Nr9BL92Flj1nY+Q7wHaS8ZeMtCw//nswLivUEuWB+6d
         xABvFMUMRXm9fJfAPuUMhsJ7vUFYIS9tDZtx/aQBRzVbO09qyPCb6MMZB7aFBfrA+8qU
         79rdBr26ZBtXdZwqhh97PsWGLpTU1qIrElMHqP5OiD5oJ/DSzjDmpuri2SF/T/7w09AP
         2J62jPrONHTp0CwppD9X2HY0AEf30kmee4jsvQUDSHRWfDQQ/knvPaGP0MkOWmbmGR9s
         sC/zSjHfdqRjx7gOoGfRcEG2si3hag8Rf9qAC0yhLNdVSs4pMU30x2kFEvL7F8slEpFq
         woug==
X-Forwarded-Encrypted: i=1; AHgh+Rqqzt2MnO+uXyqGqXTlvvLtpfU1FB+jIZrwaNpK5fdsYC+p8GnnaVbljXFWxbx7K9La127jm6mXIJjhIst0@lists.linux.dev
X-Gm-Message-State: AOJu0YxG5Bjg0y5MT/bGgIiJsISML6uQCMWl6UPNl//llkAyuKsV8QR/
	vMgC/Ce0NnypET9FdP1Q5LzBqGLVvcUtiY9HCDD2GkQRdxYo5gRsU/JfRZX1xA==
X-Gm-Gg: AR+sD130Vpu9Ztykzj9XK3EH67dDSq5aikYJzehpGPU0KnnLZYw6y6iJDUZ778BXPZH
	jGABQRYeb7WF01k7dXgu6iFy1WMT34vu089SZkbQ6KhAt/VrJ24Wjr7tWXuObOs6clXUeUt+zhf
	jvRtZRJCrmunkq4aCLHQId2296+vgVqql4QgV1tz9PpY9fPpkC8JPOJD/H5pOqjE4QIp+BgOg6c
	6bRv7GeJVB3iAgVCHQIshbrXHViweF4fL1/k7vk0YNgjXG4XHdw4iqMQ4oYa+ku0t/N555MT2kM
	oPiqOHHYuKPe7b151N7y8YvT3KK/bzNhzqkM8oGADosEmEHeGQq9ylUMzmhRrDEjQ+ayNk3IBQD
	WQd5NQA8+DB1YzRY3+dbB/RkcsSvGh3ggv0DmTtY8jgae76pw6hZ5QC+0kwXrYDqLP27KXYUHP4
	94+72ZUyK/vLsN+YHNzqP82IDFOFu6gaoiB7M+m3nf9bVzYEy+YTi1YBrPj/nuh1SQw9bHhEzBA
	i0P6isb
X-Received: by 2002:a2e:a99f:0:b0:39c:6630:d7c3 with SMTP id 38308e7fff4ca-39fbae28c5cmr34619361fa.8.1786215329129;
        Sat, 08 Aug 2026 11:55:29 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm11770001fa.9.2026.08.08.11.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 11:55:28 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Sat, 08 Aug 2026 21:55:17 +0300
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove unused 'pwrdown' from
 struct hal_com_data
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-rtl8723bs_efuse-v2-1-54488b13d554@gmail.com>
References: <20260808-rtl8723bs_efuse-v2-0-54488b13d554@gmail.com>
In-Reply-To: <20260808-rtl8723bs_efuse-v2-0-54488b13d554@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786215325; l=1805;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=Z2x5cpiM96d9JG6+sbFlDid/yXXp2YFYUfRBxkBdmnQ=;
 b=6Ekk3J79mWA7HI966wUbnFqX/wDZryawaOGylKXEHICAsfmT72XK3749sSBgNFHJ8Oouo1y5h
 KZbqjDMQZ9XD0lVMp3XJRzUtM7c2TgMvkTFDu/C6GniJvvZRK1ZYCd4
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

This field is used only in the HalDetectPwrDownMode() functions. Replace
it with a direct return of a boolean value.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 8 +-------
 drivers/staging/rtl8723bs/include/hal_data.h | 3 ---
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 57d2925642e7..b9a7b03e2586 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -544,18 +544,12 @@ static void _RfPowerSave(struct adapter *padapter)
 static bool HalDetectPwrDownMode(struct adapter *Adapter)
 {
 	u8 tmpvalue;
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
 
 	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
 
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
-	if (tmpvalue & BIT(4) && pwrctrlpriv->reg_pdnmode)
-		pHalData->pwrdown = true;
-	else
-		pHalData->pwrdown = false;
-
-	return pHalData->pwrdown;
+	return (tmpvalue & BIT(4)) && pwrctrlpriv->reg_pdnmode;
 }	/*  HalDetectPwrDownMode */
 
 u32 rtl8723bs_hal_init(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index f67ca496902a..57a18da67fc9 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -234,9 +234,6 @@ struct hal_com_data {
 
 	u8 u1ForcedIgiLb;			/*  forced IGI lower bound */
 
-	/*  2010/08/09 MH Add CU power down mode. */
-	bool		pwrdown;
-
 	u8 OutEpQueueSel;
 	u8 OutEpNumber;
 

-- 
2.55.0

