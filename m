Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CAB2E091C
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852331; cv=none; b=GsZhOPBTi5TroEszihwN5iLpOqWJTsNXXQhuAfk8ySy1ZpJARFJ3EZPrePN3vHMRKqYeKW5nHxrMTqiDjT9V5QEZt2MKnuLIe/UAGR8gl3/Ljzb4W8w0rYucEtc4jD41sBGupr7jVA2Ajm7Hw2S3lum/RJq07r6Nsxifw+OzfKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852331; c=relaxed/simple;
	bh=RVveu7Evk1TPpysgWbQDv8i6qZhE42ob6nWPtfOaz2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NbdUVy4Oo/8GmhHvXhfwxP1M919fzfotIKHun2HCp8G12IQ6iG2VCfFh1G5Im/T8WSQsNLKTsUljtAkmzuGkgtMv1D2lvUpZsKxXRhVEBn76Pfn4oa7adzn/HfeCnRHf5bRMLBmECQZDdJzLw/ZGh/W/0mhY7/H/iiWK3FkriPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4ZrGZUf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4ZrGZUf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so1123869f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852328; x=1753457128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=Q4ZrGZUfWHXJxPJkG0TNdnkTcXdYEGmK+MtzTMkQ34DF0EOY9VjQMWhRtQ5d5TFmq4
         ekX1Paa1Du+0zr1jzcBGXpClti6BB4pzHqgduw1hUiT64hV4vaWRH81guMssn3QZHImZ
         Yx1twPlLPzOxYq9mj4G0uKJJVP6aCs40ZIGN1dT/NEcyYIbqYXTmtkBg6n0oeYARIz7H
         Db9+nkXiQkCWbYMF/kMK5KQs2KAhAurtdvsJl3rn3v8aAwVDvRmiyrw9qgE/rCaD8Vao
         GvZDR8fSznzFPZoG1WyaDtB/chrHO8mN+pY20d4tsgbspV87eS7Htsy8wj/gnrCU9Erg
         Dr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852328; x=1753457128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DG2Ojz6YKxpY0UTt6+EJTFAtjpkMtyyp2I7xk76Z7Mw=;
        b=bGPEiD/r/9/3UYdLqr/Mfb3R+9D1fcQB9RuisWZeUNN70z8Yzz51BcDiob7aufcPOo
         04Eh4WikPCSaklas4nw7/bujezM1I3e9McakNwb2yWQisagqSO6XcXXpI4nU+VzjWb81
         vHHRM4KHXeLTjlfHpxJ07Tz/ZA/0WvESgNlqjmHAxH1zjG6YIh3AIz6Jwt3lajt5EnrD
         ngevcsIrPFMDcSilJ36idijWewferWJZDIpRPiS4xSAQ+kj72jqxGZhv6TFfo5GyqDjJ
         gbWl8tSnWz3I3lW9k+5yCSvMy5EpFRPX4ql1LAukX4kvXhHCqeO0M/h7kz8jUSpP17+1
         aqQA==
X-Forwarded-Encrypted: i=1; AJvYcCVlcX+/76iw58TmwSJOlE2NLcricxuHM4oTeR63hVV3cpr49PduWu/T+GlEgUGtpR5hY1K167ROMC+lg4gX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6GVric/otVHQWbGmjGLwPOkIQZO2NOcsUgJQj1LbkJv//wPxx
	CwCxI+QgjPUQVOGrSt1D4DAlFPDDIdTC7bb28a77mA06I13hYetV5iLe
X-Gm-Gg: ASbGncu4pa9bCcGaz5Q3huLZIEiF0b6php5sodUyxvYhetmcTy3yX+6r26lEC9RN5j5
	PWTydLW47tae6CODxmtePBa5XXEoKrMgtNIEMMfsI47rHf7qD095c/qtA+4+9bxvoxdKSjOQw85
	yUVpa7T1mqDjBOVMK/RmuguYgYKmxGKM+lA/Zirl98Td8yeEx5xSIV63fcuK+TfeWeFYXIujXht
	q9uasznuSifgnD5QwqXPJs0zCP3KVw7sRsIJcQq7CKEYMtNKYF9rTyUrNr8MwWCtFu3rrK1AGE9
	TgYQuGNGiBMxtwaE18LM9yqE6H5W1hJrzEO2pVWpuImmP1Wh7rVxKztRwdFxuDU+UFQ0f8f4e1S
	4m8DmYHGpXvFMPvcXnYuQ8vBF3F2ZymkF3C4=
X-Google-Smtp-Source: AGHT+IHMaZ6xEx793pS+VQMOqZMScf0rd6McvymX91J9dR2zouCdkLclsbNOoq48C7pVJzsxrGBGSw==
X-Received: by 2002:a05:6000:288f:b0:3b6:489:b7e5 with SMTP id ffacd0b85a97d-3b60ddc5a47mr8778911f8f.49.1752852327784;
        Fri, 18 Jul 2025 08:25:27 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:27 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 07/24] dt-bindings: media: i2c: max96712: add myself as maintainer
Date: Fri, 18 Jul 2025 18:24:43 +0300
Message-ID: <20250718152500.2656391-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd3..efdece2b33b96 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
 
 maintainers:
   - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description: |
   The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
diff --git a/MAINTAINERS b/MAINTAINERS
index e973b0a985815..3117345d0619c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14747,6 +14747,7 @@ F:	drivers/media/i2c/max9286.c
 
 MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
 M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-- 
2.50.1

