Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B195477E
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933719; cv=none; b=DKBlLVISpVoZdwYTrm2wJYlKv70mEuPc35756z8plrRlB1LkROxDBZdfzGhdGygBTeLY8nf4Ga/WaAU4nTx9D3g7rkvg7xY9hivY0/LZTwkWDgcY3/nKtu6dgF2hwQoQ1kLimag9Xs+WGVd+GoGkJbS9jR8Pt3TY3+QDQc7WKwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933719; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKtXAKoVWhTqv2r5SL6hf6VbqAgSh2d16TXj2G7kiII16aMRqti2C5VKX7dH3Err2KSY/eYyJf08eKrTWYsOrvisK0jiBTLTVj0Rxo6FfcdzDzgqm+YuRiTq9i3pZsYFbUpfLk217RmfMdpeHXSG1rCua2VYCnQE3y3voMxEQvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oH1YTVCl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oH1YTVCl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e257a23aso652872f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933715; x=1788538515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=oH1YTVClfeASZhjsoY79WvdsbJldQ4eQ1wxe7F8DNRHof8rWbgV6fNb1NmJJ/70nQE
         dRKgimJoiCTSIPO4O4R3EQF/tsI0aXIAKW2badBvNM9WWQy3QZeO8h4Brun0MzhiLR4Q
         FMegXQDxut8m5jMN4DrmUgbDkk2ZEgVMKsz/jDbTj5+TtDf6KY3sdBtK+ocxaQtwPb22
         PFwXct0zgPa6udzxmgtm0qT4eqmX0VZonkMsMkLReqIXy1PjWI7nEQpCwqt+wswjL8Tv
         G1anm6oalFHidbMIIzgEW5JxrdRC6VaiEzUc19B9n9cB6hYGUItRAdQN7nd2zRKaimzq
         TAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933715; x=1788538515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=iIBS+Jrj5/8PPZMUxwOHcw4sQEfHF7nH6kRQNdlSjZcGPQRYDlUll3ZPbEW8mwQGQt
         78a222rD5sCR1dX0YLtippc7+jquMekFVwP/W0VMD05AzdWeZegusGRE0CRkdUY7VQIc
         jWUokxZlXinB6LnsaxYtmzd17MouY2cq7ZDcQMSmLNMYQ5DCypTYj+zzplfTzBwEDJY2
         uAgPUiXMNqD/+VPWsMuMe6+3tnUO7Ks4sjjMJWk5jGHempuKU3h4YPn0QefjcusRa8Qa
         LeQo2C+6ucMHaPIYJQu/x9OkIPd0e2M/CMmb2Yn/JuvPqCTx2qNGf4wWC9d2+t3E+rRj
         urOw==
X-Forwarded-Encrypted: i=1; AHgh+RpfdZ/ThJgBUSDaGn0AWihX1x/L2bTf+K/J1Q4Unm/z37I81MltGbck2Y9QKSdDrtwjwVBvtrRe5/+HmkcS@lists.linux.dev
X-Gm-Message-State: AFuF++m9InTR/FGlL6n3FXISjkHPNMXk63zcq/b8l0L8S0yKj7K8OPr9
	T3fpMCbDIo0lisPdLlMOPM7kjfTPo1ijVb04wWLhla9e9pDiUPqE6XiP
X-Gm-Gg: AR+sD12oZGECNy6dhnx5FevnH0Hqm7WAE8wlgxUMdLqSZphaib1G8BfVZuQ6URvzb5A
	dUgzwI3aSP7GuUbHLpDiBF2d1bCTLu//aV1s/KhHi6pl88IG8LLq9pjeugM8mScDQQ2GnLILKa+
	7slCONQnvxm35h8ifemsh5dXU+5Arsief1RjCIQLemEQeQbw7FgEF4GTE8WsMH0eHEJQR7nUPCb
	V62H3rU88hwEkUdgN6M9btSYhUcnPO4RtNzsV2jDjm/XUqiyVl0MOoFCQ8U30524vpkVCpy3UWc
	hXQ+baEivBTKmH1sEhNCcIDFB892uANMBiF61s+vwdST0BY160UYpHeDOn/nUyOkMOk9T25Oslp
	dBiS2AB6eYXjWxM7oQXBhxZGXKMd43xiA0A0x4a7oiVocveYACUrNVtxHZuExP6f2vvJPYxAeZs
	5BkomdWud2imqdrAUecniuLJiOL39qJmnSU8tjm+uih4iAYXFoj7GQIr5rWu6rhTW1xlo44KkVa
	cD2d924DwOcRd9Hrh4nJdz1tcWvRIc3Es8P9tg/eQ==
X-Received: by 2002:a05:6000:653:b0:482:eadd:174a with SMTP id ffacd0b85a97d-482f79c941cmr12152664f8f.17.1787933714909;
        Fri, 28 Aug 2026 09:15:14 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:14 -0700 (PDT)
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
Subject: [PATCH v4 06/15] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Fri, 28 Aug 2026 18:14:48 +0200
Message-ID: <9b618d8076337f8129e235313cce90d86f95fc4c.1787933456.git.mauriziocasciano7@gmail.com>
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

