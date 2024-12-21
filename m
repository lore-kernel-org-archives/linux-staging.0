Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85791145B14
	for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734818749; cv=none; b=WBVPfBlGtvXog8YA3qRGb5HQjnD50+R1Dfe1r5wPyfR523qnn2FMlBGggTjEVPuBicFr4M53gu2VofhvwBLKWlGYBD9otjXrpMRApZ9f0OpemtcjBRdIbfpVmQ6XgiO8PpPpY1vTU6kAWArL89Aj5zgTvyLcyPeUEWkvqZUhagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734818749; c=relaxed/simple;
	bh=9l8HCqi9u9KTSjEezdj9+j+JOoAh/Kg4QT1e1W1GkvM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=btcQov27yU2TdlC1EIdw3KOr/kRMqkjf2Nr+DhQhKW2F17Vjy4NeTDaFawM0alGmUS97em6C0di9yHtIJ77w/bCQKfuw6+wqpxUbL58JweWLS9sOr8iAhr7bCmjLc9BP+a+P1wbukXrasAtz+nDdP71DpOxlmMzRIhYMAOdbN2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzQ5ox90; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzQ5ox90"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so403726a91.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 14:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734818747; x=1735423547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SeAkuv4TWODrCWJntiDCNjsSi74+4jqmzTXg1yoW2XE=;
        b=HzQ5ox908zlrTv7QFiOBnkOGBLAK31eS1msb1YlI6NRvWka5wklZLKAl5ouw9sUtiz
         YcNhlKDwvQBcIW/f+tdXpvQD/+4aZvXTpPzmrbDVNj+8St864gvYwsUXj2ZAuhDhJAvr
         mACFBWx12Zf2zl2JKxCc1VdugdiafU5YXgKP8xyKWIEjxtwyJ+T/OQSMNAChzzUt2aPG
         DP7d9wJJq0+Nly8/9IcBLGzHcO0NM79sl2DpFa4h9i6RxQ1l3rDFOPgiE3lsyIf98LK+
         QyFw14Xu5Ail1kfyXMOflSFNeAnfTROA9Gh80VlJEzgc+qZqiM0Bmb2DeP4vEQPSVtNw
         yICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734818747; x=1735423547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SeAkuv4TWODrCWJntiDCNjsSi74+4jqmzTXg1yoW2XE=;
        b=Z1u36ij81dz1rp7vIg9AnedpjU8wXh7C6cAMaxrU9PQvu7fws5koT5ywAEudKC0D1B
         fci9JeiFfIAag7u1CZkHnx+hMxSCNeJEJLzJ1kCJ0iZYK47elGAV4T8DIdDWTxAod0p6
         +R5Tnu92Wg61CRwpW7oI4tbJSOsagpWS1T/KysLHNS9hHFROV/2B77k+Di/MXv4BJQil
         3n0taBQVWIvtult4yquGfaCyQH8bF7ghhO2mBtSWjtuR0yqeZ3s8ppnmgTfaSLkPS5qT
         FVCzo6jiQDbRN0CRjSt8zw7q3KKHN1Sn4BESuZnbkga5Eyn8Mw3hHHu2h3ZmmYOvXITE
         Xlxg==
X-Forwarded-Encrypted: i=1; AJvYcCX17vG+vp+gf98LLt+7Y3HtTmdk2CIjXXZJVcfp2M53sasoAmDocJJOd9SdcKpz3Z1OZL+s6H2yPxdc/qvW@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkw6AJzhnwJtg5z9p47bbAfrNNg9pSNoP4OHxr5X7AI6MGbkjX
	nyDjPmf7QucBjP0DXJ7kEFKaogSQcNIP065URb350YlN8Mpr5+J9
X-Gm-Gg: ASbGncuELDrz4Demk2RJj0nzhH2FqURwCGLbXR/ZtaamdwmMnv67TsFZN6X8k/uKdgW
	L+YOw9AZyRw9j6T7Cai9wsboAN7Ba04wUDdZgpuTxIVdOgUPK0WYwBfhgPkchx/ji9XhrJjUR1c
	2OdyD+ORrYwmpOFTaypcC4c/Rr+tb88cHHlTtRClXlVCbAaNm8dxdsBwmSI39tWnScgqaVAjJo2
	U2uZPD6vA951RZIYAd79GWdOPogNyaUnDJnBMipBuw068614LBRoQw=
