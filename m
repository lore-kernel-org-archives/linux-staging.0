Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873D3C2ED
	for <linux-staging@lists.linux.dev>; Mon, 21 Apr 2025 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261013; cv=none; b=CpAP7h42ZkxkXAtraPJvHNhhJcITzhmPiszojaYYN3OfTRHDSpVQNBKLiefAEmlxSi0S++d2XgMolBr3pTKp5G5wFS8QlePMLbnCApvl0WSoxz/4Ai5bAB9bsG2xq60mFjrkKj3y/SbYtG1PoKUyZyv5eyHCmtlUKtuWIipQ6Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261013; c=relaxed/simple;
	bh=rxhlXqyx5x/2Y6lC6VYb0xiaMox+hPMwmGgaxzDTUmU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z1Ob1tfPIRshJyMAiw4cU75SNYKQ3ctywZM8MidhXfA5cC3ROHtGaWDWtP8wMrRLDazQVxvebezlaUmUkE4xOYaMDrWUXSYiB6jlU2THqlApqFPDv9rRmxYwnMh43+GD7Um+mE1dxuhPVunf/QXNNAsVbWRNzfYV/q4/HHzdIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cixRmEyC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cixRmEyC"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54993c68ba0so4993505e87.2
        for <linux-staging@lists.linux.dev>; Mon, 21 Apr 2025 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745261010; x=1745865810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZtocP+NkKmjE5uyIOjC9xo3yUt3gITSkl8Dclb55ow=;
        b=cixRmEyCuA5y9O8CADoVM+1e0aqB0UFJ1ILzhNCQ+ZgaJ+L/8gd6szH9RA7fxTFScZ
         64zvGeMfvkCMaEbf8iOgcIgPaf69Oz2T8kAEsYJ2rjpAw9J7Me3zBaov6pWV56jJRLzJ
         Pc4FEm6W+UIA85A7mWjFeQrvSHOMslS2cx9EvPfobQ1V9Z7IGAdskD32pG66GLmhsXd1
         XhRbhuGxSUoi7uSH50BgZYoQNvG2z1orWh2CEaQdVEiPhhSfDT4qJioPFSOY/Q2bweaQ
         c8iFpTymKQQO7IatSgQztERcdWj2udE1v17nWhB5jOR+oM/lVTZEeBA1bYu82qo8xuts
         vr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745261010; x=1745865810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZtocP+NkKmjE5uyIOjC9xo3yUt3gITSkl8Dclb55ow=;
        b=DBJXoEKHQanGIqbn3wvPbwQARaRV1Lb/zUks9hJDiQ+8oVjYz32we34l2rS9LaSPdp
         0B/2q/N05gBsYTiVP9qXy9MooB3B2fMSeh2mmY0qGbi4McdxarZgb/pmhsfST3q9ILpY
         889fFRX+IeJMsotG6dyEqYqacZFeyuNMT8qG4HI9zm65t7RR01214xyZU+TthaE5pTuc
         8mS2QKnXeDpCwDe1Wt2ILmNI4A/M15XyLem6dbEXy/Mxk/TUZpge32hj2wz1DkhgEZL0
         tmCZ2RfuG0a+IdcIjc+MuCACNK9OXtEnvj1EeakWLb1Gcn1abanU1GrNfcb605pQFGN4
         JZVg==
X-Forwarded-Encrypted: i=1; AJvYcCXE0GXwPqpa2VKsC96sw2+eeS/nP0Rr6G3LETYKH27kU9kSOz3AE2BdYuvD3BmGDiURYCy+Idn95Lz2hUrX@lists.linux.dev
X-Gm-Message-State: AOJu0YzbccQfxINmyBSDBhLVRuHTmVYhRaV24tga6RFQYyeY9tMbhQSB
	BUb7V5sVKhRKPBO3o4UKKG8v9WGyomd6KQ1IfYbz32JQDWZSjjcS
X-Gm-Gg: ASbGncvVvZsho98LEe1DQSiqy/iDCV3A5sOr3ID7ze1HSRkuI1tavbIh6uuHEEkZG3Z
	KPtaICw6vaVbASY345ciH6qDuIQTpgNFDax/S+qG0YReBBYKksmnp/gDMWni47xtS17fc5u8+P0
	DaHBrsYv5gf5f2U68jBjgsBFyBiRiPOypu8igPz/nvzgPDP9444wy0PYr1ZJqjZzkKAkfFDtohP
	cgF08l0Gs4Z+Qv83Lc5IXW9sbGTx2EksJ0/uW+l1FRDd/ClF0D7Qu2Wd4mg8UzvxD3yCqPAImib
	B2l8wSTFyAZRm2j8ismkHGN2CDV5RSzOlScWFcGjwB+tPhlZObjCLI+gOTvsb3rOjvf1Hhb2w2p
	FJWHhu4n26dnU4OA=
X-Google-Smtp-Source: AGHT+IEe0pJkek8HMn88o4XZ+AcdWsXyGbn3kvFRTYs1fpCHR6vgtkAsVOOEKwAJQwbVkczNQL8opQ==
X-Received: by 2002:a05:6512:3f28:b0:549:38eb:d694 with SMTP id 2adb3069b0e04-54d6e635b0emr3279125e87.26.1745261009310;
        Mon, 21 Apr 2025 11:43:29 -0700 (PDT)
Received: from localhost.localdomain (c151-177-8-194.bredband.tele2.se. [151.177.8.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cfda6sm1001764e87.126.2025.04.21.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 11:43:28 -0700 (PDT)
From: Marwin Hormiz <marwinhormiz@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	matchstick@neverthere.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marwin Hormiz <marwinhormiz@gmail.com>
Subject: [PATCH 1/1] staging: gpib: gpio: Fix memory allocation style in gpib_bitbang.c
Date: Mon, 21 Apr 2025 20:41:44 +0200
Message-Id: <20250421184144.220972-1-marwinhormiz@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change kzalloc() to use sizeof(*variable) instead of sizeof(struct type)
to improve code maintainability. This follows the kernel coding style
recommendation for memory allocations.

Signed-off-by: Marwin Hormiz <marwinhormiz@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 86bdd381472a..28f2f44deb39 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -46,10 +46,10 @@
 			dev_dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \
 	while (0)
 
-#define LINVAL gpiod_get_value(DAV),		\
+#define LINVAL (gpiod_get_value(DAV),		\
 		gpiod_get_value(NRFD),		\
 		gpiod_get_value(NDAC),		\
-		gpiod_get_value(SRQ)
+		gpiod_get_value(SRQ))
 #define LINFMT "DAV: %d	 NRFD:%d  NDAC: %d SRQ: %d"
 
 #include "gpibP.h"
@@ -1063,7 +1063,7 @@ static int bb_line_status(const struct gpib_board *board)
 
 static int allocate_private(struct gpib_board *board)
 {
-	board->private_data = kzalloc(sizeof(struct bb_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -1;
 	return 0;
-- 
2.34.1

