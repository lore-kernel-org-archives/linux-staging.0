Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE5213E81;
	Wed,  9 Apr 2025 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233469; cv=none; b=ibSwp/HQTvf/9XFI6tbvuSjK88G3vqYvwy7TW89pWtdOTujOykTFbDu8e+J6MX6Gg0LAwBzh7f0HDV8z/XAtN+UR0m/aYbjK3K6I4Kmt1KA+7AlqlMA+spJSXpRHaUb0xnpaLTuWOUXnIAY71vOIGPWskbe0/VQ/TgsbTZFILUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233469; c=relaxed/simple;
	bh=JVLsErMm1lbZgGTUGBXuZBa0TVE6alCzPguq9pnhM9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tt0vewtrz6LYEBAKEYS13QILexq9HSNbpeNAR7hSgEh/XSELjh8snks5pRpXkccm5CfxAd115uSAlseUsxtGFymNGzdvgIyiAx3GqrNQjzKXPcw4Klxc4+ucWWD1pg8WEKEaK3r13FHCneq2sUNBC/zeWfHFUnCRvLSs+vaJfp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDW7qdgy; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDW7qdgy"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso87959b3a.2;
        Wed, 09 Apr 2025 14:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744233466; x=1744838266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6pVlwzrEmx32p/oFLtQxJLU3h+GY6t/2EgH6uv7p6PI=;
        b=QDW7qdgyRRpf1PMMxCk8j7EqYbw0tVSG75lrug7tBr8iaYkNEmtcHCrNdzKhE0GK+p
         +VuOfi9LYHU12/A1xr2t+nYblOGca2gm/lXePxwAX9zYjmwo/VeFGRjwOT9Y/tCTpKL7
         BoAD6PLrnZ+JxnzVkQav+yzL7LkCS1+v739Tpns+lnW/5gV8SrIG4gIHjqoeb9tjZvcc
         qZ8LWecwk9uQoj+nedakKZ1pDoT3Ped0u0S7l6MtiGXQ1D3Trzku9qsUsNK6MYb9bfTW
         l7ZfbAZvSLyPGoQUrZKsgKwhWaIp/LJI2dMCLpFtViRRFH08WkuzlbjYsweTryYKYlF7
         CYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233466; x=1744838266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pVlwzrEmx32p/oFLtQxJLU3h+GY6t/2EgH6uv7p6PI=;
        b=SiILWyrHRnYgv1tul1PxCEu8LhoJFhdcXRMhl8JBTtrfvN0Kwa2R6P/ESs1nSjHixS
         gbSEYq2gyJnZQM/Hjl8ip9ahV0/A8vtbMGtQCiMx/q3OD1U8tUDs2kf3lGAxfqOdSnhP
         ISTe9hWuorXSBOfeJW+ZhTZgQSRR98OzdZNqOvDSMP806C1hZY0oQIbu6VNOgx6wPhJF
         NiMq1XmKvlMmnjcMK8Y6xLRlg28h7L88OY68m+us0/+FObXYrXX2GJ/W9lbq6M0IQHII
         8R9nl0SrX2+n72ZA2JrbYVrrgjnfEdeEzGXIO+7Jrri3i6+WEEv9trb8Pk7+66ZM0RiQ
         nEgw==
X-Forwarded-Encrypted: i=1; AJvYcCUjwwI9U/mA0z7YiFhcUGTJ5AzEfCAaUP0kRFAj5+ZCXn3g7iF9VEVeYhk4f1Wdx8293Gg=@lists.linux.dev, AJvYcCWqd6zJUujbhuxZIqgEGawC213J9zlISU2QFgb4q6gX0c/CroCjoLaIbBu86hPBfLUCkrJm7HRLjISDM577vQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoeYaJ2a9MBKmtYEo5lBN2mNtMBcEb/iD89xssNUKH/8LSS7yH
	gUNgUOEPQm/+Fps26nHRFKqdFYYuekNFT/wqBNLvc6nR2AYSmjGi
X-Gm-Gg: ASbGnct9KUgXVS5JNTxcIJY60kEH9f+mzlmYaRiQK8ugAtqAJKOR+N5UdGtTDVmEUbR
	ZnfhY93xG6nZhXCFjXMHwm2GSaK9W3p58vRKER4TVmsiwNZ0w7L/iKezfAc89338FwHeRcnT8FR
	UQz89QyrzZiPzaBL5bLnRqnVR8dCfNVsbuo8zJyyI3W1f9GQT6go05TxmyvQ1sOi8xKmT7+tmcz
	Iiy7DCylz8cClMjQcHXxyDGXoeMEAoCuptedcQYxQyq52IRz6Cf+oiemJuou9p23IhkPz972Vxf
	UKIEJBMLI0Tl/u8ZmIueNr3xKeLHIzoFOQU47UMlnykJSwKL6+qpCIfohv0=
X-Google-Smtp-Source: AGHT+IGmPmWoSu8tga2SfVkZJNouE0+nOCKOrGe4roKu39WWRmF9KPusYmzx3vw22zaprVmqFp/tNw==
X-Received: by 2002:a05:6a20:94c7:b0:1f3:3c5d:cd86 with SMTP id adf61e73a8af0-20169480cf3mr905809637.11.1744233466357;
        Wed, 09 Apr 2025 14:17:46 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.229.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3abffsm1475046a12.48.2025.04.09.14.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:45 -0700 (PDT)
From: Siddarth G <siddarthsgml@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Siddarth G <siddarthsgml@gmail.com>
Subject: [PATCH] staging/media/imx: fix null pointer dereference
Date: Thu, 10 Apr 2025 02:47:27 +0530
Message-ID: <20250409211727.62710-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cppcheck warnings:

drivers/staging/media/imx/imx-media-fim.c:79:6:
error: Null pointer dereference: fi [ctunullpointer]
  if (fi->denominator == 0) {

drivers/staging/media/imx/imx-media-csi.c:795:27:
note: Calling function imx_media_fim_set_stream, 2nd argument is null
  imx_media_fim_set_stream(priv->fim, NULL, false);

drivers/staging/media/imx/imx-media-fim.c:388:3:
note: Calling function update_fim_nominal, 2nd argument is null
  update_fim_nominal(fim, fi);

drivers/staging/media/imx/imx-media-fim.c:79:6:
note: Dereferencing argument fi that is null
  if (fi->denominator == 0) {

To fix the issue, add a check to validate that the 'fi' is not
null before accessing its members.

Signed-off-by: Siddarth G <siddarthsgml@gmail.com>
---
 drivers/staging/media/imx/imx-media-fim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..25f79d0f87b9 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
 static void update_fim_nominal(struct imx_media_fim *fim,
 			       const struct v4l2_fract *fi)
 {
+	if (!fi)
+		return;
+
 	if (fi->denominator == 0) {
 		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
 		fim->enabled = false;
-- 
2.43.0