X-Google-Smtp-Source: AGHT+IF2W/jvdk9jk+qwZefUBa+Mmnii6nqxNpbN3Yx+WsVtHGrl4jB0hG9FqkFxssO0YGa/qx+64w==
X-Received: by 2002:a17:903:2449:b0:215:a3fd:61f8 with SMTP id d9443c01a7336-219e6f10ab8mr39290375ad.10.1734818746607;
        Sat, 21 Dec 2024 14:05:46 -0800 (PST)
Received: from ice.. ([171.76.82.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964b84sm48338385ad.50.2024.12.21.14.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 14:05:46 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	roheetchavan@gmail.com,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	niharchaithanya@gmail.com,
	kees@ijzerbout.nl,
	m.omerfarukbulut@gmail.com,
	skhan@linuxfoundation.org,
	everestkc@everestkc.com.np,
	dominik.karol.piatkowski@protonmail.com,
	nathan@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: gpib: Add error handling
Date: Sun, 22 Dec 2024 03:18:24 +0530
Message-Id: <20241221214822.163667-1-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail when kmalloc()
fails but it does not return an error code.
The function pcmcia_register_driver() returns an error code but
most of the times is not handled in gpib.

Modify gpid_register_driver() to return appropriate error code
and also handle the error code returned by pcmcia_register_driver()
incase it fails. When any of these functions fail unwind and
unregister the driver to avoid semi-registered system.

This issue was reported by Coverity Scan.
Report:
CID 1635894: (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
dead_error_line: Execution cannot reach this statement: return -1;.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
v2 --> v3 : Modified the gpib_register_driver() to return error code,
            added error handling to all the places that the
            gpib_register_driver() is called.

v1 --> v2 : Replaced the redundant cb_pcmcia_init_module() with
            pcmcia_register_driver().

Link to v1 : https://lore.kernel.org/all/20241221022632.20931-1-niharchaithanya@gmail.com/
Link to v2 : https://lore.kernel.org/all/20241221091121.35476-1-niharchaithanya@gmail.com/
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 21 +++-
 .../gpib/agilent_82357a/agilent_82357a.c      | 13 ++-
 drivers/staging/gpib/cb7210/cb7210.c          | 96 ++++++++++++++-----
 drivers/staging/gpib/cec/cec_gpib.c           | 12 +--
 drivers/staging/gpib/common/gpib_os.c         |  7 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 28 ++++--
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 45 ++++++---
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  6 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  8 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      | 14 ++-
 drivers/staging/gpib/include/gpibP.h          |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c         | 78 ++++++++++-----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  6 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 13 ++-
 drivers/staging/gpib/pc2/pc2_gpib.c           | 30 +++++-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 87 +++++++++++++----
 16 files changed, 355 insertions(+), 111 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 53006d0cc79c..39420f2b0b32 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -909,14 +909,25 @@ static int __init agilent_82350b_init_module(void)
 	int result;
 
 	result = pci_register_driver(&agilent_82350b_pci_driver);
-	if (result) {
-		pr_err("agilent_82350b: pci_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
-	gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
+	result = gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_unaccel;
+
+	result = gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
+	if (result)
+		goto err_interface;
+
 	return 0;
+
+err_interface:
+	gpib_unregister_driver(&agilent_82350b_unaccel_interface);
+err_unaccel:
+	pci_unregister_driver(&agilent_82350b_pci_driver);
+
+	return result;
 }
 
 static void __exit agilent_82350b_exit_module(void)
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index bf05fb4a736b..60311ce8d164 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1691,14 +1691,21 @@ static struct usb_driver agilent_82357a_bus_driver = {
 static int __init agilent_82357a_init_module(void)
 {
 	int i;
+	int ret = 0;
 
 	pr_info("agilent_82357a_gpib driver loading");
 	for (i = 0; i < MAX_NUM_82357A_INTERFACES; ++i)
 		agilent_82357a_driver_interfaces[i] = NULL;
-	usb_register(&agilent_82357a_bus_driver);
-	gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
 
-	return 0;
+	ret = usb_register(&agilent_82357a_bus_driver);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&agilent_82357a_gpib_interface, THIS_MODULE);
+	if (ret)
+		usb_deregister(&agilent_82357a_bus_driver);
+
+	return ret;
 }
 
 static void __exit agilent_82357a_exit_module(void)
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 63df7f3eb3f3..f34654262b78 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1353,7 +1353,11 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
 
 int cb_pcmcia_init_module(void)
 {
-	pcmcia_register_driver(&cb_gpib_cs_driver);
+	int ret;
+
+	ret = pcmcia_register_driver(&cb_gpib_cs_driver);
+	if (ret < 0)
+		pr_err("cb_gpib_cs: pcmcia_register_driver failed\n");
 	return 0;
 }
 
@@ -1506,32 +1510,80 @@ void cb_pcmcia_detach(gpib_board_t *board)
 
 static int __init cb7210_init_module(void)
 {
-	int err = 0;
-	int result;
+	int ret;
 
-	result = pci_register_driver(&cb7210_pci_driver);
-	if (result) {
-		pr_err("cb7210: pci_driver_register failed!\n");
-		return result;
-	}
+	ret = pci_register_driver(&cb7210_pci_driver);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&cb_pci_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci;
+
+	ret = gpib_register_driver(&cb_isa_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa;
+
+	ret = gpib_register_driver(&cb_pci_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_accel;
+
+	ret = gpib_register_driver(&cb_pci_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_unaccel;
+
+	ret = gpib_register_driver(&cb_isa_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa_accel;
 
-	gpib_register_driver(&cb_pci_interface, THIS_MODULE);
-	gpib_register_driver(&cb_isa_interface, THIS_MODULE);
-	gpib_register_driver(&cb_pci_accel_interface, THIS_MODULE);
-	gpib_register_driver(&cb_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&cb_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&cb_isa_unaccel_interface, THIS_MODULE);
-
-#ifdef GPIB__PCMCIA
-	gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
-	gpib_register_driver(&cb_pcmcia_accel_interface, THIS_MODULE);
-	gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
-	err += cb_pcmcia_init_module();
+	ret = gpib_register_driver(&cb_isa_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa_unaccel;
+
+#ifdef GPIB_PCMCIA
+	ret = gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia;
+
+	ret = gpib_register_driver(&cb_pcmcia_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_accel;
+
+	ret = gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_unaccel;
+
+	ret = pcmcia_register_driver(&cb_gpib_cs_driver);
+	if (ret)
+		goto err_pcmcia_driver;
 #endif
-	if (err)
-		return -1;
 
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	gpib_unregister_driver(&cb_pcmcia_unaccel_interface);
+err_pcmcia_unaccel:
+	gpib_unregister_driver(&cb_pcmcia_accel_interface);
+err_pcmcia_accel:
+	gpib_unregister_driver(&cb_pcmcia_interface);
+err_pcmcia:
+#endif
+	gpib_unregister_driver(&cb_isa_unaccel_interface);
+err_isa_unaccel:
+	gpib_unregister_driver(&cb_isa_accel_interface);
+err_isa_accel:
+	gpib_unregister_driver(&cb_pci_unaccel_interface);
+err_pci_unaccel:
+	gpib_unregister_driver(&cb_pci_accel_interface);
+err_pci_accel:
+	gpib_unregister_driver(&cb_isa_interface);
+err_isa:
+	gpib_unregister_driver(&cb_pci_interface);
+err_pci:
+	pci_unregister_driver(&cb7210_pci_driver);
+
+	return ret;
 }
 
 static void __exit cb7210_exit_module(void)
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 3dc933deb401..ffa366c30ac5 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -361,17 +361,17 @@ static struct pci_driver cec_pci_driver = {
 
 static int __init cec_init_module(void)
 {
-	int result;
+	int result = 0;
 
 	result = pci_register_driver(&cec_pci_driver);
-	if (result) {
-		pr_err("cec_gpib: pci_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
-	gpib_register_driver(&cec_pci_interface, THIS_MODULE);
+	result = gpib_register_driver(&cec_pci_interface, THIS_MODULE);
+	if (result)
+		pci_unregister_driver(&cec_pci_driver);
 
-	return 0;
+	return result;
 }
 
 static void cec_exit_module(void)
diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 405237d8cb47..07795df3b721 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2094,18 +2094,19 @@ void init_gpib_descriptor(gpib_descriptor_t *desc)
 	atomic_set(&desc->io_in_progress, 0);
 }
 
-void gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
+int gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
 {
 	struct gpib_interface_list_struct *entry;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
 	if (!entry)
-		return;
+		return -ENOMEM;
 
 	entry->interface = interface;
 	entry->module = provider_module;
 	list_add(&entry->list, &registered_drivers);
-	pr_info("gpib: registered %s interface\n", interface->name);
+
+	return 0;
 }
 EXPORT_SYMBOL(gpib_register_driver);
 
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 3f938ab0c84d..2efc0226ec2b 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -1154,17 +1154,31 @@ static int __init fluke_init_module(void)
 	int result;
 
 	result = platform_driver_register(&fluke_gpib_platform_driver);
-	if (result) {
-		pr_err("fluke_gpib: platform_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
-	gpib_register_driver(&fluke_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fluke_hybrid_interface, THIS_MODULE);
-	gpib_register_driver(&fluke_interface, THIS_MODULE);
+	result = gpib_register_driver(&fluke_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_unaccel;
+
+	result = gpib_register_driver(&fluke_hybrid_interface, THIS_MODULE);
+	if (result)
+		goto err_hybrid;
+
+	result = gpib_register_driver(&fluke_interface, THIS_MODULE);
+	if (result)
+		goto err_interface;
 
-	pr_info("fluke_gpib\n");
 	return 0;
+
+err_interface:
+	gpib_unregister_driver(&fluke_hybrid_interface);
+err_hybrid:
+	gpib_unregister_driver(&fluke_unaccel_interface);
+err_unaccel:
+	platform_driver_unregister(&fluke_gpib_platform_driver);
+
+	return result;
 }
 
 static void __exit fluke_exit_module(void)
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 62791db1c34a..5caca0223c66 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1690,24 +1690,43 @@ static int __init fmh_gpib_init_module(void)
 	int result;
 
 	result = platform_driver_register(&fmh_gpib_platform_driver);
-	if (result) {
-		pr_err("fmh_gpib: platform_driver_register failed!\n");
-		return result;
-	}
+	if (result)
+		goto err_platform_driver;
 
 	result = pci_register_driver(&fmh_gpib_pci_driver);
-	if (result) {
-		pr_err("fmh_gpib: pci_driver_register failed!\n");
-		return result;
-	}
+	if (result)
+		goto err_pci_driver;
+
+	result = gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_unaccel;
+
+	result = gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
+	if (result)
+		goto err_interface;
+
+	result = gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
+	if (result)
+		goto err_pci_unaccel;
 
-	gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
+	result = gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
+	if (result)
+		goto err_pci;
 
-	pr_info("fmh_gpib\n");
 	return 0;
+
+err_pci:
+	gpib_unregister_driver(&fmh_gpib_pci_unaccel_interface);
+err_pci_unaccel:
+	gpib_unregister_driver(&fmh_gpib_interface);
+err_interface:
+	gpib_unregister_driver(&fmh_gpib_unaccel_interface);
+err_unaccel:
+	pci_unregister_driver(&fmh_gpib_pci_driver);
+err_pci_driver:
+	platform_driver_unregister(&fmh_gpib_platform_driver);
+
+	return result;
 }
 
 static void __exit fmh_gpib_exit_module(void)
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index a2d562cbd65b..2f1fdb6f0802 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1341,8 +1341,12 @@ return_to_local : bb_return_to_local,
 
 static int __init bb_init_module(void)
 {
-	gpib_register_driver(&bb_interface, THIS_MODULE);
+	int result = gpib_register_driver(&bb_interface, THIS_MODULE);
 
+	if (result) {
+		gpib_unregister_driver(&bb_interface);
+		return result;
+	}
 	dbg_printk(0, "module loaded with pin map \"%s\"%s\n",
 		   pin_map, (sn7516x_used) ? " and SN7516x driver support" : "");
 	return 0;
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 40afe42aea47..1c44a865ad05 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -325,7 +325,13 @@ void hp82335_detach(gpib_board_t *board)
 
 static int __init hp82335_init_module(void)
 {
-	gpib_register_driver(&hp82335_interface, THIS_MODULE);
+	int result = gpib_register_driver(&hp82335_interface, THIS_MODULE);
+
+	if (result) {
+		gpib_unregister_driver(&hp82335_interface);
+		return result;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 8ad1c885a9fb..daf5f6e02bd5 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -807,9 +807,17 @@ MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
 
 static int __init hp_82341_init_module(void)
 {
-	gpib_register_driver(&hp_82341_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&hp_82341_interface, THIS_MODULE);
-	return 0;
+	int ret = 0;
+
+	ret = gpib_register_driver(&hp_82341_unaccel_interface, THIS_MODULE);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&hp_82341_interface, THIS_MODULE);
+	if (ret)
+		gpib_unregister_driver(&hp_82341_unaccel_interface);
+
+	return ret;
 }
 
 static void __exit hp_82341_exit_module(void)
diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 5fc42b645ab7..d0cd42c1a0ad 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -17,7 +17,7 @@
 #include <linux/fs.h>
 #include <linux/interrupt.h>
 
-void gpib_register_driver(gpib_interface_t *interface, struct module *mod);
+int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
 void gpib_unregister_driver(gpib_interface_t *interface);
 struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9d8387c3bf01..dda9205bfd97 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1227,12 +1227,6 @@ static struct pcmcia_driver ines_gpib_cs_driver = {
 	.resume		= ines_gpib_resume,
 };
 
-int ines_pcmcia_init_module(void)
-{
-	pcmcia_register_driver(&ines_gpib_cs_driver);
-	return 0;
-}
-
 void ines_pcmcia_cleanup_module(void)
 {
 	DEBUG(0, "ines_cs: unloading\n");
@@ -1420,28 +1414,68 @@ void ines_pcmcia_detach(gpib_board_t *board)
 
 static int __init ines_init_module(void)
 {
-	int err = 0;
+	int ret;
 
-	err = pci_register_driver(&ines_pci_driver);
-	if (err) {
-		pr_err("ines_gpib: pci_driver_register failed!\n");
-		return err;
-	}
+	ret = pci_register_driver(&ines_pci_driver);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&ines_pci_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci;
+
+	ret = gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_unaccel;
+
+	ret = gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_accel;
+
+	ret = gpib_register_driver(&ines_isa_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa;
 
-	gpib_register_driver(&ines_pci_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_isa_interface, THIS_MODULE);
 #ifdef GPIB_PCMCIA
-	gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
-	err += ines_pcmcia_init_module();
+	ret = gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia;
+
+	ret = gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_unaccel;
+
+	ret = gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_accel;
+
+	ret = pcmcia_register_driver(&ines_gpib_cs_driver);
+	if (ret)
+		goto err_pcmcia_driver;
 #endif
-	if (err)
-		return -1;
 
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	gpib_unregister_driver(&ines_pcmcia_accel_interface);
+err_pcmcia_accel:
+	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
+err_pcmcia_unaccel:
+	gpib_unregister_driver(&ines_pcmcia_interface);
+err_pcmcia:
+#endif
+	gpib_unregister_driver(&ines_isa_interface);
+err_isa:
+	gpib_unregister_driver(&ines_pci_accel_interface);
+err_pci_accel:
+	gpib_unregister_driver(&ines_pci_unaccel_interface);
+err_pci_unaccel:
+	gpib_unregister_driver(&ines_pci_interface);
+err_pci:
+	pci_unregister_driver(&ines_pci_driver);
+
+	return ret;
 }
 
 static void __exit ines_exit_module(void)
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 796c3a5be545..3e826ab89bc7 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1181,7 +1181,11 @@ static int usb_gpib_init_module(struct usb_interface *interface)
 		return rv;
 
 	if (!assigned_usb_minors) {
-		gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
+		rv = gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
+		if (rv) {
+			gpib_unregister_driver(&usb_gpib_interface);
+			goto exit;
+		}
 	} else {
 		/* check if minor is already registered - maybe useless, but if
 		 *  it happens the code is inconsistent somewhere
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index b7b6fb1be379..f20a23a023d9 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2619,14 +2619,21 @@ static struct usb_driver ni_usb_bus_driver = {
 static int __init ni_usb_init_module(void)
 {
 	int i;
+	int ret = 0;
 
 	pr_info("ni_usb_gpib driver loading\n");
 	for (i = 0; i < MAX_NUM_NI_USB_INTERFACES; i++)
 		ni_usb_driver_interfaces[i] = NULL;
-	usb_register(&ni_usb_bus_driver);
-	gpib_register_driver(&ni_usb_gpib_interface, THIS_MODULE);
 
-	return 0;
+	ret = usb_register(&ni_usb_bus_driver);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&ni_usb_gpib_interface, THIS_MODULE);
+	if (ret)
+		usb_deregister(&ni_usb_bus_driver);
+
+	return ret;
 }
 
 static void __exit ni_usb_exit_module(void)
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 7b3b34f47341..1d42ced67b2c 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -635,12 +635,34 @@ void pc2_2a_detach(gpib_board_t *board)
 
 static int __init pc2_init_module(void)
 {
-	gpib_register_driver(&pc2_interface, THIS_MODULE);
-	gpib_register_driver(&pc2a_interface, THIS_MODULE);
-	gpib_register_driver(&pc2a_cb7210_interface, THIS_MODULE);
-	gpib_register_driver(&pc2_2a_interface, THIS_MODULE);
+	int ret;
+
+	ret = gpib_register_driver(&pc2_interface, THIS_MODULE);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&pc2a_interface, THIS_MODULE);
+	if (ret)
+		goto err_pc2a;
+
+	ret = gpib_register_driver(&pc2a_cb7210_interface, THIS_MODULE);
+	if (ret)
+		goto err_cb7210;
+
+	ret = gpib_register_driver(&pc2_2a_interface, THIS_MODULE);
+	if (ret)
+		goto err_pc2_2a;
 
 	return 0;
+
+err_pc2_2a:
+	gpib_unregister_driver(&pc2a_cb7210_interface);
+err_cb7210:
+	gpib_unregister_driver(&pc2a_interface);
+err_pc2a:
+	gpib_unregister_driver(&pc2_interface);
+
+	return ret;
 }
 
 static void __exit pc2_exit_module(void)
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index e49a952fa0d8..573544e86598 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1523,30 +1523,85 @@ static int __init tnt4882_init_module(void)
 	int result;
 
 	result = pci_register_driver(&tnt4882_pci_driver);
-	if (result) {
-		pr_err("tnt4882: pci_driver_register failed!\n");
+	if (result)
 		return result;
-	}
 
-	gpib_register_driver(&ni_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nat4882_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nat4882_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nec_isa_interface, THIS_MODULE);
-	gpib_register_driver(&ni_nec_isa_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pci_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pci_accel_interface, THIS_MODULE);
+	result = gpib_register_driver(&ni_isa_interface, THIS_MODULE);
+	if (result)
+		goto err_isa;
+
+	result = gpib_register_driver(&ni_isa_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_isa_accel;
+
+	result = gpib_register_driver(&ni_nat4882_isa_interface, THIS_MODULE);
+	if (result)
+		goto err_nat4882_isa;
+
+	result = gpib_register_driver(&ni_nat4882_isa_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_nat4882_isa_accel;
+
+	result = gpib_register_driver(&ni_nec_isa_interface, THIS_MODULE);
+	if (result)
+		goto err_nec_isa;
+
+	result = gpib_register_driver(&ni_nec_isa_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_nec_isa_accel;
+
+	result = gpib_register_driver(&ni_pci_interface, THIS_MODULE);
+	if (result)
+		goto err_pci;
+
+	result = gpib_register_driver(&ni_pci_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_pci_accel;
+
 #ifdef GPIB_PCMCIA
-	gpib_register_driver(&ni_pcmcia_interface, THIS_MODULE);
-	gpib_register_driver(&ni_pcmcia_accel_interface, THIS_MODULE);
-	if (init_ni_gpib_cs() < 0)
-		return -1;
+	result = gpib_register_driver(&ni_pcmcia_interface, THIS_MODULE);
+	if (result)
+		goto err_pcmcia;
+
+	result = gpib_register_driver(&ni_pcmcia_accel_interface, THIS_MODULE);
+	if (result)
+		goto err_pcmcia_accel;
+
+	result = init_ni_gpib_cs();
+	if (result)
+		goto err_pcmcia_driver;
 #endif
 
 	mite_init();
 	mite_list_devices();
-
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	gpib_unregister_driver(&ni_pcmcia_accel_interface);
+err_pcmcia_accel:
+	gpib_unregister_driver(&ni_pcmcia_interface);
+err_pcmcia:
+#endif
+	gpib_unregister_driver(&ni_pci_accel_interface);
+err_pci_accel:
+	gpib_unregister_driver(&ni_pci_interface);
+err_pci:
+	gpib_unregister_driver(&ni_nec_isa_accel_interface);
+err_nec_isa_accel:
+	gpib_unregister_driver(&ni_nec_isa_interface);
+err_nec_isa:
+	gpib_unregister_driver(&ni_nat4882_isa_accel_interface);
+err_nat4882_isa_accel:
+	gpib_unregister_driver(&ni_nat4882_isa_interface);
+err_nat4882_isa:
+	gpib_unregister_driver(&ni_isa_accel_interface);
+err_isa_accel:
+	gpib_unregister_driver(&ni_isa_interface);
+err_isa:
+	pci_unregister_driver(&tnt4882_pci_driver);
+
+	return result;
 }
 
 static void __exit tnt4882_exit_module(void)
-- 
2.34.1

