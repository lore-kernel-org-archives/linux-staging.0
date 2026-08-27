Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3DB4D90C6
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854695; cv=none; b=M2Ri++lkXlsI1wrG8I6SC7PH89ArljvHj6zbN6kqL0f4t3ygfwF0ahRY/9HnQwI7cHgBMtNrdFlKKtqtv76epmaHb9KlMrSgjxq6vqqtP+tIjZKxnyxh6o+irEDkF6pcp3jouTuBRwnZGE4/cncQ/ZOnrRgrq3ItVB75pP5PF8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854695; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHv9HhTjJC74SJs9idjvEwYktGkmq+FVCAPKVKUe4IE2o/Xh8UIxfffLyESG3BjuPJdwGemNJO2OvepSL9TA1NhfCKNUVFu+9hTlylrw4q4gI2maDAzMRGILro6L5I2qug8FsduW7kgKoBKmYIEiesZitYo4d/tQz82USlMpQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhehwJOq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhehwJOq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49557167508so621325e9.1
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854692; x=1788459492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=FhehwJOqzhq09zrAx2ntI6ovYLbnIYkTiaKvFcFkpSdU3g6qiiGgTR6X0p3rWfUmDf
         2aopaFRPFAKXOhItaCU8i+kRIgzDfcsYoU2OUVvgGZ0JY9/w3yy4UZSk3vulCRApSwE1
         ImDPsmOLQk6nLl5fSDPFxBV68TiEJkLATrz7XwHtSK/XVRBjxzKSkyvRxIInLSfZStM1
         Imeyh/pj+7tRmnXw3ZHAZ7cXhmmE3cYCeJ08XVuseAvk0L8V9LS00EyJkdO011PrU09Y
         UxsF/nrj0GkksBV132OupJMMBNwGEgizTPHM6+Ji/coL9I3yXDAoPFyEQwzF1+bgjb4J
         x1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854692; x=1788459492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=fI5AvLybZEpW7UBLJ17Vxv6lkMoOEZJ+Y2sKsGSYtXZ+UCfLP27Qy+uRRSHXp+VdSm
         xIYVLfKWaOCJYW4QeEameg2Y/tYuCXmIuF4ej9omfY9/WK2xfzjRfmqV2ldymzS5+Z5K
         S/SEVs1aMnZtIs8bFqy4di7EXtdVzcuVADKv0aH5l0JVdqAICz+W+V5TxzQwPL/dwYf1
         yjq+IwqexDAzMI9RpB8t008yvNJXn5JBYJIvsXNZJE2XfQcx0cbVHkd8PL1ThpGX31Iu
         sPBmX0Hn7Pg0vBlEA4mZtrAlzk/d/XgtYrBP6LjREY8bTBLbb904+OKeZJAWEp9K1Lcs
         XDVw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3AcVJTx+NyKoI7vtaw9TGCh1wFXyZ65z5K/W/oKDIsvn0LodxfkfQDU6USj0LDzSVzOeccNFMK8I8BnmX@lists.linux.dev
X-Gm-Message-State: AFuF++mEBl7JLcDK55IWp+sgbOb1l11Tv8V2FvO5koN+a5ETxSP2LoCQ
	NPOk+p9LHG1Ne6mQQEWH2LfXGY8Fca7JEw3Sl+wbnLSNNnwX4mA6fzwZ
X-Gm-Gg: AR+sD13qeoiJS42OtiRWI9zwxEVlh89Ch7tBbqSHcJ1H3GaeRTwGcKYbh1a2pV2qQ+9
	9ODRlNActFlf2moXnc8hDdXGKg428PGI80GYmX5aERYle4qM3WKMEOI+ZNFrClgL6HOl7PBogK4
	z+WvAnzvxSCVOxQIZ6Lrb8mTMMgfxvNrpsVmHSC9zXeQf+bnK44MefJEVuN4869oP5KoB6tSnud
	Tr6219tsaLjhVnx+WNKfYFpwBvTVmOd4OfnspxyiAJMq8XICFrR6Kye/3grIG/6jxNpBhtkI0ul
	o0eT0zZT4b9hVS6r2b9m5CerwvndBWrcJ1Cbr5Vcm//kI1EfPUPxuU1lLDKv3xkx+NL2Fcb7628
	M1eJYbdH7431kzK6qzlMLi4Jr/XA11gRD/x2tR/A6+S8lXja/KJMPBzonJRf8yHChCB/rKHXCmh
	9DCYeghhcjHNZwsvoDVmfcds+Gr+7unMaByuYTkINQHxQMm9iAloguMmwpm6eV+RP+9GdBCHz5z
	j8FYRWjw/cwihag33caQACpvZY87LhAqJJLVrUujApsWTJClOz7beE=
X-Received: by 2002:a05:600c:4e14:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-49b91bd78c0mr16681215e9.0.1787854692236;
        Thu, 27 Aug 2026 11:18:12 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:11 -0700 (PDT)
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
Subject: [PATCH v2 06/11] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Thu, 27 Aug 2026 20:17:51 +0200
Message-ID: <20260827181756.2430054-7-mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

