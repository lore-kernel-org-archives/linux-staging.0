Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42794424D79
	for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750596; cv=none; b=ST+JQ4iJfQEdZud3zzJWdhv+Ycv6DC4BYFbYUEo/8C8TAz/H3K+rVXTywKL2gBvVmSFqks9K8CP/B4yH4uCLqEMQAxFIxyR4GXvi0TDxW5LLrhFoviwZZ+UnshraQb7kGK6SGEu+AiuvrMmFTqULIsLIvPUtl3LTQB3WH0jZuCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750596; c=relaxed/simple;
	bh=zNg9hW5D8DfY6cxbJI9eBWDVBL+I9NugvrjlC/Bu+EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eevL2QhXQHnaEDKoZ5idTLSf4qfIbVs/F5eXtcCmyeSAgUcFYa7C/OcJXmwXmSyy3fATnmWE7uALilHl9rN5b6g3TGjh9bSTzQRuIOXos5Vt2RMtPqNHfIgc/YurlbXaPcBvzztp3mbQLJ5wDbR07+1GW9SUItk8m4yp+kg1+kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNTPXXfO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNTPXXfO"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1756500a12.2
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750592; x=1788355392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKiURqLEO6GLiHVAiPzakCM7/0KgqMwtzahpI4nlMQg=;
        b=GNTPXXfOXjBdlBcBaLMQDbDiH5Qj22a7JEy1cSv5FdzS5VbKk7RjivoQ0STN1GODMm
         wY5O3xltEe3ewgROczsvQJHZf+G4SXLxY5zai2912zLFAP4r1NZx6ty8eTDudwh5cHEP
         dp/EVXQktPe2wuKX1VbhHitK8QtLxCZs8+gYfFCzkj7NxSHEbqYJjM3GTbvi+qdEwPlt
         BxdchhP611sbTy22gTTgK1C7P/hkTO+Q0NwqMSCbTGUq6nDf+q40dVdzZ1ZiaHZd0L8T
         hPcn86DEKAD1iDB6JRTXiVue7+Gpt1BLFsi9edXi1Uuxt1EvZNygkLLvh5owFrAE4FgQ
         IEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750592; x=1788355392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKiURqLEO6GLiHVAiPzakCM7/0KgqMwtzahpI4nlMQg=;
        b=gRFMeN8vTxyLRYzKCslk2o6zngOEdDxHnc+WFlO8+oUpw+KTkMlF4kWqV0dV9r4TDO
         ApDv1gwpQCcC3I3X2GuCiVdg5uOxj/vTelbmWiSxS07p715rErah4M8ayUyKREJFR7pH
         TvX2Grez7af31hIIUtepZcqdmwyXVTR0ZKrPs5x5bW7EKwMQf1lCiZTH4spggrZY43di
         rtMsDFnl5EG4QQ88EDIEbKxSZqhtylB0+YatM36/uao8qr+OVF56Xzvy6OtheP+lP9q+
         93Dz7QK2dInSfwRMThjOd+clJ0tokL0GQ7gACQR0MC6fGvn/k9nmQcrmOsf4xm1fjed6
         bR2g==
X-Forwarded-Encrypted: i=1; AHgh+RrlcCbC0tJGCnkSdYOEhyeWtnV8iTSWs2haybGStdn7Xh/L1Jl94bMaITmQdSQjSuy1zqfy8i1LCYgxKOWG@lists.linux.dev
X-Gm-Message-State: AFuF++kfRy4jtbr51vtFIUI+C9fzgD6j5E/r+FhlHxX9GHhZB/BuyV1m
	KqHi4XPRbrkJJpt/UX213yAVp4gjkDI8Jh7S1owBvvySey4ZL+W3pri3
X-Gm-Gg: AR+sD132vrLwJZuvq+8eR+8b4+hr7ySvze9zvIM72f+qrkFIoypCpUHwmchUfCvvs0W
	IZ4AUTwulWmbP+8PuetT1hxQs22AfYuXeQMDMbnjqPLlf6CyZJ9rzcdZAVkkalrAoC0mTidbqNj
	z5CIxh42n3d1QOgHbsalz9+Q+f5vv53AHvapLxVKiBYAlCk8CLrLlZSvIPgeTllacNhPxP7I/4z
	NWcRDWumDD6nNMHgrUQOli0ZKxhz1yrCogob9wEixKGSQNClH/iKSN+AOxosXAdA8RyXatw/5i/
	2S0vwefQFYW53RYuydhEHW/RSwxLot2d1ap4NCKMvB0TgnX4DQbxlNA9XXH255himK7tMqFnyff
	rW8JDHUKNaSuu9ULqbOe7L9CKXq/AL9LzhPr1PahiwJeHEgB7qaTuMIppguOImkFp2gheEFFdGQ
	idJhZcl+1bLFy94mXA/UqEDwco4T37Jt1+Pk8wrCYyXMqTJiL1r/ARrmthSVwTrKz4QwNXz09HQ
	hE/gaXnYZoWO2emjPjSrfBsPZibPy7cAHIygBQ+H5A=
X-Received: by 2002:a05:6402:5057:b0:6a5:dd97:23ea with SMTP id 4fb4d7f45d1cf-6a5df65b681mr8136749a12.11.1787750592156;
        Wed, 26 Aug 2026 06:23:12 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:11 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 4/8] media: atomisp: Add Yoga Book camera configuration
Date: Wed, 26 Aug 2026 15:22:52 +0200
Message-ID: <20260826132256.3343451-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator; front OVTI2740 uses two lanes and no actuator.

Add both sensor configurations and a DMI-scoped two-lane override for
OVTI2740:00. Keep the quirk limited to Lenovo YB1-X91L systems.

Binding and media nodes do not prove streaming; both sensors and the
focus actuator still require physical tests.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..207ab69385b5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -360,6 +374,8 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false),	/* OV2740 */
 	{}
 };
 
-- 
2.53.0

