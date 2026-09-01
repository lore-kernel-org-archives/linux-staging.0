Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D24A2608
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289510; cv=none; b=aQo2ERjgVlevrvEzARJLeiBkyI3rAa2iAKnGiU3iI1AClVaqmY6+QGbAn6JACFNaV86U6EzBeTQ+WzxhUHwkvg2XwwWxGgnSex1+z6uAbhk+91saoHyWHq7nJtGbu5Ntbm8yfHRw1TfYcCYfniyd7B35ULL8Y5+O6N4nXSzRSSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289510; c=relaxed/simple;
	bh=O8+H77ig95xx3D9xkOkxR8/Uxxs4zMr9rHlkTdeo084=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ct5vWmVSpk1Ftxd3RZbGxi5lx9+Xb42jwrS3jPJTxZ6ytUpTSvOME/5uDmtOAF0uPZb9v3vxXNyKagSzKEZNX/g4BX26HWxnmAltBRsetV4BNEziMCFsfwjZaZqrobaK28xDMHlKSagqIgsV5T3HDqfhmUXmaK7NYLRabhNG2mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1Fc2FbH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1Fc2FbH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso1496685e9.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289504; x=1788894304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yex/OilwSnogp/tXDfdHCJ3GmknddcQsqQcXRNs/Vaw=;
        b=B1Fc2FbHNFSQM5yTbooqDDLzwnkH0ieoFN3WRDw3MBVqooQh8LnpsR0EEquCZ8VAqC
         UpnZXKCNHnFxObShk1/JSfkX/QYKZYYTD450njXQgYYdpg7p0oE0A1GdmQAMwSGcgmao
         DEX3p5LeeS5DktEu0yCB5kRZFSmJoDsMEen/wC6pLlN/N6o5Ml91sQ2C0jQjdD/eFRmG
         Kva0kyMmiIgYGF6l1cn5krEGUqWOWTmip2QJQAXld5fr2TCYgCflkZmDnkPle4d4XXp5
         n7IpnCboZpFjY+jSIpJsInoQh9MozszoJuJ+vVvc5XVz04JmDU0p6ecBW2P8GF76ryl8
         rbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289504; x=1788894304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yex/OilwSnogp/tXDfdHCJ3GmknddcQsqQcXRNs/Vaw=;
        b=q+moizVKSW3HSZz5Ff0ym8f/Wa1/gGjmzkBgeKwt8cecGqmRObDuKE6XiQhB9KKJjj
         XyCCUwM562ox+r65brzWKvNaYnTzsC1JDbRhA3L/jRDVITysU3l49onzt39EW4Mu0bAz
         B7plJ+hdXwHU0/ryMEp6JzVDh//VcVz9g9amQuXw21k8p+FG+4dHvSFbmgjulpKYU51u
         98qj1Uq4jViabTRCaIM7nXLiLSn5GPrTu6JZTQ0HPTKKwNktOnpWRXdIT9djFkBRXcgZ
         ZrSFJSbimBlu6ZjqN66NDrsQNriei3AetAU0Kq6jkP7hy1hodU6TWre6D4c3DyW/EG8C
         BzLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rog08sDvRIx/3W8T79JIodg3CCbeNZ2o6dq/jMkEok4oKUKFk4h3Mf1kKn09eerk8D8sKymXQbN6GWY7TAI@lists.linux.dev
X-Gm-Message-State: AFuF++k0Yzxk019h2b2KFSWC0twjQIstSMB8JsmRMUvzD/5WYkO21hOJ
	SQz8iRb9fzoZccVOq7jChoqF5wUkQ/v2DL+uHu8PIwwooiokDbhAHMjH
