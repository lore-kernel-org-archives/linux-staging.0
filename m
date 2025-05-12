Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A501299AB8
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085340; cv=none; b=gMCXxQtJelKgNne6elynfR6AGbJUeThSq4OdUGdVxa3yUfpx0j0J8vWIhpZyzGEwpP3M+MZMgH1uwN8zyC+qAIWEZfkD1y8q0NqFC07wJTpTrhTVRyk75IgA3eWfLKt/QQ3yxW/eXW1lD4gf4xMt0feq7T8AZHO7TIbOWqwUpHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085340; c=relaxed/simple;
	bh=TVTa1or90A2EcNKApNpwgoujqc65zgifofFMkE9RT6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMcFQQdObR3aD7nYHZdyKswtD75IIYQEJNumTe6wU0L212g/SQ0VPHhE9vlLSEych304HHGogW272e1uLO7WQ4cUKDiGUy7f6R+DyYhMlckJaKDcwAN/hfvhgCZ+93j1EqqV8WYRmdtESU0S9dPPU4D4ht91/qXwpU/fBn0deOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdOr2uNA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdOr2uNA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad216a5a59cso541981466b.3
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085335; x=1747690135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USSVmmnFJdOcJq4DaZtsKaThQaquXKB2SbmZfhpsh4g=;
        b=ZdOr2uNAv7SyWTKi1U+1fJqH/7UEf48LfCTlaQSG55ugwlnG252j3uh8QIh0oSThj7
         6G7dOQln3NN3k1+DpMeq3gR3vJkKmbf3pG9sHzE0ZhG0Ir5q95kG1ZcTPG+3hfR2Kdgx
         bz3QFq/k9V2OakiAnDs68mwwfwnmic6r8UYpqygsDCSEioP3A5capROFOSXyEdNaQ9cx
         6pQdpUj3g0TRhBjhZkV3l6byfHpLQe/FzYRbw/rWHLYAyBgFw9s+gtCKRro/PNZu0Gyd
         v0UyY+etEEW+P0zeSdyuwuuhdx4J/YiRozTg+DwzwbnvwJcNtMWzPzGHL7NazO0REYST
         jvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085335; x=1747690135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USSVmmnFJdOcJq4DaZtsKaThQaquXKB2SbmZfhpsh4g=;
        b=eHzNszxQuKfuBpoLuXyRD9eLv+HKn0eGk7AjKPkC7j7yy+GiejFe3gpYRwHd8pnqNt
         EM6WvySYaJA7HoK7MZqo7sui+rVGVO5G3rtN0qsSUfml7ij7IpX2W9CAItisz+VbLYhT
         m6gbHhanxrKDqWVZnQ9Eb1T4f7MBrAjAYLFrrN4M06F2L3CqUzlNVMOd8IfOddgxaMTG
         d0mwqSr67bthnygC6OHjEoFzd20LYAwaZbN7uIMRwo02zrUweYDyrh39mQ/yhvOP/XRD
         C6+A6uvYNef+aV6/1bBai/oBzjz+WvpS2DtELIcU7qyKsOdK4yhTcFJk5CqV0Xf7D+J+
         RJaw==
X-Forwarded-Encrypted: i=1; AJvYcCUM9jPRd5pMfNqdf48zJ216fiLEjjkKJXvuGv7t5HTzhXS90U7x3r34BESXflv6fvYHKYrPmiQUl0ajtnk/@lists.linux.dev
X-Gm-Message-State: AOJu0YxLKG9PIWX+6wdMoFdBegVFr2aP6tZzOTm91IJ4A07oIQ4QChDu
	ScK4RvTDXuulv2bGYHWQUJhdmSlzBCiIb9bUIPs7H9R7tx8ycpJs
X-Gm-Gg: ASbGncs0TEMFQt6fXmdUaeuSyD4wPVtaUVlxU9OA44Jok+L+kwVCRiTfgDyun0Zs88G
	qTd50sYQO5MRsa2ZsLKjtFj5OHqKwRCfoXu0vZ+4YbYLbbVEl0jS9el5kxzoMOaVnvIwSu9eJ0R
	P0ZoTTjW3m+5TYvzohmzG/NMZYnGdH4HBWdgbNGXLAxRx5L7j7RHEI20kC7O75TBpTk1bgsVoAK
	DrPlWWdlPSCdprq4qW1o/7I1BnmXlQ2wZutKpf4uhShmBS1zVZ9ibyoOMJ6Y2aJYqYou/lXqEok
	xmP0gfwyhxgMXxYY6JDxMvqyJE5X9i4O+mWl/h7+toYdpwIge6bD8HxKsU8jHmUYsBkA5/UvxA=
	=
X-Google-Smtp-Source: AGHT+IGZYGO25xeU+0WuvzEPqbhgDfa90J56T8yELtvmAfLXs700qoIgre4bbS1rcOkKIGUXxI87lA==
X-Received: by 2002:a17:907:c316:b0:ad2:52c3:2088 with SMTP id a640c23a62f3a-ad252c322f8mr489370366b.25.1747085335042;
        Mon, 12 May 2025 14:28:55 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:54 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 03/19] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Tue, 13 May 2025 00:28:12 +0300
Message-ID: <20250512212832.3674722-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683..5998e2518be9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,116 @@ required:
   - reg
   - ports
 
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, rclkout]
+
+      pins: true
+      drive-open-drain: true
+      drive-push-pull: true
+      bias-disable: true
+      output-disable: true
+      output-enable: true
+      output-low: true
+      output-high: true
+      input-enable: true
+
+      slew-rate:
+        description: |
+          Slew rate.
+          0 - Fastest
+          1 - Fast
+          2 - Slow
+          3 - Slowest
+        maximum: 3
+
+      bias-pull-up:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-up
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-up
+
+      bias-pull-down:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-down
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-down
+
+      maxim,jitter-compensation:
+        type: boolean
+        description: Enables jitter compensation.
+
+      maxim,gmsl-tx:
+        type: boolean
+        description: Enable transmitting pin value to GMSL link.
+
+      maxim,gmsl-rx:
+        type: boolean
+        description: Enable receiving pin value from GMSL link.
+
+      maxim,gmsl-tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while transmitting value to GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,gmsl-rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while receiving value from GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,rclkout-clock:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Clock value.
+          0 - XTAL / 1 = 25MHz
+          1 - XTAL / 2 = 12.5MHz
+          2 - XTAL / 4 = 6.25MHz
+          3 - Reference PLL output
+        minimum: 0
+        maximum: 3
+
+    required:
+      - pins
+      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp5, mfp6, mfp7,
+                       mfp8, mfp9, mfp10]
+
+      - if:
+          properties:
+            function:
+              const: rclkout
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp7, mfp8]
+
 additionalProperties: false
 
 allOf:
diff --git a/MAINTAINERS b/MAINTAINERS
index 8f463ebca056..f8ffb7cff9c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14201,6 +14201,7 @@ M:	Julien Massot <julien.massot@collabora.com>
 M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
 F:	drivers/media/i2c/max96717.c
 
-- 
2.49.0

