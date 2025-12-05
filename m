Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F053161AA
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933714; cv=none; b=BO5DWVYhHclK0CONTjF4yW9lF5I8TwM4kwcpeyxeNa4VZ7Rnfbjq1jHDk5wscFSdQurSc4f+bvXl0iVyyYxKMAl069XVDlO7o3mPy+qgMG+8Jmf050lkReUM1SxnCjC7dGo1YCNh0umbG7TN8IwLtrhc56g3NWmE+ZcaTfTRCXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933714; c=relaxed/simple;
	bh=2/gAulKtzzFr7YJbE8Gp5IY/e1RbiN7OHhRPWyb3QN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QN5cLgTYTvfRFHbKJRWAh3TyOCfBAx0f879x99k4t3V62rHDP5oBoYokhICK7XyZxqvH2hRjv31QacMO639GcXUcyvSCPnPJvAdTx7Tx4VWcgtukPtnOETREfJBopmHcuxeb57seDPVIJ92KSF+XsEPkyKMsj3b7xi7T754ceqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J78S9c+x; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J78S9c+x"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso1656791b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Dec 2025 03:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764933710; x=1765538510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P55QFDL5j85Vhd3CMucSVVVZVJ9u57AheboaCTxtyrw=;
        b=J78S9c+xm8pnYW9d1a92j/dDN5xGQQyK2XC2+CTp0PG7qZd8Nd/io3jYXC03XWQNHF
         kLSqkhip+4X1UItGP6gZNbBW8DLG40iCymQmvMzKkWuxsKMePOn37f/SHfV+6d548uUa
         C4fWMiyd40Z9D4mPflhNLrzjNfiYQOESmFmB8aEexACoYOXdUVSlTVdQOQNhE+gH6AfN
         BJlN2BO2Fz0Lfl3DlPlkGc9heFOtovXee6lIMgr/lWqmfAcIteHxSXY+qUReDqLLp6c7
         eLI87aHh2pDMDqQLsmXLWL6SbpjkU0OKY+eQvMls5JrAnZcUMfRKkjCCsZBpNo7Mqwoi
         wD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933710; x=1765538510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P55QFDL5j85Vhd3CMucSVVVZVJ9u57AheboaCTxtyrw=;
        b=hVaoBHoJXdL9K+KSSyDMunDpWWOG/1mKeHndPo1a/dSIwipSkvPs9E7pinF9c37y4W
         VQNhT8bIQIkn3SOuF9BNbY2bjtpA9oa/8G9/w+Mcql2ulAAjCZXFIf0d3GMQPIb1kO5d
         2zb0ww8YZhafvirFU2JRqvaZ6ze1tEQmUumAQwagK9rqf/AvzqvB3W2ozU03/Si04ds6
         PRv0/F+bhzYc7J61b03d55J7ye6I3rLhijxefHNvpJD3JvYfPMIw/ajUstYe761679U1
         h2l3EnWOwBFOEpngQtDsgHbtBdM0oTobRUmuDiqaOCvmEGy3q9A6Q+rm2tOo5T+jPQgZ
         PYEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFGKuMgnVjs9Cdx5EOVUnwyw7xAOBaF+jS1gHVU5FzLMI3hvfnW/aQaqhFGKvuDQrVw17BIOOakm2wFfSw@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx+fWb4dbZ7lM28mXoVHcrqC8Br4jY5Ph+stcnxBqLty5tyqsf
	dy6aYGW4zIhpiMnLT4QHxD2Zm9lLVfc8cPwH6XwcMKGB0nVi/GyCvL21
X-Gm-Gg: ASbGncvtaSpGdz7CQYC3WLjPEV7vOv2sgiyhLl4++iiE0ME9HblYkT72AUFUH4+V5eO
	nT+hpAV64dTFWLfnuNtH0f8b+wXY7fXuSeH5HuGCEpPGsYOrj5p7hzSMoZuQKj99OK+fb45BKCE
	rYvJKCQRYZrnErp1hLcZ09ZGctG4eVCnem2Fr8OnBvI5OtauC9FrtBx7O27aHBaAuGOUaY5XUXA
	GWzMqaZ17U5y0CnhaBrS9HizOogR0/EaOc9lkNBzZhaB2WMeTRcdp1XgYdJq+HumikXr0nI29Jb
	NxgpfVXq9NH37XA0wwMZ7w1jKErXYaAX2hVNwdDQxZMz2/Q98eC+9GpjZ3av3GzmtRZQ/MP/cZn
	7xCUBj+nxAIFQZgUwiGnCF+JwYJL+5/oodpOEMO/2t4rPEN74VLcDE8Sa1IgRtSs7G/wPwpQeVb
	AhAjY/YHJ7xVGR
