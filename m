Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3692DAFC8
	for <linux-staging@lists.linux.dev>; Mon, 25 Aug 2025 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116932; cv=none; b=YcoKJBkscUu+SDT+hEAW3JhHMBgm498qGiJ96RNObclH2SNumLqdulDRZoxjW90wHQDYFIJmu6ibYyT/oKYTDjN/FQpJAUt6lgCYMBiPhKDL2mdcLl85CLGyRXZD5F/istTrAdaYDZ+ujDk+U01XSnOBsvgT9RNkwYzaZO7ebhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116932; c=relaxed/simple;
	bh=MfxlT6HHPLQ0+q+ChRWLyrMPR9Pk4NLHBouZRnY/i8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liSf3m/F9lDqJqtJguPYDe40V3YhIU4mHzwUABsACZuWnwjfA9jU2r/qKEohFL/GZOLalNvYesmLG/u8MYSm4sjsPKFFbVlOCRo9FI5700D5Fi9wcI1hrtHMNLRcG5u3qSR+/hBK3IbQ6MLTQjgXE1vuUvBa72fRQnxd9Nibjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET8sESUJ; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET8sESUJ"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70d9d415a2dso39991816d6.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Aug 2025 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756116925; x=1756721725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFt0F6s62CwKTaaArfzgIuwwDW3kJdXGRmblHfk+gSs=;
        b=ET8sESUJdugQkTmtSpzgazBDqIk49NDbNWLw33UCwAKtT/PbrKupFG9C+0KJ13/f59
         DiBt/AsPP0uZWsoeMX3ipr4s/thSpKYcUAlK+Wi5A3TIToqdOsXmr6l2DtigxRFrYJe/
         owhBhZRwf6G4hc/Ypy3PCS8NUSDxRXybC1GifqH3HYNQzdig9kgE9/MO846FAHZTxaQ4
         fFF4idp0SHWULgMgv+2zlK4cQ3byQs0QbZv2g8aMSoH+Lkq031QKj5dKgC/dkhPCJqAj
         bsv+diWqduxq65HooCVWBSSeQ+53dw3D5i6X/FAOezFcPF/lYEkJlraa9KynWdCL2oDe
         L82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116925; x=1756721725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFt0F6s62CwKTaaArfzgIuwwDW3kJdXGRmblHfk+gSs=;
        b=b6a18E5Rk2x0aSlIP+9GdMIGltLYbjgIKfE+KMnfhCqCOLfFi+ABW/EyjV1TYon+gf
         MkO9CZitn9Jnie52eTZ1ABDfCvYvd2cWbcZJ3JKBJCn+5mJ9qiSPxr9msqJ+g21eo8H5
         jx12ACJQXYdnZF4PQS6Wi1h7Z9+IAEjaCfBLWlq8IzXIb7BAJtY3opznTnzzSnaNrBqU
         Gwc3JfkSQID8ursAnUPBALVve8usdexDlvxeXCsCDKc66AtcRha8I3nIJpM2CNuzMGnI
         R8mdXZw1O7mhlhyC0rXVKfqGiSaI+j9UgC6unecXD4F/3lp5S/P5NOFq0eTMw/j9rWJj
         u3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXtD0DUfv+SSrW+fT6D0q1/t+1nLJG4CzBx4gVorecJbCuCwZoVXt0EWRKDlXTsNfyZx4OMnXiTm1P1/w3m@lists.linux.dev
X-Gm-Message-State: AOJu0YwJrUnrb6+quSvAqavROWlQKHxcAyYPcb9+hH/owDr9h3lczLyB
	Ly3PTAcCIIMNRo0qQwGsMgaIcRoNa+0nJDxIrWLokKdJoCLTr9ugmaXy
X-Gm-Gg: ASbGncsLRThRe72qHkcou+AbnBBB6T8qeN5Ttq+QonkjkLUd6eWph7MEjt7lRD80931
	huYU9nQ0A/TAjjNnQc9OpV7niEhfU7vSQcuuz3X8UlxUGFR0utn1khqFxXnC0cNt2awhWeaEz5s
	aUkQ0/jzxCoX3XSNT8OdniQ/qZCVoKafSV3bweKx986yXSJgllRxbytQpqVO0Nc1yzrx7FOzBZR
	aKO2bwXTHyxfPIwz80WW1PwL+n2a3Qm+hkYqed48w6zVwaGfogkGV45HbkoqvbRr2c7SfsQrFpz
	fnLEGNt05X4SDdjdKRxapWphPeoPhZkk6ZJccMrZyhXr5dDDgYZePlm2aXh3z+Rj9aC2DYBN57W
	XqcZwdsaqj8bzRsScXobIbhm2eLFnwvgZ+68G3JrAxMWOUy/JLlkUC243GiDH/AFBN+T6
