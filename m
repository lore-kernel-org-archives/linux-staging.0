Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D59C426431
	for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750595; cv=none; b=lWe2dZIlk4ASlECWgEx1GZWkRhNlN1iwPYtgeJkxx7UKzt6RZ5Qk3ib3UGByK5uN8aP0J5KrAuXWd+vwSSwFnqlEjy5e3K4M05SAFoEIM/mggUH5DAb0HfTJaGIBTW/PfjaSmpwEO9tLL1oB0yAfB5HMr7+A928vovs4MLUMauc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750595; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kneMo8B3xDicnAXmuxY+uFYgeHYsLVFW8ISBTrUbmSg3N8L9oZyXVHtt8557oxzh+Kvwv5yuX0BQd7IcBEuJsCXmJyzoILIdruxwOmzOhIPKOFDwCpXX5zXaUbGJR3SZHsrpM0/QQlZzAcc3j/1tx7qIycnBbVGgtK8cH8m6pgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnK+BgRv; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnK+BgRv"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so1197291a12.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750590; x=1788355390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=rnK+BgRv9Lf2QK0eRZc/xhyjoFWrL8Bf0C81g1TB8ZHnyIBBvmvWiFUP22PM+vnKPo
         7o4B5OMy/poxhblAPqUj9Lniww/kOttj45rm/4WRa3fx04j1tXPLyMpfo8iWaSVqekrG
         uBYaAk2nxmWnJGBW53ie3H+MQLut1MBRExjSsYrEz++kiLlA4JW9KRTcDryf+B+WPgGa
         L5qs9rw6ar524pdSlVNxqmmTsduRbfyoTsU2NcZvug3rNjA3s6LJnbgQkAudGRzUVA7b
         qeq44vE8o9tz0S8PlJW6KoTDFax2xYJ0+wxZua2mX/Md7LEc+XUF7v78vIzNNECTrS4a
         Gokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750590; x=1788355390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=SsQQ0aK/Vom4C+8eJ4GPLa9QSjI66LUFdeYum/IJFzGcDydQeBamIubaT1S9JT90zR
         O9nruwBuO4Uz9cstPHWQh8zPqvULIIARI/u4WFmQy1FUQziKLk4ukwFjvbyX9pKqKvK4
         SyyAnM3pl2SyGlTJuV2wc/6xrCcklZDq6GNL5oi8Jn9So8AF/Mul1WV3t0xeSQ/6E16r
         c1ButODgaCGmxF0fnyAsjxU8Jd1+j5W88iHSzldbIoNlpQfsFRjx03EN0AdBR/CJRTMs
         OWsqGd4XElG0USOP2d+3GfCWywo9ZTFuEyN+yue9OdTqKgSSJEYwwkz5kTGYpTSh+O1l
         xeCA==
X-Forwarded-Encrypted: i=1; AHgh+RpI08axQ+IAh5OKVfEYlztCfFv+9NpDG8OM6DBEAKDbfilk+4adh+m7C3XG+ONjvDBeB/bkXpUb84h0O3Y9@lists.linux.dev
X-Gm-Message-State: AFuF++m9ESAyfgiw9eXWz6Acoa3ug9nNZi4U27/O65+DuwLW8nZYwqj8
	5FXN5H4Uv12K0XYE+vCNtBn+cH33z3yNuFd4VPjTn026dwRnk1nnv9Cu
X-Gm-Gg: AR+sD11d3meUg3jXAhabKbJvxh6jdpvMUUywIN72TJ/YV1p+dqGLsifowi/WL4p/jp/
	99w3tRWO0V3U2O4xmFbeZjrISA+6Mt6+0Vk8ELteMmT9aoVmEXmv01mTEMwNpeXh08Q6cqN6uEL
	lju9S/ZC0o783kXDi1jVRLW+pFe7uFxoLyuYsxOeJHpD7i+pEyUniaVKeMPbKA3Q0UL2cBmT0Kh
	zwod++Nui016T5CpeNtPu3o4dwn9wD3wLvAYEaPLWbGHde32ojllgMiDgJJfWijCciGnWYefxOi
	Q/h4C4cp4SHB1hQw60Nd1rMHLNs/Iqjx2s2xB6WJXECfJexWPHN97arJGKhLfMyiQ98heC8UJkU
	dEHKSCSxRPGG+z1BRnv3FO/ldBagrz9mNMXVbeVtxHaHzoxmpyiUNYeV4jYXJu1tUUijLS3dRdD
	SV2q/vFMOIkBzevv82hwQ9QgLgfPepFNYRM2fM7JCY32IZxCn9gRu9OIWjwvYgYVahi5HbGazf8
	e6dQpfmdg+tP0JcIPWMfFXPzpBnMNAjkPT4v9GSq+T5sJ4ppeeqkg==
X-Received: by 2002:a05:6402:21c6:b0:6a5:7aad:e75c with SMTP id 4fb4d7f45d1cf-6a5df61e239mr8437572a12.6.1787750590242;
        Wed, 26 Aug 2026 06:23:10 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:09 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 3/8] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Wed, 26 Aug 2026 15:22:51 +0200
Message-ID: <20260826132256.3343451-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
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

