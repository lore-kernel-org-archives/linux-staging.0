Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84301AAA5;
	Sun, 17 Mar 2024 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710677417; cv=none; b=ccaOBaoxI+CaOn2+QONuVk5wMykdNK6AvToxUKFua4o8IR8AdWxLOOEow9WjFkGwIFZWWGRWmJeJPKjw/OTlb76L5nEgQFuqtVkV0ITUP6alaIHP2mXyjV5VWQ6nh+2Yt3B+rwZFjFkhFxf4TJ7EgXB8vQsSbB66vKx16PLdmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710677417; c=relaxed/simple;
	bh=9VFShwVBNzTspoBKCpd6U+c3LjtRAVtq9eVSmw5I3wk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mhujSgAIzwH+FM1MxZyatqBq0AQwQr3xEg1hd/GvpZCmSqYrCxLbp0Ryyn6LkyX6tQ9Ym1Pn5Y/++i1gyduIX8Z+KQAeyDg6r0enOAYt6sJ6OytRf+W6CgcFVlfusuoggFlDDlI3TAu/e/eflS3iJ59IOrMdCu/FKv0bHl4/Ea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAXXsviB; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAXXsviB"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5691a35826fso165559a12.3;
        Sun, 17 Mar 2024 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710677414; x=1711282214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui0t13Vy7TPwnpeJlaf01c/OHY8VOmxd5VDc0UiW9P0=;
        b=QAXXsviB3+v7Bk84k1EeMwFmMOmYrqbAoZrbDRelZIW1od9Dfp5oGtUlyYpvveAsk0
         xXPb/sGwE7l2wsoh817EYsMzoxt2PL/zSx1DGPUr9nHDk7TM4EOgLePvOUSH2QwnwnMg
         ny5YpjYBE4yCaLR091GpgvqAZb2Eo4XZBrt70XcvGJBgkbYKTf0aLt1Evd+8vw5vnzIc
         p96NIniyL/q9pUM+/FcAcgZmKHlhvlztlToxSqDORta7iHoDbTjB4jWirfLDyo4Wb2ps
         QbApG5dD2Lh5b67JJZf8DzGCTyiZxiEaW5YMHXPAZKpF8X0ibUW6xHqgPYTB5yWXKI6e
         rupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710677414; x=1711282214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui0t13Vy7TPwnpeJlaf01c/OHY8VOmxd5VDc0UiW9P0=;
        b=A0SgXMmrCL1/+TDxR97tc5SqpnW3WcobbonMLJCRoncvFcJYbPeEHxS1iOJItV1Iun
         DADceeuqqJbeqSHgmFp9FnbhGULu5JsiayfAg4JM9gdhspHarV7cEWCEWDcFtawXAleZ
         g3Wi6Bbgy922qI32ZdhnQcHukINFF3PznchPDtY/QAhm+zlp2CuoKIvyw1xulvtrLViR
         lNQrEO8zT9ih0ibGSoaL40vV+VJoYq1Y+JJmzspgBia/lrP2+FmbPgnoctPmHtCiTD06
         EoZGNV9hWLnkuHzqJGL9anfPWX/JbZQaMQ8C2TZ50y7pmeoZVfcgemlbLC93nihw+HtH
         EwSA==
X-Forwarded-Encrypted: i=1; AJvYcCXJhjS0meKumY+FSewteuLoIrbOTgjvR7CKRyHbpLAXzb4EPG5ecDDubCdI8xXp1pk/9gy6AxLn2dCDmFvUPG56/gB3WwHtD1wjRiGoKhtyRsMkrtRhdi/8saI8CxMYRoVoMW3Q5UwgmQ==
X-Gm-Message-State: AOJu0YwcbubrTc9E9svzXooAc9I+qb7DqFzuLj5dNwkxirN47mxqpQ5X
	o+Eg0SDVDnMuE2mOP3aviCgMozwur2oo7OnVWyQW+jUjfVHJU+Uf
X-Google-Smtp-Source: AGHT+IHhu+mQljK4JSTFNc4urw4uSisoJXVdQwZsPboYHjalFqGE6UTI3NcNo/OFFxoPczaJnPAgRQ==
X-Received: by 2002:a05:6402:5385:b0:568:ac09:4a5c with SMTP id ew5-20020a056402538500b00568ac094a5cmr4770806edb.11.1710677413747;
        Sun, 17 Mar 2024 05:10:13 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id en10-20020a056402528a00b005693985c35dsm203252edb.36.2024.03.17.05.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 05:10:13 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: nvec: Fix documentation typo in static irqreturn_t nvec_interrupt()
Date: Sun, 17 Mar 2024 12:09:47 +0000
Message-Id: <20240317120947.2923-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of initialisation with was misspelled in the
documentation

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 282a664c9176..b4485b10beb8 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -712,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	 * TODO: replace the udelay with a read back after each writel above
 	 * in order to work around a hardware issue, see i2c-tegra.c
 	 *
-	 * Unfortunately, this change causes an intialisation issue with the
+	 * Unfortunately, this change causes an initialisation issue with the
 	 * touchpad, which needs to be fixed first.
 	 */
 	udelay(100);
--
2.25.1

