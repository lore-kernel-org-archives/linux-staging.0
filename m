Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880DC2E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759316; cv=none; b=IG0xvoCSHsJX2fz15kOB/Ggt86adzYSn+j718Za+iBbDXR2fcLVfen9OWT8mcZlo+vAZD8FcLEdyRgJyCnqeDdtObqI6p6sWH1v/zk8VEyoiiwTvmCblXNmCoFbt8VaPNGcsNYvmt6kIZax+h5N5Nz5hNmlOoWIBmBp/0gOahHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759316; c=relaxed/simple;
	bh=LK0jc6OiqiLToHVH+veqzKzGb2Q/9macRx/S+pZUfTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LD6lNiFNUMk/RagvMLGmrZhU2957BkJD0dwWs3GhhcE5kwB1igdE+OcOTq8ru/j6hbDOD632EnetIcbc5vSyop061IydVS8sXl6Gkeg4V9gNcWtoA8KGA45M4pyMldAhoa81/o1uDNn+ScIMlMfSv9NjsuNVix8neMW/06CQRjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAr+XsqB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAr+XsqB"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso2448877e87.3
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759314; x=1778364114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhg54AZZWIq7HCOKbz8oeWBDcN8UCaPTZKhrElwj0r8=;
        b=NAr+XsqBloY6FuOnMajpiyfhoQpjsJGvPb1Ka2dB46I2pilsef79ihFRDVtYSRGk6i
         c38BrZafABz5jaCNVvUvpdQ1txP2m/krSHqBzQ0qoR4CsJx2SNAx4TZObR91v/R8o7Jh
         +qBn+RkbJOOcQoxADgdIONEh266Z+DYPbEQcmqs3mVSvO/ISP5rUXvPzpEwQGYZ9/JSl
         wXMWB/B54HU6QvCXzh8bUyGSV/P+VPRM230QZTpvp7++VKdZlchE9py+gejxnbMmiKw6
         b4cGh8Wth1+annVhqJAOWpJ49j8cFzlyUBzQYbd9Dw7UyPPokib/0sHMyEcCIGtg9D6X
         OaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759314; x=1778364114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhg54AZZWIq7HCOKbz8oeWBDcN8UCaPTZKhrElwj0r8=;
        b=NYYBuoTZeqWq0Qm82N20M49P7iAsl53mXyJFTbc9dKjpUL8QbGfHssbQrhsBKCDioV
         YDGT3SAfQWqWhebfRwtfDLxelBmcftFtFDKuxSnmedQ+75wO9Z7W8AzoVjk7CqPzPqgH
         vidCreBh8ryJG7UqmUMfO9uZ9xgcI5/wUrloJzk0qlcPRKw+NDY5Vmq7NpTWdsluvz28
         Q3oBKd8A65sR7EIM4U2fC7efywhYQcjB8B0H5zkL1MUms4XMTMNU24rhCw+Lo/HA6etI
         6dpVUr1KO/EDN432ohLA617h+VGvKkoGlo9rN0RYpYqnZ/cXlm+nqaIhvVHk2HbfIFma
         CW5A==
X-Gm-Message-State: AOJu0Yy+o6WExBbE/NdWr6/RsKJ2idenDdtJ+DRpuw/M5qiA3TJ7Pj/L
	2DX/V7ZwBWmaNt8u7508ywlCWxT7Mj5jRsqJj2ZxFpaoTQ4pcjsYBbFu/zlQPA==
X-Gm-Gg: AeBDiesEdLqCNTb1lyrjCBJGwvjxtOx/X7EgeHklBbN53jdoL1BXeUVycZUgLHyIyMF
	Rgid8gBORUwud5HzT3daivfVrCmxFtoHWG8X3dQdIA3P+ug9EMqbpI58675b8iNqnqSwsbAaUx2
	Fj/n0gLIyNE9wFGoUKrH1Ke7WHYSnbycI11phs7C5K4GrkTUIXFpwSQ98fRtBwGF3ikiOtO551C
	yhRT+CwlhD4aac2h9jkFV4dxnHz2ve53ZWKiMCFFRp9RuRZ8nM7Wf0ov7M0oBAtOpmzMphhCz06
	+ntHblnWJUf5Vy++xiLAouiRkg6kSp/6ZzNdwNytIAxuSJ7IDffow3KN+Sd/djIM8Mv+4W4clyB
	Yhq+8DWyOfABnEYkTtUOz8yXkGLOihgWKeiYoaAEgVcSwXDPP5x/d3E1Xb3kFor4dq94iUnLcRN
	ynyz3uup4PKTP59nnJzQd02bzGsjNsZzRmV1k=
X-Received: by 2002:a05:6512:3c9d:b0:5a4:10b5:ccbe with SMTP id 2adb3069b0e04-5a862fbce85mr1088435e87.17.1777759313728;
        Sat, 02 May 2026 15:01:53 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:53 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 10/10] staging: rtl8723bs: remove include/HalVerDef.h file
Date: Sun,  3 May 2026 00:55:49 +0300
Message-ID: <20260502220056.59815-11-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502220056.59815-1-nikolayof23@gmail.com>
References: <20260502220056.59815-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove this file and several enumerations from it, as they are not used
anywhere in the driver code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/HalVerDef.h | 45 -------------------
 drivers/staging/rtl8723bs/include/hal_com.h   |  1 -
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  1 -
 3 files changed, 47 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/HalVerDef.h

diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
deleted file mode 100644
index 9b607543133f..000000000000
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef __HAL_VERSION_DEF_H__
-#define __HAL_VERSION_DEF_H__
-
-/*  hal_ic_type_e */
-enum hal_ic_type_e { /* tag_HAL_IC_Type_Definition */
-	CHIP_8723B	=	8,
-};
-
-/* hal_chip_type_e */
-enum hal_chip_type_e { /* tag_HAL_CHIP_Type_Definition */
-	TEST_CHIP		=	0,
-	NORMAL_CHIP	=	1,
-	FPGA			=	2,
-};
-
-/* hal_cut_version_e */
-enum hal_cut_version_e { /* tag_HAL_Cut_Version_Definition */
-	A_CUT_VERSION		=	0,
-	B_CUT_VERSION		=	1,
-	C_CUT_VERSION		=	2,
-	D_CUT_VERSION		=	3,
-	E_CUT_VERSION		=	4,
-	F_CUT_VERSION		=	5,
-	G_CUT_VERSION		=	6,
-	H_CUT_VERSION		=	7,
-	I_CUT_VERSION		=	8,
-	J_CUT_VERSION		=	9,
-	K_CUT_VERSION		=	10,
-};
-
-/*  HAL_Manufacturer */
-enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
-	CHIP_VENDOR_TSMC	=	0,
-	CHIP_VENDOR_UMC		=	1,
-	CHIP_VENDOR_SMIC	=	2,
-};
-
-
-#endif
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index cf775585c8e2..7bbf62cfd825 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -7,7 +7,6 @@
 #ifndef __HAL_COMMON_H__
 #define __HAL_COMMON_H__
 
-#include "HalVerDef.h"
 #include "hal_pg.h"
 #include "hal_phy.h"
 #include "hal_phy_reg.h"
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index ffd03927841c..8e04e6a4cb01 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -118,7 +118,6 @@ struct rt_firmware_hdr {
 #define WMM_NORMAL_PAGE_NUM_LPQ_8723B 0x20
 #define WMM_NORMAL_PAGE_NUM_NPQ_8723B 0x20
 
-#include "HalVerDef.h"
 #include "hal_com.h"
 
 #define EFUSE_OOB_PROTECT_BYTES 15
-- 
2.54.0

