Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1863655D2
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909150; cv=none; b=kQL6DcPgoZm2JHtPC+cdokOxja+wyeJPvnYQ4zdGOn1DXv00Yaeh0Mofz6/b2+RZoh4RHlWYzrXiFFL+jjZqNjbqbOdyM5O+qCxnVp6TttF63wUjt7FdC3rLRCuyCduUjeuS0xmDTmuuwui9xbhuZ+cP/cBKCkMG+CFtMIw/LNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909150; c=relaxed/simple;
	bh=TxelF2TlvciIBUPuGANi4gD6woQUYRFw+dD6rtdgk4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dA/pOPhDJuaGRv9DOhu6dt1kV5ZH/H34nQdya0K6mt8WAz/GlReypDe1Z7tPzvUy9Vmw/I4s2TuGB+lJ9+C4Ss7osgRBBuaKnO5SLzTvq5gKYVtF9tSRgqwePVgaz90inZNZdQ/LBEmE+bGJrlEXhc2vRWn9lrm2oXKAX4WwudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alm0EGqr; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alm0EGqr"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-63270abd14fso4020246137.1
        for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 12:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779909147; x=1780513947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tF/rYvIWNr479mr9wAyoz+o8sSO04HMCu+OTpaoH+T8=;
        b=alm0EGqr1L1i5UPki0KAEth7sN3S3UpIOYoXFhiDarBFw2VJlpofZGc5n5CdOCl+B1
         RGW5oJo45WXJ70rcgLXVOKmJEQgYxHQi1bkPmd3FZ3yd2wxNbb/tf2Q7TLuAl5YvBUlO
         sr1JdFA1Airl74lygs35wMRcNDpg6xduM4yORVDRD2bwL5puWFt9heIfvLRvA0m4TkaE
         FAs2wa1ZTQm6qmYK/BaDyAnsey6FD8gq4Ao2CClUR5nM/8pRxooff2D2HhwL0GT9diMT
         WkwH64JeGh5qCKpmM7xu2YzpULTKwUFXJuoLjccnVnde3kie0yWUAo99NKJN7bQ+Fozh
         zsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779909147; x=1780513947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF/rYvIWNr479mr9wAyoz+o8sSO04HMCu+OTpaoH+T8=;
        b=fYjSQQFFhkcHA67I4SUow1NXd/KbQYKUNxUQSJ7W9chHMGua5SrQ54CP351ofwoegV
         vKgzA3nbAUxjeL4GauZsVhdDt7ARo41ZMzcG4JKkRUlbcCOY85CsjFyDj3g9zqEBsDXw
         CMSdKvxjN1+9qs/bUpAtOa8rQqRNvdM6Q3Mi+GkxttSniN97h1c51KNnHUZ0NWdXgAsf
         SUyj4jtSsIKynnywZQ4JR4xEfE/imfZd4sZ3zZwPy0OvAnghgpHJ8mGTjpyN6jMz80QM
         WU0Wrbjq1n0wcEkpmdPNgiunIBXuUSpnG6CA0TO1pOsMUc2AYNqySsbmid9cuPXpQb5D
         7Owg==
X-Forwarded-Encrypted: i=1; AFNElJ8a0MVIjnSSh5H/K+mosKLr8gc0OEXRHXFz2hgXFhKBuuGsFf3bmeS2WLkMlaXdX1VLZpNfS9ZaGkt2zv8L@lists.linux.dev
X-Gm-Message-State: AOJu0YysvemZayu8V1awBowO7MYUy66sshGaddokkhRIPwgJ2uov4vFA
	LUU21Ct6w31KbXIpNHSWlRuv9q2QmKND+sRaD35cWKg24ap9P99yQTKV
X-Gm-Gg: Acq92OG8h2H/Fauwc1lioBRhyR4Xi1e5kJSD3IYhEiEoxzvTsvexPBMaTAxvLDl7muf
	iBLdSnbWlcVDrV4jaRETEDiZIUqIGkvzofFDPPzV6q9YTy4b2Taj3/9rD1R0YUElSIEY+lbz1cK
	+sznYLs2EC+wLa4tJpnIcG4dDeT58Ryc9xgsXlVMcQ6+gbeSkO+l9rfS7t7rOUIk1gtwcNdDvwI
	rBFevOjef93PWJX+CxfB8VOspNZISIfGr2/bJgbF3WRb3mny0Wg6+MTsTj7Qfk/bo1dIrsvzv9n
	6vAI+mM6IEL1/nE/uYkoPL49PO7f41Gs4iWolnjXl/QqKouxrS+ezACC+pcCSgx8oL6jZJuFIzn
	9bwd9Pu9HRrkl+V49msZsY9Wsa6jpQSsW+keCPDXtb8xBf2DuYxvm30SMTwCGUddfjMn6vwmPnj
	E9B9TwsznpTOWTBtFO53l+MyJYpdT944CB3fdB+KGuSJ3E0aTSDpU5yBDTp6AEtVZOW4JrRG1I0
	kFLlu61cqYo1/7sbLiTBGJv5rXhzYSNHw==
