Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C733793B4
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199283; cv=none; b=Q/MPcwR2ai91rIrH0ojKJnWGr+qfiZyhUJ66BQxIEVdVA0u5hC1m2ady9Vdr1PuIEPzAC0W69X3x0sf8T2NjSxR1xePXdxWX0SWrnKJS4UG+WXprOPwHLoBsGKDVnrWxIf24XSoO+eFClBxGqXctztKK8/3D3JpMENG+1Zcn+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199283; c=relaxed/simple;
	bh=dGRaBeE3nJd2FiUEsWNK0qhtWpUCzITGhWfU6u54kVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjAZg+nA6swX35guVY2r/xf+Drz0Dk8M9VcHwFE5a2x4W959l0qotLLFXeWOtav4YldUcEH2r/ud3wACQVww0HSt6CeUOAmgoflo1SOzKGTiGZr3lsW72w66xVXod5wpHIPOHZQ6ks+92joaQCjzw+qnJAFL6oGJ9YX3Dt4WMb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdFYsYYp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdFYsYYp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de0093c42so12807f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199279; x=1788804079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGGUFeBAj4JyjV5WQU/FItRd64MCygQVYmp7iNEyrvI=;
        b=RdFYsYYpx36iShu8pDrCWWjDUEo6TKngvHD0JFOIfUKUNISHgewan4KMzW755cqvn1
         2ko2disnobx4zVSrX+rIvrasPeZsRC0Q1o+2xo32fDJa9ZaIRXE0dzNg+fGR2oCtpdzB
         f+XYqQp7AA6Bp7xkTMGjLqLS6tpm68G1pRiN3z8lA/Dr2WM7rzOl44tav2WYQ42sE8m6
         YXuXSZkCWcm7oquOAtp5z0mQbH+6pu9SUeCRASzWqhvhUkKS3ZZ1e1yb6lxwM6BFMrrS
         VU0xkwssNgABPJ7Zu6W47Kl8t7u0nVCz84Vqd97DXhdL2A23anN/DawPeO5xjOqA+Jji
         zicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199279; x=1788804079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGGUFeBAj4JyjV5WQU/FItRd64MCygQVYmp7iNEyrvI=;
        b=H9Y5q72fwUAym6rKS5ubJ2/zJVwtFKeTHi4gCujQQ79YGQX9VowejO/lfdo7TiDNPc
         YUaMrASKy014i33XMTFnE+mFOmTpYh1IKEqLFptaH9aXvIYsjNdOWWujn5DfBbEJ7l6a
         cmUIQZKPcNS2K7jsrhKy9bucky4kz0vDvlvem7h2JaSO5Qm6he1vkSc4551j0aOHhtkA
         2S095ePZhgGbBCamL1HD3Bidbx2fEyq+mRiB66NxRGV8Ip6fLkr6wYc20rY1g/3VHZOX
         G3rKyQ7N3ZcLC0Z4F0OUadIWGpIkm8/y1MHzJdD1sTKjTJ/NV3IMkANV00U2oD4DOj3R
         I5uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUFx24wo7XNIQXCvNm8ipDYVpoiJpFHT4e7lDtqovKUSkW/Pqtkr59ZLBDDt6zWUg2CZ0qHfZiZ+R3wuAB@lists.linux.dev
X-Gm-Message-State: AFuF++mbaNC6Kp1nH6NLDQ/wvYyTWWTev4/fZ9bg8zwoCLQc14UzsFT/
	3NJV5qk6O5ABAm8uuCMMlCY5AswBn0wOA255dTz8kvmiJPEIe8FPnHgW
X-Gm-Gg: AYBFou2eMseDmVAsraCZXxEFxjVRv5wIjFIoJgbUVoq8UoDtkNb22o+ryVtn/2QsUpB
	kvwwFeSqtfaTB03ORl1m+G4H1kjc8L1KJiteAgZZBfm0gfC656ejZbx7int3++Fb2/Uu3uSp85V
	37d652hp16fqEtKizKBd0Qn9TByiTHFmJ+9I33nH5TfQS7Xf0A3ERn2apmQ4yAsGhuKOZq3oWAT
	kMg9m0f5ST9f8ejP9HN1Yr0zxxhKTqtRjfDNOFmax6n/uDkB0qGRcvuMDe3NgJlovLyqOvN5Gms
	xZM6YyA6geRMbVrxEHjfNaIMG6yztA6WozXJgKNcBDa7t0khk9TRdgCiGrHDwo8sd540uhCxd94
	sthwtYui9sdG2CP/DDqi9GzGbQypCn8x5W7MgICazf8W2DtSs8+eWwa/evpQVvm5Ki5JzkGVJx5
	G4ebBMSFCBnbOXMC1ewczrmDKWYL7jc/T/D/PT9Y87Lcv27NUnhDn4UKGjie0VYqvQlnwSwF1a9
	I7JFxju0dODQ7MJ9IOV0yJkIvqlLMrM1YKqbNc0TV8=
X-Received: by 2002:a05:6000:288c:b0:484:3bb9:25ca with SMTP id ffacd0b85a97d-4843bb92758mr14491965f8f.12.1788199279230;
        Mon, 31 Aug 2026 11:01:19 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:18 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 07/16] media: atomisp: Add Yoga Book camera configuration
Date: Mon, 31 Aug 2026 20:00:52 +0200
Message-ID: <20260831180101.3109854-8-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
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
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
With Best Regards,
Maurizio Casciano

