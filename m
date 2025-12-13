Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D82D94A2
	for <linux-staging@lists.linux.dev>; Sat, 13 Dec 2025 16:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765642292; cv=none; b=tCzeDcEdbTJURC1nVcC4aCfuq8/GEysNzdtN8govsM2N1CwZZZNJqHcy36ee7qn3jH29u23QRJtHO9EGW18xn4bpOXttEVeSnFD0xsv5JYogacfIFPxD7Y4R2FaXddaX8WrhElzK8oyTzbR/l0KIacMgSCulqcsvxT6mZ88KbSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765642292; c=relaxed/simple;
	bh=bEq/ZTGlDxmnyjk7Z52kTyCQ6ee29rpTCy6tmTpuBYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVKhN4IYSP71v4s+PWB/JfFJIiBHAPz+p4AnAO00OXDIBOStwg/C6jWyyxqREAWCzTQrJRZHRiPuawrmdfZb+uNfvqu36gIVcZtnj7ElTx3Phz/ocvyOqy73IVw/VoHM+5ssIzY7ZzZboslt+IvkLEfRIYuVL/BNafiH7r6QGpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+0K2CvC; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+0K2CvC"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343ea89896eso2235152a91.2
        for <linux-staging@lists.linux.dev>; Sat, 13 Dec 2025 08:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765642290; x=1766247090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDSnf56RHeC4k3lfxzo2oRynLd5khsYlG4J+P5TtUFQ=;
        b=U+0K2CvC/rlwn5TlTBRchF+QM5u7/pn6JwmSw7339VpFUFPGeMsIzg/4Xs/3rnfBbd
         ex2aC/KDubioKTv0IpFjsfHIx++XtWedgs2pgTSGLeRe28+wyduFPCCKIiKwk5I4U39q
         eZSVGnkWFH0d3E/PSiNySi1mLY0iVwuevHrFdLXw3BUpUDZmcURmQ+0zeu0lkgkvhX4G
         SR9qOMnvAE9pe2xzZF4HoHs7qbef+OAhbbK5VjPyScXmnE9OLYm8oTxUZ7v/oVEYPWYQ
         6/zXu4Fujx/fxqcgnWHUXhp2PXLBpu9J/OQNbWvUzRuHRauAUliuJDJRhIS6tsJp3cRy
         r21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765642290; x=1766247090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDSnf56RHeC4k3lfxzo2oRynLd5khsYlG4J+P5TtUFQ=;
        b=LwuGaB6rZLS7hQ0i5jZ7cOlXYcLl37lr+ivuajchpfKK3hqeBHbffPVYeQCju8ouBL
         erw9UI1kLW0DUVTpR8neeF/Wpk9E573wTs/5ZqnmTM1kzDhJoGmnfI8MJGEsMycuk3k8
         F7OvU3+hWs/j88TOq6sLTYGJOc/0WHy1/4GAgiUIHbrh1vooHUEzPy9OteYIzpWg8Clw
         zB1kjYky+h49N2PDNBOF5Qf8feUEmVMwqrepos9AcLxgyH4i9Afn/et4gBCbkSpUJ0zh
         JQqd5nG7fkBxXCIeNye3wmE16HDSyYLc4vRZCFO0wCKhyCXdQlcLgBinLsY2U/RCnw/Z
         mtrg==
X-Gm-Message-State: AOJu0YwdPT1HZEXDN6wWVVJFxkUZogpgApfTuo15jA0WYd3kfJL+LHPU
	e+jNTS8CT7k1NZr823PV0b3HDeIpK2XEEBtw3WoLyRvPikpBmvJH+yvi
X-Gm-Gg: AY/fxX5P1iSJyeGqhlqopaslTOkVVpOzz2HDuM/EsatOtLdQn+32Ei0+9Y8C8qsNOLn
	9YC9DizB2//QaG/itdinxS8tpDaEtv8K4YVOm06i9jGkMgZp2IZrtYMCgNlO718RRh2a3EUurDi
	Eq8+rILlYJIAWIERTTFmEwaV0nB/rrhrEK1/P4g65r7JWjAqH0DMN0gycgaVXbxKbxl0BvywuGi
	RfsGYkt8ej7uuOrKNKJ18NdhQkPCWpfCH1o3s9IrrQBUzLn6v3UL83WroEMMtlugBeHhqJttqYs
	LsHH2lhyjODPBOwUce5R4K6Xem6MR8ObLF8DS8nPkCe6nC5Zq8UopdiLGgvm1xYhT6u1c5e5b0b
	fTLbYkWN8osKc9vfkcX0iv2lu1fGRmnkQl/vp872d2Nae7v8MaMMHeWFL0+byrfrc0jLd2BbBxC
	1zkHXm4Xw=
X-Google-Smtp-Source: AGHT+IFZ4TVSxiV0Hs3M4yfuTF13SHYxBQKmO0Y7ERGfAi1IefZmLU5HJv3OAH+9sFvCuwFAUYitbg==
X-Received: by 2002:a17:90b:2b46:b0:340:ff7d:c2e with SMTP id 98e67ed59e1d1-34abd77ec88mr4744682a91.29.1765642289692;
        Sat, 13 Dec 2025 08:11:29 -0800 (PST)
Received: from ubuntu.. ([211.234.206.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe3dea94sm4893341a91.11.2025.12.13.08.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 08:11:29 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces and else block
Date: Sat, 13 Dec 2025 16:11:22 +0000
Message-ID: <20251213161122.4280-1-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes coding style issues reported by checkpatch.pl in
odm_CfoTracking.c.

The changes include:
1. Removing unnecessary braces {} from single-line conditional
   statements.
2. Removing an unnecessary else statement after a return, which reduces
   indentation  and simplifies the code flow.

These changes verify clean with checkpatch.pl.

Signed-off-by: Sanghyeon Lee <sanghae778@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 666a9f44012d..166af5f6c9e0 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -100,9 +100,8 @@ void ODM_CfoTracking(void *pDM_VOID)
 	u8 Adjust_Xtal = 1;
 
 	/* 4 Support ability */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING))
 		return;
-	}
 
 	if (!pDM_Odm->bLinked || !pDM_Odm->bOneEntryOnly) {
 		/* 4 No link or more than one entry */
@@ -110,9 +109,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 	} else {
 		/* 3 1. CFO Tracking */
 		/* 4 1.1 No new packet */
-		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre) {
+		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre)
 			return;
-		}
+
 		pCfoTrack->packetCount_pre = pCfoTrack->packetCount;
 
 		/* 4 1.2 Calculate CFO */
@@ -133,8 +132,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		) {
 			pCfoTrack->largeCFOHit = 1;
 			return;
-		} else
-			pCfoTrack->largeCFOHit = 0;
+		}
+
+		pCfoTrack->largeCFOHit = 0;
 		pCfoTrack->CFO_ave_pre = CFO_ave;
 
 		/* 4 1.4 Dynamic Xtal threshold */
@@ -176,11 +176,10 @@ void ODM_CfoTracking(void *pDM_VOID)
 		}
 
 		/* 3 2. Dynamic ATC switch */
-		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC) {
+		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC)
 			odm_SetATCStatus(pDM_Odm, false);
-		} else {
+		else
 			odm_SetATCStatus(pDM_Odm, true);
-		}
 	}
 }
 
-- 
2.43.0

