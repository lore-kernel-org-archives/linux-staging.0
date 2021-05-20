Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D5B71
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 06:41:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6348860FE8;
	Thu, 20 May 2021 06:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621492899;
	bh=nMb5X5D49ryt79hhiurA4uQDV2U9mH+ktgv8mYhMIhE=;
	h=From:To:Cc:Subject:Date:From;
	b=ord7m9SsfAWQ9yaL52omSjQUGRhkX/MsERKrMvD1fu+MV5L0l8bPc3ZHX93mQIbwA
	 oNo5ha3xYX3xD188Yj/coI7070055JlO6iquH5I/qfog1tcG0qYW9poHErFepM2ghU
	 NGrbrWoxwAy7alCyHzsiLFHS/gzMX/5AF380VGlE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: rtl8723bs: HalBtc8723b1Ant.c: fix build warnings about unused variables
Date: Thu, 20 May 2021 08:41:33 +0200
Message-Id: <20210520064133.1953156-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0-day keeps spitting out annoying messages:

drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2117:6: warning: variable 'u4Tmp' set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2118:17: warning: variable 'u1Tmpb' set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2118:5: warning: variable 'u1Tmpa' set but not used [-Wunused-but-set-variable]

So fix this up by just removing the storage of the values read.  Leave
the read from the hardware as odds are it is required in order to keep
it working properly as I do not have the hardware to test with.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index e5464a27c052..518d5354bda4 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2114,9 +2114,6 @@ static void halbtc8723b1ant_InitHwConfig(
 	bool bWifiOnly
 )
 {
-	u32 u4Tmp = 0;/*  fwVer; */
-	u8 u1Tmpa = 0, u1Tmpb = 0;
-
 	pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x550, 0x8, 0x1);  /* enable TBTT nterrupt */
 
 	/*  0x790[5:0]= 0x5 */
@@ -2136,9 +2133,9 @@ static void halbtc8723b1ant_InitHwConfig(
 	/*  PTA parameter */
 	halbtc8723b1ant_CoexTableWithType(pBtCoexist, FORCE_EXEC, 0);
 
-	u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
-	u1Tmpa = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
-	u1Tmpb = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
+	pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
+	pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
+	pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
 }
 
 /*  */
-- 
2.31.1

