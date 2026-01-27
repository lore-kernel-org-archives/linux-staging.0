Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74A72676F4
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476906; cv=none; b=ksGLm0WyAj81xdpOkCOs0/hJillLnk+3m8qYtjrCn6R5VrFN8t7lnlOSfIvO7v0IyjlvU76dIbiIoPngrV7ELOF51f4V06eTQ/JtxhC5o3NgPK/amFV60flemok+s78nbQ7iPe08d4pzFaD/uFqs6VMfKqPpzfyHzLIrv+ls+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476906; c=relaxed/simple;
	bh=CZh1oms4tg823p3NL4KsoOiSLw0+DBB0AA+QBlYpKA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hM/BbvTtkb6WoqTtB42sjuHS/xhic55+Roy0R/u1K/uZxhsF7dV4bqUGBd6ZQv/oslvVb2HjkvmOVOdZU4AibaJ/IxkHjawJ41e321dDCsZdvo4t9O4uNdap4eYgbZRj8pfLthNV5bRFzcbuCHQOJsUTzrm5eQcMoLhFJDW142U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1XMWrLL; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1XMWrLL"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79274e0e56bso50749187b3.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476904; x=1770081704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ax/DtX3U52L5ilLrJLGZXgOPJbqXoiOd58E0Q9dODg=;
        b=D1XMWrLL3PNDdlyyxUPINkPJ6CKgLDOVKBnilX/Rmr0YRrP7Iwyyo42PmoNvmvQgVD
         yjjJO2CezCaneUAkW4+IYxA+TVVifl0eT0TvFu4fUQG/uVZeTn2E5ftSlQh/IuMNnUZp
         qDxOypL67KvmjcBBb+6ICy5eInwkCeTWJK+uqrq2iMHW/ksChU2GAcPuQbCBXwcZSS43
         JVEO4mbdB/8R+y82Rv22lrNUy3YlL4haMUOZymd0UYRClzSpgaseeAYxodJGWhl72GQd
         8UpLAWVDJOqLewP0NwLKobF72juEwBaFybCgbd9czp3mgSKj8U3MKHn36u6phyk9PV28
         +owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476904; x=1770081704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Ax/DtX3U52L5ilLrJLGZXgOPJbqXoiOd58E0Q9dODg=;
        b=QdJXimtxcG/5R5vDxfsox//IKKHh+RSVKMkhwuHMHbZ6kWu2mjMsoy29QgHB84jqBX
         xA8aOHuIi/ldf1jXg8/J98tmdUUOz8AsjzX4EvGxhoZYFawsPQeY0J+kMBcIxcAlq2bz
         YCanFJBZWMHIofrLMxXiRwyzxvRqVQgxVrFbqTriXXsHaQ/SpyQBD595RFzvxpSPeZzG
         p7EmK25mzDoaXadZT2TwfBM4tNBeCSIXQgeKbCho8STx/onFmUx/jVFS/NTtGwDIUEgT
         ZpaZLZbUjLMsmkKqMEOWxvIzM4te/bDKEQ/4K+6zo+TudoiQ3KEE7kVPPpNugFTv0a/G
         zr7w==
X-Forwarded-Encrypted: i=1; AJvYcCVc75f5NKicmROqU3X7V0/vgo+S+FCJw+XxCkpjzjpVdvVkwcyRBjthDdLE8K3GR9o+A/wzT0eZxmiT5znS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8spuIzFXVhh0vylFXkAATmeiJFjQfp/kH87YOY/VM0Uwu4wDL
	md0T1fL8EzYtMdFUw4S8uj3TGfdb8+tSibN8sMpKoJn0cMTIgQfOH5Gf
X-Gm-Gg: AZuq6aLS/DxV4VWINSJXoPmgzniyePs8sa9xKjRm1VGV6d6hoM8SuxI3BQwsApIFT+E
	Hewpa7hNLDmEabBl2KPZmFGoJf/ILu1F4gQBZaRo2dFn1bo6N8UJ/lvnERwKVEYWdQEF2x+nw0I
	iADpeIO84aD31EYninlyf7DWQKyYd09TR/FChAHHeOZ3mxoFxzOjRFPg62hluDeHGC2dYNYL6cG
	MbLeqDF/03jo6/iyoBpUWiJlyHRpPgd5iCi6XcftlprB9+IguGu1/usaJUDFKMjow619oiJV3mw
	/DVUrw3Mxw6+higsggEJrQ7xWKml8TZ/kMyE34nJLf5GLLBU6AwM4ElWz82h5TT+boM5ONQtMzB
	NG4w/Uw4i4fpwyez+uZgDcV828H8avtJm3taAiOJWUsSP1CvHM2fktwO67e1GmCNy7uY=
X-Received: by 2002:a05:690c:30e:b0:794:6fa2:a00e with SMTP id 00721157ae682-7946fa2a97fmr21541537b3.60.1769476903921;
        Mon, 26 Jan 2026 17:21:43 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:43 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 5/8] staging: rtl8723bs: remove unused variable TxBBSwing_2G
Date: Mon, 26 Jan 2026 19:21:15 -0600
Message-ID: <20260127012118.43037-6-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127012118.43037-1-ethantidmore06@gmail.com>
References: <20260127012118.43037-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable TxBBSwing_2G is initialized but never read or used
anywhere in the driver. Remove it to clean up dead code and fix
a CamelCase warning.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 3557d7365585..cbbdf45012c4 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -160,7 +160,6 @@ struct registry_priv {
 	u8 reg_enable_tx_power_by_rate;
 	u8 reg_power_base;
 	u8 reg_pwr_tbl_sel;
-	s8	TxBBSwing_2G;
 	u8 AmplifierType_2G;
 	u8 bEn_RFE;
 	u8 RFE_Type;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 02e01f0f0bf4..f4b2be4296c9 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -263,7 +263,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->reg_enable_tx_power_by_rate = (u8)rtw_tx_pwr_by_rate;
 
 	registry_par->reg_power_base = 14;
-	registry_par->TxBBSwing_2G = 0xFF;
 	registry_par->bEn_RFE = 1;
 	registry_par->RFE_Type = 64;
 
-- 
2.52.0

