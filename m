Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093441C5F11
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771672225; cv=none; b=QFJfehqlyfd/TR0qiogZo9gAwNwE+gDzsj9StOO8D2lPUY/OgCtM+Kg2KWlxaFa/zKgmezonXHSCIy4x8uKnPxRxmcc4ZF6HaoD/wFe+BeDadHRRyDTlQO8fHnBrqgWy7TsMm4wTk0MMmOjk8TBO+jk9TwZX27r8XEu8C4Av0Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771672225; c=relaxed/simple;
	bh=MWP2QOFDiZgZXNosWoSyAyiM32mlu2BwvP/EWRp2a6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGn62xLzdb7Pnxjg7NU9HQK6Dqct0ewz+C4yfcMe4jhk2FK5evOFVt3+nYMwncd7HflwONXGA1jHNJbqRAj7Ah6U9BMmeM22QCyA4kB8KTXLLQAgEKpLf07GRYl+7NzdYX/14gbd+68TN797PmXRn0n+tBnw3mScsA9qYyxxtRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlmsH8LE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlmsH8LE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359a302794so2167364f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 03:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771672221; x=1772277021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz4q9gcZsmnhpfIXH3jPqSCThwQEpICUB9rrjc6xkL8=;
        b=BlmsH8LEKWxDaChU4cuaxgKGJnhcAfWBw2ztLVieMTjVS+wT8GRhD6SpLSLMH/ogG7
         qldpIkt0Oo9kI7TfGdLdsCflswvh17ynAdiS/Rie2fYcFIbfSxL+/1Yy8dD63WoZbC+E
         psI3nR9EC3Xw6j3f4FgPSPIVr7WF6VaIfu5fX6gAwhu12W0IxW+NGaQXQRJIQ4XHRpEZ
         g11Prd75QpSayKsJ6Qbyl1kXnR5RNIuuwofBzJbficsJMk79YEAPkltikmRlbCS140+N
         8zRiPzYDx1Bilf6RS0/up9rGvfM02fPee4YtMFos4ekugLyaBmvaZt+ohcFxNGP8AatS
         0nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771672221; x=1772277021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dz4q9gcZsmnhpfIXH3jPqSCThwQEpICUB9rrjc6xkL8=;
        b=s2dH1mAk98D0x7Mh0Bt85fpxq2+75nkL5SbAlVm1vmNDwaZj1PgIj+J/rHhtJWrMmK
         P9cjVhVEbG2qcn/05E6mn9cl9jkQeoMrj8dQSTksjCosgl4zwPUY3NS9pnfCbnfLwpGd
         WT2v8V8GntrEcYmi+zCZpYziKiUnjfaxMVF1czrAc2w3frvE98uqhAO95mvwuimL71Y5
         el9D5mgeTWenIkpOWuiHLan45c6TaISYJbCXAeZO65XcqqihxxGIT0AqWJxyI5qu0Uyw
         CVQAG1mqW5IQiPLXb+BoNGz8wx4ECVcDnHGIru3LSGL/AYb/x2Bo6HRboykW00llg418
         m3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUYb02Sub0vsP0nmFPSxje95AQ54FF2+Dv2U71ohwzHb1V33scwEx4E3iSqsjC9FDiZiLmcibRon9BRbnFO@lists.linux.dev
X-Gm-Message-State: AOJu0YxsOU6A+IUqUDe5kWf+dBeQerKSu3GUG6eguX8wP3PV0KWlqOSn
	pq7BjvdR+SL2WhTIcTCKYPMmhHTLhaY9D7GU6fZVvkDgIU9/e9lNPgrQ
X-Gm-Gg: AZuq6aI3v+fN40llFISW7nXuV5ooIcQNL7eQvdhr+k/L114GjZqwMoNonwxDwq394nx
	5otsbWJE7zm7Z6zqpIoGYVVHTT3SSyi1ledKnxaIcIe156eM7b/soD+XZ0wZ2pQaU4CYBd1b1H2
	gW9CqEVMfRS95TU/VE5c3Ya1p79TQgalDbtEdDNlSubMZ2sgP/+Kb93CPqSDvt2gT7+r5+neyJQ
	Z7HGeNW32BCACuwdDIH/zfqeoFsDugLnMXxkJS6erU6f6H//oHkGZknX5/jqHIxhHCWNkO8MWkz
	d9LwQcox5K9bkJJVoo7+KpP/qkLL5BIi05l03O2isFvmI7ItdbzrnG8wfzU0sPAQxI79G0G10qG
	nVQw5fygCvALcBvEk1MDKU0qxuODnSsm7mlxGgw8HxTMMNH1Uyy9D4S5/9PWx7ew1b0XBVPchmd
	UOCKAdCn3mzerOgFl9V6EXRdnHjulqiIboJWyw60AV0hclvbKyNew4
X-Received: by 2002:a05:6000:4381:b0:437:8ff8:fea3 with SMTP id ffacd0b85a97d-4396f16897amr5315309f8f.21.1771672221265;
        Sat, 21 Feb 2026 03:10:21 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54a68sm4998499f8f.39.2026.02.21.03.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 03:10:20 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Replace kzalloc with kzalloc_obj
Date: Sat, 21 Feb 2026 16:10:02 +0500
Message-ID: <20260221111003.11339-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANhxO_hHUBi+Cs_mq7x0h-RVLdmujX1aDzatfap_9ExP1LCcPw@mail.gmail.com>
References: <CANhxO_hHUBi+Cs_mq7x0h-RVLdmujX1aDzatfap_9ExP1LCcPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kzalloc() using sizeof(*ptr) with kzalloc_obj()
to fix respective checkpatch warnings.

Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 22dc36e8e38a..1bc90fa48d36 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1875,13 +1875,13 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	struct	cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int		res = _SUCCESS;
 
-	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
+	pcmd = kzalloc_obj(*pcmd, GFP_KERNEL);
 	if (!pcmd) {
 		res = _FAIL;  /* try again */
 		goto exit;
 	}
 
-	psetauthparm = kzalloc(sizeof(*psetauthparm), GFP_KERNEL);
+	psetauthparm = kzalloc_obj(*psetauthparm, GFP_KERNEL);
 	if (!psetauthparm) {
 		kfree(pcmd);
 		res = _FAIL;
@@ -1912,7 +1912,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	struct cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int	res = _SUCCESS;
 
-	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_KERNEL);
+	psetkeyparm = kzalloc_obj(*psetkeyparm, GFP_KERNEL);
 	if (!psetkeyparm) {
 		res = _FAIL;
 		goto exit;
@@ -1954,7 +1954,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	}
 
 	if (enqueue) {
-		pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
+		pcmd = kzalloc_obj(*pcmd, GFP_KERNEL);
 		if (!pcmd) {
 			kfree(psetkeyparm);
 			res = _FAIL;  /* try again */
-- 
2.43.0