X-Received: by 2002:a05:6102:848d:10b0:6a2:f99e:b3cb with SMTP id ada2fe7eead31-6a2f99eb69cmr3132573137.4.1779909146862;
        Wed, 27 May 2026 12:12:26 -0700 (PDT)
Received: from VitalNet.localdomain (186.232.16.162.vitalnetprovedor.com.br. [186.232.16.162])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8850d17sm18067398137.1.2026.05.27.12.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:12:26 -0700 (PDT)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH] staging: vme_user: fix CamelCase macros by converting to uppercase with underscores
Date: Wed, 27 May 2026 16:12:03 -0300
Message-ID: <20260527191203.494292-1-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following CHECK style issues reported by checkpatch.pl:
Avoid CamelCase: <VME_2eVME>
Avoid CamelCase: <VME_2eSST>
Avoid CamelCase: <VME_2eSSTB>
Avoid CamelCase: <VME_2eSST160>
Avoid CamelCase: <VME_2eSST267>
Avoid CamelCase: <VME_2eSST320>

Convert the lowercase 'e' to uppercase 'E' and separate the protocol
naming elements using underscores (e.g., VME_2E_VME). Update all macro
definitions in vme.h and their respective usages across the driver
files to comply with the Linux kernel coding style.

Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index b6413605e..03b7b11c1 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -33,13 +33,13 @@ enum vme_resource_type {
 #define VME_SCT		0x1
 #define VME_BLT		0x2
 #define VME_MBLT	0x4
-#define VME_2eVME	0x8
-#define VME_2eSST	0x10
-#define VME_2eSSTB	0x20
+#define VME_2E_VME	0x8
+#define VME_2E_SST	0x10
+#define VME_2E_SSTB	0x20

-#define VME_2eSST160	0x100
-#define VME_2eSST267	0x200
-#define VME_2eSST320	0x400
+#define VME_2E_SST160	0x100
+#define VME_2E_SST267	0x200
+#define VME_2E_SST320	0x400

 #define	VME_SUPER	0x1000
 #define	VME_USER	0x2000
diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 8abaa3165..ac0871fc1 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1114,8 +1114,8 @@ static int __init fake_init(void)
 		master_image->address_attr = VME_A16 | VME_A24 | VME_A32 |
 			VME_A64;
 		master_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
-			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
-			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
+			VME_2E_VME | VME_2E_SST | VME_2E_SSTB | VME_2E_SST160 |
+			VME_2E_SST267 | VME_2E_SST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		master_image->width_attr = VME_D16 | VME_D32;
 		memset(&master_image->bus_resource, 0,
@@ -1141,8 +1141,8 @@ static int __init fake_init(void)
 			VME_A64 | VME_CRCSR | VME_USER1 | VME_USER2 |
 			VME_USER3 | VME_USER4;
 		slave_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
-			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
-			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
+			VME_2E_VME | VME_2E_SST | VME_2E_SSTB | VME_2E_SST160 |
+			VME_2E_SST267 | VME_2E_SST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		list_add_tail(&slave_image->list,
 			      &fake_bridge->slave_resources);
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 4cf348664..9d466f529 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -551,14 +551,14 @@ static int tsi148_slave_set(struct vme_slave_resource *image, int enabled,

 	/* Setup 2eSST speeds */
 	temp_ctl &= ~TSI148_LCSR_ITAT_2eSSTM_M;
-	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
-	case VME_2eSST160:
+	switch (cycle & (VME_2E_SST160 | VME_2E_SST267 | VME_2E_SST320)) {
+	case VME_2E_SST160:
 		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_160;
 		break;
-	case VME_2eSST267:
+	case VME_2E_SST267:
 		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_267;
 		break;
-	case VME_2eSST320:
+	case VME_2E_SST320:
 		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_320;
 		break;
 	}
@@ -569,11 +569,11 @@ static int tsi148_slave_set(struct vme_slave_resource *image, int enabled,
 		temp_ctl |= TSI148_LCSR_ITAT_BLT;
 	if (cycle & VME_MBLT)
 		temp_ctl |= TSI148_LCSR_ITAT_MBLT;
-	if (cycle & VME_2eVME)
+	if (cycle & VME_2E_VME)
 		temp_ctl |= TSI148_LCSR_ITAT_2eVME;
-	if (cycle & VME_2eSST)
+	if (cycle & VME_2E_SST)
 		temp_ctl |= TSI148_LCSR_ITAT_2eSST;
-	if (cycle & VME_2eSSTB)
+	if (cycle & VME_2E_SSTB)
 		temp_ctl |= TSI148_LCSR_ITAT_2eSSTB;

 	/* Setup address space */
@@ -673,22 +673,22 @@ static int tsi148_slave_get(struct vme_slave_resource *image, int *enabled,
 	*size = (unsigned long long)((vme_bound - *vme_base) + granularity);

 	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_160)
-		*cycle |= VME_2eSST160;
+		*cycle |= VME_2E_SST160;
 	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_267)
-		*cycle |= VME_2eSST267;
+		*cycle |= VME_2E_SST267;
 	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_320)
-		*cycle |= VME_2eSST320;
+		*cycle |= VME_2E_SST320;

 	if (ctl & TSI148_LCSR_ITAT_BLT)
 		*cycle |= VME_BLT;
 	if (ctl & TSI148_LCSR_ITAT_MBLT)
 		*cycle |= VME_MBLT;
 	if (ctl & TSI148_LCSR_ITAT_2eVME)
-		*cycle |= VME_2eVME;
+		*cycle |= VME_2E_VME;
 	if (ctl & TSI148_LCSR_ITAT_2eSST)
-		*cycle |= VME_2eSST;
+		*cycle |= VME_2E_SST;
 	if (ctl & TSI148_LCSR_ITAT_2eSSTB)
-		*cycle |= VME_2eSSTB;
+		*cycle |= VME_2E_SSTB;

 	if (ctl & TSI148_LCSR_ITAT_SUPR)
 		*cycle |= VME_SUPER;
@@ -894,14 +894,14 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,

 	/* Setup 2eSST speeds */
 	temp_ctl &= ~TSI148_LCSR_OTAT_2eSSTM_M;
-	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
-	case VME_2eSST160:
+	switch (cycle & (VME_2E_SST160 | VME_2E_SST267 | VME_2E_SST320)) {
+	case VME_2E_SST160:
 		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_160;
 		break;
-	case VME_2eSST267:
+	case VME_2E_SST267:
 		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_267;
 		break;
-	case VME_2eSST320:
+	case VME_2E_SST320:
 		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_320;
 		break;
 	}
@@ -915,15 +915,15 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,
 		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
 		temp_ctl |= TSI148_LCSR_OTAT_TM_MBLT;
 	}
-	if (cycle & VME_2eVME) {
+	if (cycle & VME_2E_VME) {
 		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
 		temp_ctl |= TSI148_LCSR_OTAT_TM_2eVME;
 	}
-	if (cycle & VME_2eSST) {
+	if (cycle & VME_2E_SST) {
 		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
 		temp_ctl |= TSI148_LCSR_OTAT_TM_2eSST;
 	}
-	if (cycle & VME_2eSSTB) {
+	if (cycle & VME_2E_SSTB) {
 		dev_warn(tsi148_bridge->parent, "Currently not setting Broadcast Select Registers\n");
 		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
 		temp_ctl |= TSI148_LCSR_OTAT_TM_2eSSTB;
@@ -1099,11 +1099,11 @@ static int __tsi148_master_get(struct vme_master_resource *image, int *enabled,

 	/* Setup 2eSST speeds */
 	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_160)
-		*cycle |= VME_2eSST160;
+		*cycle |= VME_2E_SST160;
 	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_267)
-		*cycle |= VME_2eSST267;
+		*cycle |= VME_2E_SST267;
 	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_320)
-		*cycle |= VME_2eSST320;
+		*cycle |= VME_2E_SST320;

 	/* Setup cycle types */
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_SCT)
@@ -1113,11 +1113,11 @@ static int __tsi148_master_get(struct vme_master_resource *image, int *enabled,
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_MBLT)
 		*cycle |= VME_MBLT;
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eVME)
-		*cycle |= VME_2eVME;
+		*cycle |= VME_2E_VME;
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eSST)
-		*cycle |= VME_2eSST;
+		*cycle |= VME_2E_SST;
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eSSTB)
-		*cycle |= VME_2eSSTB;
+		*cycle |= VME_2E_SSTB;

 	if (ctl & TSI148_LCSR_OTAT_SUP)
 		*cycle |= VME_SUPER;
