Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB907215777
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458913; cv=none; b=FK93ZNjYazQU/vu0/D0LRuj2/M1M9cKybigXnKisR9PWjdPAQGRsRwjls3cZSrnEQ/GO7agEXuUHMIHUo56qshO/K1Y7N+9aBEb8SiQpCX0LjpPUKYhvGm8Fq6yY4l6lgjMWu+VujpWlL2sUaLplEWlqQStu3kWJSGKRbp8hMaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458913; c=relaxed/simple;
	bh=o05S0tGp3dvRdH5lVO/ozpjjZ4Bgkp1SlZ/e2LGGMnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBJA1nVkqQOPfsGSQIlmcDg8DycFvL0rK5u2hyWAKbD6AUEwbETQsBtj5p4p3kjT+DL13uZKk49YPhK30j92sOb0LoB5k7opyDy/BOQk19Xg2AJOkVXC7xdrl27E48YngL1BypB96Uwm/zxd5+uGYyoGyfSjoeb8IZ9QxSVE37A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBsA72u/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBsA72u/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abf4802b242so528759266b.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458910; x=1742063710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StYjAl/VAK0MYL6WYMTcRj5E6kmKjD+sp6An2vGqQtw=;
        b=nBsA72u/C3a8jYZXZt4IEiegT4cuoppSqcHloijgV6kY91kcWczqzSloD06XdQWs+P
         kfk008rhqyqmTz/uTWMOMcfxFn2II3ehU/H+7wqVLBPaW3FSXtwwFfH7s9xM7XNK6epz
         mCTPz0+1Ls9jRpGHU7B12k+145xuTx+xq1ZpM5VDzXEwFdHEQ6DMetf3qFU1if9H6WFa
         CNxT/azUD6xp7EURwWVwc53CA73jrelqNJ0/IAcTg01hm98sNHjnHMwSNEpv44CiqCmg
         htsP7yVXWqnazmQlf3ZwxAUhe9zuXmAC1XWxmBo8LmzrWBIazlwaFXwiwWfcuUtqq8nw
         2+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458910; x=1742063710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StYjAl/VAK0MYL6WYMTcRj5E6kmKjD+sp6An2vGqQtw=;
        b=e79erSS8ZJCo2C2DORckUu4YsFAExDCX95SXDrQC/qVWR7wbFYz8LiMwc0FqbAJmFG
         3dzv3e1ji9xqhecm3R5AEB7HWaFmmmShNjhh2lQCiHHCJmMlEy4PSS6NpvV71W9N4VKC
         2ksO5z0hGrIeY8R2N97oTWxfoGqwubD7VU9m2p0WVg9/aazQA3GFSE9m6XU3oRe4XLI1
         mro8GMF5MiO6U7KAVONdR4jYU27w1oSxDXVYjEKPvYIA9qWrZ7Ve/OXkZL94W9u/E8yT
         oY+wTL0H8CvCZKw0TiuIJ43N+w1Vm11ANw4Dm3ySNIZiENwmKU7i42lySnZLN9UU3zVi
         pSsw==
X-Forwarded-Encrypted: i=1; AJvYcCUeQFSqG8GKrkJWl3ZbqJNU/8EGCgEYOnrvQvmx/kXohzr2bYPAncS7onYSh63E5pXeIC0i/DYqEq9XNk0t@lists.linux.dev
X-Gm-Message-State: AOJu0YwuhY+wTqRPVXENZB1Iuyc7abUwEVnp4ULd6af75tRKTRpklURB
	y9hSMKHbgY7lI1OeWN1sMFk82moWguXS0JyNzytafiyYYcWNGqHZ
X-Gm-Gg: ASbGncvT+DTocvrPbqGrXT8ZaNWBYiXjajEt9bRPMGDe//DSR8Q+hZTCf2Y83UEXAsQ
	YLBS+FXt1yTE3c/szsalLa1VnxQt2iE/0efBRCdhQVnFUqdnW3t2Qj5vwRItySIuwgraxo4Po8O
	2bV9Z6TtfflVztFIJlEy1cBmfyd13VzDgEm+xFSkZxwIObGnFAMw7WPWqed7wTCVdgYF+c+SH8Z
	oxt1hb72bkhOAWOPzbepioTXGIlGYm8sRz3r+XjOamR0RAvxq5r4ut2hvH+0NB2jCV0i8VkeWjp
	Qhd7EC4gbgDcgCT5lB4+qhwTiVyH1dkJ9hppt4s5GpAz2IBq4WtnVZTknQ==
X-Google-Smtp-Source: AGHT+IFkml8eKK0tt9HJFaDP4zPVB3vHkGahRibCFcb1VL1+aECeQ55QqNbdYqCYjZhicTjwIyr4zA==
X-Received: by 2002:a17:907:1b16:b0:abf:742e:1fca with SMTP id a640c23a62f3a-ac252a9e1e0mr879939566b.18.1741458910140;
        Sat, 08 Mar 2025 10:35:10 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:09 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 11/24] dt-bindings: media: i2c: max96714: make supply conditional on compatible
Date: Sat,  8 Mar 2025 20:33:40 +0200
Message-ID: <20250308183410.3013996-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devices to be added in following patches have more input ports, and,
implicitly, more POC supplies.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f0ae069c93b5..5bbd36c55ab4 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -41,9 +41,6 @@ properties:
     description:
       Specifier for the GPIO connected to the PWDNB pin.
 
-  port0-poc-supply:
-    description: Regulator providing Power over Coax for the GMSL port
-
 required:
   - compatible
   - reg
@@ -62,6 +59,9 @@ allOf:
         - ports
 
       properties:
+        port0-poc-supply:
+          description: Regulator providing Power over Coax for the GMSL port
+
         i2c-gate:
           $ref: /schemas/i2c/i2c-gate.yaml
           unevaluatedProperties: false
-- 
2.48.1

