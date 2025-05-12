Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D72299AB0
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085335; cv=none; b=exjdU+x5m191R4gVPkO6HYckCTedWEipNCXdqUBpECHB6RieIxzJ2RdHN6STWXpZBsiXgaInOLTOYWVZUCnOPQnrU0KWuj5UT0Xb+HYfTppftg3hue3Hga05bDsDKe6wE6nI296hPYMJJZiWJa6SMa/W8gmcfeEfi9H4YO+p5uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085335; c=relaxed/simple;
	bh=ZnJc+8Plft0YCbEOZ5U61D/iUnHBrlspaOOKM22MjOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKH6JYfEzK9xGZXX95+HgSOTeTGJgD6BxlWUS4Y8/rB0FAdiz36gv0JsovL5KbVylk13o1xcTjZD5vXhXOAPKy1bDLJOlrwI5/YR89HJxLho5Jgtl//Y+78UP0iatgZKfYmvItRfWjvttBREvoGwAj6FXRb25i4kX/l12BSdxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnjt//Ny; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnjt//Ny"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so761268666b.0
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085332; x=1747690132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zniI+wfyQHBGi/dszKJTZkb9bGfPHkPMGjKY3XSq1Zw=;
        b=dnjt//Ny+Ht8WhNWOcKQKG3tg7F+1mgda3KskUJwusqYHV9dW1yYBwXX0YMjegXIY7
         zhMyX0WqbSX+W1xWsZbjFs58dq8MP/EQG3UmkL45EaziBaABvyr5aNJ94ECdeUPAeWzj
         mpEkcCaQEs0uoDVwvzgAifA9XRwMBZ0sl3LrlYjUvoyZVG74CFI/NohdluPT6CIieDEj
         tc+eVLO7cO/b4R6P1FTpTbyphXq75o7tnJCPaJW3LLp8uz1BgxzxgNnqHTS+Ln4ovzgW
         l92XPRT+Rke8S+9jI1J1neOaNCpjr1HJdXFtTastKLPtKGHQW2IjxnTmWnavUFGcVVYp
         u7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085332; x=1747690132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zniI+wfyQHBGi/dszKJTZkb9bGfPHkPMGjKY3XSq1Zw=;
        b=YZmWM53xcWBbc6fqmCt4niWNQpRhaPpvFwGP++0J6v7/XMbigy3W4JJcBCvylJCpC8
         9C5tvi4T8+Dko/yq5jz8zki3iao3JeFpptzeoJQxRLKuiHzN2Q3TpKS7wKPpvp+/PWnx
         m8vVXzLHdWtQd8B7fCSAFzp0w9NOiYOZg2XGe12WtT0354DjlLGAZn2GIG45Mj6/jpD7
         OWTV5d6MnETD10/DFLSO5nns/wTvbCac+69IUuqN7FQek49ThJILD7SQRMy32cC8TMdD
         gzP7UvAgaRUXWvI++Vq5EzBgcuHI45vuoWzDXh57ETp2H8VTt/FI/T6CMj1ZjL5S0bm1
         eIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhwKcjjCt+nqwDuJ1Zm7FWCH5rT4l9h4e4oxfpLa2pdxf5FigRIgSPoIca/Kwhy7jX6ZLQr3ZypCVg5WYS@lists.linux.dev
X-Gm-Message-State: AOJu0YzkN770sQr1Kg2X+WKhLLpC3AIjhIcWpkUsywKCRN9UWZ5EQJ0p
	gJxGNv5FExkI9+0GJE6Yp3PkETeZeie89A52Pg9PDD09URWNymXj
X-Gm-Gg: ASbGnct+1cZ1fksy6YlLulXF6A83Y3xyTc7OZSny6y15lW9EXoFyY/TFjaicf3fA+j8
	VrWK1ShTFAfXlYjEaGrYRgJ7tod8nxldkUE9H0StqH+5Y2yHETqMh2Zvqk4l0VugMngnvtPFREO
	Hh4y/7USLOa6xFEQYwqpVHnVPgF9v5M3ojfzdIB4Cd2qHR33g2o5oBkQggtrCeAxXLdKz+pJ1/T
	w+DfN7vcl/dUcKE2DgfeSEqRpLzw6vXZYrlcf+U5AC89Y1N6oEKInX7ZLj/P/RhJGMtCtUeHkoE
	THeLOcny9btHL2zOgINR7UsrEldGeeyM/APDNA+/aD40QVmRAlJjO/MihmtURbU=
X-Google-Smtp-Source: AGHT+IGpEtJ466hjYZxHXgDx9Wx4R13JZ1nthYkWedmbOHtDOcknWCFkgjViOloIUCaw6IMyoZqxVg==
X-Received: by 2002:a17:907:3f97:b0:ad2:2a5d:b1a2 with SMTP id a640c23a62f3a-ad22a5db522mr1283450066b.57.1747085331905;
        Mon, 12 May 2025 14:28:51 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:51 -0700 (PDT)
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
Subject: [PATCH v3 02/19] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Tue, 13 May 2025 00:28:11 +0300
Message-ID: <20250512212832.3674722-3-demonsingur@gmail.com>
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..167c3dd50683 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
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
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -99,6 +123,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
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

