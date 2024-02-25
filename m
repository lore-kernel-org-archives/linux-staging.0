Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0DFFC01
	for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708850520; cv=none; b=u47zq/AQbfnWqs2B57t9Z6MqQbQwhyBclq22dD8dknLCFOnsUX2Z2hIskmz0vnttqb7NGNNw2DyHxMRmUgZ45zkEvC6u4u24ckLKxOdizaKu/7m1SsiGopSwOS3MW/zfKTVcgpBuoLlHLUgJhCOlTrriPncQ9hD0taON5nbSQ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708850520; c=relaxed/simple;
	bh=ADXWWn3aihrNdObnQdFuMx+J2IzGQidw1FrBetQfMq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OCebaEOrLUnJEznDGlENTBdcD/e5c7qRCZDJt591vBp26qz/J+xnB+dyDeHjtH2m4d/+hSv9TM71s0+TMqsLcYf0mg5/9//moSuiDsVRFzd7YycEfufT1EHwY5DRx+z6b5C+CxzVyN5MY1dyNJgmGajuAD/qldK3A+yrFrXeibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyG8RWsf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyG8RWsf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dc0e5b223eso16906395ad.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 00:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708850518; x=1709455318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iXcTHohQKUEWCG3AfRPALlxApVKdvPfbvuOAXc4fB5c=;
        b=XyG8RWsfJjn4uP6dioXYpb3+tLRgsPGFqXDWH5RnITNob02/iCLQDkPEC+LUVEd36f
         h5rG1Ht8Nw8NDbla6QLgHL7WLOybOYRQ6LeNHEFhyC2W4bcre9sNB2z/fTclIkurGZiV
         aeFf/hwa2DG37jMBYWcetNgTfgX/LcwL5/E4MzwyDinvq1F3261IXpYOR5tatE52xrqf
         ofV+zZAbODVNP+JPWYKTwNClqDJmAipxavcZ6+XkYWrRzeHQXHzHKXUSCuOZ2/b7Ogpk
         65zReDjGvFJGRX1V39A9vMqHhPD4IJXvlw2cqJdsIai60SIslOoEJ8vnXq3mzRZn3Nzj
         C4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708850518; x=1709455318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXcTHohQKUEWCG3AfRPALlxApVKdvPfbvuOAXc4fB5c=;
        b=NCKydkLUp8bQ65MSE2zJ6dWdfDe8e3XlYTx1+8inIDxklQNvPjlJFcosaPwf7dMAZ5
         epbrVZdI9mOojZs9P+wa7X4mqjU3MuqqNVZDkQgL8QupLUw6VpmsyMbJovx1pO728Zt0
         foaZpuWgNRgcd8Nmh4GJ7ip2CiqBzN3atTQFt5QLc+1CgU2nMVp2DvcX7hg2V95l2Dcl
         SbBMoBD7mgZtNyFjGoh96WIMaEogxQjiAQACt0kP5iZfpyGfpWdn4+R/vXoErixWdzBM
         2Uq7xFKhAzf/Sgo1mvk3dlYWxO4uSlep6S1YWIqp4egC0wpLn2pvOxOy5lPcORh0MHM9
         UJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLp5ZbtuPNyISPSEP4hPtym2zAJWnTWXLm+YrvbuEZpeEpYPYFDm9PZKxPtW89VhRYidu3ukfJCkAvWxYPyfzfYXIk4QVD6rWk2uhKsA==
X-Gm-Message-State: AOJu0Yz+cG21btqY2UXlDyaInmacSMkumR0hr/0mI9ikBDd8M7Et4dwP
	PtdOo9TIeFHa2SHMhOZSTD0gXnXy0UlcS1qZ9nPagsBRoqCUHJmi
X-Google-Smtp-Source: AGHT+IHaSPeFmSU8LbgQp6DtCzv3SLULosPQKgzi/lNKyeSLUsDjebl0vj2X4o7c4Gbq1Kxs7N69Ng==
X-Received: by 2002:a17:902:db01:b0:1dc:6373:3cc with SMTP id m1-20020a170902db0100b001dc637303ccmr4354300plx.50.1708850518265;
        Sun, 25 Feb 2024 00:41:58 -0800 (PST)
Received: from dileep-HP-Pavilion-Laptop-15-eg2xxx.. ([2405:201:5c1b:782d:790a:81c5:9183:eca7])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902d3c500b001dc2d1bd4d6sm1968425plb.77.2024.02.25.00.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 00:41:57 -0800 (PST)
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	Dileep Sankhla <dileepsankhla.ds@gmail.com>
Subject: [PATCH] staging: greybus: put macro in a do - while loop
Date: Sun, 25 Feb 2024 14:10:17 +0530
Message-Id: <20240225084017.418773-1-dileepsankhla.ds@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enclose the macro gb_loopback_stats_attrs defined with multiple
replacement statements in a do - while loop. This avoids possible
if/else logic defects and clears a checkpatch error.

ERROR: Macros with multiple statements should be enclosed in a do -
while loop

Signed-off-by: Dileep Sankhla <dileepsankhla.ds@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index bb33379b5297..eb5a7a20f5a3 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)
 
 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {							\
+		gb_loopback_ro_stats_attr(field, min, u);	\
+		gb_loopback_ro_stats_attr(field, max, u);	\
+		gb_loopback_ro_avg_attr(field);			\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.40.1

