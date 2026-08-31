Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A7437F007
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199291; cv=none; b=slQv+ZfSqAfokXu0r58Jj6puH0M7WlQC4CdQmx3q828UyWlViwmGn+LscMi4OY7+HZiQLVzUnTIcvpPPgCDuDIohfN6B7eZjekkD461Z3f77kM8uRiFGlp7Y4HNK/2nEwV5u7ZBZftBIqclMogoYvo+d57t7UO5W0lg0nKNxUQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199291; c=relaxed/simple;
	bh=8zThRUQpY5dLJkLhz/VsoaCUOQSCbp2KirpHaq7e5ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7lOZj4z7v6i2xUXrDrJsyimPpwaAvMV0eQbYLIWR/FsYe4+9wx4I9DKLLanEKQ3QJMWNPQ9XxoC/1y3s9fL6l3Y/sDkHnvccYsPmTq1lxK50CRr8ZVH5hu27wwgSBkC9bI0T1W2nSs/5EaT4ccIYBsvad/6pXrqfa6xn+J/gVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzHjIW4I; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzHjIW4I"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba14so119464f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199288; x=1788804088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpJ8roXvhY23ncBXqOP9UGLUTn78a3yu4lle+mqKLYc=;
        b=dzHjIW4I7kAJ6wXQMYIhJt14y4q2DkkhV91EZ1PQ2m1DVx8sSiFiU+4hbMGF2KuvGv
         NTAm0ckxId4Z86yIRZ1hLdCpNJdk2jkpHs3Td5LKp/hyoQTohMUHXCyy89m2r9kBkDhn
         mFVpoH3++TNeQiQ8XgpNRDM7BTnVXJ8XdKaJKOUuM6VpQkCVp2c0+eoLMCO5Yd/Qqi3e
         k84yqu7p6Vq3Z40vwxvaCg847BCGS+uc5NA74NHoPrRPPN5d4scSYtFk036UnHGivHLj
         HmYgHDJVN0c9luhmMAeus6RsJ4L6YcSMbpSoTMKMYR3YZOvsfJNZzeXKoR1u36X/nrtb
         xCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199288; x=1788804088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpJ8roXvhY23ncBXqOP9UGLUTn78a3yu4lle+mqKLYc=;
        b=nSOVln79A0hYHAJL0XfuPd/PCsuV6PNYsS4MAePuwAfr/NVUBCQRFyit+1i60wZlYa
         vL5P6Xa2iXuoR/SslRk/6W8ukCq9nLp+xLa/t8597FPK+vdfw6StTCwePdPQF14YtPQ/
         vuK8MgNPtK41Y+6ZHUQdWDDwARjWoAlT2do75FOTQ5BkRRS1Woo0Sz3ZUWJUjnKcqEuZ
         i28R1tw+bmitlqnfovOX9YWX3BOTGocuDp5Ts+qR5VwxpaOcRkIFVgMrCbmEqrDyzOy2
         pDrgZx3u2gSf/2USEP7TT0NJprKghCG+9CG+sWbB+uVGoc+/JkkH/w/dZBZIT2Y9idL/
         dy6w==
X-Forwarded-Encrypted: i=1; AKwUvBw2ZgjE32p7cjzlgVz7B2tPAvCXOnzDUyV28RJ0JQaRh0eVT/BHpJF8yZxatGRlEoRiBiRc4iBqBIYz+PVz@lists.linux.dev
X-Gm-Message-State: AFuF++kfoR12ZkQBiKejecczlRL6cfcM4fdvGfPd9dvnt12FYhhqvn6z
	DI/deHwYfJKi08c02CfgFtonXmiuEAjX1UihCDqPKN3bWh7DF/Jay1Xt
X-Gm-Gg: AYBFou1Eg9Il/eZ/u0/lmJGPVpHsaMm4xZNUC2LWvI7uBNsMx0aEjYfRW1oZhCXIDLH
	EYuwJapXJkNCdO25Ctxx+oSNd3SztSCyCmJT/fStZ72QpxUk3IkKioup8CPICqxD2A1SVVnNNxp
	/M+aqh7D4eYwLkElgJiXttQFR2waQR//SkzC8UDQof9d7/8t+Jc03HiBOoiLLjX1eT38kc9lS23
	9EuvF1+wjPlvgfmQ6RlGH/i59IzMi5SjuLgaSQx8KKlCj0wpkVHDB/eDbZ4yjtLVqEXs4fROUYY
	xBwBLObEJpJUD2cZ2Xzgv0ELykyYKnda3wYBCGpA26XAL2MxbI9wSA9py+KHmlHF6pyQIAjnEpX
	UbCBsfqhd/jo53pQ97GzdJw3c64Drmmu9JIHvNHnKFDabR4OzPqdyfZw4tHHspcukybLH2VuovJ
	W3kAKA0ht+d5tjIuPeTIgw7VvCWxOn4f8K8IQeQC7Ip0yCBhQRp14YUqwCZIEe45bdgQwHQG+GP
	8AIbS2IWdwPSggxIxaAEGS+8EEgkZxgWaaav1Qib10=
X-Received: by 2002:a5d:5f08:0:b0:482:f0dc:b4f7 with SMTP id ffacd0b85a97d-482f799dadcmr44755064f8f.4.1788199287659;
        Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
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
Subject: [PATCH v5 11/16] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Mon, 31 Aug 2026 20:00:56 +0200
Message-ID: <20260831180101.3109854-12-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

