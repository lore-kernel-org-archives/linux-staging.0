Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDC34A205D
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289498; cv=none; b=ImZtvtKBJV5s1qxIwCvWI7Ph8fqUR2hZCF8LCt3t9gGn1Z7nUiT5zUybLwGRaJB3qAM6XP1EXIXlKBYYMYPHFCspYBhIDYWeEKrJ/49dVddUrurYi/UcjIVwBC6o1bhJki6sm5sYEyAdEEe+a6cjYTBkGUwROHcIMFg4O8H4joY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289498; c=relaxed/simple;
	bh=zMz6YudLMNRyvt1tJOUeINHtau4Y9OLX8SPtgDvi43k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZq8W0Wj8Uay9qf23WrKJznkz5xb13ImiSkB8tJQkXyXdeEgx3OrqCft53V8Nj9/bwTs0aTAzcR2w0fgBGfMjR0HJuPTV9JsGHI7hIlP9uxpqdEcEgKyZ5hdZXEXx7etQZQzdh1XhdZqWf+kTCWqElIXFvQTYXlW89JEiStcqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLlULrV8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLlULrV8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso875965e9.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289494; x=1788894294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=TLlULrV8YLz0aBRHarAFsdDKYYqeqIL9g2xiH+2ct01AjaN/dWPMxNzMVvNTKtxi9N
         AkL0Kes5iWYWa+/V/uvgzuXHcR8oubQ9GogLTH/IB3CiE9+/pG2YgMf9osxqZWCUa/Uw
         4yUyBghEnnoxL4dr//25bBsMwkmFxcaKEIBvUqmqLngpt+rGy5GRvwxy44HwynKqQ1IW
         410Aphlwxichl8Xys5stRutm280xG2rVhuzwETyWjyFITdMG8l2ZOQMzEuYKnR9Kr8wr
         KVCDdA6Q6ljbwqHbvuc6CYdhW/vXSZ7E2pmFmlW6r8rrGt4y+MDk2UU7UA7OkS/LiwNb
         yxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289494; x=1788894294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=csxBI0CRVnV9kZrDbL/Uwb06z5uWafjqr0FqRGxyMK5OQv5qv86713ZBn8OCw/aXtd
         8ZpQFu2wNeX2sVGpiIVBXCgthsXlimYyKqQvHv6b15v3a7jN2FFBLCFUo9Fbdu8M+LiO
         fzcqX8Gj6pHRwvpaRi5rRR82d27NLV+Eg8cXwYhG+iGLSQY30xZRqytoJ31oChEAw2f3
         ABYJhhPKZxjT87OITaL1BEAJN0f38pYyriQOzn6Y51+C4HYuH5Wz4rplW+HS/vBN+DMv
         Q+Sur9GUOpuPBuwjv/sZIH4x/NeyJrATNPNAEH/+k0++EHhl7cDujBCYQCyjianwW57f
         Ywog==
X-Forwarded-Encrypted: i=1; AHgh+RpbXkYqyd9cBHXq1ADxANQOs2gKQDWCQxRiLbmGXNGcdQ2mm3hKd9skY7DUPyHiHgT1JrYzVQf8RfbAHUUy@lists.linux.dev
X-Gm-Message-State: AFuF++n9m/ir1uzRxw1V3SEDYXfBDoFjD938E9s6aOwm3Q9Xhwoiwx25
	HaY46wwMGzZy26FG1kvwjObqLPUtOwfBqbDZuRAgWYNLliyAvaDLM9fj
X-Gm-Gg: AR+sD101Tb5obLwuolq7rW9k1gCLokRhudMiJPLo9byh/10OJDuX6UOfAok+OO0lEl0
	OMCCEl80m5xokI84Hjy7apJzqgCR3Euoki9+uolhtaKKclqCjxGx+8BDDgkE6ZT6+essakYHUPP
	QRR0dln8OHu5C59ajTpGAaoSy6GySmth+KyjSfdVpX+UMuFzRez7yPFpYGE26aKoWlBuf9t2zAj
	ezWeCslBTAXx3OYqqJQHadQ4XTdLn0FJjKvB5eCEgARSkg2kgVmair++ttMHrmYA/ARPjJq5VIB
	r7jc6+8ItI0obaWipWsxZ7y1h8kfKIskKWSRSp74yQeTmZ68/VaaEyllNt9+ny+QcwYMzyZBmyZ
	+WhmxPw5E2IhjYDQLRVfxfndzv1Ec6tsL587KluUR1sFlLF4dUP+Ac1frw1f6YaRuFCBVVtHqAw
	hQtlUpgms+qzVycxe8y8Y3Cxoc7cA9dY9dz5B2Q2WQe0dGod8986FiR/4Aaw9BvBIQgUjFn1bNp
	zXkU4Ip2423Dbm1Njl7br4C9eXXfFri7RtJKLWWBw==
X-Received: by 2002:a05:600c:6096:b0:49c:cfad:90c1 with SMTP id 5b1f17b1804b1-49ccfad9180mr442961605e9.14.1788289493664;
        Tue, 01 Sep 2026 12:04:53 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:53 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/16] media: atomisp: Add Yoga Book camera configuration
Date: Tue,  1 Sep 2026 21:04:29 +0200
Message-ID: <00930098d6083229724d95fbd14275ad36b75f5e.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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
2.53.0