X-Google-Smtp-Source: AGHT+IHlkzDGXGPpU1EkxS+EnYzPt4rNJbW1yGdDiMh8qobFS6uk9AAWfFNiWTDwM+ogqrK8zjcWSQ==
X-Received: by 2002:ad4:5766:0:b0:70d:bec9:4807 with SMTP id 6a1803df08f44-70dbec94a59mr28601966d6.8.1756116924984;
        Mon, 25 Aug 2025 03:15:24 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72c9fcdsm43128106d6.60.2025.08.25.03.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:15:24 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: andy@kernel.org,
	hansg@kernel.or,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH v2] media: atomisp: Use string choices helpers
Date: Mon, 25 Aug 2025 03:15:15 -0700
Message-ID: <20250825101515.953993-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use string_choices.h helpers instead of hard-coded strings.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
Changes in v2:
 - Split the patch into two: one for staging/media/atomisp and one for
   staging/media/ipu3
 - Corrected the order of #include statements

 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c     | 3 ++-
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c    | 5 +++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c             | 5 +++--
 .../staging/media/atomisp/pci/runtime/binary/src/binary.c    | 3 ++-
 drivers/staging/media/atomisp/pci/sh_css.c                   | 3 ++-
 5 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..e5d80611d009 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -27,6 +27,7 @@
 
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>
 
 /* Assume max number of ACC stages */
 #define MAX_ACC_STAGES	20
@@ -841,7 +842,7 @@ int atomisp_css_irq_enable(struct atomisp_device *isp,
 {
 	dev_dbg(isp->dev, "%s: css irq info 0x%08x: %s (%d).\n",
 		__func__, info,
-		enable ? "enable" : "disable", enable);
+		str_enable_disable(enable), enable);
 	if (ia_css_irq_enable(info, enable)) {
 		dev_warn(isp->dev, "%s:Invalid irq info: 0x%08x when %s.\n",
 			 __func__, info,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 964cc3bcc0ac..8ba53021133d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..812230397409 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -16,6 +16,7 @@
 #include <linux/dmi.h>
 #include <linux/interrupt.h>
 #include <linux/bits.h>
+#include <linux/string_choices.h>
 #include <media/v4l2-fwnode.h>
 
 #include <asm/iosf_mbi.h>
@@ -527,7 +528,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
 			   MRFLD_ISPSSPM0_IUNIT_POWER_OFF;
 
-	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
+	dev_dbg(isp->dev, "IUNIT power-%s.\n", str_on_off(enable));
 
 	/* WA for P-Unit, if DVFS enabled, ISP timeout observed */
 	if (IS_CHT && enable && !isp->pm_only) {
@@ -569,7 +570,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 		usleep_range(100, 150);
 	} while (1);
 
-	dev_err(isp->dev, "IUNIT power-%s timeout.\n", enable ? "on" : "off");
+	dev_err(isp->dev, "IUNIT power-%s timeout.\n", str_on_off(enable));
 	return -EBUSY;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..2a4db605c126 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/math.h>
+#include <linux/string_choices.h>
 
 #include <math_support.h>
 #include <gdc_device.h>	/* HR_GDC_N */
@@ -1241,7 +1242,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		dev_dbg(atomisp_dev, "Using binary %s (id %d), type %d, mode %d, continuous %s\n",
 			xcandidate->blob->name, xcandidate->sp.id, xcandidate->type,
 			xcandidate->sp.pipeline.mode,
-			xcandidate->sp.enable.continuous ? "true" : "false");
+			str_true_false(xcandidate->sp.enable.continuous));
 
 	if (err)
 		dev_err(atomisp_dev, "Failed to find a firmware binary matching the pipeline parameters\n");
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..cbade11087d9 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7,6 +7,7 @@
 /*! \file */
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/vmalloc.h>
 
 #include "hmm.h"
@@ -1478,7 +1479,7 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	enum ia_css_pipe_id pipe_id;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p, map = %s",
-			     stream, map ? "true" : "false");
+			     stream, str_true_false(map));
 
 	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
-- 
2.47.3

