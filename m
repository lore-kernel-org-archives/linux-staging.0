Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450620C031
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458883; cv=none; b=phs8AWcjH6zY/rxDLwSeg9e9tq+kHfd4cwbGfgzdyMu22L3eLcIrPYi7s29HZmsfqfotue7XRU4A4l7282MhYq5Ix/E/86pyAZwjdPUBD/3MB+sCVoQRrnPFJDJCoB1seGpi5HtGm/rQvr3q6LvOK2xn6zuoeUd+//505e4toY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458883; c=relaxed/simple;
	bh=exadcfJVkTurDFUaeZb+RqB2u67LeqpkrFjvwrXOI70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxPyfdbSCNEKxEWdTvx4W80iaOq360I1zU0GbQTc1DpCLNZsxiHjcpVoxA5Ge5KVklqWbWeRSSyLjtcj07KsNLJkIkPdhFvLMFRHyzbGFy51L+TvK4f8NNcLIwFHJzooQNup9YOOBF7/0y0RAI3b2pDea3cqCwiMckh4gxUVkes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dK9+FpVM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dK9+FpVM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac1f5157c90so485719666b.0
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458880; x=1742063680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQJEYnQvhExzx8TDjhGPNTh+RNL1iu0t7DvSRmmSgXI=;
        b=dK9+FpVMjuxWtebT+t+qg/KthFAXdQNc00LjdX2wSPgRk6/MupAZUQwDlY+CTNtn6w
         Vaz7vcefixSdq2SjLQCHscNsOlXZlEGKqVG16VGmo8U8HiKAPlFUyfjyDaYoV30D75jP
         zIjLQv+XljgoKjjm5+Pbd21G3HYMg6sHW8RIiC2lAnIg51XVk/033I7zM+13pxL2dDXG
         x7oYh0I18BXiJMi54cfzNT+lZrbJzmgzpXITNDZ8tzzaZwL9bjPsRbMjfnnVY91HbjxP
         rwxPh7uKPUhOjO5aNuyMpDj5WjyLFK4jyrLMvnNj4CRCPZF9Eec5G4MxQ8PkF9KrHNGi
         YrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458880; x=1742063680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQJEYnQvhExzx8TDjhGPNTh+RNL1iu0t7DvSRmmSgXI=;
        b=WrdFAdXqNmYyckYJ9yx7GrBq76kJzJpOxsMHThSNmDKW1Y7GbcIF+TkbpeaPquXKRB
         tYu0PSkv/LTaB5TgSnbE4KTJFN/h6O1DspmKCdWlcRu8p9SDuxZc2BACbTOPKxiQy7f/
         /tUErDt00uooyfDZb0A/Pgk9bU1X0u21KWLPmmexWP6YMF0lgilH101XUNdbSPSoH1EK
         qwCi1sTRhjY/hOANllrkOaL5Do2PaEipTrjLc08Kg0PUKjVDyN1g/ghM8vmTPOIloY64
         wKRqX18CP638nbvQ423seMcWvglreTBJAT9kWmOljG6426moxzNJL0w6ji5AAXnmG7hR
         LfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvH3475i+X5zLozym8v53EqCUxK458bG/0kdx0AlcyrM4O2svKdHHP3uTyb6DyjqPSiGaRXRoybqaI9Tnh@lists.linux.dev
X-Gm-Message-State: AOJu0YydYaVAsssVDGyKT/P4FwMmRem360YkLnuUAwCTrqC4U5jmxldH
	Oc8cCVtTJNCbrrAeQlcQvSEZ93vXH8zGLg3O8VPjgPUjwNpwRGSn
X-Gm-Gg: ASbGncupZCwXyG4WYI7y4qiBeuRQptYMrfykkupsbUW5W7A3BKnOSCmzSQuOGV19Vff
	QdUgiIfa1DyiUH8+4KPfqHD7cf+WD7g4di3QcNUSIFahzUJUkMlxVS43Hyo3tPb99V1DGbxiRst
	kvHKrL6D+ewJXL71MEh8VU1d3+MlBZdSA5rowUXtHrjDx/kngrmgEPO8HRToMY5mXzFEb6RtGLD
	Ix/K4MGeutIbcQ/cjj7f1GtHO8wXQ5vrUyeVdSZ+SS0zLnmamfq8JArFV5s8Vvr/mhGDxwKNXDJ
	U7sJvkAeeWKXLXYc+9B2IA8E9AXdIl1GPrxiHTJ4qUPhXJDHLjb84sZGcA==
X-Google-Smtp-Source: AGHT+IHutThyGnIQqvbIW7Z/8kxkfEm3URL5upQB6kksolklRRYFKs6NUWaDZnidc7rD2PSGBBS0mw==
X-Received: by 2002:a17:907:5c1:b0:abf:4bde:51b1 with SMTP id a640c23a62f3a-ac252aadb09mr788726766b.21.1741458880189;
        Sat, 08 Mar 2025 10:34:40 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:39 -0800 (PST)
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
Subject: [RFC PATCH 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Sat,  8 Mar 2025 20:33:32 +0200
Message-ID: <20250308183410.3013996-4-demonsingur@gmail.com>
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 1026678a17a7..7d77cc9dcd96 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -83,14 +83,6 @@ properties:
     required:
       - port@1
 
-  i2c-gate:
-    $ref: /schemas/i2c/i2c-gate.yaml
-    unevaluatedProperties: false
-    description:
-      The MAX96717 will forward the I2C requests from the
-      incoming GMSL2 link. Therefore, it supports an i2c-gate
-      subnode to configure a sensor.
-
 required:
   - compatible
   - reg
@@ -98,6 +90,32 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - oneOf:
+      - properties:
+          i2c-gate:
+            $ref: /schemas/i2c/i2c-gate.yaml
+            unevaluatedProperties: false
+            description:
+              The MAX96717 will forward the I2C requests from the
+              incoming GMSL2 link. Therefore, it supports an i2c-gate
+              subnode to configure a sensor.
+
+      - properties:
+          i2c-alias-pool:
+            maxItems: 2
+
+          i2c-atr:
+            patternProperties:
+              '^i2c@0':
+                $ref: /schemas/i2c/i2c-controller.yaml#
+                properties:
+                  reg:
+                    items:
+                      max: 0
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1

