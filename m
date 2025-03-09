Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCDF1AAE01
	for <linux-staging@lists.linux.dev>; Sun,  9 Mar 2025 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510120; cv=none; b=FarnNjWL5/tThr/y77nfHpkfMIzYs7Tzt4NRnpY+n33De328CQsKHgHiA67KpWE8BU/lEyrIYnMfMXoG+jSiVTtma84BahMLc7RtN5rkJLAkKjnTjx9WVBErUupoSENhmgNA4loHbWgMckLVoKjdxwyQB62F835tHcbj+1Godkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510120; c=relaxed/simple;
	bh=HtLFBeCZH9nn41lolrrGB7cnQRuzm4PKv4E8Y+TUXz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqmi0ARwVrkYL/uWybF9Y1DXKv8P97KUkDSchl/J/zBodj25Rn9QvV7GAgTrKTuAA/t9Ygyv7coczD5DJht9QHU6ZpMJPBBfbf+pMI/c7WYwVMR24TxZSTT0bnE6slcdXveYIHsROaeGcFLI/Um6fuuYEazA/WzessReSwTpIW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO8ExIXY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO8ExIXY"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac25d2b2354so299541266b.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Mar 2025 00:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510117; x=1742114917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrbGAQ2uhNvJ4/rBt+fN38afZopmEc/0A5IF3Y67uyw=;
        b=OO8ExIXYVhAr1gSK7HTJqTOgPUJA1wBy/F6a4V147u4rr83ywtF4uIqE/Qd1GZb+5M
         SIvS+UByDSucHhFnThLp3PZRM4QhkyOpzAQqZ1qOA6K274rxfc73jwoTcl/LVxm/m9Ic
         FeicDF4PaQeJLjDvxfiYyrWWcQSOw0RunBJtg89FS7V7ZaJczvkpADJIB7MIZ6eTK/G+
         TrGR1GHTaX7GXwbGoH0PkDUD0pYDt6DqPmZZfz5C0TOQcGKq2wNJ9XyT8gvsl1gT1JeY
         pQPnZ3QYin+XQD+lbxM2lvkCey31agFQotwtLz0t1UmcWpUXqBqsHm3nOrsfl6CTCofF
         fOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510117; x=1742114917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrbGAQ2uhNvJ4/rBt+fN38afZopmEc/0A5IF3Y67uyw=;
        b=nLW2lXU22FhSuWZ6iqYfqT0e88tZU9Croy8X+H4DLdrWaSGO/jw0I7K8Nw+HHSiDWo
         XFWxcvFlRl5iANGnZuhDivbOpFLCCgBDO6Qa7r+OdAdlYdRQ7ZNpy5/+XGIPKsXZCW9C
         vVmKHlHEvLcLCmvNA0wgOD9ukgPnAZqBVMa/jBLtbNffb5Y62ob8hwzrMzPAlaINbgbS
         FckWplHGQ9Wvz7VHtcEnG+3lWITyVKy+P+C6P32aLoEjIB7nT1cI30Qqnb/9b8K7kqpI
         71Mfg8Nb+m1Wi+xso3nCJW2JrK0AQuHecbDqND+HUEPyX0qdqrmHoIE99woiKFoRjnAa
         hMaA==
X-Forwarded-Encrypted: i=1; AJvYcCUALDqp8MezHITwSKLmGCGyZtGPXYEp/rWS5R5HL+FLZdovpUhlN0LPT7PPCXisbDUf96cW2wy4zaFshlj+@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb+SKiS10jhdwMTLBpMlQNSV+rPqmNHoJp+Ci8RJMxNPOweIY5
	CXAqorUM09NUs3xya0Bah761b5dMxefcm4SwRTu22yzSGdQ58YY8
X-Gm-Gg: ASbGncsJUqVun0q4qi+LyMIYg61E+OrjTkx+LCUA6xU9hqN1dTNwAXD975TjBK3nPJf
	kk4QFWa21sH38bUIvLXwcaE9cgqS5Yosduh1gbcWyFhUjlt/z/pyF/kZ45hmIUnlD+h0qwCRwUd
	ltl3j4VKNCDYAbGFcLPiDgs01+FaK00Gcv13uKULFx/uacZwFG9bkRjRz99OXQ8JXMfmMwdGMfF
	ZAdBGRJAeFhZIJmtjLwy+ePbLl3vtETDgdZLZPhiYY7GIayGsB1MBHyacNlCZ1/qNPZO0FnBf8r
	/aKB1zXpR1e1uPakFUW+M64hcNHVbjlGrOK4P2vN6vX6hR9bpyUzURioQQ==
X-Google-Smtp-Source: AGHT+IGD8kViV//YVpWgVRhDxEU4994VL0wz2et/xPmoDQOHxpV67VDbfzsmYHx+eVCo0QhuL2340g==
X-Received: by 2002:a17:906:b20a:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-ac284db5ff9mr291074766b.31.1741510116313;
        Sun, 09 Mar 2025 00:48:36 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:35 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 04/16] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Sun,  9 Mar 2025 10:47:56 +0200
Message-ID: <20250309084814.3114794-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
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
index 000000000000..347e66a5320c
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
+    minimum: 0
+    maximum: 31
+
+  maxim,gmsl-rx-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Identifier used while receiving value from GMSL link.
+      Default value matches the pin number.
+    minimum: 0
+    maximum: 31
+
+  maxim,rclkout-clock:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Clock value.
+      0 - XTAL / 1 = 25MHz
+      1 - XTAL / 2 = 12.5MHz
+      2 - XTAL / 4 = 6.25MHz
+      3 - Reference PLL output
+    minimum: 0
+    maximum: 3
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index dd28cc397674..0a43582168a8 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -120,7 +120,21 @@ required:
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

