Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA20F3B42EE
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 23:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782344395; cv=none; b=beMcruzDi4V2xDT2B+FP9R97JCbTxTSLD6zF/Ly3BQb/Y2dWvIM/n++9g3ob2ibdpbk3mZjDDxVsbH4q76vOB6Bl5s0+n3yHq5FHmvY+sbyAMq0FmxkT8C04iOl6D5NMAXFvAd1d6fLNPO6xroe5fLsXtaiKgoDCy11rhFgEs94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782344395; c=relaxed/simple;
	bh=dPiYU21UICloo2GT1gPYMEzu2mw9yuDwrGH4FU1wZpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5WdG8wgMs4nTfQK7i6+cf4Sr6QdzPeZSwCKgH1qtBYyI1H7XjYuGgN3ho+c5/Ci7Ohp5QOZW8tnn610+WKQFeCA34hKFjdm3oIHjM3xSCk/qOcm91Mf3Ba0mk21tzDipROKrC80ZxI4mcahOaZjaZz5UHmSnzSuCjE/FIKOz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpbdFGJA; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpbdFGJA"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43d3a0dabb0so1188190fac.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782344394; x=1782949194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0ftl5od1sc4CqUX3S8ttDYIWwf50BvLVRjkQU/mG/4=;
        b=qpbdFGJA+kSKKuDa9X0OOIc0Ic4t6Yas+YzKcWfmGyA27OBFx3naQvkQEXQjtY2lba
         1ZHeBIInzum2/8uX7zCz7nsJALfiQKQAZrZ4ZDZIW+uVYJN1aPz/MBcvCjhf2pEYy+RK
         fQhg40Z4df1MhW7nMVHQPsjhoxstLsxEDKcR9lhmJVPUEi2iayo9u+vkzK6N0xF08bM2
         kdOt5xja/Pr+psHjjM03uQ/X8HEBAabSDdaVPWsP7Iyn4f0DDcSLwMju+eyUwvJKK2VY
         xdwUEu1f93OkVfYAASjVVTG0ioM0JtcMeTHc58nGeuzZpdKFEDJk2kKcn8/eaIMJ9WRU
         ooEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782344394; x=1782949194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0ftl5od1sc4CqUX3S8ttDYIWwf50BvLVRjkQU/mG/4=;
        b=o+vJBRT3sthX5J/mq6w2D3So0VNVYbDNh0tXoXV1EeHEyW3UynEg7OQRboDQRzrpuT
         OGMmeIYtLK/uB6FAF7Y6Nj/L+jromLntSQpTK7BcGNRzi+xGuLUKUsuVdt19gdVZN9Yz
         z7xoYNcO8n/99diSAejnb7IQ/NGq2u/QDQExY07uBSftSA08QtuYEeMpsDt3XEIJxEsJ
         hNwV2xzqNdVOjEk8nFpo1c+p3s2hmuUdyz508cEaNKEX7ndP+0bbZFgjJO3nFnkBcws9
         sVNvHiGiZBe44Oi4YFISvhL45j0+NrVfBefwhO5KHwiyOAg+NwLsq9tQcJNx/Gwu5ke2
         dctw==
X-Forwarded-Encrypted: i=1; AFNElJ9brqzFBZGTC8A875edRlTi54GH1P4qOvSUR9np0pgq111fxiyMPoY7s9Fg91WLKp33t878OysYtWNQDrd8@lists.linux.dev
X-Gm-Message-State: AOJu0YxvPWeQgyzqhvGjtcpliMhWWizM6/bDubBDQx+KTYlJYk2uboIs
	rNCGqNWTSms/a7bnTFMk2ZcECd/UAixN0HmZEk/9Tr36pKdHkTyN/aZx
X-Gm-Gg: AfdE7cmfzpe9mdb7pfIlZL0zESIkbfpxaiBEY/wWHQLouTScuuWR4SUnfcy1w4kphS+
	+l+S+rb3fy+iMnJcEc271u1MpKrtHDk6w/6YGVr5RSREMbJgLKkjEj4gn0HI719zAooWRv8YUMk
	tViIK84z8xHW4zSkW5FGSxW5kWYfkHqx0NIu3jVxotBqet4tP7U2zitM6e96SfwTrf+ikHLoHxw
	mJBY5lJV7a5M8ei0ywEB6ay35ojMVjPVqbvo438f/8xbSXYLdtBsDB5wlwxzCrHTpGCwXeRHBM+
	w95YTrDStdalW7hIXWxBA5XW3H7MDnqCKH/ayDEF4H8xDFQtmTWYbhHzhaZWhXQNfhv+dglT+OS
	WLKGh529amGAyfWBSTAxnbVwEKM3iWJOcLnGeu7vzJF57L8QVGCSAX5V/dONe8w29aHDjchKU7z
	MtLgXVzRSDHlcLYMyCrBrOMhguEpRWUSRhbsNBj+mMpieVxKUMopMSKuA4dffdcSuBze1FQ63J8
	A==
X-Received: by 2002:a05:6871:a842:b0:447:a1f2:f01d with SMTP id 586e51a60fabf-4481196e859mr82114fac.5.1782344393704;
        Wed, 24 Jun 2026 16:39:53 -0700 (PDT)
Received: from ShravyaPC.. (r74-192-25-180.bcstcmta01.clsttx.tl.dh.suddenlink.net. [74.192.25.180])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472eccfa68sm10637006fac.5.2026.06.24.16.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 16:39:52 -0700 (PDT)
From: Shravya <shravy112@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shravya <shravy112@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const pointer const
Date: Wed, 24 Jun 2026 18:39:07 -0500
Message-ID: <20260624233907.67886-1-shravy112@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the const qualifier to the g_fbmode array pointers to make
the entire structure read-only. This resolves a checkpatch warning
and allows the compiler to put the data into the read-only segment.

Signed-off-by: Shravya <shravy112@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..8f533f3b1b42 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -21,7 +21,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.43.0

