Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDC42560
	for <linux-staging@lists.linux.dev>; Sun,  4 Dec 2022 10:19:20 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so12231509pjc.3
        for <linux-staging@lists.linux.dev>; Sun, 04 Dec 2022 02:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2fSlUnMO/6t25t/a1TF0aEDuwOExF29IGAIYrpdFAPg=;
        b=d7a5DRPgcOJQ2TIwVAt0hAZwlXkQ4E4X01QQaSCgoy/a0H+kL3NYjZKtDsbJeqr0g6
         nEg/HMTc6soeTxkoEdqyUr1SAdtCVLpXYa7YazbtUYc1K44UUj8iM33O7jcJmlxvgJOE
         c2esxiAOwBL9kkjV0a3hRoVEjqe73aPzmCCdmyb55s4FGKpnkQGmpyvK8X7Sk9DkBTKN
         msQk7/KoSmrBRIxwSEmpUoaaRHVn+oOua6fssy025dxuLO7Iwg8uJg3zc2cQ/MnQQwMS
         6MP4gkyMEnkwLNw/HmLsCUmL8yAw9PGYA8H9DFE3+lk41IDAk3/BWYhZUIk0P/vbw9N4
         bm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2fSlUnMO/6t25t/a1TF0aEDuwOExF29IGAIYrpdFAPg=;
        b=gVcrgGDAV4nR1zRVzDDRkhMv1fptuV7YRJFaJ4MwM3pUr7WC2LGWPx9AqxVm8cShTX
         PC8lro8KEwtaUvx2kSOD0F7/iplhly1ByEn0COp65BfLHx8u2YFz0M0k4srV9/hA+kNR
         AweDa44l411nsp3R/V3ka9bLE4lL0816IysnC+890vVEmA85+dTm1nG6qsod+RruLshw
         gviOwXmfNoZQXEvE3spNWBb46RKQUEoW0HDkjH/X5ZD4kI2kEOvRVM8mdbQB4lmfvp+N
         q2iP3MF0mitXMpcA5+LM9cODcasyA5+g6WlXZzgmnkxkG9SZZHivulfpKoxy+9m4tE6f
         N0Fg==
X-Gm-Message-State: ANoB5pmaN1NKhsxYWwunQSiNfy1CIabfJluLHiGvWZIuaH2d+M+5bgMN
	mTteLwAJjHmQlqh751weOjAPa9Gkry97Yg1+
X-Google-Smtp-Source: AA0mqf7q9fKb012dnfOLIaniOoXOQajQ08Iv2R+aCpp9/UAgYxW5GfjAcJ+IkARDr5PrcS7JNIHTKQ==
X-Received: by 2002:a17:90a:b298:b0:212:f923:2f90 with SMTP id c24-20020a17090ab29800b00212f9232f90mr81856509pjr.93.1670149159930;
        Sun, 04 Dec 2022 02:19:19 -0800 (PST)
Received: from zoo868e (1-170-26-182.dynamic-ip.hinet.net. [1.170.26.182])
        by smtp.gmail.com with ESMTPSA id lt19-20020a17090b355300b00218f5de49f4sm9426293pjb.1.2022.12.04.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 02:19:19 -0800 (PST)
Date: Sun, 4 Dec 2022 18:19:16 +0800
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: remove multiple blank lines
Message-ID: <20221204101916.GA51992@zoo868e>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove multiple unnecessary blank lines in accordance with the Linux
kernel coding-style regulations. The issues were reported by the
checkpatch script.

