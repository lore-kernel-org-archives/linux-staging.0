Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298132153D4
	for <linux-staging@lists.linux.dev>; Sat,  8 Mar 2025 18:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458909; cv=none; b=AbXmHu27JJVKGoK9KfIjhRGtPJe3ITd6wPtPG15Z8SE2F2XJcT9PrkPi2t8R9MHtTQ9gPzzjAfUk5MumNWpG+E8GYaeJiti23SBxuhuwbAlpDIz/ETmo2CE265xmjct7XVcMzIcyX6QM5icCwB9ys9XbnpDZrnpz3d7sNa4bHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458909; c=relaxed/simple;
	bh=EOp/22V/izo5AAhRS37CwT1hkJVaRpvHoWf6KSa5yZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNboPlbuYFqhEd3tNy/k2rJp09jHAfQAOL5GA6+RI0el3zuItKU9sl8OsMRso7MQgGqo9uRwogddAic2QMXdgsX4COV8XIM0u2NqvEUmU9pSw8sQoB5sNfDphL3GA8YaivVhlGTIneSZYP7gwehC+5GPmILgVVZE7XsS8mzmOJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGq5jzJo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGq5jzJo"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso4248486a12.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Mar 2025 10:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458906; x=1742063706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMGBxKdxUGyFUvUDQCN+Pu7Job2ef1gvSHKYwiDKEWE=;
        b=BGq5jzJoU/gdA9bYOufKB52ofhH86vHkKTmDlFBDExgKZ5nBO5LyicD46rly988kAO
         Yh5XXQz6wWm5mV3XGkt8UVoRdg0SvH6qLrE56wfWBPPc5elBBw2MT1Y27kO/hiDW1kFI
         v3JSTjTPv74FFnMIYt9HaXJ/ZTcpTn/pUt9kBTxawLkIV9z9/iLNNceysZLeULfqWAYV
         IFVFkpXTylsYIrnQJz8TY/SXKAW2yyfz1V+WLIITgK8qwS2DBcH/uexr30HY6nnwJRQl
         /KYH5FNkzrbmu2emPYBQ1b65t6ETgg3l8DpvppJEUvCVGkTvUGqp+G1wOdTyO0Og9rwk
         DuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458906; x=1742063706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMGBxKdxUGyFUvUDQCN+Pu7Job2ef1gvSHKYwiDKEWE=;
        b=ewdQVWMTNoKSFJW2kI+3pjrPKcxQgmTugygBeP/wm+lo+XlZ/nMuccvJiAa3vrwAHq
         +dfD9ntUnmGyONbKSrBRXfgA4FKqk5PUBJKpPOnVmvy8Xa/MwFRj8zQvSwacnoW2AXQ7
         KAdQdxHqGAYkWzjsGLAN4FR9FKpBKGiIgZMIiUzDdcsTprIIlgVgO4tewKomkbmvoVWJ
         pUA4TcgZEQ3vVRTF9s8wDFL9OJYMKlwNRIW4WgOM1FsyNlsi+qOHnvLeL+7fo1Q+q8qD
         OZt7d9ELymPTRLjBAW3gzX7wEwCBLKKBGrvElaYrQW1Kwnro/Znh884UsauBtbHW8gxd
         Iy7A==
X-Forwarded-Encrypted: i=1; AJvYcCWErR4NzR0F+DwhktCNCmbwnm/R5DBLAPPh+vXJom27whiHbs31ehg7q0DSEQhPEjwgI+vZkZ8TzMkHo/5K@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7rey7Z2CUyRH0Kwyi0l9IKSNwEFp+We2d7gBCVAnDCIJX588d
	J87EKrVYoCNOk2gWKFkJOFJznIwBsGGJsia6rK0jwpk60lJ/1DqF
X-Gm-Gg: ASbGnctmMfjYVUNMTRmIClHDGRc5cbfsfVOgufHZRdYWSGNFtJr065RUBAFWafM+T/O
	13wYgeW7f6Qy+MZDxRq6WnSocMArZyz+/WLpDkZthGqPNKT4/qtLAfXvXJC3MBp8krNLFlW5mwL
	8M3iYX58F/xzfREshUXByeCQu13ng1M4zqSZNxxG7mkM7cp818iQFQUOaURQtaH5bqPd+wIpx3w
	+vAi24FTAcrJnD6wzled+CTvA4cFtao7mlWbwHy/m4ofRgZZ6U+NDBb/WTaOOIfTbXjR6A0/GAM
	xxa/9yFF58fNhw26R2kR+q8sUd9SAy35bnOLZf152NBHzwC8F0iKuajILA==
X-Google-Smtp-Source: AGHT+IG1X/LQ5evGM3eWPzIxwvwVI1mcEKQY/cg9Y9a4wUk6EK21LKlTc+rG43P9ZfCGFMaDANzX1g==
X-Received: by 2002:a17:906:99cd:b0:abf:4a62:6e5b with SMTP id a640c23a62f3a-ac26c9d4953mr449641866b.5.1741458906347;
        Sat, 08 Mar 2025 10:35:06 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:05 -0800 (PST)
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
Subject: [RFC PATCH 10/24] dt-bindings: media: i2c: max96714: make ports conditional on compatible
Date: Sat,  8 Mar 2025 20:33:39 +0200
Message-ID: <20250308183410.3013996-11-demonsingur@gmail.com>
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

Devices to be added in following patches have more input/output ports.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 90 ++++++++++---------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index d0a2aaf7df9c..f0ae069c93b5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -41,56 +41,12 @@ properties:
     description:
       Specifier for the GPIO connected to the PWDNB pin.
 
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        unevaluatedProperties: false
-        description: GMSL Input
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for GMSL2-Link port.
-
-      port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: CSI-2 Output port
-
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              data-lanes:
-                minItems: 1
-                maxItems: 4
-
-              lane-polarities:
-                minItems: 1
-                maxItems: 5
-
-              link-frequencies:
-                maxItems: 1
-
-            required:
-              - data-lanes
-
-    required:
-      - port@1
-
   port0-poc-supply:
     description: Regulator providing Power over Coax for the GMSL port
 
 required:
   - compatible
   - reg
-  - ports
 
 additionalProperties: false
 allOf:
@@ -102,11 +58,57 @@ allOf:
               - maxim,max96714
               - maxim,max96714f
     then:
+      required:
+        - ports
+
       properties:
         i2c-gate:
           $ref: /schemas/i2c/i2c-gate.yaml
           unevaluatedProperties: false
 
+        ports:
+          $ref: /schemas/graph.yaml#/properties/ports
+
+          properties:
+            port@0:
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
+            port@1:
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
+          required:
+            - port@1
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1

