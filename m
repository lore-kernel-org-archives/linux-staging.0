Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC34A64D9
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360852; cv=none; b=l9eVnrtowIdE4ctCNqz9oL7huHsZdctZxEUuxkrq9/8oX0CHbTe3Rk0/qUN2UZ+toyh35/8Gy0WyRRIGcJfh4+AUkKSUDx5VTJkcTRwlo5r2ARrUGIyx/zA/nim+2trBoDQpTQcvx+4rfdzmYFL8RO9xghJuNTwdIXHKz73FQEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360852; c=relaxed/simple;
	bh=nDjXt+isRGGooTXCaWuWnqb5pe5EC5+ZCK79Vbzm3eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGHXJAtyFm4thUoKEHmb3dmh2rpXleo3947Hh6u7lBmqP+WdyWHbKJVMnzSW0BJQeg158WYtIwS0dW28SQEIcZAm2nYLuY/nEsbGBIkWz0hzvzBgTshQXvSHmGCiIOJaedAa55z+8GoUtQxzBrppcm4WvZaGeI9IOoP62j6OI/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOu0g59L; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOu0g59L"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47fe89fb333so752010f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360848; x=1788965648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=mOu0g59LQ3h9/V+P1evwcp6LrhoWjMLv9JLt8X2qnoWWGdH3V2Poh6670Er/BAPi6k
         3Z4DuMOW/A27F8b2ONkgrLEdVkWxjPTfk+QiyUSrjOXyaneJGT8+TmuPrfVoohnZFhO4
         BhK3Qo+zHV0wRPM/hsD+4mtm9Dlf89naD9ITdJR2dqt30lYDtBTQec4GOmJyh0hX1BLE
         UkCirtxyGe0tpxaF5IToZNpcyJb7Y+IFLUZDU9G8IjeQzR7uljH591O6g5Np6rcJRHL2
         q8wYQxySXRdrc9Evy6PKvziSTuXQkYDZK7TxRasMTq4nEzpa3ibSpdUIwBMwec85tpkM
         ts1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360848; x=1788965648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FYj9gMNKBj9PIheDoD5f1AO5Yajaqc9NTnFS3lh/Ezo=;
        b=Lh5Oh1kBwXwTKylP8cYbv/NUQ8G7mxgMn1e99MzSgJ8metjdz5d+3RtPtbr7Jm9XKU
         vMUDmCf3ecilX5l2V25vCkn/jHZpBKkkO6yWeYz0immQfs+Bq3H/aP85ZE6Tt36BjoIk
         NvJSp2HARMf0jwiMSTJLK2Ui8yJcekLhebONS3i89wMn35PAlmGpT6DUZkWZEOZ+jizH
         o3azEvJlgdA703KINrmCoMPRaCEpZrfJl1qYDPb9H91TRz+T4lgYq9bD4DNOgEvNdnm4
         2Qv+GTGJNspo3FdIBDSut/hDRs4POh7mYWUx7c/Q2aNGICUT3MGP+fblsyBJfB/DKrix
         9JPg==
X-Forwarded-Encrypted: i=1; AKwUvBwidQprubfI3mBWoBXhYwMwzgwAQG2TMxVDpMYEr02VyoiP/9hOpS6qP0MifMY6Tcy9oYr1VKeq8cyOsCHr@lists.linux.dev
X-Gm-Message-State: AFuF++kXWbviSMkjqvsYE7n+EUX1k2FnM1tIiYHtqUFhDNkuA3j0bn/g
	3MHE9+dlBALaf/LUdOltm3YR4MGIVV24gdrDXDXMDFH5VSbkBFBCLU4F
X-Gm-Gg: AYBFou3plRJc4e+UCMYBRqxrdbJtz6rcggnkV1hXeXRHik4ZqRiwG5tgC75mBYb3K3K
	m1JQGr3tk5k8OIEukm/ela2WNiqs78kwwrlIDtZdHhi/rR1EuvCZxYnGTqeSVQu/hvRqLip8ulI
	cjxjZxshvrpH1sD9TdL9ytl8iD9fmsgEdihRf/HOpnHMDccCKzR21p8Akg/d97XksA36OqCLjHS
	u1lmdEnTUSEnzqtS8+eY5zch759TqVVxzXACbGsJYzOAgW9Ncxl7LBq5RNt8CVrSgOM4H9KXZd5
	oUWxcZV4Mj7fn+U3a0NZU+M7dScCj+avKU4nunUncoiDHmBEJxS67ybnvIJABFdmiu/rZOBJDWK
	ONJw9+H2yejRVOAbung6adwB+t1q+vw+czY5jeqYflyflswPMU/ilqCor9Gysmdd3hkp6b9oKKz
	3AONGPthTtAgLActNV2kZdIVaVOJ9POXCSOOhMNgwLJ5V5D9WiAMUM8wHqs/DiT5/VnjaPsNwLp
	hE+DM8KDlKRxOUgzTVIGVN+qXUKW4ViEkA/DH/RID1p
X-Received: by 2002:a05:6000:4b19:b0:482:e4bc:51a8 with SMTP id ffacd0b85a97d-48488f07a87mr9665454f8f.7.1788360847525;
        Wed, 02 Sep 2026 07:54:07 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:07 -0700 (PDT)
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
Subject: [PATCH v7 10/16] media: atomisp: derive CSI-2 timing from sensor link frequency
Date: Wed,  2 Sep 2026 16:53:39 +0200
Message-ID: <2fab63a3719391b1a37a8937d5a37d9150c64819.1788360629.git.mauriziocasciano7@gmail.com>
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

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 throughout the calculation so valid link
frequencies do not require an arbitrary S32_MAX limit. Fall back to the
existing default timings when the frequency query fails.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..5cd285fab742 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */
 
+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -209,7 +210,7 @@ int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 static const int LIMIT_SHIFT = 6;	/* Limit numeric range into 31 bits */
 
 static int
-atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
+atomisp_csi2_configure_calc(const short int coeffs[2], s64 mipi_freq, int def)
 {
 	/* Delay counter accuracy, 1/0.0625 for ANN/CHT, 1/0.125 for BXT */
 	static const int accinv = 16;		/* 1 / COUNT_ACC */
@@ -288,18 +289,18 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	int dat_termen;
 	int dat_settle;
 
-	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-	int mipi_freq = 0;
 	enum atomisp_camera_port port;
+	struct v4l2_subdev *sensor;
+	s64 mipi_freq;
 	int n;
 
 	port = isp->inputs[asd->input_curr].port;
 
-	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
-		mipi_freq = ctrl.value;
+	sensor = isp->inputs[asd->input_curr].sensor;
+	mipi_freq = v4l2_get_link_freq(&sensor->entity.pads[0], 0, 0);
+	if (mipi_freq < 0)
+		mipi_freq = 0;
 
 	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
 						 TERMEN_DEFAULT);
@@ -310,6 +311,11 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
 						 SETTLE_DEFAULT);
 
+	dev_dbg(isp->dev,
+		"CSI port %u link frequency %lld Hz, clk timing %d/%d, data timing %d/%d\n",
+		port, mipi_freq, clk_termen, clk_settle,
+		dat_termen, dat_settle);
+
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
 
-- 
2.53.0

