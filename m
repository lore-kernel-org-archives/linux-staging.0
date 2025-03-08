Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA720F083
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458887; cv=none; b=K7QuV2TeGQ2GLV5CgzIwjWebkW30d3DaUEVXREdi6+g8+mkzcNsMlyDCgQMKTi1due3Joqq06jocItSe89x5YqFkFH3yhk7S3yDUTwc2Q20pTbNFrk2LMv7iC7TRkX1Gja725ZL7tQGv6Uey+vpahepZyfWkO0cU7j3U+YCr8jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458887; c=relaxed/simple;
	bh=JcNX+Uwj8MrIGD510BeCEpEVIg+bwj5e+9GO+9IhS7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RG2tHyIiA+5ft3H5MQr963gTM5RjPoCQdPGq3g57nI9A49FXTPRl85ywssJfW1aFAQyAkM3EMalp0rnKRe84tXDlu79gMvdiztNCFSZQmU4g0pmwofSmF7WsoVt2QQjkqPcKiBXhacHLR9zX1k1vFCVbK7zG8dGGC2a92BQtPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg6nuZNo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg6nuZNo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2400d1c01so499000266b.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458884; x=1742063684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3B4HVT5Pw89yNuuwGAR+e1ksx1vA1Amc86HOn9OXiU=;
        b=Eg6nuZNoGJkwpza7sW6cn1yH2Ii2RRCaEm+MoX7MYM890NUm0Z+EqcMreCn8ELiBO9
         /a5zFNeSDXUWjPOBo+O/sDjDOmabOF35KQPcIqQr7tJCoV6dNXCQqvfLIRQka6St+Akv
         6svfSIFzuJ8g8rhpEK/6maa3R2CJisCrLsfOaIywN0MwMrf39HCmzWpEb8/6jK0p8gGG
         TpWi9G7JbjuTEvDA585FZ4uYNjNodlYARQnF6mWlN7W3hJ4Ed3iCb1zVOVqsQSV76qIU
         t8ha1OG9hmcZNJYRFFFbVLn2DNMR/vT0o5oKxH44qGjfciWnXM3rf+p3VKi2oLO+joVR
         L3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458884; x=1742063684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3B4HVT5Pw89yNuuwGAR+e1ksx1vA1Amc86HOn9OXiU=;
        b=CjMbx+cx/jGV8d2AHG+nPjTGkVBKgPkTAoIcS0Q1yDka21KRwEwpBJEgP55T4y3SGx
         OtQ4ljdJo6bE3M198eoyWr6xgUKNYCc18TTbganrh3mx5XcbvIs1ivBBDEk+geKmdmeX
         nJawYfJY/CV86ZH6SpXLG99BEf5C+8UzjVMdd3Xh24po2hSc7iAshvlpV86xmxMGE8yP
         9rkW5F/VXqT16M4+aUemiTNRNwcD3PPbeVX2zTF3yfYtz4IjC5C4JyvXWoru5ERUWuGG
         2sAU+uogMVemOEkzNiILHiDMb25d5EaJxCikRjVj+z9OMdqRc5hEXLtuArLRxM6OB9ca
         8f0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUvTq5RzCNxKyM/PbxoOW+eICp+ZP5That2IWjPkS/t+zjrf3+v/OqDJC3++sR4Nt0MlLC93P8njRzHhDu@lists.linux.dev
X-Gm-Message-State: AOJu0YzH6qP8opfeCIEqYHRhqbvqXf9swJle6RVi3xa72Q0NZaJqdx6A
	G80T5ilLcW1evkAQu/Z2DfYuhSyO5+p59NOjGD38hFF0B5/I+0ay
X-Gm-Gg: ASbGnctEMLivrK95YRvlNkV4aHx/Vmio9zTzw3BFP96n6kYHU+NfWPKqMkmHDJgm5mc
	V1tqsc9ExlfXlfk1jm13a8DLF/vk3RCAdDAXQXX4oPsLjIlXiaRZE0D1O02U1WPQJYJD3BHJelT
	1QN/bQKkoTZ7qV/hPzXqZb1MrXnNeeqyFfsGSAAIqLKAbMC+MW+fq3GjZLWxqlZTzotkR+bR3um
	uBfsH/04RHw2wNJm9Rr0scQPIGVlpMsRKKkYVhT5eFRJi8duopKc53U2N+A4uvuJGuW7/gom4ib
	01j5F2n8j7Yz5AqC509JLRE257KVaDPa+SqLaiZ10XdtLmGEneYi5UVsYA==
X-Google-Smtp-Source: AGHT+IFNSueh0kjG5Dw4oKrSBt0pxkCJRfwG8SDYdVUY+KWspoiw5fa0VzHeIZu860SzagBERe1Ohw==
X-Received: by 2002:a17:907:a4c7:b0:abf:6f95:22fc with SMTP id a640c23a62f3a-ac26cc768f8mr411691166b.28.1741458883641;
        Sat, 08 Mar 2025 10:34:43 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:43 -0800 (PST)
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
Subject: [RFC PATCH 04/24] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Sat,  8 Mar 2025 20:33:33 +0200
Message-ID: <20250308183410.3013996-5-demonsingur@gmail.com>
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

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../media/i2c/maxim,max96717-pinctrl.yaml     | 71 +++++++++++++++++++
 .../bindings/media/i2c/maxim,max96717.yaml    | 16 ++++-
 MAINTAINERS                                   |  1 +
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
new file mode 100644
index 000000000000..9480d3127643
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Analog Devices Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim GMSL2 Serializer Pinctrl
+
+maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
+
+allOf:
+  - $ref: /schemas/pinctrl/pincfg-node.yaml#
+  - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+unevaluatedProperties: false
+
+properties:
+  function: true
+  pins: true
+  drive-open-drain: true
+  drive-push-pull: true
+  bias-disable: true
+  bias-pull-up: true
+  bias-pull-down: true
+  output-disable: true
+  output-enable: true
+  output-low: true
+  output-high: true
+  slew-rate: true
+  input-enable: true
+
+  maxim,jitter-compensation:
+    type: boolean
+    description: Enables jitter compensation.
+
+  maxim,gmsl-tx:
+    type: boolean
+    description: Enable transmitting pin value to GMSL link.
+
+  maxim,gmsl-rx:
+    type: boolean
+    description: Enable receiving pin value from GMSL link.
+
+  maxim,gmsl-tx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while transmitting value to GMSL link.
+      Default value matches the pin number.
+    min: 0
+    max: 31
+
+  maxim,gmsl-rx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while receiving value from GMSL link.
+      Default value matches the pin number.
+    min: 0
+    max: 31
+
+  maxim,rclkout-clock:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Clock value.
+      0 - XTAL / 1 = 25MHz
+      1 - XTAL / 2 = 12.5MHz
+      2 - XTAL / 4 = 6.25MHz
+      3 - Reference PLL output
+    min: 0
+    max: 3
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 7d77cc9dcd96..20114c252e01 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -88,7 +88,21 @@ required:
   - reg
   - ports
 
-additionalProperties: false
+additionalProperties:
+  anyOf:
+    - type: object
+      allOf:
+        - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+
+      unevaluatedProperties: false
+
+    - type: object
+      additionalProperties:
+        type: object
+        allOf:
+          - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#
+
+        unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/i2c/i2c-atr.yaml#
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
2.48.1

