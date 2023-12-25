Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4BD54279
	for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="f0FfYHS+"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d422c9f894so19857285ad.3
        for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 12:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703535803; x=1704140603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YY8Yj/DU7Ru4GTNDSXSvBwYAcH02TIn/sHGmgQuRGjQ=;
        b=f0FfYHS+A1zU6KLmAKYWVBT5GrPRrU/h+zvgrsjEGiLl4HjYJdJTGiyC9zr6UztH+T
         CY0RNwZ+pb81QHgW2PWY/wbmF2KTvqYVpAYpAASEQlKEFFWDewAi/faIZJhaz0MF30rf
         G1guKB0jcrSe0incHYdC8hO/cCvumuOCHUYHvYmy3nH20EsUTeLYKdFJOtX9oGR53TDl
         vUjmB/vHLtl+oB9DcvGliZa15gw/4cU7fWVLjH+YP5tqmbIc7Ph410RdOBsZtliG5LYA
         hj4Ph4WlF+UoUgtAcl/kkC4bZZtkmX8TOj98FckU9v/zbyIZPD1EO41uApEEjjml2K7a
         00mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703535803; x=1704140603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YY8Yj/DU7Ru4GTNDSXSvBwYAcH02TIn/sHGmgQuRGjQ=;
        b=Yl071+wJY8+c3APJrH0O++LrTFQRwpsmAmKApcZGSPnNoFBqiaKc4RVywVlF65Y1K5
         VRt1n7D9V6hmbi60YPkj1c8OQJmKbS5/Y3FYLaVm2SLlKJCL+XlhZYRcrFBWmmshcv0w
         TOhbW1xxE4clULqqmj0e//hPky1LJyxMvVfVSxiaNaQ5/6YUKL4IhsVq0X3YQQCuu79K
         vIN5sq2Fa7DLdIfMxo+mnbX189pFT4VOXWVX7uDnGLqid+1RIgGQ2UZWSexr9mluHKUP
         Y7+OsnTRTbQOtkoaQ+4gAiewiCyQ/vHTXnQfQ5cPDUF2KAP8HnMZish5G+TuJhNDChn4
         bCdA==
X-Gm-Message-State: AOJu0YzLDbzXeWR+zMBtYQP4VrDxi1yzBgCad25U2k/fEJJqlYvH1rUi
	6Z7VpTRdsAd/9dPx6nGBT48KHU4wO9AqnA==
X-Google-Smtp-Source: AGHT+IGxHy/lP2tgU3DLHGT71bu/t8Q4GMnCMpTPBHGajLrEVlge7LrR8vjYqJuBYy2IMgfQz9JHkg==
X-Received: by 2002:a17:902:680b:b0:1d4:638f:3ff6 with SMTP id h11-20020a170902680b00b001d4638f3ff6mr945916plk.66.1703535803407;
        Mon, 25 Dec 2023 12:23:23 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id l17-20020a17090aaa9100b0028be5732f01sm8741246pjq.0.2023.12.25.12.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 12:23:22 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 6/6] Staging: rtl8192e: Rename variable OpMode
Date: Mon, 25 Dec 2023 12:23:14 -0800
Message-Id: <20231225202314.31869-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225202314.31869-1-tdavies@darkphysics.net>
References: <20231225202314.31869-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable OpMode to op_mode to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 10 +++++-----
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index ed0c152c2477..c7a2eae2fdb9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -51,12 +51,12 @@ void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val)
 
 	case HW_VAR_MEDIA_STATUS:
 	{
-		enum rt_op_mode OpMode = *((enum rt_op_mode *)(val));
+		enum rt_op_mode op_mode = *((enum rt_op_mode *)(val));
 		u8 btMsr = rtl92e_readb(dev, MSR);
 
 		btMsr &= 0xfc;
 
-		switch (OpMode) {
+		switch (op_mode) {
 		case RT_OP_MODE_INFRASTRUCTURE:
 			btMsr |= MSR_INFRA;
 			break;
@@ -1693,12 +1693,12 @@ void rtl92e_stop_adapter(struct net_device *dev, bool reset)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	int i;
-	u8	OpMode;
+	u8	op_mode;
 	u8	u1bTmp;
 	u32	ulRegRead;
 
-	OpMode = RT_OP_MODE_NO_LINK;
-	priv->rtllib->SetHwRegHandler(dev, HW_VAR_MEDIA_STATUS, &OpMode);
+	op_mode = RT_OP_MODE_NO_LINK;
+	priv->rtllib->SetHwRegHandler(dev, HW_VAR_MEDIA_STATUS, &op_mode);
 
 	if (!priv->rtllib->bSupportRemoteWakeUp) {
 		u1bTmp = 0x0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index df72504e9695..4ce80239b8b3 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1187,7 +1187,7 @@ struct rtllib_device {
 	unsigned long status;
 	u8	CntAfterLink;
 
-	enum rt_op_mode OpMode;
+	enum rt_op_mode op_mode;
 
 	/* The last AssocReq/Resp IEs */
 	u8 *assocreq_ies, *assocresp_ies;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 66816155ff36..80e323030f5f 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2245,7 +2245,7 @@ static void rtllib_MlmeDisassociateRequest(struct rtllib_device *rtllib,
 					   u8 *asSta, u8 asRsn)
 {
 	u8 i;
-	u8	OpMode;
+	u8	op_mode;
 
 	RemovePeerTS(rtllib, asSta);
 
@@ -2254,10 +2254,10 @@ static void rtllib_MlmeDisassociateRequest(struct rtllib_device *rtllib,
 
 		for (i = 0; i < 6; i++)
 			rtllib->current_network.bssid[i] = 0x22;
-		OpMode = RT_OP_MODE_NO_LINK;
-		rtllib->OpMode = RT_OP_MODE_NO_LINK;
+		op_mode = RT_OP_MODE_NO_LINK;
+		rtllib->op_mode = RT_OP_MODE_NO_LINK;
 		rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_MEDIA_STATUS,
-					(u8 *)(&OpMode));
+					(u8 *)(&op_mode));
 		rtllib_disassociate(rtllib);
 
 		rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_BSSID,
-- 
2.39.2

