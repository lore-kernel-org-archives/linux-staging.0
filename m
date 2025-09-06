Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92352F83BC
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166855; cv=none; b=jTcNCBZr6XO8H4B746DKw/L5LJaVCo6iCVTSYn9nY1z5+9p5W9UPiQ6vhT6vMdhVGkyNEj4wWZJl4eJLhCvBEje/xT4bcOu1nynbuSQC1zTC/yJT1C4X/a8oRY80U2i8C8XyoI2fAtEsXW5OdNXECg0GDRWUrcCkBc75MI3hrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166855; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lf7mP6d9bUMoV9/BSLF/wWOzz+ZT1995Z7B6/eR0tX3pLh/H22KC0xcFyE3Z6wkU1HD+Rs1kKsehftgjwZFmWRFLONEtK/giMEIplhzudX9JrUzW3gH7l8fOBVGkavU1e216OU6fDcuU4MBX4e8b8K7v3GjKMYv5oPEDLPlHqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce0cyuD7; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce0cyuD7"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so3698699e87.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166852; x=1757771652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=ce0cyuD7G/DaWE4JePag0AdWOPfBAL4WyJqk0AZiUOqc83iCtptm3HMiPvWiCADoi7
         oVFa94fQh8FsRRlgWBpkYODNTrfxVfHopp8DIfs86i11EpP/EA3zk6SQEWYae4/YCVXg
         fN+2ImhfUnaf3T4D/8hCG+ibNjl2i94H9hvgTMkGbRfODVcFS5jPs+qfWtlmU16qi0M9
         GaY6y6ikFZo2+BjaGdL0VOKoVbByG3aYOJIZwl41TIY3AvVLtnmc401h5m5JP+vpc8TV
         lVg2ElB6FX2JSxC5w5aKv/dyaEPACSZq1pjz/F14wH3zbcy5k76vPqzNhQ69mia0bOan
         1glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166852; x=1757771652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=Nr2i38/nscODLky75mXsofwTMjSV+FubzvurbGpZ5Ibx+n2lo9VppscWuo8u9wlMrl
         KK1Ax5MxsYUC4+/RbmDhTVgJJdiZBPW1IgvjY7txociUaxu/3HYFgE9lSjc2bELMCjpt
         3Npbl3HFF15WqXWJ+XuLYzapYpxg7JFR4Cl8HvVp3DPMzcMuV4DHhs1EbM/oi35+ZF7y
         hkPoGhH9TGCV7INg0SLzSXO5hSZ2+Sa8i9A85max+TGXeDRJFa8h/f8GfXmK2hmsc5n9
         k6pITGBsv6hj6ACMS2UKigUEaDP8CFLdhJeQwEhLzb4vvbfs5zLLf2iLcwhk7P/dFoc1
         vGlA==
X-Forwarded-Encrypted: i=1; AJvYcCW4J+rCfNcKTrMIzoQ9w5jbfxB8YbkCAxJXHKcyBT8Oys1h3dHHC06bouZCDJkGDE1bPsv9lQ7HFAEhDvv1@lists.linux.dev
X-Gm-Message-State: AOJu0YyjDbYznPX4YOyyEwTU5Sohm0rkY6gITO/B+1VLvGJxQdyRW1Bq
	t3Jga+sLzwKqqvzX86wK9wQrqtZxD5o0xoFtbvK6ZrvV1FqQiMF50bLD
X-Gm-Gg: ASbGnct4AM6nxF5Tu+aHGiTCfxwKdzkchtm/fOy09BEwzVQeOkBPTzaiNsI9gB/bEad
	rzn85JgGFDN94OSP8HJRAN9FhQbSH1j5OSAt/wxsf+WmV/5Gs+MqnrL3ib9sYA75AjNi/cdDEFM
	wOAuBnFO+uW8sUT4BipM5+iirPnM8zM2vIV0aFvkujx2cxOPytwQo4eRkwdvFmAy46N9H+51Ygt
	ZtvUIaTL7HIpzt5yAVEDeJ6yrFnp6rUlFL5HVxybBxdDB2pzWW1QjHMEDXjo52SJeJzRVcaJTMf
	BuRSRo/jTZuAkgWDF/MfgR/arkLRz5NhtsvYNbfW0FbJcggnQ0foJAXpmJSBPp4ksORNVNpXAdc
	eS87HWVWLCbtlL/I172kTpdr/
X-Google-Smtp-Source: AGHT+IFNdBjIXq5sYz1MCdAhWLRCrwcVaq6AC94sETsLdKECpgkyBPhg/M7G3wdyhSPEeg7Mdr0rBQ==
X-Received: by 2002:a05:6512:1390:b0:55f:6eed:7805 with SMTP id 2adb3069b0e04-56261313e4amr564548e87.2.1757166851621;
        Sat, 06 Sep 2025 06:54:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:11 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 06/23] staging: media: tegra-video: vi: adjust get_selection op check
Date: Sat,  6 Sep 2025 16:53:27 +0300
Message-ID: <20250906135345.241229-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1