Signed-off-by: Matt Jan <zoo868e@gmail.com>
---
 drivers/staging/vme_user/vme.h        | 2 --
 drivers/staging/vme_user/vme_fake.c   | 5 -----
 drivers/staging/vme_user/vme_tsi148.c | 6 ------
 drivers/staging/vme_user/vme_tsi148.h | 7 -------
 4 files changed, 20 deletions(-)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index b204a9b4be1b..98da8d039d60 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -27,7 +27,6 @@ enum vme_resource_type {
 #define VME_A64_MAX	0x10000000000000000ULL
 #define VME_CRCSR_MAX	0x1000000ULL
 
-
 /* VME Cycle Types */
 #define VME_SCT		0x1
 #define VME_BLT		0x2
@@ -185,6 +184,5 @@ int vme_bus_num(struct vme_dev *);
 int vme_register_driver(struct vme_driver *, unsigned int);
 void vme_unregister_driver(struct vme_driver *);
 
-
 #endif /* _VME_H_ */
 
diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index dd646b0c531d..a9d3a7f5c440 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -356,7 +356,6 @@ static int __fake_master_get(struct vme_master_resource *image, int *enabled,
 	return 0;
 }
 
-
 static int fake_master_get(struct vme_master_resource *image, int *enabled,
 		unsigned long long *vme_base, unsigned long long *size,
 		u32 *aspace, u32 *cycle, u32 *dwidth)
@@ -373,7 +372,6 @@ static int fake_master_get(struct vme_master_resource *image, int *enabled,
 	return retval;
 }
 
-
 static void fake_lm_check(struct fake_driver *bridge, unsigned long long addr,
 			  u32 aspace, u32 cycle)
 {
@@ -1060,7 +1058,6 @@ static void fake_crcsr_exit(struct vme_bridge *fake_bridge)
 	kfree(bridge->crcsr_kernel);
 }
 
-
 static int __init fake_init(void)
 {
 	int retval, i;
@@ -1238,7 +1235,6 @@ static int __init fake_init(void)
 
 }
 
-
 static void __exit fake_exit(void)
 {
 	struct list_head *pos = NULL;
@@ -1294,7 +1290,6 @@ static void __exit fake_exit(void)
 	root_device_unregister(vme_root);
 }
 
-
 MODULE_PARM_DESC(geoid, "Set geographical addressing");
 module_param(geoid, int, 0);
 
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 0171f46d1848..482049cfc664 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -34,7 +34,6 @@
 static int tsi148_probe(struct pci_dev *, const struct pci_device_id *);
 static void tsi148_remove(struct pci_dev *);
 
-
 /* Module parameter */
 static bool err_chk;
 static int geoid;
@@ -673,7 +672,6 @@ static int tsi148_slave_get(struct vme_slave_resource *image, int *enabled,
 	/* Need granularity before we set the size */
 	*size = (unsigned long long)((vme_bound - *vme_base) + granularity);
 
-
 	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_160)
 		*cycle |= VME_2eSST160;
 	if ((ctl & TSI148_LCSR_ITAT_2eSSTM_M) == TSI148_LCSR_ITAT_2eSSTM_267)
@@ -1142,7 +1140,6 @@ static int __tsi148_master_get(struct vme_master_resource *image, int *enabled,
 	return 0;
 }
 
-
 static int tsi148_master_get(struct vme_master_resource *image, int *enabled,
 	unsigned long long *vme_base, unsigned long long *size, u32 *aspace,
 	u32 *cycle, u32 *dwidth)
@@ -1244,7 +1241,6 @@ static ssize_t tsi148_master_read(struct vme_master_resource *image, void *buf,
 	return retval;
 }
 
-
 static ssize_t tsi148_master_write(struct vme_master_resource *image, void *buf,
 	size_t count, loff_t offset)
 {
@@ -2000,7 +1996,6 @@ static int tsi148_lm_get(struct vme_lm_resource *lm,
 	if ((lm_ctl & TSI148_LCSR_LMAT_AS_M) == TSI148_LCSR_LMAT_AS_A64)
 		*aspace |= VME_A64;
 
-
 	if (lm_ctl & TSI148_LCSR_LMAT_SUPR)
 		*cycle |= VME_SUPER;
 	if (lm_ctl & TSI148_LCSR_LMAT_NPRIV)
@@ -2551,7 +2546,6 @@ static void tsi148_remove(struct pci_dev *pdev)
 
 	bridge = tsi148_bridge->driver_priv;
 
-
 	dev_dbg(&pdev->dev, "Driver is being unloaded.\n");
 
 	/*
diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index 226fedc6f167..b3cb4a089cc8 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -87,7 +87,6 @@ struct tsi148_dma_entry {
  *                                Control and Status Registers
  */
 
-
 /*
  *  Command/Status Registers (CRG + $004)
  */
@@ -342,7 +341,6 @@ static const int TSI148_LCSR_VIACK[8] = { 0, TSI148_LCSR_VIACK1,
 #define TSI148_LCSR_IT7_ITOFL		0x3F4
 #define TSI148_LCSR_IT7_ITAT		0x3F8
 
-
 #define TSI148_LCSR_IT0		0x300
 #define TSI148_LCSR_IT1		0x320
 #define TSI148_LCSR_IT2		0x340
@@ -464,7 +462,6 @@ static const int TSI148_LCSR_IT[8] = { TSI148_LCSR_IT0, TSI148_LCSR_IT1,
 #define TSI148_LCSR_DMA0	0x500
 #define TSI148_LCSR_DMA1	0x580
 
-
 static const int TSI148_LCSR_DMA[TSI148_MAX_DMA] = { TSI148_LCSR_DMA0,
 						TSI148_LCSR_DMA1 };
 
@@ -532,9 +529,6 @@ static const int TSI148_GCSR_MBOX[4] = { TSI148_GCSR_MBOX0,
 #define TSI148_CSRBSR	0xFF8
 #define TSI148_CBAR	0xFFC
 
-
-
-
 	/*
 	 *  TSI148 Register Bit Definitions
 	 */
@@ -828,7 +822,6 @@ static const int TSI148_GCSR_MBOX[4] = { TSI148_GCSR_MBOX0,
 #define TSI148_LCSR_VEAT_AM_M          (0x3F<<8)	/* Address Mode Mask */
 #define TSI148_LCSR_VEAT_XAM_M         (0xFF<<0)	/* Master AMode Mask */
 
-
 /*
  * VMEbus PCI Error Diagnostics PCI/X Attributes Register  CRG + $280
  */
-- 
2.25.1

