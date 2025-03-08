Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929C4215F79
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458919; cv=none; b=HpMYOhZt6ZyP5MLMhxlKooKEeGQ/rBUkxJy4ng1hpeWs79D3zxMQDADNdsCxNXFf3Tb9IeRDszc+qdZWijsQ5dsPpogARlA0yL3kkmsgZIIFP4tnP5RtJWwoDnPKHJaIfTj+mmM9j6nJ7Mv/I0szERUlgd+T9y79GimBNdypQ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458919; c=relaxed/simple;
	bh=BJzpD4gfPGejKywhP8UPgiRX4+wHEm1Y8kRS4kT9oec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk7v5GV57ohkkpxEr2/2EBg4q12ew/FKDQl+CcoKAVhME76tOTGe5pvRjv7pjU9CQbNNpSMdpiUbp4ssQTRJ9+lXHAc7elqhSj5pixvAPMb6iXuiiK36gxsImUzk/6B0bWbjL9WvXlQpBJv+51O611AmFKZWlX1oiV6HfkQshlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jD7uzOFu; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jD7uzOFu"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf48293ad0so469512266b.0
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458914; x=1742063714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6+z5mwvOpLxFkXjmRmdjGwPnNX9qEV+1prpbhSFJtE=;
        b=jD7uzOFuelj0YnNWrx9oaL+y4MOUAIX34jk8to2xLFzDDAauve2hKcnGeYf8HRpqRP
         RsscI7WcNoKfpwc4lvL79viqhWEKuBO7+JjuOz4HqIYL/5dOEUcrPhZaTsgyMCOmu01q
         /NTcNmvBLlnnogRNxB7dZ1zGU976laLgrEkXptlHvLEA0nld/55OYDckT7yatb0RH33Y
         7DIkzYA0Yd06/XfeSIpwXZIrJhIm8g+efdlo8FYwhOgKNojzquylE3e5EGMvGBezgZCA
         ySg/L9Pg7w1Thk+hGVEGEguDvWwhU9sQT8fwRTCiraO4PgMmG2RTIOioA62D+8fWh9/z
         OtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458914; x=1742063714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6+z5mwvOpLxFkXjmRmdjGwPnNX9qEV+1prpbhSFJtE=;
        b=vlcgIoeVX/kTzfdOAKy9wcg51lKJJbU+kANeRUXQGvaORMTzYqn0xMWqfd3ylxcW94
         QiZ3RwFmzUHqEzi573IgxhyL6+hWMDB9oDWFkxeX+5/iK4qUPB6/QUGJxfN2FQlPXO17
         5v3vZJABW36uCV2fOjWTEgw0zLT1gloMeU77rx+7T9VIWAqLkE8cNhiuor4Gt30ezTeP
         COEA+U+/A0vVQ/on5AVzD4lkqiaXCp9JUQHADyDbOKYwzEz73+ro2Nj8QdnQcO2WcP1+
         5OQun96zk3nawd2qT4MEaEZF1jnCalty2v9Y0X43WkPeup5EHK8i225SJ5iRDpwZyiDQ
         nfCw==
X-Forwarded-Encrypted: i=1; AJvYcCWm3l6iQ6eXyxFFp+4wdybvIUWu8mGvsags5vZx+czsNZAUTmUe9IC3F59vyIncQ6iCn9Fclf7xsixUBoyM@lists.linux.dev
X-Gm-Message-State: AOJu0YzY41oCkREV+PrnSz4lOGXLW9n/U71GkHd6ih+eFXN/4W6XOGei
	R1w7MGmZNIUm6BQ5HnntOVI3exp1ROVEH30dpzvNlCcX5Yeux4hn
X-Gm-Gg: ASbGncvB5ji+U71eGaKnXa8Ji0KqjXAUs758sKZS0lbmLw4fSdmKgBMVpjsrHd/isv8
	2ws8QliUt5E96Lmejv9x1KWysDtqXS4dmaJ6l0fdcBMHsq3VdJZK2EbMcNUzb1eeQ3c0HfyDLrV
	7lcXnOZJcwh9zvZ+K6QBn+SpQWgXk8Ggtm4XF+INMmBlRlyRs/gtran+PhNkcf3ucbu8rKnd4eH
	29wQyAw8bwQOv3Ud2MwBOT6oviIszQW5ei3a1ldOiaVpHmDjw2zYQtiDeJp/XeGjsfX0RUepPtk
	dn3gJvDDcjSNIJtZ8kyZO27oLDowX1PTQEdc1eRjvRn9Ae5dw1T2A5OpBg==
X-Google-Smtp-Source: AGHT+IFh4qSdAc0ziZwtQFqR3gB3PLHeMZTKtpDvQwy/JOvsAtBLR6l0SztItz/m5ITqfugVt1AvgQ==
X-Received: by 2002:a17:907:3f9b:b0:abf:c20d:501a with SMTP id a640c23a62f3a-ac25264ca27mr967872266b.16.1741458913731;
        Sat, 08 Mar 2025 10:35:13 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:13 -0800 (PST)
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
Subject: [RFC PATCH 12/24] dt-bindings: media: i2c: max96714: add support for MAX9296A
Date: Sat,  8 Mar 2025 20:33:41 +0200
Message-ID: <20250308183410.3013996-13-demonsingur@gmail.com>
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

MAX9296A is an older variant of the MAX96714 which doesn't support
tunnel mode, but has two GMSL2 links.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 5bbd36c55ab4..9c6c79a770ed 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -22,11 +22,14 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+  MAX9296A only supports pixel mode, and has two GMSL2 links.
 
 properties:
   compatible:
     oneOf:
+      - const: maxim,max9296a
       - const: maxim,max96714f
       - items:
           - enum:
@@ -109,6 +112,90 @@ allOf:
           required:
             - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max9296a
+    then:
+      allOf:
+        - $ref: /schemas/i2c/i2c-atr.yaml#
+
+      properties:
+        i2c-alias-pool:
+          maxItems: 2
+
+        i2c-atr:
+          patternProperties:
+            '^i2c@[0-1]$':
+              $ref: /schemas/i2c/i2c-controller.yaml#
+              properties:
+                reg:
+                  items:
+                    min: 0
+                    max: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max9296a
+    then:
+      properties:
+        port0-poc-supply:
+          description: Regulator providing Power over Coax for GMSL port 0
+
+        port1-poc-supply:
+          description: Regulator providing Power over Coax for GMSL port 1
+
+        ports:
+          $ref: /schemas/graph.yaml#/properties/ports
+
+          patternProperties:
+            port@[0-1]:
+              $ref: /schemas/graph.yaml#/properties/port
+              unevaluatedProperties: false
+              description: GMSL Input
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+                  description:
+                    Endpoint for GMSL2-Link port.
+
+            port@[2-3]:
+              $ref: /schemas/graph.yaml#/$defs/port-base
+              unevaluatedProperties: false
+              description: CSI-2 Output port
+
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 4
+
+                    lane-polarities:
+                      minItems: 1
+                      maxItems: 5
+
+                    link-frequencies:
+                      maxItems: 1
+
+                  required:
+                    - data-lanes
+
+          anyOf:
+            - required:
+                - port@2
+            - required:
+                - port@3
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1

