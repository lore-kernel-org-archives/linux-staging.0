Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF070
	for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 07:39:38 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id if15so1099666qvb.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 00:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0D0RyfEI/YYH+umZt/l1fT0zvlmNHGepMtTDRyFPZvY=;
        b=HRl8G71CBordXP8uYrjJENk7BT/KpAU9LUG4TAuefWIbyZrWvZBP5pvs35+2R13zIO
         19qddd/qBBH+Gcgmf4V1fRy3QrXhiK0xViMo4IJ7dPKYpX4j4mA0IPYCnxCeUHSSIray
         t6T2XMQraqQXGeD/70nqNrpk/eKX2Cm3Tx2NHWc55eBc+0FCwtCShjuYENs3ymI76xJF
         mwBikMPTDP8nlybMlTIWxJYVvJ+CeaS0IG5zEiI0vsPa8SodNHbwJqUCcsBVVf9bMyHA
         Mj51Kphp9gaCsJkHxQGtleznzb9hk690POpK9KPc6X5V4YrA/QKTp2NJgmb9dKcU9afN
         TBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0D0RyfEI/YYH+umZt/l1fT0zvlmNHGepMtTDRyFPZvY=;
        b=nfnM8NGjHITEeQFFxvZIGsF0n2akrmPIDyIMc98t8LgDPNeEZSzNrCYHAX0DLv84W2
         dN8PWHTSbVcMvA97Og+VPFOAGRaqW8L5f8I+xtd9XeB4LQLkTkd+1gTCZkSmwRFbxTze
         wUQ8nFFi/NGRelThYUJvfjKY+9usekt3UsC8KTHF4yMrsc+iJC0H5rjmLh8eWyvgOiVE
         hbeQKtwJK6wpIpbORr9y/W1e6ihln4JRUNPbNx1lcjEh0kTUqui7czxoaq3CB7AUppu4
         NvL13M7yzoapJJ+nbGwXQbPjxQoD8WkJXkTLLjgD8MAJV2Jv8dCmsON35SK8jYuqteAy
         jIbQ==
X-Gm-Message-State: AOAM531Zo3i0eUoaQSYzC/PaKYeU4ARGhW8OcJmbutkinv6MJKx/dBGC
	P6yW+qJ5/4FtgpW0L0Q/2LnoC3lihqiZBczl
X-Google-Smtp-Source: ABdhPJzJ5Cd6sbTpu5QSQkfElWOwoct0rWUHQI44xvs3wEnrdGLBks9SN/VekHxlU+cZ3TjQZ5l0YQ==
X-Received: by 2002:aa7:8c02:0:b029:2e9:c513:1e10 with SMTP id c2-20020aa78c020000b02902e9c5131e10mr8376728pfd.2.1623829166727;
        Wed, 16 Jun 2021 00:39:26 -0700 (PDT)
Received: from localhost.localdomain ([115.99.8.69])
        by smtp.gmail.com with ESMTPSA id z18sm1323065pfn.37.2021.06.16.00.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 00:39:26 -0700 (PDT)
From: Shreyas Krishnakumar <shreyaskumar1035@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rtw_efuse: Fix coding style
Date: Wed, 16 Jun 2021 13:09:21 +0530
Message-Id: <20210616073921.156814-1-shreyaskumar1035@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around single statement blocks as warned by
checkpatch.pl

Signed-off-by: Shreyas Krishnakumar <shreyaskumar1035@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 81457467461c..430e2d81924c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -249,9 +249,8 @@ bool		bPseudoTest)
 	u8 bResult;
 	u8 readbyte;
 
-	if (bPseudoTest) {
+	if (bPseudoTest)
 		return Efuse_Read1ByteFromFakeContent(padapter, addr, data);
-	}
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
 	/* 0x34[11]: SW force PGMEN input of efuse to high. (for the bank selected by 0x34[9:8]) */
@@ -291,9 +290,8 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 	u8 bResult = false;
 	u32 efuseValue = 0;
 
-	if (bPseudoTest) {
+	if (bPseudoTest)
 		return Efuse_Write1ByteToFakeContent(padapter, addr, data);
-	}
 
 
 	/*  -----------------e-fuse reg ctrl --------------------------------- */
@@ -319,11 +317,10 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 		tmpidx++;
 	}
 
-	if (tmpidx < 100) {
+	if (tmpidx < 100)
 		bResult = true;
-	} else {
+	else
 		bResult = false;
-	}
 
 	/*  disable Efuse program enable */
 	PHY_SetMacReg(padapter, EFUSE_TEST, BIT(11), 0);
-- 
2.31.1

