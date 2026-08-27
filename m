Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B292E3E1CE5
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872675; cv=none; b=dENbkqQ5xkXLuiI4w+6e1YhaSS648pjWLPgGhndootQbvxSQs7na4S6lsxbv82iAprMO+5+h2d9qWNY7zLEzIGSXnUkogfMjnWtrNEq/gr7aqsEAgoCH/rpt6lNdUdw+zZFwqPuKBw2Z2tyDvHvJCPMkpzBddiIxJmGwucozJZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872675; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0L5XfEvzbS52YopqMPtmI8hJGM62NwbtSS3lt7GA7kgI2X9/vXBN1qz+HaTqayuAgNFv2uEZ58O+mDPdDnpb+tPtYzdsILrCHgG1eqAk6WWgbGj1afmnBGi4Yk6jZFAkPlD1m+Iog5LgtUg0SupNy5eWroDN91RCltF23vNOM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWDvR8iA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWDvR8iA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8687630fso2214415e9.3
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872670; x=1788477470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=IWDvR8iAP9Cwafo2EtMu4ut6OieirIsdl+kAsz+2WC92N6Kfs3QG6VustPfLR+UXqI
         66wG6pq0WvgNOjNknCT/iKwWJDmr/I1EowIOpqxKVLgqkdx/vh/f1ESDMauEoLwht4Jf
         jk77fgbENotETeaWCqcFj7/KkcqELgorbkY19tVfCl/Ao6f6DG8MfDLHj1aZEOntmrep
         2BerTK4inXAJtl0nPM/8YJiS1HpHMY4scJThaQtPwd9jPQNzMrBNAN8YYfOHfQCQQ5NE
         FIkcB73ErpWacZrRK1bg0DWnEfZnSI8MMDNIDnLhlTl1b3or3vRKtSbpY626aArcpgZ7
         7rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872670; x=1788477470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=mA6/IsyNOQj8Jjtg8TvEFQUo5iUoPhR8XQ+v9I6EXABCB0gCYg+P4oXqqGKxysSxGG
         u27+sK/jmYPzu+v6vqK9y5MpWXKEs0r5afjZPHEUGF56cggHZaxrB0R2YWJElLpsldcj
         s23DbBJq2u2S2kD4Pwl6C/xPNLeGe74gKBUAhMUMQyLLDKsJ/SyhSQY7sRVgOD/Qy5xk
         TNVBmb/FF2I7q641hoQ7LueTQXoy/BPSfX43ibzQSoW/KNiIbTOshJagMokUWYMdZrte
         TWqJ5wkNw0fbHN6O4/KQdhnquWUeMY27NFXGAaL7abgHL1GJDEj4UN4eImX/u8b0OOBb
         GwIw==
X-Forwarded-Encrypted: i=1; AHgh+RpJoZiLg1abvgrRq+1bSLbyszLuznerHmacq3dsWWSDO1URWRfWBx7EevOf6TqRafiDdWXRGFpGO45rk+ky@lists.linux.dev
X-Gm-Message-State: AFuF++k81k5WrIRnWRkLL5U+OHxtEpyDeCDpQ8DtUMLuQLIHeqmHOP01
	JbjJI+wVxuB/2/A96+WQBahv2g+o7JykuM8AzHEoDABMQSyGEguixj7v
X-Gm-Gg: AR+sD116ehmZilwm7Qy9avVY56HqUXwzsynbvnGYs52NX2XHkg/1GG1lz3ewaTO/CO7
	aOdpHe3fDpz1F+EQoJ8WjwxSzNPkyoRgEI+ZEtLVzKQDcBvIQjTzwgfb/tlGWP8iW0/8tFfRf7e
	e8dMyiszcyzVL5ZQm/IAVv2nUBRqNIWlPWpxdzbRraMw63/d4gyJIo7unR7o1YkZQkBNgeJpFUO
	zwL+Kt8+YlwOnCQm4KXESsPyCsP4VCpv5G7G4a+gU+kbVAD7dukvDUzqnHb8mhrkW9WU7WgHQZp
	G69tCCaBCAsYgYi1ANkiHyTjET9U9GG0QMgaINgXHdYYvR3BTuYgkntopXJM0sIegDTNxNHxgJY
	QbmPgB4U50bKR8+CWxLGqhsJ9rX0fFgYha9Y+bH2zvqjwcdqqf06qUQ7yk7307j7cnZB6i10Y2b
	UznYw8+fP1boFVO9c+oVoiW8DQJy+ppY7Ephh0PtbC8dQt6ctjDYfxNDAY7TGoLGAaC3Q3RasSa
	F/gD1UBDT/5oeE3rlOsqN5B+u8P9aw7R7lqHVn2avXX
X-Received: by 2002:a05:600c:6748:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49b91c57449mr33983265e9.11.1787872670200;
        Thu, 27 Aug 2026 16:17:50 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:49 -0700 (PDT)
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
Subject: [PATCH v3 06/12] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Fri, 28 Aug 2026 01:17:24 +0200
Message-ID: <074af4590e20c3c88e372f482faad03a358c7de5.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
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

