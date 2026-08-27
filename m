Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE483E4C75
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872677; cv=none; b=H+i/3ry8RB23SpOPTiVDxKPPFJZDOaRRrUKoIgFm4faewQooL3nrDmF3EeRCp/S0bIz9OxTNgSGGakPhxwdJkbe83Kvta9kZZvhaY0F48F4D1k6fbbXxF4eSIQmJDg2+pDTYMoClWm9pzST3Iwm3t/LnNK5oJnm4flXtc9wdeQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872677; c=relaxed/simple;
	bh=pljKBt0ZqgK/u5wnmw7D7yDX+T1Gj3r0Q4vuQLP73RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLV4CoJQgHrWMsrT7TNjlD9oaeJADvPlr2XSZ/DkXTeqz2Kt/cGspt191d6Sy7C7H0K+j99ewllR0L4pxpNWsk0dfg++g3P4DnzhB74opAENO49tVmyklRWVh9u05iQt6Oxt/HNA1jWSYc3dUn0XGQTpxNsn1liyRBAS+qwlyIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJypDSjL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJypDSjL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso1762035e9.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872674; x=1788477474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhopT/io3eKO7wMhXLgmZimKetvp9lSHGdET2Xvt3oI=;
        b=tJypDSjL9GYsd2W9O+MGWUslhPC0KauWMjzfGGFVJ/nzhtwYqXAAPIpm/Pj7aMH/vD
         8pzRJQcIRjvg61r8Q8485dBCYHPwFnJq6GYCm0AcIKGT7vpOhs/nlyiWS+Y9arZPblY1
         juxrQ3DD72ZR+rWbR/U/otoKzFV5HwgfSYpBzSMNN8z70hFqNb8JrZeiscFNuRBYhK66
         NDIblX0QNgsPlu+JIDCcT2HwkzqA91N7jnMhFbEkw8tTxslNwZmqFoFNoWCRHqhWDKNL
         5Fj4cJV7tf5mI3Df/vFVRCmkSkFJcjr4SBhWOpoDZRa/iOMyN/SDz0Fvb4xXxJ1+BgMh
         FfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872674; x=1788477474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhopT/io3eKO7wMhXLgmZimKetvp9lSHGdET2Xvt3oI=;
        b=RfJG0IZLB2aSXvngXTNejIekM3/dIQzPBG+7BKsMLNpZC1Tf4wiNhSlQU7SQRbqMWl
         4JwJ8j36pNAYpFpjh5DaDkaFRUgvPYjvsEQH3Q8CiDNpvCEtcaSbltr4V+vF8bEF6zit
         H56P/eebi+uuWjhK4mHR4sjvrJBo7Cto191LRAV/qWdiD1HZt5laSgZldmiXuY3lKQz0
         LHK90x5a533Npig65KJ8A1mp5NSR3X7/bZNHM4peVsoczMtllroQIHRxg2Lp2FVmjgZZ
         TDVsPB9M33dOyCRaYnMQIurTkGeEnv0CGOLEQBureq8Y9hTuoXGtmRZd+82ki9eWEl6Z
         wgMg==
X-Forwarded-Encrypted: i=1; AHgh+Roc1ZWJXbr7JM8gmVL9BSn87IBU+lLoIhs7r1zGTULDI1+oSmh5aXxz87j7DAM3ujC77oIRiICfjPuhpjNx@lists.linux.dev
X-Gm-Message-State: AFuF++kMlg2SsRtHhAlaH0akUyX9vPp6VhoHYKKSGS/KQK4DyHEPi5Ot
	Q9r9YcceHNj1ddCj9qe8hxzPlwK6mjsMeIx8HABZAgdaoU2TYfWWWFmW
X-Gm-Gg: AR+sD10a/BbTVxBtY07AjmLMBZpuYfZ/p2Gzdl8ALGL6tXA+WW//x1sA+Cf35L+tWMd
	6UpNVTrGx51VAutYnI5ldoWLmizrR8I2MS6mfEUaofhm7csNgOkuG9nQ+XSThwbFIf53TAbtQpR
	TlPW709UrW/aZhkG626ZLbYehN+sbSdANXkmJNC8nf8vDkIAq17hXGBTMjhYoTKjsJTzfVCUGfr
	Hfaw54dbWibugd0EReKcByPbC0JIJdfSESn2IYQYdRFe2CJPhWiqYpteEAezqGper5MylZBp1RG
	xN14+drCb1WK8mRLtIG5pDrBoUR7SIsGVYet55qUMNs3O35kbzEOoiXQj0n1qMac3IoFuz7Z8SC
	gK7FelsH4JTEDe8lotZFGlV14q+FbaIm81YBtMSLXkuNV+Teqig3A1BCapcTTMLy1h6Bi9a1OsI
	AElL2OeA9Vd25PLmM2q8JhVuE4lRO5yof1g9tHr6saqlEhHKlW3hkU+0A3zU86AVyKbbmkbIKl3
	j3PKrOIioBSSEao7BY1K11uNeGvAc1yAhaYMtLFq7zo
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr36908955e9.7.1787872673685;
        Thu, 27 Aug 2026 16:17:53 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:52 -0700 (PDT)
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
Subject: [PATCH v3 07/12] media: atomisp: Add Yoga Book camera configuration
Date: Fri, 28 Aug 2026 01:17:25 +0200
Message-ID: <73d7c2b008b55c418a556f01d0e19f11e6d71414.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
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
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..22e0a48f2377 100644
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
@@ -359,7 +373,12 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
+	/* OV2740 */
+	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false),
 	{}
 };
 
-- 
2.53.0

