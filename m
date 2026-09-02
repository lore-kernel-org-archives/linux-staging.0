Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779854A64FF
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360854; cv=none; b=ViBAO6j2h3KFnc5TkYG5MOdDE8H0iWYwbdaZnfVsCTQYsrBNw5IZ1H3fRnaJsOuawk+etXfcfa7oQrc86xV6YF7cSeG1PWhoXjPvhDfFjtSFZPLZPv2q7rUtzKvJdEZogVTkpb9BlbEYY0/wqtSYwIhpTZ7MoKm++VQK87Syu0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360854; c=relaxed/simple;
	bh=O8+H77ig95xx3D9xkOkxR8/Uxxs4zMr9rHlkTdeo084=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfTsQ5f3DkT/jaUHHhMOP0n7+1safiMgHSZ2nQn0AY0isBGahgpJs2ca3fBRiDOcqX4padJqqIVOoU8CUe+PFgEvXePetfQK3VNZ9O0pJB/t8VQDqJONvzCW+cJRz5zaCZC9j+nB68SyNUKFtk8wsxxjFODkfO47nwGDxuunsBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDl/vLEK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDl/vLEK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso8845825e9.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360850; x=1788965650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yex/OilwSnogp/tXDfdHCJ3GmknddcQsqQcXRNs/Vaw=;
        b=hDl/vLEKczqRtmljGoudnxYJbByrbFs6xfseiwSMuxS095FODEOxEPhGHFR07RcsXM
         tIdJ3HSvmhcWCDgTEpxXdDC3qSbC+PSv6UheRZxgJk3A15wnWPkxUL+x+OOGr5Alg4yU
         H1zdaH4N8bHgxMM65T9b9LvFYb0x17QGnJp4gg1pGmkvLMYopCJ6SgVIv7QqMiJDCBhp
         CGpF0Ya/rfgN0+vCcHpQbpSKvsPxVO7uF83hhQL2iYPgGMrNfiMU3xVWGSPqUYKhxZFz
         /JB7T86jBsRwUtRGezWo2tpzQTaqgPC7ezzA7I+3DETof1/91dVvyF6BVBWR9BlwpXFT
         w92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360850; x=1788965650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yex/OilwSnogp/tXDfdHCJ3GmknddcQsqQcXRNs/Vaw=;
        b=FiB8nuA8JVssrIqrMYZeH+zhvTyTULwDrMtTMDubGlCZjj41/kBPunIWZJaJXvi83w
         jccA9alhUX0n3w3dZyyWGl+nI9eVO6LL0I/D8N70qP5qbcnuDOVip8UrPJkkc80EfGZC
         Uiw6ZdNyJnkEe7W0hrlT9wOOfJk09fmmlIVl1ilmlX0WgVpqWcWGSQjialOILxwRBtR9
         1q8F/2eHIP88lvD0pbjBZz+uanhnu1RDab/VkZcja5Mcn/wqK6MRB0UBa2NJBpnBfYJD
         /LyLzfk6FIxmp8b0Oo7JAzMnQQjdCBf0zIwgiKi1mbyQmoDgqsiAdso3UfIAXnCSYToU
         VjLA==
X-Forwarded-Encrypted: i=1; AHgh+RryrjNF5YE3d/K/bsNIhkLnUpvBl2P94ncDa6bfuaLYs80F2O1SAvkYrQtS9WDNez89dVVUw1XyWrCJfreq@lists.linux.dev
X-Gm-Message-State: AFuF++l4XRSdsPrv9PHM495MEe57knU2W/etzBqGeBtZaf3Ei3BhD2ex
	2GY78It4gce36iCziM/XSrRE7wMt5J+LEbm9V2uzlAE5v8UM+JPtdOms
X-Gm-Gg: AR+sD10eqGGMBvO3MojpdKqmk+k9KiZq+hbBkORlDW8IlYy7FFUM+ts9WBF9MT+/f1d
	EUJSCAbKOjyr5+UIL7DRCNnSMqsjhkN6vO0mrak3isH+nGAOc0k4/jDqxKweDmJqiTX6CFEXix7
	mwRYBMaxXe7kEjDR2HedxAiLhtP3+kcR3eHIMhRaQDQBJp1GrM8s8jawKzCT2qV+6GKcZWfBjgy
	ZbzjA/CQpzl8FFZVcBMqMnEp4q4DAxhzssSTypQHzOYQGlJ1O/TjAMvt/A1gHroCdYpujqdVycO
	A/Ak3ro1RLE3mZbj7axFw2zUMjNsw3HBwNxeWG3wfC38IsdSG5IPEVsVziWjA4kPm3JYd52vYWh
	YjTPKXmQLKS0KWtv5FU/92e5B+VtWgrBe+GZwtc982bmkqiYUKkSEAvrnoubBJqq0ZKDfS1yxqf
	+mfv4uX0cmdmAKfvUjleDEDSAjfRYAq9fZKE4VWJmXahEONH2V0SY7L1AYtzYYRAlw56vEuN8xA
	d5pcSngLeOc3Bz/zs/fmaMkrN/Iy5cwBMZh659eOjyF
X-Received: by 2002:a05:600c:4e8f:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49ce57f5647mr83604445e9.1.1788360849699;
        Wed, 02 Sep 2026 07:54:09 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:09 -0700 (PDT)
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
Subject: [PATCH v7 11/16] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Wed,  2 Sep 2026 16:53:40 +0200
Message-ID: <ac9418b65cb9b52a3aa864786f1bdb1819d73315.1788360629.git.mauriziocasciano7@gmail.com>
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