X-Google-Smtp-Source: AGHT+IFy2MHfCerrGnaj1Qc+/LL4wDTJCmzPsBHd2bOjZVbGPNG91rncOd1PgzI9xp3MZTEio0x3zw==
X-Received: by 2002:a05:7022:e1f:b0:11b:af12:ba30 with SMTP id a92af1059eb24-11df643bf9emr4174980c88.8.1764933709822;
        Fri, 05 Dec 2025 03:21:49 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76edd4fsm15756550c88.8.2025.12.05.03.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:21:49 -0800 (PST)
From: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
Subject: [PATCH v6] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
Date: Fri,  5 Dec 2025 08:21:38 -0300
Message-ID: <20251205112138.3431-1-julio191096@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from the deprecated of_property_read_bool() to the common
device_property_read_bool() API. This makes the driver agnostic to
the underlying firmware interface (DT or ACPI) and simplifies the
logic.

Since the driver is no longer strictly dependent on Device Tree,
include <linux/mod_devicetable.h> directly for the struct
of_device_id definition, instead of relying on implicit inclusion
via <linux/of_irq.h>, which has been removed as it is unused.

Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
to better reflect the agnostic nature of the new implementation.

Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
---

Changes in v6:
    - Aligned function arguments with the open parenthesis in function declaration.

Changes in v5:
    - Fixed 'From' header mismatch(updated git config user.name)
    - Fixed indentation aligment in function declaration as pointed out
    by Dan Carpenter

Changes in v4:
    -  Fixed a typo in the v3 commit

Changes in v3:
  - Added changelog history as requested by the maintainer bot.

Changes in v2:
  - Shortened the subject line to match subsystem standards.
  - Updated Signed-off-by to use full real name.

 drivers/staging/greybus/arche-apb-ctrl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 90ab32638d3f..33f26a65f0cc 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -10,13 +10,14 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
-#include <linux/of_irq.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
+#include <linux/mod_devicetable.h>
 #include "arche_platform.h"
 
 static void apb_bootret_deassert(struct device *dev);
@@ -314,8 +315,8 @@ static ssize_t state_show(struct device *dev,
 
 static DEVICE_ATTR_RW(state);
 
-static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
-				     struct arche_apb_ctrl_drvdata *apb)
+static int apb_ctrl_get_fw_data(struct platform_device *pdev,
+				struct arche_apb_ctrl_drvdata *apb)
 {
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -378,7 +379,7 @@ static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
 	}
 
 	/* Only applicable for platform >= V2 */
-	if (of_property_read_bool(pdev->dev.of_node, "gb,spi-en-active-high"))
+	if (device_property_read_bool(&pdev->dev, "gb,spi-en-active-high"))
 		apb->spi_en_polarity_high = true;
 
 	return 0;
@@ -394,7 +395,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
 	if (!apb)
 		return -ENOMEM;
 
-	ret = apb_ctrl_get_devtree_data(pdev, apb);
+	ret = apb_ctrl_get_fw_data(pdev, apb);
 	if (ret) {
 		dev_err(dev, "failed to get apb devicetree data %d\n", ret);
 		return ret;
@@ -403,7 +404,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
 	/* Initially set APB to OFF state */
 	apb->state = ARCHE_PLATFORM_STATE_OFF;
 	/* Check whether device needs to be enabled on boot */
-	if (of_property_read_bool(pdev->dev.of_node, "arche,init-disable"))
+	if (device_property_read_bool(&pdev->dev, "arche,init-disable"))
 		apb->init_disabled = true;
 
 	platform_set_drvdata(pdev, apb);
-- 
2.52.0

