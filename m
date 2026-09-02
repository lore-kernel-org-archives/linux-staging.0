Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188234A4989
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360849; cv=none; b=eN+B1MocoNlT+fQMjbdqOp4cpV6Yzc11ZWvoXtmFhGVqcf6N7mam93RymfnqU8Fcbdg68ZhTwQMRfadqVVeF2d/yTtd+web4tbJspMUK2xoPVBv1+SGFp2Gdj+srFnO6tmMHz+mNHAaXiU8rv5mgIKTI4Dd7AjWZ9WyKmYsWcqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360849; c=relaxed/simple;
	bh=zMz6YudLMNRyvt1tJOUeINHtau4Y9OLX8SPtgDvi43k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kldYrvYedCxYfnJAzkuMX4jfC48iZk0KCiZ5SuOl6NQi7hOhzpmGbBM6/FQ84tcrlkxESAorae3wIOD+XdHfXmgQ560GUrkSueIqrrZpDqjfsWypfHpyrjRRGB9HT4bYJ8O+vf08CZrJb3Hiy4/xb/GpyXZdfvZri/XlRVSNgcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e71RFhn7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e71RFhn7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so745663f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360842; x=1788965642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=e71RFhn7xZJRfw3YvguEPpPOU/R8zkAtVTK7rbSX2bwF9jp7bqYzm2/EtJZsBt2J2P
         WnBM2At863rmqozQOA62BWdLbHp1zR155xNLbwNtA6/dVAmlJUIiO3x0vHbJJoQfYULi
         s6lHnlgBMfHaZ3owQ9tAw50Ew1YHg+jWem2ylOegv2uBWezJJwnB4LvPgY5poDgFjq8G
         nzWxLRivs86+AvgtJcFiYw76iGzmlP0fUuRDXNIYCPi5DTCYqQBTf6X9fjoeTDK8or8t
         Yz6RT8gD8S/91I2TOMMbbdb3DnsZPuUhHCt4fiMiAtPjuD8o9X5fEpzrGpq9IjVNOWwy
         2igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360842; x=1788965642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=HEPCFSR0g0pswCexxEGhT8GlN03oFPKfd1WGPO8NDFlaTB9+vYMwz8V+PaOBZwBL+y
         NJFgoF437oaWF5SSCEOHj6pO43c506hPEWnIe6cEuoMn7n4GmgVel8mifGBx34g2GfxE
         JMx7IuNwLC5ggvJBERN/8MVtkfxGjqCTnQPn9ucDPCLMX0PPFx2X3TGscACkDRere+FJ
         IPqK+Tm4tUK3SZNo8FGFu21FJkaSfhRzvE8pC9ERY+pDWnF0fqRed6Ylxn3CeYCJaF6s
         ni5uI1BvctlawnWmcoWA1dOujDPqf2Z+12eid2HM/rFLPqWciGQ8nCVeHwyCA5e+bhPA
         B0Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxZCsS3zK/E92Y3J6xOIGpZ2Bb/45RxfQ+7+EuGyIY7yAZJNmjgygvLXmtcpqg60je/DZasdvUN4RCTEG5N@lists.linux.dev
X-Gm-Message-State: AFuF++lGR9JCBAfHdwI1rUXvuR55aAQrq3oddPPi+HRFZBpDnyJSj7wp
	YSBmg//1Y+Gaehw8caJ4HOybFpKPz2Osgtq1OAKbaRUgkkb1JLHxrtY1
X-Gm-Gg: AYBFou1ZD1Ql7SxmU4WHjK/8AJGkvtoFHjioO6JV8FcMJ1BIBGvU5vuyGizvgFSleQZ
	p2cR1qvW6Pc0dxsnW1VUYu/3RG+8CnW4Wf3lATJwjOer2WC5HWM6iFiEmk2Pm9ES1gK9IVbCaUa
	mLIgYwVtBNr+W/tI+VECAj26qLhiWv8hw+7jT8TlYSEuuWQ8pqoQ7Ieaju/ZdE7rksucEhCZHV7
	ISfWulUswnI+tMjfdNgzIu6sct8IiaCJcdvbQnrKO3ddcFx7lLpzuDj0ZItlF47yza5l3cM5EB4
	8ZSxOxtG+GVW7Y4Im9F8nu39MPPkXr+IJNO9dYfEP+MNAztak1YDNODLcSDk77tpbXiTcQoYWGJ
	NebPwDHqNQY1EIGqtWQ5ofECwvlmcvZQd4j6+d6SZHdlsqex8M3hLRwX6yG7/gmTrppVCy62uSk
	W5HoemC+4J4dnzTnkdON1uFJ+r03+S3NjfdIJ2zPP/UD1blB5vnvgQa+1nLtjSWjWCiMl/PjOuR
	umj4TC+kD/tcOQE24FHUbe2N/eGaPd8F7UYjb9wyXMAi1Fhxr1Nm7E=
X-Received: by 2002:a05:6000:4819:b0:484:4537:95ed with SMTP id ffacd0b85a97d-48488efe633mr10448603f8f.5.1788360842124;
        Wed, 02 Sep 2026 07:54:02 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:01 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 07/16] media: atomisp: Add Yoga Book camera configuration
Date: Wed,  2 Sep 2026 16:53:36 +0200
Message-ID: <3aa1bfa59816f3fab70801434659bdc2885ba4a1.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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

