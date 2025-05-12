Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C729B214
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085353; cv=none; b=jQat6W9gRPh8C3liyuINzS33KhdI1cSr6cWJcWZjgD4h2aBMa0IQ6YLpc+R9VtHJ6bu3Z7CBV0Vj24raqPv8z22BbLY6/fC/NqJHywKMRD8d1QXNqMInWON6WABw9InTPKikVVGQinaf+Emy2/yWAMau8L2P+mnJkx2S04o0Cl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085353; c=relaxed/simple;
	bh=5+JO0vRYD+fNefwX+fbceUZ0uXE+29KVob5wwF7490I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thZvLMixpfgP48vngyGY+Bunn3mm2TKxbb/EMH/vyDULBx5bbEIPqm1ZxfyFKRe71NricvDr4kqDNldkajLz0dxBykEKXjR6t393O9n9azBa4v0rL5qnEFxh0LeesK9Uglz/h/hx2kKI1uSc9nTL04CtcyKYoQwF0Ya2ur36q5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYpga2FM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYpga2FM"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fc9c49c8adso4923116a12.3
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085350; x=1747690150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwu29EMYbHZnZ2ingPRlXQV8GOHy8olFZlFGRco0m+E=;
        b=NYpga2FMt994PcF6YZ84rNAnNS5htM9OTiB6olY924m2TnRjkIhj7fcAwBaC86LGXB
         MDJtXIDFoEO+fPiTCAqDBnJuzRyq1knQEfamb9JcH8zvCOE/w//X4hK12kTSddtpivJJ
         c56GeBwEBp+nyOku0PV+X6SKVmBH2Oel5Mz6/uWdWxGrQz76tQPPu7DQq6k87jo/C14f
         Fzzm3Ww0zXXpdxKDdHO2Rv1JnSv+p7E75abL+OJAUVlLVE9+BNFFbVX1VECi7iQm32L9
         c669U5GA4oXZ8D6zPHp2sUoT7/Srb0haMbE43ABrlqoUyInBh/qqfRy88lUEFJM64doZ
         sgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085350; x=1747690150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwu29EMYbHZnZ2ingPRlXQV8GOHy8olFZlFGRco0m+E=;
        b=SIhKSe6RBVN1THud4Uec4KupTUY41MoMCgjx2K7iApwm+mYMHcbnTsQdJreLVlVAzr
         Z/vHjCsFkYC9cj/ByhtfF/lXyevjozlZeA23oGdC97PeAGuVIItBWHgOpsKRouJ1wnA7
         1D1hhDQan2Mp3h+CvNutki1w8XTZYCHSthlbOZx8FM/E9z31oBKonrPzDYgPy3iYVSaV
         ucltQeL2wC9TpCzjx6V1+PtdSonZ7A/t4QgINoivwhLFwq37vmrBCsewOD3GpcrJSPdI
         1OX1ZWxVXJjiW4RHlsg3GIoNeXsBSz6SwWRVQ6x94VPWbx0OlIxkeNdjBPsA4qhIZSAP
         3hwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK1n6lUnc/V03NPbnCuXOpAiPeRhPm1gJ0cSED97gFFGSzID7Os0J9IXZy6nsni9UTQpIDj4ybAGHfmXsO@lists.linux.dev
X-Gm-Message-State: AOJu0YyzvNk3Ie5Ozq+tSw+l6GflWhU/nwrnMtgsJaF7J6I9juiuHlgj
	3SOjPmuQdWge599Prvn04iPYBMRZ52d6ZawQPGM7g0ZfSZnnV8Oh
X-Gm-Gg: ASbGncu/y7PgWdBVqITNXIls5pl4ByZ4rogoethP6aclcIA3ml8LzgkQ9hjvspH2VKc
	xH6qJ0L2JjcGQ220W9ornFkDPabYl+soOKTFWccDwC17/hFq7wem6ugOuzRDKBo2BWQHlfUbfNo
	A+Z+74u6InmL6zLLoNjleOPaXilCuVQUcts8b8gJVehOSBBhu3wV1MO14LnBzKEvGhyMUWDOMRz
	hpox4EQH2Bwuux4asQa2YHU5HFKgaBgYIcA7tT2890nn29VI1SKaKZLe5vCbs4EGzzuFxOi9fg6
	H7UxDfRN/UIWtMhDV30m0aWbNmgXQje+eS0H1g6WBEv7M+lKpIxnalkgniyRsBs=
X-Google-Smtp-Source: AGHT+IFh9UpWB73Gif9/RG0hEasXz8yA7Q30IuXmnkfuwvL7LMAjJqRJGSW/yg1R6sWeJzfxK/H2Rg==
X-Received: by 2002:a17:907:1c17:b0:ad2:455e:6ec0 with SMTP id a640c23a62f3a-ad2455e72bdmr811477866b.20.1747085349950;
        Mon, 12 May 2025 14:29:09 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:09 -0700 (PDT)
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
Subject: [PATCH v3 08/19] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Tue, 13 May 2025 00:28:17 +0300
Message-ID: <20250512212832.3674722-9-demonsingur@gmail.com>
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

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index f712d7cfc35f..758c0223977d 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -79,6 +103,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.49.0

