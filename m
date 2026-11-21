Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267981;
	b=zlabYLFbvWuart1O9MCqNpU+URlLurFMLv04c49Se4GBP23WQtPiNV675GZr7bowWbVc
	 ACvARCzWQtk+o3QG6FwKDPmL0X9Dk2gSPPCWhYIH6YOuJ00CcJ78W46GQWix/0gianmgw
	 Wq3gqeXnPHUepvm7piGZ8cTXM6MT0fLL2W2PodO99X3n+2DFXJc/7ccvzf/iSnzSqK1pt
	 7JJC97ooSdIegjRxiFSTT1B3S41xZdTqWaNcj8HWFoktBuGO9Mg55g4tWeH+C3NDsHAFO
	 bBsjVomC4rOvy4JqWtFcPDJZ+JDeJDFp2P/c9vhsrTLx06Hbgn8cRL62TgpAhu52aEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
	b=koYOXqrRm9VNiq0xBBVW1N+yfEgQfm4a06hu4bqoi5usA37ZY9R1xzrTLd9OUkhD29xK
	 XuMEHomMF17Iw4kKJGxiW589/7WVTD7neQCXXhsMVBtGB0o8xAWxYYr7lKlnL9pPcjerR
	 xOCYq0fK5nOwDY/tglppp2QXpRj2y5hDdQPIKWUzgPu0c0IEaQolYZV5eCpntyP5Wbljc
	 SxvUXrMrZqfgKaC6BSh4fyQJVHTTS+n8Z0904Y+5YvC3D8LPlHfgDtm8APom/moH2L+Tr
	 qUu8AwoHK9CoG8KKZUJme9Xo8xHeiliO/nw/MqiZvPRsoO1RqeT8AjW7X5+2iJAoS5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/irFn7o";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0200606A6A1
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0200606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/irFn7o
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4aa5833c263so1690204f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267979; x=1795872779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
        b=K/irFn7oIQeRDStG35LgbnqSvSz4yDf8XGwGkoEt7Q0mVqtoOIN4Zy7RPXNBGbWfe9
         dcV3xIli+LS5xF64mwtLPzVSLfxSRH/8gAM8tp0R/2tXCjdzwG8Dn6LMBVKTzJsLd8Wx
         hAfASPCEluHKyBjC2VgGNgH3UoVZ4Hb8at5XvBs+PY0GoqniquoZ0mKVZA1JG22o9sKg
         2TfOMoYYOlRuLFJ/NzuVzznCXs5pA7BXqHlD+BZlL0ayyeKLjINtQCMdGklR5jnIJ34s
         +clfanjHblkr1wZZ8SPuGdkD2Ipz+yGM683FvtevINyhdAtNPFsUwsSxsKjYzXmUClFc
         tmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267979; x=1795872779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
        b=JlIiefWFiAItFAa+5BbXN+Qd8uYBzE1FCvFZU9ZOnK1I18QxQYspGyM9O19uPxsRI4
         5BuDoAVuPbLcbGMX5qee1hTqroRu7uYNG4TxKD1c81ieELF/cpILDfDLvjeTQnJt/tXw
         PgCSxTLvK5ATywK3A1ZkuZRlRubOpTuYAj3EoIRqi7BBmSjp9+uWp4jHra3bfMCpU9LV
         ZoacdLzOp8gxgxSxekOJwdTu2EFwm2HtFdsReExBFzUAg2S3mpqrf9+JZiH5QrL8APnH
         UT+q5MN7r24HQDXiCgPCPLO92ziTaSc/ucLSQIxDem0paX/NibHgQX/Dh0VtJWE2lEm+
         8Sjg==
X-Forwarded-Encrypted: i=1; AL+hErHLxORxSI7G4mvcJ9Mh7LuxLh22Z1mpN7c+NpOcASOADlASI56qQZqsmy2pcQD5TJbKUzqxshRfpBJHiS5M@lists.linux.dev
X-Gm-Message-State: APuU4Z/GvQoojUQw0N2Og7fWjsBU84VNVSZVOfmghPOLPV4CVof31HzC
	wywJjd4+21hiAFcHJu6D36w8xqcY+UV5e8XWd07uA2zL+stoz6wnCAfq
X-Gm-Gg: AZFdTZdwuoMJiNE5qOmMrX+DEsdtgutm5PiMLZbmnRZu7rJ4g68GiYQD4FQsZ4VyEXB
	rFzUwqbxO0jlvgOe2oMGG8X3Xcez9EqTnPguUJJ49MJHNdAxmpQEjGi/vlMhSPHQj5LPRw9tG+y
	L5AT+AqzogffpBevVJlVRgzptGl9uVljv/afL/qzTXwSYFf24Bp2YWvTejnPP5QDf8iNRXTODGv
	XN3tGxbH7utQ+EemIjXzMH9IkSSrVxlkz4dzM0ZOmIC5uoo6kUN1zFpjfzr8Saq56P/IJbr8hwt
	2akW4Xiy7dwuGqWWos19fFDx0g5q8hUCWlifDjyYTTWC4YpFDlqaKPuQHSSlYpaLwG6lparpPkr
	BWYJjMBOFaPmDi4o/ynKo/hnDXkyN+ePwHkyEUNXhPjhvN+jBJGIPRsItJ4OKJ1Xil2L1jpfWa/
	gHHLTQvJ4TGUgRYZbNDOex2oGRzQvbnyggPP6b31NWQODX6jtlQbR7Fg2KdsTJ/L14ApBLHrSoI
	H+M6Zy9kPo6sivwL3GSB7zaBGMAVIiBf+qC1Ddl4L+8TQMQmdaSCpP4T5fCt2KBEID0DkN9r4rr
	ac6A+A6kIRwwAFClridSkCVuFemYPZkUW5YVWl++JG0MU6lFc4LF114PnRELXSqjCbRfPbyNJSt
	Id4GadNVVvo/g
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr145819765e9.2.1795267979159;
        Sat, 21 Nov 2026 05:32:59 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:58 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 06/14] media: atomisp: Add Yoga Book camera configuration
Date: Sat, 21 Nov 2026 14:31:36 +0100
Message-ID: <3768f17b328286f4dc3e6a31a265eaa6e484e57a.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..56da454f0 100644
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
2.53.0


