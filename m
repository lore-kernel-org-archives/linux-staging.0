Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9554D98F1
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854698; cv=none; b=EQOxi7SC1DIEvlNcWWq3fLCMe+vz8c03WxbkGuIMW0PFhfBBTPg8ar1GCwdXb6cn7l/dqPYrSXZJhM5ku+z11iyvvy3Ire3hXC3IBO8lKJdjbqxWz6jvG2jHLJT5n926k/z9iZ49m5mbH5CC5WNwfyNHfIYZ/sZ3JHLYTFb/m7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854698; c=relaxed/simple;
	bh=zNg9hW5D8DfY6cxbJI9eBWDVBL+I9NugvrjlC/Bu+EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+QXahqvB7/AZPH/P6Ht12wQEh3boNfQbZxC1n6IDU/uMcw7aJ6E5NVkBNiUQOA50ygF+L9KkRnfj1828Upi34+V4ngUu3L1rB2ANgdUFMwi7URDSWQyAmFiya48pQL+quWnJeWOD2biOCluVNVJb1NLolOQbrLvK7rSVxrpBog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaRB/Rzi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaRB/Rzi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso937705e9.0
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854695; x=1788459495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKiURqLEO6GLiHVAiPzakCM7/0KgqMwtzahpI4nlMQg=;
        b=qaRB/Rzidi4cTfMrtwGQvkbDebkognZG+O7VlOnFtX1/uCcnzdex5NtrQZdggPuCM2
         Z3hxLjfKcgXGfADT2+yntSwEMb3fNrhPOa17nnyazr8NDdZi9hySUJE3j+SSdlhc5g3q
         fCS7zzlBn8BPVHNThscawWOf4Rggew6akOYIehj409tJbvrKsCVX3EWuQzHMl5AoxWhT
         M3kNOr632nX3soyyWYw2cp23jhY+CJznz/3y7Ir7l1yfL645lzNm4q7NhfVJaunkmhei
         eV/04Rtr7CS41eOnnWyPMMOCDMmRnqfjRLSZHm8hOIetRBdLxQ50mrK+YXXvsfyr54BG
         TlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854695; x=1788459495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKiURqLEO6GLiHVAiPzakCM7/0KgqMwtzahpI4nlMQg=;
        b=hF7qFHcQX7FRjT5RjTdeC+9haOhaMZ7JJoKaf3jreCUo/Pw3MWliy2ft/mOWs1eeFh
         oe3QUaEWj1ZMEeUJLUp7l4czX0MjJ6fz8a2isHIfnnnkkGHWfC4MHnk0X4tCbAFvZRyz
         ox7TR2gnFlxEP3c5/9+5HAxsjBfhdWJmrNWD7v4b0/ogJdfWmWPWilUkMVw0dre6KuDN
         aLvo4Sc4L1lPBuqSHGkXdgO9lHg1dMlv0QanfLNsPfQQ/Chz1aLpoHebM++5gmsKllJ/
         Q2V8po/tFfZUsOC7DjUCmgkquSmT2Zs8JBFu+odR1EPcappV4xyQ2FA9LnpqUOW7LykE
         1eMw==
X-Forwarded-Encrypted: i=1; AHgh+RolFgNJ4gN9V1jdNOx4SyLhPz23GRRoqpDBSeUaL34JHj46Af/dUTQKoG/vwqTARKhhb/qP0PXt9+go06ku@lists.linux.dev
X-Gm-Message-State: AFuF++lT2cCAjsAH83HbRTeT8UUYHraUL+fTYsrSXMCT+XB3Z7tAFzoa
	DQQ42zfNNq3ICyowWwpHLVgdBi+Iwp7xYfKiF8ik8NwpnvescOnADIkd
X-Gm-Gg: AR+sD13JZsvMKoD9xHUt6gk9SlAqQZj5eyTqQCVDQB1yTi158LDuOzXZKsZJhWXXYV4
	KCJ71pPXiAH0XVI8a3Qcrg2TO35qagPWlyOylMakUKtrLXYFdhtxVyIU8XqvrsYNSnsTC0nL0Qe
	B6BIZezhDlBSAhTIEOsgEw2hfMCCPZxzVu7oBHTdIhX4PQ0KoLjIN+ajlgfQ7QJsDa+hwigWl62
	t1ckfDLjLGI0W8+OJFhl+epGTd/TVuwlBG93mGET8NejY6VDZf9moT/LsyMNLYP6NZC62AdkpG3
	DpExUUvuxVQt2omoCZQ82lTrFxr29tXTVXaYx7lOq7LCPDoMf/JwdVousQ/5cYO9ap5A+JUjftQ
	9Bf09kpzf/FtX1wl3R0OUmoBIshTzxlN5aDrLo21qrARSjFB2Ad8HbfGbL+NIe/8SunjwUwyeyU
	2PIA8FQLg76UM/3l4dpnCMPSzFnyyl1HsWbx7OLtT1ESkxWUCPWYC72cOZfEsRITHKQmWA9K2tz
	tWlh6nARxy8BqhxuXQiMisfaQKvlseifodJ521tzDkI
X-Received: by 2002:a05:600c:8b26:b0:49a:ce8f:1a5e with SMTP id 5b1f17b1804b1-49b91a2bab2mr17583105e9.2.1787854695146;
        Thu, 27 Aug 2026 11:18:15 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:13 -0700 (PDT)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 07/11] media: atomisp: Add Yoga Book camera configuration
Date: Thu, 27 Aug 2026 20:17:52 +0200
Message-ID: <20260827181756.2430054-8-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
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

