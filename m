Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F0D376A06
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199280; cv=none; b=Zyu4+j8Tdm+A0y3N2wKsXG7DHRYk7IjydQlHac7F74aG+x81k+1oxCnfGzGZv1NK0UqziLQj+Pgny2oVNOczl+AzAAOE3uto2h+OWxxWllWvVc18/f0ukhtGOIzMoPJu06UBvC58HazaK6DJgH0eKefBn7Od6D8a47nV5HCpeb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199280; c=relaxed/simple;
	bh=WyTLm3nJrWyEPC1OlppN/k0EgaQgjfMDm7WlJrB5cQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLY7eqYsE3vjBQMeBSwB59QFnnLeToD1PzJLoUz/0U9CcxoYv4Iu7rI0/89dmg0L0N7RSgkzelvijfm0arLuaUVBki2Fwt9I3KjnCNNy97twFG7gbgS8V+wyV+fQM9aN6UunGVNPKfYaJB46L0iEg76VP/mp2XMXkCjvjZWaQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/BZdQbg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/BZdQbg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-484392e3d33so942933f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199277; x=1788804077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzgUwaQwZkakfwcRSTvIoOI/cqYjfJpPcdCsGPGI/Pg=;
        b=J/BZdQbghdmJSTWBWYzop6pAJActI/uBJou/f5g5gE8ZjA08mirX4e1L/4vklUVsHL
         SQ5Mf7LAWSz1nV7Cs1hecj8B6Ox6JPEhbwW2QBpgxxx8KSarrwInXpzTC3/2sGonfee3
         /Q9JKd5Kmz8nd27rTY+E0AnfmTgSITNaqAtYLN/GH6HcO7BnzuQS1LoLyh+QfS2eXZC4
         s7L/NRaCaVCFDjArMMfPE4X0GI52644p4URPRrPpHnZMKb78udlCGy+SutjQBV6d3YNJ
         Afms14gh9klm/SThiiloLUZeg3T8/e2si8yWZ8VUdaqiRST4emE/T22uUkJZ1UNeHH8c
         riQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199277; x=1788804077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzgUwaQwZkakfwcRSTvIoOI/cqYjfJpPcdCsGPGI/Pg=;
        b=AtFUxEUJ6LG/4eFNNoBnt6sTPufy6bjpDIlY9RbF4Fhgmrq2qM5QtQtTBQo7UCqBGU
         IJiucj03WAJDOTPcPDRkd0fGossqug/TR3/tbK1Ph99rPRgr1IVu4t2C7P0fkhN6rW1c
         Q3X92VsPQp2H6ywJJzNocTtbOhwXRFeLfdg8tbFxN3wMnYHCjMe+gQCO49Rj6U5rr+qR
         eIkAxRWuaqqN8b4RsL2wyh+D7v/wlpbEBQ6StL/7KBPKP6OLSYLtXPq3ZXqmcMo3tbQX
         3/RjcgZEHgZhICzCfw/+/Lo7D9Qwj95NhqvslEcA6lBojuH8neMf2OrZhc+rTL2F0Gih
         WQXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNZ8MMNI8UEBZhkMKDBx9zs3UrhpJ95x/qscJs6PuQEBOYmu8WHyQ1S3u7G/qLzidATRO4PjHw4JhRdt73@lists.linux.dev
X-Gm-Message-State: AFuF++lxPKzktUX7kadYgwM22sFUv6gSjAArkzE60sed6566c2TgfQya
	sH+sXPPrI04KlguWWD94tL6IrtuUioLrYjkmAWnAvms3YqD7vD/pNIZE
X-Gm-Gg: AYBFou2c5zzHb7EW8BEw9h5ZFECgh/ijlJ0o6oSllhUPLqg1cGKVb4FSqrW8lCkJnvW
	I9pUXE22MmjGa9x8shM1e/H/V2NKFdETodRSCXZ+s3UeGVY954Ffd6KKVESMZaUjf3sRYFDYIaV
	ut/JIxzmg9YxklWcK0JSOrxWCXi/SZ/c7MW81l+db5W3hguKw35hK/gdHteEadeK5mNOI94ewa2
	qrbTHVuGB9VKy+0WyuSFZVAgzaJkIAT8DE9U0v6lusXQ0qm//sFD2rt8WX0dZ0KL6BU+6XPKjPn
	0ubK7EaeaK4lZ/boRy38GkxgFezCnkBJNZwPW8B6Yow14Ld66hn4gAwz10hK4Bf/Kj4UY3IPTCk
	HlfaP+td1ijqJqW0kEPsetv7HFrhgaH0oD9bYgeWvHCZPtpBSW5X/jeVprxT273PRuvJeLjusDK
	LraGxKT7k3EwZG75WyegHv+c/0XAF0OIEc4F0cfmL4gHIdpy1LVkxGQ9a0pgKnjomsBUgEfx6CR
	cDmvLSKIxwu8kqOuNvIOzEFu3m3Pl0nNvL+guOIZeQ=
X-Received: by 2002:a05:6000:653:b0:482:fa3b:fab2 with SMTP id ffacd0b85a97d-482fa3bfcd5mr43581557f8f.19.1788199277291;
        Mon, 31 Aug 2026 11:01:17 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:16 -0700 (PDT)
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
Subject: [PATCH v5 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Mon, 31 Aug 2026 20:00:51 +0200
Message-ID: <20260831180101.3109854-7-mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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
With Best Regards,
Maurizio Casciano

