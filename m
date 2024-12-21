Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA481D959B
	for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734772831; cv=none; b=p83BPvImRfskl4W/0D1aj5JYk3sQV3GJyBKPIo8KtWLk8pmZEpBN8IsGJHpNQQI7+ur/ZtnYixOYjvA+ERjg00NHZA9V/zl/Ruyl/jon1+VyuhfgQt9sSAMF8wNZkgS4t+q2L9SZ3LxYeFAruTYD0panxVFEdbY/Md1WSgYfZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734772831; c=relaxed/simple;
	bh=xFMyGeeW+BTPfa09a1GSIMGggfdwZuzj+keky3xMZRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dRcshLfIDfIvYyTnqjXUR40D67V9uSbMxv83wSj0GVmmFp4ZQaF9lttLsRbLYNbOO+8eVLrddYaE7l/l1AheqZG+Z+UojijpmZOxIBDghWGO0+kNXBDa0lMb7YawSuOppZg30QPG/udjtaWxc/uCrLMi0eh0Z8TRW02khvbvnA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpVtgqNR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpVtgqNR"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f440e152fdso427956a91.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 01:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734772830; x=1735377630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhwcrQsJQmOo2XPFjcrVZyYTE2H2xXLHXnuSNOc9Lw8=;
        b=cpVtgqNR13FW7asCyCaVwkMVWhQPKOe7/d0R0mZgiAscWFHEbM9hI8IgOoDT6uFl3G
         eHd9SOu1NaQg1UjTdeR9TzwNx+fowp2EkTMRmZOVgtkWcG73HIjd7olOWE+I5YauHZlW
         4fjznwdQwF4Hwo6XtQ1hw0lU3QejDLDIxVMEtQe3hD2aYRm4pUbTKaFlgqKk90ZC471E
         1FtTbNA/u/6yibcaJnddiH1rHfTHNMoYsqjTjcTyZ+bpP2Ez9GcKJc+Q5UNCcPA4KOB8
         iFElVxa+D2tgqHW5nNUk7Lh70jTIB8qpn/749pFAsXZuhFpujXaxt8uKsS9IRDLN6AkR
         LwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734772830; x=1735377630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhwcrQsJQmOo2XPFjcrVZyYTE2H2xXLHXnuSNOc9Lw8=;
        b=WcZW7SjZYJ1olraDhIVvR801l2UNjn3tI2JqtPZFw1BzCJ1IcTPxoqt67BCkErVsAg
         oaU4GD5fv8ZXKsl+wb30WZkbre8nBCag+5X3JjOmMfZecWiAKWbYZ2Jcc5cIHftoovbb
         0g1XVr4LdK0TpviU8URVcTwLbJ/Y02Nc6PO2kvhccC5u79bq1g0WsHfYTzekqpNw0icc
         9Co3bigBJ0SrzisJ6cfWicMnydgUbs/A5wxDVIMVPuRNWltfr/FYrrmszcQq4vRt6n+7
         krIOxkTsvKWjDyq8nLPOQrm4wBkbOrwByreyHKwJ3+BPj2mHv+sQDIqkKyrgzQBuzeGx
         BYNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Rf4hkpoQLJ+On4Rr5Cuqqg0qIuvOxCAev+jOFT3FfJkUi1lbtBQ8bAz9Jm2LgjqQGGx09MPnApCVqh7C@lists.linux.dev
X-Gm-Message-State: AOJu0YwcpQMaLHppjtYxfPzhj72bccEkFOo5fDqH0nCCrA4x3RUpVtUc
	zF8H4VF7+uUQH7SpzdyZGpk3e+SYVPStoPwgzxRGBcGYV3NTeeoU
X-Gm-Gg: ASbGncudm5vCqA/zsQhCvYHFebVhIV8lzNMgVCkCqf+G0xhLtEOKLN3FGy36AJUiIk+
	TaJx6nSJUlA0H+1NptHzerlD4UpBsJjiFchqcIm+MAUtBwTQ2F2QcujSTyq33Ew670NEWVuUmNH
	J7X+ncCq3OPYye/Y78t+aqd/rTud7xvWQYyMfZtzgqAM+19l2ejuTVA1Qx/tuf8xpH6sz7CGxL2
	CvDnUV0uripsmCidql/7VPOAPiQ1t8WWoi+Nco6x7w4VXrKmkBm2mE=
X-Google-Smtp-Source: AGHT+IGZuWNEUdTLP2KFf9V3FZ/v2zB12av3VOzf3qrEgXToHRlKoMBvMR3SO31Y2oBIM33pNUJOEw==
X-Received: by 2002:a17:90b:2d4f:b0:2ee:d397:1fef with SMTP id 98e67ed59e1d1-2f452eeb60amr3401132a91.6.1734772829736;
        Sat, 21 Dec 2024 01:20:29 -0800 (PST)
Received: from ice.. ([171.76.86.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed0d8bb2sm6550949a91.0.2024.12.21.01.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 01:20:29 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	arnd@arndb.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org
Subject: [PATCH v2] staging: gpib: cb7210: Add error handling
Date: Sat, 21 Dec 2024 14:41:25 +0530
Message-Id: <20241221091121.35476-1-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The if condition in cb7210_init_module() would always fail as
the value of err is constantly 0. The function
cb_pcmcia_init_module() can be refactored into a single line,
and can be replaced entirely with pcmcia_register_driver().

Replace redundant cb_pcmcia_init_module() with
pcmcia_register_driver() which returns appropriate error code if
it fails. Handle the error if it fails and print the debug message.

This issue was reported by Coverity Scan.
Report:
CID 1635894: (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
dead_error_line: Execution cannot reach this statement: return -1;.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
v1 --> v2: Replaced the redundant cb_pcmcia_init_module() with
	   pcmcia_register_driver().

 drivers/staging/gpib/cb7210/cb7210.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 63df7f3eb3f3..abd6632d8448 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1351,12 +1351,6 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
 	.resume		= cb_gpib_resume,
 };
 
-int cb_pcmcia_init_module(void)
-{
-	pcmcia_register_driver(&cb_gpib_cs_driver);
-	return 0;
-}
-
 void cb_pcmcia_cleanup_module(void)
 {
 	DEBUG(0, "cb_gpib_cs: unloading\n");
@@ -1526,11 +1520,12 @@ static int __init cb7210_init_module(void)
 	gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
 	gpib_register_driver(&cb_pcmcia_accel_interface, THIS_MODULE);
 	gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
-	err += cb_pcmcia_init_module();
+	err = pcmcia_register_driver(&cb_gpib_cs_driver);
 #endif
-	if (err)
+	if (err) {
+		pr_err("cb7210: registering PCMCIA driver with the bus core failed\n");
 		return -1;
-
+	}
 	return 0;
 }
 
-- 
2.34.1