@@ -1404,14 +1404,14 @@ static int tsi148_dma_set_vme_src_attributes(struct device *dev, __be32 *attr,
 	val = be32_to_cpu(*attr);

 	/* Setup 2eSST speeds */
-	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
-	case VME_2eSST160:
+	switch (cycle & (VME_2E_SST160 | VME_2E_SST267 | VME_2E_SST320)) {
+	case VME_2E_SST160:
 		val |= TSI148_LCSR_DSAT_2eSSTM_160;
 		break;
-	case VME_2eSST267:
+	case VME_2E_SST267:
 		val |= TSI148_LCSR_DSAT_2eSSTM_267;
 		break;
-	case VME_2eSST320:
+	case VME_2E_SST320:
 		val |= TSI148_LCSR_DSAT_2eSSTM_320;
 		break;
 	}
@@ -1426,13 +1426,13 @@ static int tsi148_dma_set_vme_src_attributes(struct device *dev, __be32 *attr,
 	if (cycle & VME_MBLT)
 		val |= TSI148_LCSR_DSAT_TM_MBLT;

-	if (cycle & VME_2eVME)
+	if (cycle & VME_2E_VME)
 		val |= TSI148_LCSR_DSAT_TM_2eVME;

-	if (cycle & VME_2eSST)
+	if (cycle & VME_2E_SST)
 		val |= TSI148_LCSR_DSAT_TM_2eSST;

-	if (cycle & VME_2eSSTB) {
+	if (cycle & VME_2E_SSTB) {
 		dev_err(dev, "Currently not setting Broadcast Select Registers\n");
 		val |= TSI148_LCSR_DSAT_TM_2eSSTB;
 	}
@@ -1502,14 +1502,14 @@ static int tsi148_dma_set_vme_dest_attributes(struct device *dev, __be32 *attr,
 	val = be32_to_cpu(*attr);

 	/* Setup 2eSST speeds */
-	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
-	case VME_2eSST160:
+	switch (cycle & (VME_2E_SST160 | VME_2E_SST267 | VME_2E_SST320)) {
+	case VME_2E_SST160:
 		val |= TSI148_LCSR_DDAT_2eSSTM_160;
 		break;
-	case VME_2eSST267:
+	case VME_2E_SST267:
 		val |= TSI148_LCSR_DDAT_2eSSTM_267;
 		break;
-	case VME_2eSST320:
+	case VME_2E_SST320:
 		val |= TSI148_LCSR_DDAT_2eSSTM_320;
 		break;
 	}
@@ -1524,13 +1524,13 @@ static int tsi148_dma_set_vme_dest_attributes(struct device *dev, __be32 *attr,
 	if (cycle & VME_MBLT)
 		val |= TSI148_LCSR_DDAT_TM_MBLT;

-	if (cycle & VME_2eVME)
+	if (cycle & VME_2E_VME)
 		val |= TSI148_LCSR_DDAT_TM_2eVME;

-	if (cycle & VME_2eSST)
+	if (cycle & VME_2E_SST)
 		val |= TSI148_LCSR_DDAT_TM_2eSST;

-	if (cycle & VME_2eSSTB) {
+	if (cycle & VME_2E_SSTB) {
 		dev_err(dev, "Currently not setting Broadcast Select Registers\n");
 		val |= TSI148_LCSR_DDAT_TM_2eSSTB;
 	}
@@ -2361,8 +2361,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			VME_A64 | VME_CRCSR | VME_USER1 | VME_USER2 |
 			VME_USER3 | VME_USER4;
 		master_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
-			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
-			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
+			VME_2E_VME | VME_2E_SST | VME_2E_SSTB | VME_2E_SST160 |
+			VME_2E_SST267 | VME_2E_SST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		master_image->width_attr = VME_D16 | VME_D32;
 		memset(&master_image->bus_resource, 0,
@@ -2386,8 +2386,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		slave_image->address_attr = VME_A16 | VME_A24 | VME_A32 |
 			VME_A64;
 		slave_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
-			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
-			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
+			VME_2E_VME | VME_2E_SST | VME_2E_SSTB | VME_2E_SST160 |
+			VME_2E_SST267 | VME_2E_SST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		list_add_tail(&slave_image->list,
 			      &tsi148_bridge->slave_resources);
---
 drivers/staging/vme_user/vme.h        | 12 ++--
 drivers/staging/vme_user/vme_fake.c   |  8 +--
 drivers/staging/vme_user/vme_tsi148.c | 88 +++++++++++++--------------
 3 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index b6413605e..03b7b11c1 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -33,13 +33,13 @@ enum vme_resource_type {
 #define VME_SCT		0x1
 #define VME_BLT		0x2
 #define VME_MBLT	0x4
-#define VME_2eVME	0x8
-#define VME_2eSST	0x10
-#define VME_2eSSTB	0x20
+#define VME_2E_VME	0x8
+#define VME_2E_SST	0x10
+#define VME_2E_SSTB	0x20
 
-#define VME_2eSST160	0x100
-#define VME_2eSST267	0x200
-#define VME_2eSST320	0x400
+#define VME_2E_SST160	0x100
+#define VME_2E_SST267	0x200
+#define VME_2E_SST320	0x400
 
 #define	VME_SUPER	0x1000
 #define	VME_USER	0x2000
diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 8abaa3165..ac0871fc1 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1114,8 +1114,8 @@ static int __init fake_init(void)
 		master_image->address_attr = VME_A16 | VME_A24 | VME_A32 |
 			VME_A64;
 		master_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
-			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
-			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
+			VME_2E_VME | VME_2E_SST | VME_2E_SSTB | VME_2E_SST160 |
+			VME_2E_SST267 | VME_2E_SST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		master_image->width_attr = VME_D16 | VME_D32;
 		memset(&master_image->bus_resource, 0,
@@ -1141,8 +1141,8 @@ static int __init fake_init(void)
 			VME_A64 | VME_CRCSR | VME_USER1 | VME_USER2 |
 			VME_USER3 | VME_USER4;
 		slave_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
-			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
-			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
+			VME_2E_VME | VME_2E_SST | VME_2E_SSTB | VME_2E_SST160 |
+			VME_2E_SST267 | VME_2E_SST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		list_add_tail(&slave_image->list,
 			      &fake_bridge->slave_resources);
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 4cf348664..9d466f529 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -551,14 +551,14 @@ static int tsi148_slave_set(struct vme_slave_resource *image, int enabled,
 
 	/* Setup 2eSST speeds */
 	temp_ctl &= ~TSI148_LCSR_ITAT_2eSSTM_M;
-	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
-	case VME_2eSST160:
+	switch (cycle & (VME_2E_SST160 | VME_2E_SST267 | VME_2E_SST320)) {
+	case VME_2E_SST160:
 		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_160;
 		break;
-	case VME_2eSST267:
+	case VME_2E_SST267:
 		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_267;
 		break;
-	case VME_2eSST320:
+	case VME_2E_SST320:
 		temp_ctl |= TSI148_LCSR_ITAT_2eSSTM_320;
 		break;
 	}
@@ -569,11 +569,11 @@ static int tsi148_slave_set(struct vme_slave_resource *image, int enabled,
 		temp_ctl |= TSI148_LCSR_ITAT_BLT;
 	if (cycle & VME_MBLT)
 		temp_ctl |= TSI148_LCSR_ITAT_MBLT;
-	if (cycle & VME_2eVME)
+	if (cycle & VME_2E_VME)
 		temp_ctl |= TSI148_LCSR_ITAT_2eVME;
-	if (cycle & VME_2eSST)
+	if (cycle & VME_2E_SST)
 		temp_ctl |= TSI148_LCSR_ITAT_2eSST;
-	if (cycle & VME_2eSSTB)
+	if (cycle & VME_2E_SSTB)
 		temp_ctl |= TSI148_LCSR_ITAT_2eSSTB;
 
 	/* Setup address space */
@@ -673,22 +673,22 @@ static int tsi148_slave_get(struct vme_slave_resource *image, int *enabled,
 	*size = (unsigned long long)((vme_bound - *vme_base) + granularity);
 
 	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_160)
-		*cycle |= VME_2eSST160;
+		*cycle |= VME_2E_SST160;
 	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_267)
-		*cycle |= VME_2eSST267;
+		*cycle |= VME_2E_SST267;
 	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_320)
-		*cycle |= VME_2eSST320;
+		*cycle |= VME_2E_SST320;
 
 	if (ctl & TSI148_LCSR_ITAT_BLT)
 		*cycle |= VME_BLT;
 	if (ctl & TSI148_LCSR_ITAT_MBLT)
 		*cycle |= VME_MBLT;
 	if (ctl & TSI148_LCSR_ITAT_2eVME)
-		*cycle |= VME_2eVME;
+		*cycle |= VME_2E_VME;
 	if (ctl & TSI148_LCSR_ITAT_2eSST)
-		*cycle |= VME_2eSST;
+		*cycle |= VME_2E_SST;
 	if (ctl & TSI148_LCSR_ITAT_2eSSTB)
-		*cycle |= VME_2eSSTB;
+		*cycle |= VME_2E_SSTB;
 
 	if (ctl & TSI148_LCSR_ITAT_SUPR)
 		*cycle |= VME_SUPER;
@@ -894,14 +894,14 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,
 
 	/* Setup 2eSST speeds */
 	temp_ctl &= ~TSI148_LCSR_OTAT_2eSSTM_M;
-	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
-	case VME_2eSST160:
+	switch (cycle & (VME_2E_SST160 | VME_2E_SST267 | VME_2E_SST320)) {
+	case VME_2E_SST160:
 		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_160;
 		break;
-	case VME_2eSST267:
+	case VME_2E_SST267:
 		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_267;
 		break;
-	case VME_2eSST320:
+	case VME_2E_SST320:
 		temp_ctl |= TSI148_LCSR_OTAT_2eSSTM_320;
 		break;
 	}
@@ -915,15 +915,15 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,
 		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
 		temp_ctl |= TSI148_LCSR_OTAT_TM_MBLT;
 	}
-	if (cycle & VME_2eVME) {
+	if (cycle & VME_2E_VME) {
 		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
 		temp_ctl |= TSI148_LCSR_OTAT_TM_2eVME;
 	}
-	if (cycle & VME_2eSST) {
+	if (cycle & VME_2E_SST) {
 		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
 		temp_ctl |= TSI148_LCSR_OTAT_TM_2eSST;
 	}
-	if (cycle & VME_2eSSTB) {
+	if (cycle & VME_2E_SSTB) {
 		dev_warn(tsi148_bridge->parent, "Currently not setting Broadcast Select Registers\n");
 		temp_ctl &= ~TSI148_LCSR_OTAT_TM_M;
 		temp_ctl |= TSI148_LCSR_OTAT_TM_2eSSTB;
@@ -1099,11 +1099,11 @@ static int __tsi148_master_get(struct vme_master_resource *image, int *enabled,
 
 	/* Setup 2eSST speeds */
 	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_160)
-		*cycle |= VME_2eSST160;
+		*cycle |= VME_2E_SST160;
 	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_267)
-		*cycle |= VME_2eSST267;
+		*cycle |= VME_2E_SST267;
 	if ((ctl & TSI148_LCSR_OTAT_2eSSTM_M) == TSI148_LCSR_OTAT_2eSSTM_320)
-		*cycle |= VME_2eSST320;
+		*cycle |= VME_2E_SST320;
 
 	/* Setup cycle types */
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_SCT)
@@ -1113,11 +1113,11 @@ static int __tsi148_master_get(struct vme_master_resource *image, int *enabled,
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_MBLT)
 		*cycle |= VME_MBLT;
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eVME)
-		*cycle |= VME_2eVME;
+		*cycle |= VME_2E_VME;
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eSST)
-		*cycle |= VME_2eSST;
+		*cycle |= VME_2E_SST;
 	if ((ctl & TSI148_LCSR_OTAT_TM_M) == TSI148_LCSR_OTAT_TM_2eSSTB)
-		*cycle |= VME_2eSSTB;
+		*cycle |= VME_2E_SSTB;
 
 	if (ctl & TSI148_LCSR_OTAT_SUP)
 		*cycle |= VME_SUPER;
@@ -1404,14 +1404,14 @@ static int tsi148_dma_set_vme_src_attributes(struct device *dev, __be32 *attr,
 	val = be32_to_cpu(*attr);
 
 	/* Setup 2eSST speeds */
-	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
-	case VME_2eSST160:
+	switch (cycle & (VME_2E_SST160 | VME_2E_SST267 | VME_2E_SST320)) {
+	case VME_2E_SST160:
 		val |= TSI148_LCSR_DSAT_2eSSTM_160;
 		break;
-	case VME_2eSST267:
+	case VME_2E_SST267:
 		val |= TSI148_LCSR_DSAT_2eSSTM_267;
 		break;
-	case VME_2eSST320:
+	case VME_2E_SST320:
 		val |= TSI148_LCSR_DSAT_2eSSTM_320;
 		break;
 	}
@@ -1426,13 +1426,13 @@ static int tsi148_dma_set_vme_src_attributes(struct device *dev, __be32 *attr,
 	if (cycle & VME_MBLT)
 		val |= TSI148_LCSR_DSAT_TM_MBLT;
 
-	if (cycle & VME_2eVME)
+	if (cycle & VME_2E_VME)
 		val |= TSI148_LCSR_DSAT_TM_2eVME;
 
-	if (cycle & VME_2eSST)
+	if (cycle & VME_2E_SST)
 		val |= TSI148_LCSR_DSAT_TM_2eSST;
 
-	if (cycle & VME_2eSSTB) {
+	if (cycle & VME_2E_SSTB) {
 		dev_err(dev, "Currently not setting Broadcast Select Registers\n");
 		val |= TSI148_LCSR_DSAT_TM_2eSSTB;
 	}
@@ -1502,14 +1502,14 @@ static int tsi148_dma_set_vme_dest_attributes(struct device *dev, __be32 *attr,
 	val = be32_to_cpu(*attr);
 
 	/* Setup 2eSST speeds */
-	switch (cycle & (VME_2eSST160 | VME_2eSST267 | VME_2eSST320)) {
-	case VME_2eSST160:
+	switch (cycle & (VME_2E_SST160 | VME_2E_SST267 | VME_2E_SST320)) {
+	case VME_2E_SST160:
 		val |= TSI148_LCSR_DDAT_2eSSTM_160;
 		break;
-	case VME_2eSST267:
+	case VME_2E_SST267:
 		val |= TSI148_LCSR_DDAT_2eSSTM_267;
 		break;
-	case VME_2eSST320:
+	case VME_2E_SST320:
 		val |= TSI148_LCSR_DDAT_2eSSTM_320;
 		break;
 	}
@@ -1524,13 +1524,13 @@ static int tsi148_dma_set_vme_dest_attributes(struct device *dev, __be32 *attr,
 	if (cycle & VME_MBLT)
 		val |= TSI148_LCSR_DDAT_TM_MBLT;
 
-	if (cycle & VME_2eVME)
+	if (cycle & VME_2E_VME)
 		val |= TSI148_LCSR_DDAT_TM_2eVME;
 
-	if (cycle & VME_2eSST)
+	if (cycle & VME_2E_SST)
 		val |= TSI148_LCSR_DDAT_TM_2eSST;
 
-	if (cycle & VME_2eSSTB) {
+	if (cycle & VME_2E_SSTB) {
 		dev_err(dev, "Currently not setting Broadcast Select Registers\n");
 		val |= TSI148_LCSR_DDAT_TM_2eSSTB;
 	}
@@ -2361,8 +2361,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			VME_A64 | VME_CRCSR | VME_USER1 | VME_USER2 |
 			VME_USER3 | VME_USER4;
 		master_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
-			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
-			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
+			VME_2E_VME | VME_2E_SST | VME_2E_SSTB | VME_2E_SST160 |
+			VME_2E_SST267 | VME_2E_SST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		master_image->width_attr = VME_D16 | VME_D32;
 		memset(&master_image->bus_resource, 0,
@@ -2386,8 +2386,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		slave_image->address_attr = VME_A16 | VME_A24 | VME_A32 |
 			VME_A64;
 		slave_image->cycle_attr = VME_SCT | VME_BLT | VME_MBLT |
-			VME_2eVME | VME_2eSST | VME_2eSSTB | VME_2eSST160 |
-			VME_2eSST267 | VME_2eSST320 | VME_SUPER | VME_USER |
+			VME_2E_VME | VME_2E_SST | VME_2E_SSTB | VME_2E_SST160 |
+			VME_2E_SST267 | VME_2E_SST320 | VME_SUPER | VME_USER |
 			VME_PROG | VME_DATA;
 		list_add_tail(&slave_image->list,
 			      &tsi148_bridge->slave_resources);
-- 
2.53.0