X-Gm-Gg: AR+sD11892dpQyiDvnBXGHemFNyOfHuyCSlonnWn4r/e7SWroWhZmr2rWFpIMscxJC9
	VUJoNwkF5gFjPFsWGSdB9Ws+7U6jjCZvsHhcbYEm3iLYi+jYSKZnAM45gz0KCYMkkDgOa6vnl6Z
	m1Kdry6K6xpM+huM5g1boJ08JeWJORnKZO0v7VMfpC9QRJhLgx3IB/i5EkorJOBC2R/Vc5oZzbs
	6LLJCmM9gbg4R0mRiFIA8XjZjn1UfKctmhMornz2rR4bFmow0fwZMMkZ/IBsha7+YfpehzvVTBP
	G6DX/sJBhb8qBimkxa182u6IfNMDOqI2j6Y4SjITTfVF3cy7ok0LRUwxaFjOQ0uNCIrd9lEf0X2
	H45VxFZYW4PTA0nAf9uGB2UUmEbmth/0fZrHcV18YLMqfltYhpzeQ7+M1h6YP9KlcN2jH6EZ/kA
	NMQmvqsgFVoGfQF3wK7V83MpOhaf51tEmQXDwoiKviU1iF/oZwiDhLR6sRNCtujoWIXIMbXAImn
	p3Wa53PD9OMULCfhN4VG3U/fr54/wBpcYzKYv7AP6RzP877f/hM
X-Received: by 2002:a05:600c:4688:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-49b91c4fa79mr486809935e9.11.1788289503687;
        Tue, 01 Sep 2026 12:05:03 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:03 -0700 (PDT)
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
Subject: [PATCH v6 11/16] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Tue,  1 Sep 2026 21:04:33 +0200
Message-ID: <3c061a86251dd0a7210d67d4f1a254c2b8308d36.1788286339.git.mauriziocasciano7@gmail.com>
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

The Lenovo Yoga Book YB1-X91 firmware does not describe the front
OV2740 link frequency. Extend the AtomISP sensor configuration with an
optional frequency and assign the 288 MHz Yoga Book value while adding
its ACPI ID.

Pass the value through the IPU bridge per-sensor endpoint data so the
OV2740 driver selects its matching mode and the AtomISP CSI-2 receiver
derives the correct D-PHY timing.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c       | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 56da454f0d9e..226c81409848 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -15,6 +15,7 @@
 #include <linux/dmi.h>
 #include <linux/platform_data/x86/int3472.h>
 #include <linux/property.h>
+#include <linux/units.h>
 
 #include <media/ipu-bridge.h>
 #include <media/v4l2-fwnode.h>
@@ -43,14 +44,16 @@ static const guid_t vcm_dsm_guid =
 		  0x9f, 0x48, 0xa9, 0xc3, 0xb5, 0xda, 0x78, 0x9f);
 
 struct atomisp_sensor_config {
+	u64 link_freq;
 	int lanes;
 	bool vcm;
 };
 
-#define ATOMISP_SENSOR_CONFIG(_HID, _LANES, _VCM)			\
+#define ATOMISP_SENSOR_CONFIG(_HID, _LANES, _VCM, _LINK_FREQ)	\
 {									\
 	.id = _HID,							\
 	.driver_data = (long)&((const struct atomisp_sensor_config) {	\
+		.link_freq = _LINK_FREQ,				\
 		.lanes = _LANES,					\
 		.vcm = _VCM,						\
 	})								\
@@ -374,9 +377,11 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	/* OV5693 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false, 0),
 	/* OV8858 */
-	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true, 0),
+	/* OV2740 */
+	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false, 288 * HZ_PER_MHZ),
 	{}
 };
 
@@ -395,6 +400,10 @@ static int atomisp_csi2_parse_sensor_fwnode(struct acpi_device *adev,
 
 		lanes = cfg->lanes;
 		vcm = cfg->vcm;
+		if (cfg->link_freq) {
+			sensor->link_freqs[0] = cfg->link_freq;
+			sensor->nr_link_freqs = 1;
+		}
 	}
 
 	/*
-- 
2.53.0

