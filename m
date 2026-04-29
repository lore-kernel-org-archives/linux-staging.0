Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4E83A8727
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777506084; cv=none; b=SAKt0b5JYITZ+ae8m7DNxGct6wdodNiFikuR/dyl5qnUVPV/nlOp/f/IxeEQQsL3aRa1RZlcYvVGop5z/u5Ha/uG1i/lLFs/2uHpui84IIGq1C8kY2nAaWASf/Pt5A68ZH1wVvR11/2XZZvdb8x3nhlspUu7dMkqQr8BaypAX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777506084; c=relaxed/simple;
	bh=SENc4XzcXhXZH4RQPf5YBtAV9F2SAEGP6vKTlctEGbQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=sFvJXJ77iwTV4e3KR2uof0fxS443NmriOU69TntUVIaK3+f2MT9K7C/W+4DuoYqdrHIKt9zOjdoVWzLMBqm6ZoGZ5aK/sVFLMxKeGFEu89W819Cemw6yGXZzNY5eksmhH8vVlYU94O6WnCkkPZ+eighROyO9X9nSy/vLi8Uc4Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZV9yUkjo; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV9yUkjo"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-364ad762ef8so136550a91.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777506082; x=1778110882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEbN0PRYPELCXuCsVB1AGme2es0zOz+5Jz+a4L5FzlI=;
        b=ZV9yUkjoyohXQjjKoIzkKE6aWjqLs2cruNlb6ChEAG3kmjxUSIw1cJJis9PvU1q2Xi
         WIbrK4Z/VQfPbEgUOEtZyZ9N8yFgczrWpGFaRqlUvTriANu2ABfJQGajrQ5WvNo/EQ6q
         BquzQfkIW+S1jjWzzsmbvcEN3RgDsu/AQHU7LHrO96KaIyIBON8E1k7F7TS1UAdGMxGp
         2CU7+N4ze1iG7v218Yakh6rdW0dBXT9WHdKJhuhXS9AQnlqNsoLHhMIDDah/sBvUDXwm
         VQ0wDRptiBpwaZ34UwKXTaNTBAjm3oaEVSETpli4d8jdRQ8zaVcC8FiedoeEXuVdibD6
         Fs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777506082; x=1778110882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEbN0PRYPELCXuCsVB1AGme2es0zOz+5Jz+a4L5FzlI=;
        b=QlBg3PqyGJjN/xW3idLp5MqouKgZbpJkexxXrcOHKxg7GU7fO2qhZkZw7WELwiK8TT
         YR1MtUa8W/2d7onjCY9T0EtHlCabCsVl+urobBk6KdkFIL8u+smndWFQXIPLmLyodQq+
         Av2Yz2rqBCiH3wR9d03VGYv0hsYe9c39sHRypa7WNlMJWbloc8OLj6qJ18AzZNtO/GMi
         VpKZwZAgPbqnjQ/ondRD2P8IzyoMUn4MuNQDDaiu27SgPk+Lrz2D1sWQNllzZum+ID52
         hZtS0Dtlw2Kao717JWzOMMd8tEWWBUl+lf9zSAipKHaSssr2GBAIZzmX77gBCCyNsGNQ
         1fjg==
X-Forwarded-Encrypted: i=1; AFNElJ8gAlAB7xc/0gYROqXVpPusRknh5ZEGIDssYQ5fbTrWD1MMxWG9OPALjcPtrTHAgvmIPz8tVa3jrhp+Q0rZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwipJsUNmG+afbWlKO5uks+J5W7cdWFC67B5oUNuGxb8iAxiWJt
	sJ9dhS/1hNmOKrIv9AKaVLzU1QEACS4Zx0n8Wrqyd1soBLTj5iTrBNMg
X-Gm-Gg: AeBDievJ53a9e8RCCwVJon8gRtbmhZSaLkAevJFpF7oXEzwj7RhPFoO6GNfh/BrZJS/
	5jvKLAEdAr/LzRYCiDtoZ6yrEdQaskcgW5ILRIVn+pDstgIzCURqhkYyYhSqGH+NEVJVVdsDNNG
	a+3fD2ONZHBqHv2jlVkOtU8e4TdJnS5+SvRgBCrsLWhWoEu3SKahCQI4eIQFPbucGUB7dLsJ59E
	j6RiqdB6b8fWRDjSVvHV7Da8hVIL/BYw/IyfMwOFhv5YINPU65k4uEoRmfKDEojyFW5FXvcXczg
	7uS6CpRYRXUDAD/sqazQgpwMCsJ+hrRWy9O9XJYK8bQe1yd/F5o2tRUODxw7mUKu++m6D/tBm+k
	K5ctoiPwLLKMGv6pW/fX0UqMOw/2pylNun51tuCNK3xUoPwOVlNzs20hAkY2rZ6uaEqCdmqHLwx
	m2qvYiciptqNKFE5Hvr6ZNsAVXpgyaIdqpQR+nHHLe53h4SA03RiKLLdydIEiFVIqmEflzjg9p4
	cqJv3G+EBcwjDORIqopjop/Rkg=
X-Received: by 2002:a17:90b:2fc8:b0:364:87dd:b2c4 with SMTP id 98e67ed59e1d1-364c32aa4bdmr345691a91.25.1777506081799;
        Wed, 29 Apr 2026 16:41:21 -0700 (PDT)
Received: from archlinux (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be02940dsm702390a91.15.2026.04.29.16.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 16:41:21 -0700 (PDT)
From: Jack Lee <skunkolee@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jack Lee <skunkolee@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH] staging: media: atomisp: ov2722: clean up ov2722_startup()
Date: Wed, 29 Apr 2026 17:41:06 -0600
Message-ID: <20260429234110.7879-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove stale TODO comment that has been present since the file
was first added to staging in 2017 and was never really acted on.
Also replace return ret with return 0 since ret is guaranteed
to be zero at that point, both write calls return early on
failure.

Signed-off-by: Jack Lee <skunkolee@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..fcd71cc55731 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -599,7 +599,6 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* TODO: remove it. */
 static int ov2722_startup(struct v4l2_subdev *sd)
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
@@ -619,7 +618,7 @@ static int ov2722_startup(struct v4l2_subdev *sd)
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
-- 
2.54.0

