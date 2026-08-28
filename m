Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC1044C505
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933729; cv=none; b=nj89PtQ89S9wJqm2m3KRaXlG5aIxswshTf0nXxTKhPdJdO7b2qnUfxLf6ytXYWaBgzJ3VgJQnkb2gNWoq5tQ18IcQL+qB4lo4YahmQsZ++uOY/XBRdl+eLWem/G8oxio9Zsmw2t2dU0NwT2ayzA8vFaDLWWWsYNGeZwzlq7RuVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933729; c=relaxed/simple;
	bh=usTXO+ZWlW2Te+ZHWe9NdViYSu6Lko1pNutdv/H6/Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPtojKReTnNGPHqMFo8w8pa9hlln8uK88BzxrqdT3P5sEuCUXX1JAVriI/89UG6SXOPOTE3J3v0BtqOFHJRinsg0HPPhCA518U0SDQixpuQeERUjgsdVP2M91HzMPXtvzC2NHeat9XfYnGjnEiJV8yfvPHE/tGgpF/aYeB7+d0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clH7+trX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clH7+trX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fecbb7000so421611f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933726; x=1788538526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCuY6gGTBuVO+96rY+P61STsvhiDiQP17uO+QOQgni4=;
        b=clH7+trX60gRdqLx5Okee1aBgJokDbdkNXkTI8rh8uQFlSwSu29h4d4K2OoeaxELqy
         5WnuLstIhnkPxqtvZXHZza9Eo6pczj94fIQM2A3k0sahEl3Tv7G6KrK3q70bMrypFf/j
         +IVetQsVuFUv37u1El/nI1A4xY7j02rsR0IjePuI/JeaZEnMqW0U3O5fd/My0448INhG
         3fhOe0Z5j8zzcXPkqmRKD5KmcPVTGv6iiw2/9yMCJJ57xihiaQOqCZS+4HcczSa0Xw/7
         qdDGsuxuQi1vLT6jPsG1iNDyJFXc7+wiFJ6mSn0xG/A7NUsHJV7Q/6JGQMyFztQPt+Ph
         nFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933726; x=1788538526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCuY6gGTBuVO+96rY+P61STsvhiDiQP17uO+QOQgni4=;
        b=Q1md8kRDDGSKXDuRAx1ywT+oIX2YHwgUx+d1Q39EMlr1zuZ9HO7iqRybPgGJ4EdLrC
         ZaF0Y4kELtWzFLwaFvFM9FiAWDz7a65L7y8tvolokN0Xwwh6OLp3HtJ+iTQb4+yhk9of
         lGYH7XKBU1OpgG1eoylX0d3GUouysc2du8jX4vV9myzBFKPGKiO/zuBPTySs/yjpCfZG
         WPnwje/07/dRBkmg0ByluWjNF5BIh0AzF50RXUos/T/hlvOuq4Tv2BnS+A+YHvM/F5Nz
         APE+R4qwO+ZS2ElZTHNcuMm4PQ2A4UXrDj9gXbp+ynnJAGTaI8MTTt4LR9S3W3AllMe5
         rIoA==
X-Forwarded-Encrypted: i=1; AHgh+RqP5ibOkIaTSALKw12HRpzbqK/rfFiTGP57dPqdDq0625i7l+cnb8JV3nlWbnpqWnu6gbFZuP2pfT+KiWdm@lists.linux.dev
X-Gm-Message-State: AFuF++nNTHrbgPsZcEsy+VWNkAwKl0I8GA0nb4ksii4wX84PWQTm8Fy5
	dLKWuIZniSiU1X8uTdMUxrO5xnMNqoTfY0alcGy+aDliK/SQbL6GAuu4
X-Gm-Gg: AR+sD12JI33Ngtc1PI87ErSnJZqMMERaeAzU4dZHbkNu0G0RIQ5X0BYXt1Spo6DZUt1
	59EdyQJbNCOHcJ8AFMi2eiGOHLvDifocoXyz6KpSL2+i1mwXAhBX/WAHfFGveF6D7yAKx/JshDT
	hG5Wx9yeBo33G9JY1ltI6WIkKSvD8SqasyOj51wIKee2CiPQ/sRJCTEG84wsw8G5hKnMZ90QeNx
	1kt1eOzky0ujtVbjOqLDKVAmdd+x4R3v9Epd+EVgoVnorR0Ljce2Fd3f1yhAkKs/F9Db+45OpTU
	a3cm1nWXYGXoeCztblZbsRB5YFtuEclK9rSoG+u7ib88BZC6dVX3DlMdXvDZSiBO/EnsANJizqj
	Dc453TOzNlxI3tvTOuTsVJwKo4Teil1MtNM/36aTK2sP4GdXDs5EuUhvcXPUP1L5qG7427NaW/7
	IUIF3ZtqQEILM8MAAFwnUOjaK/ZlI7mj46IGucFJ0g0XKLoGIs4cq8j2ebHkRA8hDSKxodc1Nbj
	7Z/asnPf9NWUsAYEfi1kSpgU7eossCvMoX5DHdXXA==
X-Received: by 2002:a05:6000:2c12:b0:47f:80d1:be0a with SMTP id ffacd0b85a97d-482f79c7697mr12240100f8f.14.1787933726470;
        Fri, 28 Aug 2026 09:15:26 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:26 -0700 (PDT)
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
Subject: [PATCH v4 11/15] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Fri, 28 Aug 2026 18:14:53 +0200
Message-ID: <286ec3ad5ea72a769b5a30a086a4ca8b35268700.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
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

