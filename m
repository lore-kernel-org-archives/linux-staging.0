Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A80E236420
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602338; cv=none; b=hRENROAxdKqWYePrxRuDUqQkD12L7ZPXjIVJ7EF/x6rtjJdl7b0exUBJ4JYuCtdCpNnG/qE+6KVao6eIdV3yvYyYLZApC5iCiOgcYB/gLKYIaS3CQVdcgJeEq3tPzLMaXRpkhHRmBtpDmrn4eoxDD9MKRgNODvX6eSgvBukjMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602338; c=relaxed/simple;
	bh=E1RquFpLyZTYcfSNn+gPl7tMCMbmQmZDBrNyAAGg7mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tGaz8YEMlrMmCRqs24eXQCVanF+JSsmUS76ek1RY+WTBozYR+rk8IqFVT0XcgJv1utNIhozJDW5eTQrmJbe0mhMGGXNZe8wXsWIld2QfeKWiurMAERPDWIzc4s51T9I/ydPsVRs5SpdHp6FF4psF/7qJWcPEaOgCqJrMfej/npo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZCLFGJH; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZCLFGJH"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c08f9d0ef3so392448785a.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 06:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743602336; x=1744207136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RKlreFQivVxqrvuN1/QXrm7XVZTtvYdxyFro8fbbwo=;
        b=EZCLFGJHa2nFx1/aOMmds7CIll5lH/evzjjzJJiJBRqyvFcnsPqh78lr3kavhDpwDS
         l+KWHmzT4m0wvXvllpNmbQiSmT6Xbw8dGFIvz6sJuVEVDUmBWUF6a/xWTM16zpkCq+26
         hGmHy4Bg+JO83FxhtC/aMoYS6ajju49Ey8VR6ex0VaPcG3XRxs8rNvjUVxpn8Nlu609A
         Mw8hYZzTCmTAXaz54bwaErKxut6oKDb92t3gAVxfXXheZ6tl1Jrd0SEOMAfbDvk1jSpX
         yoqTnv+jGTOwEZnllULRXi6q2JE6y2mbPL9d/LBqSocAJeA1MqFJxuIGgZdPrYAbZP22
         p9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602336; x=1744207136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RKlreFQivVxqrvuN1/QXrm7XVZTtvYdxyFro8fbbwo=;
        b=M7zVKA+AkEIZGvrg9jROFvPIyoc6qsPNmQ36jNx7EY9MNjXO0kLj0pH1X3Ci/10ybh
         9FuuprZZaDgatbmgVFddGFXddk2fUnjSTJHqvumFa4VIZj7KqTeZNIEp1m7tfxKaQLWB
         0RGdMcc2viPTa2dskf9M6nQ92I1UTpR8pDbiVMu0NS30g4fYgYT/KgcNPh9krt9Lc8I0
         sRYSePrq3kOWBNS+bDpz9EWOrRiMGUW+dpMJV7+T4HFEU7FyvoQRutM7dsfyfN5z+iKa
         B7hdR5m7Teny4gCNglvEgQavG0UbEtDMm6VjekqxmR5NDcVwrBwKtYUmMdkcu+2a9ErQ
         AxwQ==
X-Gm-Message-State: AOJu0Ywu4rVlfo5ajOO7Ny8KvhHNa6qzXNuCyBFeSAGhmNvvdT+dJpjb
	1PY9f7Mmy0l4Uy4UuI2D9ZzL2GtOBJkcLyZNHdaf4z+pCPLPDo7J
X-Gm-Gg: ASbGncu0UVb1So6kvd0ONCbspx2MUrZM6CsiUpYWG2/7iyFIGO5uJVsInkbcPjcBAMl
	NJRIHNwSGKuA0wdGGV5rLBf/LL97gzY0D8pSUw56wAI/vQBBOsMqJNCTn/DM02eHBYgy6bPcpG2
	fnVXi0RFkQ6OUjUDCkdDwonkdKpOy3xkGpCNdXqunGmB3sUA/hNGdhJ8HPt3C8k+4gmVIqh0iaz
	4clanHJGYIJbXZCNT5lKUT3mDp453V5kpFwKg8puoDaoQRcbYtLvW/et3zlU1JxXLNyy+nCoKif
	o5oyWaEBtqIqoTXqPMZqnnjEvIUUnmWgoqM8C3EzXc0E0i8DcZGsNWdiyHVgCPSPPM7Hc0ByYXe
	yOIeyQIw6pQckWonGiAkITaY=
X-Google-Smtp-Source: AGHT+IGhyWbX15a0Lzy3/ieWFeMzPPya3LsFi78CVOBfuojRqD/8rX3uad3QIOQrL2LX6wekR6vyvA==
X-Received: by 2002:ae9:e71a:0:b0:7c5:9c38:ef6b with SMTP id af79cd13be357-7c69087de5dmr2107423985a.45.1743602335819;
        Wed, 02 Apr 2025 06:58:55 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f777e02bsm789748685a.110.2025.04.02.06.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:58:55 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	kernelmentees@lists.linuxfoundation.org,
	gshahrouzi@gmail.com
Subject: [PATCH v4] staging: media: Remove unnecessary braces for single statement block
Date: Wed,  2 Apr 2025 09:58:51 -0400
Message-ID: <20250402135851.13627-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces in single statement block to comply with kernel
coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---

Changes in v2:
	- Add missing author.
	- Fix title of email.
Changes in v3:
        - Resend using git send-email to fix formatting issues in email body.
Changes in v4:
	- Use correct patch version.
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0

