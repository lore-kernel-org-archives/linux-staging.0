Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDADE38E5FE
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314472; cv=none; b=Sjb9x+BwrzPs+0mPfmBRiedGM8awQyRNxxWnGEujCrze9UpU/bib71NyQGFHVU5Dym8r3dchWWJYY0y4Iezz4w1xwZFrStjmE8zOOC6dJ9qMzw5OZO+TCY+UjoccguzWgEqZQEsEVBcX8HzgPB/jN4g8Ag8MX+H/R/a56oz832A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314472; c=relaxed/simple;
	bh=+32ciUSyVsmJquRGsSLXJgBHcboGpLaXsvx11HRBRF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dH0opbkOBYsrxUIrmSEFwCjtjSfDqhSR2fJQMz/5QT/YkaDXQiflO77ygPr6z2Lrac9zN9wjwTyunX5hOdMaFIGTVo9p9iv7SOLqw8L5FNCdBrhM4LR9VjxPg+oGjTAM875EgiaM51XryOQmmZpO6hle4a0gt7IRTfvqozWiIE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjEiXsra; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjEiXsra"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so14800892a12.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314469; x=1784919269; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5T2ChN9OdEEU8NHaymn59c803dUQieRuxn92k4f3Hxw=;
        b=GjEiXsraXJy/Pn8XZbTEJK6wVajTOAOX91JuPON9DQ/drPRqm+pYFOGxw1lBpAApFD
         L9/QMqd+JZ7ufhHTzRQoRm6WDXP6R7KdU+1YAvu66PG7in+FBVnVpGVrEpQ4C8wXlTmi
         8tGq+VqoSrzXFk5jd+oKbC2Zf0dziaAjXILnsNokLmuKy06GUXwdRrdc+vDHUaUDHVmR
         WgYvOZooR0qVoS3vklE0E0FNs5cBgOSMnj94CWuTd+x9YEmwzdMYZkrKRFhGpoNnNbr7
         op/py+LsbCGV56YOcTsMVnpNSr6nrvFHvcRvDb4gcQXx58T2gMNDyeJJlIx119dyL/bk
         ICCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314469; x=1784919269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5T2ChN9OdEEU8NHaymn59c803dUQieRuxn92k4f3Hxw=;
        b=ZdtYspntH01OMenzf/DCw0Tk/l0JqhPtn1hp0f9+bRmymDUGGPYznY2mgZqkXteV45
         vxVfHoOOyQIMAwLsseZG+gvIpd4qDgj0++yRbPaW5q7SksAbDEh8BLqxZuZFekSLQ/nB
         /bebn+0SkVLrGM0h4mUEzilAyulVUKKubd3GHlIl3OCWV65T4UeBCfTwHyt+ZqwWykfm
         7oiaYHL8ul574fJ4z1to7IfVP3qXwBfWnLpXfqHJjSAlqZgv5ScEZJjTaHqDdRSr2rIv
         QyLlQSvtXSfNuDp1ieejzvJ4lWrTWOWXVJETM5jUenP6tNHJDgfTBVrw8rHsDljQXogf
         ad8A==
X-Gm-Message-State: AOJu0YyQzaxypdvqePqcx583xFs3n2AUYtHEDVE4kjGp4XaNJlP6e8LL
	K/h4u3aPJMKwwSJ+vXLg5qKo0Pl8W8yt4MB18pyocYoFsOdB005G9BFY
X-Gm-Gg: AfdE7cmb0ZEFHdsl0waP1TyC/iN3Z6gJxmVENDIGnSZfAqsPkv9tL7JVqoMkKgMiahm
	pF3JPrEzrVi/wVGXSN3LH+YYeGIJmYh0AuUNUAnAz9NfJAzbGeWPrSjfg0PEcvVFFqrWisQl2qN
	bVcrPGm5aaJoVDbDGpWy3svSlzqZUzbFakTYnrI2XijHZLf0INZesuXc5fy9IqzvmlI1alF8e2N
	nxMfI/PlxrarvFVNMYAHHFSGQ9ROzpYMgl3f+J8qeeB6SA697bR6rfPNjw0v63iS6Aq5Ne2lsDt
	dVi3MJFYjONb7VEqiPhlFeVD9uhsEozFnV+YK1cZNpGFDpuARbGlf6HU+Q6wCC2G593LjyJQETx
	Ru/sGrL1iDmXUDE1g3z1Hug6VGGYVNgWKHbtoD4AJReNH/ZPw3lXdm+QIrnDONk+7PjN06AmlGs
	Du
X-Received: by 2002:a17:906:ef03:b0:c16:c65:56b5 with SMTP id a640c23a62f3a-c16b46e5059mr192400566b.24.1784314468860;
        Fri, 17 Jul 2026 11:54:28 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:28 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 6/9] staging: rtl8723bs: remove unused 'UsbRxHighSpeedMode' from hal_com_data
Date: Fri, 17 Jul 2026 21:52:05 +0300
Message-ID: <20260717185407.56513-7-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717185407.56513-1-nikolayof23@gmail.com>
References: <20260717185407.56513-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value 'false' is written to this field but is not used.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 5 -----
 drivers/staging/rtl8723bs/include/hal_data.h | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index a08f7c78a921..e11d0add8c02 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -478,15 +478,10 @@ static void sdio_AggSettingRxUpdate(struct adapter *padapter)
 
 static void _initSdioAggregationSetting(struct adapter *padapter)
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
 
 	sdio_AggSettingRxUpdate(padapter);
-
-	/*  201/12/10 MH Add for USB agg mode dynamic switch. */
-	pHalData->UsbRxHighSpeedMode = false;
 }
 
 static void _InitOperationMode(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 6d9421cd0312..8ec45ba0dd34 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -244,9 +244,6 @@ struct hal_com_data {
 	u8 OutEpQueueSel;
 	u8 OutEpNumber;
 
-	/*  2010/12/10 MH Add for USB aggregation mode dynamic scheme. */
-	bool		UsbRxHighSpeedMode;
-
 	/*  Auto FSM to Turn On, include clock, isolation, power control for MAC only */
 	u8 bMacPwrCtrlOn;
 
-- 
2.55.0

