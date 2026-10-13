Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217E3E00B8
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885435; cv=none; b=e2pKS3KYK+CgqL3VgQjC2+aeeIYEI3+WElsFfVFQkeOwwhs++sZ0l7HMZ3S6/Z8Q/043OYVF/yPlbv8dEbWeB5vC/5aptsfEzY08Jyi36S2WyQ0k6QHMldpdH9j8Uw3mPYMN8dDVzRWeEimTm7Gq19t0FVrf6tTlm5Jxn893vqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885435; c=relaxed/simple;
	bh=3abKAhIkx78dcddudfnNcTjPTC2m93Ecx/g3mCrvIXA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Es/+dgyjnyC6O1AP+/0Abbx2HLBj5VTr8a4QKsZG7lkP/ifA+oKQS8iETnBbO2V+iznZnYmwWVK7uGdmTccjGmmb2v8RCij538Vu5Vr/VQYGqaOjmeDiNdN/UqMrL8Tf5VbmAEbD7ob4fF17MEvhLVcK+HXei6blCo/ImAjASLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VI82gHc6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI82gHc6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e618db81c0so22323995ad.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885433; x=1792490233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PxcGxjYizPXeuPKAi/3W+fOgW1EHAMoCbtXdC0dqqY=;
        b=VI82gHc6sRiAbyfNE6Z8c+twZYS01l+B90TbDltNenV4e+fC5xGQav6mwZGlVLc9Xm
         FUTwCBOAKTpyz+pUKG5K04ZY/6MLyIPsMXWrfkyDFg4tivswdIt+9sebsrrHO3/Y92pl
         mzv5ZVapsr/j3peV3bXbjkDSGbmqczp8/v4oZYubeyO3mely2i1NnQD3nRLahuh5YKDt
         sMuAnNiGxRlVbF6jK1ZA4j8014bx5h2BgxPNUwrjFrNG+n03DkOQDfd1D2hXlgbflkPX
         FP590PmTMYBl+A7p5rgzM8E1lnB8v3yrwDyPot64rEHag5nlMdv6p+W/VjIoxOPub14w
         ctrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885433; x=1792490233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PxcGxjYizPXeuPKAi/3W+fOgW1EHAMoCbtXdC0dqqY=;
        b=bBYUKHIRr/7yvTpoMg7gbg/stkJQVdt4b5hZT8CMLlCho/9Xj87U/lHjT+PhH8Uhhn
         X7zJzumAUhpXPa7wBaiO6k7fd2Ex+tl9/8dOg3r0f8tiUHrb4UVdoRHjTjRi74UihIuR
         AaKQ8t1yLcJACS3uote6oajIm+SWqDPLIc23dVgyWQmrhvDBkc3voNvAM0YBm0xWc2XV
         poI3vo/GED83jUKtj7OaRbPGotqBHQZ8w7ivIvDWL5WNOredsnfRywnk7OdqWJp5LnMS
         6t1VfEnxRes8BkmOumQNe1lpkqLhs7yHcIUJB725iqsKrBniH22lGXwxZFsHnFjRPBta
         cPIg==
X-Gm-Message-State: AFq9FYI3pqbQkFcZDqJRBwVxJB4VxKgS9PkvsuzYEMXzdZNopUHf9PTm
	ySgFi+LMANZDYAIPh9kV5qjFO2Xm0cba8NalkTVBEdB1BjjQIQSeyPs=
X-Gm-Gg: AYBFou2nqCSl9dV5a0m+bPFz3uEoMNdgRud6+f5ZA29yC2BQNGY75DVBkCyvdzV05Z6
	/DUevbYvM3/NWsdImdyl80RxzxATIchwNOcWSqC+OwWnyo4a8cnJWEqNEXKgiliDuNz8kzc/INW
	A2B9mfzddUJmOMbODJjLgCtm7RErUAaYkVtM+KFcxuwn+R0FXnrEh1hkceyti5MipCeWw5PVprt
	GYV3KvB109Apj7N7w03w2GotYHQ0qpLFiL3FTBI8aV50w7fCq1VB8CdLVwKBvbjDmsEh4yU2Cb/
	sxJn/nIU3cahpSGq+D7fq33UilNSaFzPLBNGIH770yeMGuk+plex9OY9uXhFeW41HlNwBMdtt/j
	V3+OCuZIPL0adWcTKt9Um20bUgQF8Cbspsxx8Wkokaymw7FQp3NmIhSfrGYQUHCAibcE6BsuL27
	SRwSpQUIVuW7+xbMpov04Cy0oZcXiWV+IfvtffXYIsj2eOC5rpIu3xrPAmHOD1Ctsug2anJsoEC
	Ob6ur/lCw==
X-Received: by 2002:a17:902:e551:b0:2df:8430:a580 with SMTP id d9443c01a7336-2e876ca7075mr85664185ad.45.1791885433158;
        Tue, 13 Oct 2026 02:57:13 -0700 (PDT)
Received: from localhost.localdomain ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e6aasm51797055ad.18.2026.10.13.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:57:12 -0700 (PDT)
From: Wang Yibo <szwyb123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Adriano Cordova <adrianox@gmail.com>,
	Azamat Rakhim <azamatrakhim8@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused defines in odm.h
Date: Tue, 13 Oct 2026 17:57:07 +0800
Message-Id: <20261013095707.387341-1-szwyb123@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hal/odm.h still defines several constants that no code in the driver
ever references:

  BAND_NUM, AFH_PSD, Adaptive_SIR
  ANTTESTALL, ANTTESTA, ANTTESTB
  AUX_ANT

They come from the PSD and antenna-diversity sections of the vendor ODM
code and were never wired up for the RTL8723BS.  The "/* ANT Test */"
comment is removed together with the defines it introduced.

No functional change intended.

Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 3532f0d79363..8a357658fdb5 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -29,12 +29,10 @@
 #define TXSCALE_TABLE_SIZE		37
 #define TXPWR_TRACK_TABLE_SIZE	30
 #define DELTA_SWINGIDX_SIZE     30
-#define BAND_NUM				4
 
 /* 3 PSD Handler */
 /* 3 ============================================================ */
 
-#define	AFH_PSD		1	/* 0:normal PSD scan, 1: only do 20 pts PSD */
 #define	MODE_40M		0	/* 0:20M, 1:40M */
 #define	PSD_TH2		3
 #define	PSD_CHMIN		20   /*  Minimum channel number for BT AFH */
@@ -46,7 +44,6 @@
 #define   Smooth_Size_3		20
 #define	Smooth_TH_3	4
 #define   Smooth_Step_Size 5
-#define	Adaptive_SIR	1
 #define	PSD_RESCAN		4
 #define	PSD_SCAN_INTERVAL	700 /* ms */
 
@@ -56,16 +53,10 @@
 #define		DM_DIG_HIGH_PWR_THRESHOLD	0x3a
 #define		DM_DIG_LOW_PWR_THRESHOLD	0x14
 
-/* ANT Test */
-#define			ANTTESTALL		0x00		/* Ant A or B will be Testing */
-#define		ANTTESTA		0x01		/* Ant A will be Testing */
-#define		ANTTESTB		0x02		/* Ant B will be testing */
-
 #define	PS_MODE_ACTIVE 0x01
 
 /* for 8723A Ant Definition--2012--06--07 due to different IC may be different ANT define */
 #define		MAIN_ANT		1		/* Ant A or Ant Main */
-#define		AUX_ANT		2		/* AntB or Ant Aux */
 #define		MAX_ANT		3		/*  3 for AP using */
 
 /* Antenna Diversity Type */
-- 
2.25.1

