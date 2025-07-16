Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC092DCC1F
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694303; cv=none; b=R1CToEFzZ9QpYDfNNwf7A16ve8ePnGncdDeU8A/bIU0OLABXGbDME/jWulKBs6RFsyeEu3wC4Rwuq7/nM2+QPdCUUbMjJFFIT4dBg38DTGXmdlHMzHG/GgAVfE6GoXwqWKCGX5TWxN8JU2lgEQaLMqrPsLkWN9PAwDYM+CiHbFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694303; c=relaxed/simple;
	bh=jeuvs5sazyu7V8h/2z/SSmBL9wj/xBK/jonDHUZR3lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJk3l+KdjXhxyx77g/cckpLSYjznvXo8tSy+2iNE5LI2zjZN6Y2eJ/9aHn+LbDgmRyg5bXbnnbHzH3E/ZXG64bZ7NAndQfoWNQXkumgzfQ3OzSoJqE9FafML8WQ0VaIxaZ3Vf0R/Af3v0f0bY/hDn0KUXx/zFApTyNJZIJ3DQow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/vO335b; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/vO335b"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso33923666b.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694300; x=1753299100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=M/vO335b1qAfFgqnJYMLsSt59pRukYgVDzvPArqIvVb6N23kYjRhh+w3QTaTS2iRTt
         nzH+9ZNOq2k1zZccDId0HdCoG3Bg6Y5m1fw06WG9gRqG7AZPAcareaOOZsIe2YdCC2ds
         ix801FEpSMbvVYO9OziH8BLfbggm4+t8LABFcV+8DA8twWX7Fzy0E0sfSXMUJD1x8SSG
         lu1mnQbmU/gJrrFlGigN31WmCd3/AdmoGmPx1cTCpJasPLPy9SmWaXHZ4g5SdQeCCFFD
         fCretcWdeZu+s5UUIRMsqFQrtSFU8HFuP/ORevlWJTFkLD0ZH/LI1U8flsfDOL2EY1Am
         WSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694300; x=1753299100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=PDH94zF5cEdM+ZVHeMcyHRgUanbi2A0cYP99MSSzt2nvMMHyLylG88zUKRhrnmovq9
         PmWG+c7xrEUgpMUUP98pSuVi1Tg4rQDhOr+Q2nh46HhCYMzhvH9+DhMHOHbabg60YjFo
         LHrYPgBUGvPwXhFF4kdz5yiPwh33BVv/FaJQNaL92vBpD5G3Kd1e5kPqFqf/7UJtocGj
         q0XFNkBSEaQPkqlv1H/uWK/ZH19t6Fdy4iEtU3GvfVzQ5tc6WGTBK3kpt0GxTKqeEt3b
         I7Ehrbfm7pzbcQ+V8k25BdsHAJuU9e4pK0OOEV0ydpGBmp5gWMEy4E7mqfY3P+g+ulbA
         ssxw==
X-Forwarded-Encrypted: i=1; AJvYcCXWT7gfzx/uZGEw7jlNLpSS9CUQNs5iDc0uAL3SGijPuGGjGrkG4mvsRU1S3nwb18prB5WU4ViYcE9lvdF6@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx5lT04/LR8fCDy6v8esZ8HBEDpTThbU9+ZHHBVzdTW1h8GIkG
	tI6HM55W8g9TPb+dsxW9oCKHpHsXnzpKvNKiEoN1UPIUZJAC5fAGv4/EV+Z9YA==
X-Gm-Gg: ASbGncvRNkN9BCJMY1zlOO30qFwET2rVb+NBjd9S4bg7+vGrxppCyfvqBfQd6SJ83+y
	hy39rj7MigUyIB50ebRNijIqltMyONZJcF6kLFusX3BGOqZyd7Q4HradAAlhZlegGSwRMcXENfD
	HmWD+B3i6AB/e4MYvXAcB6dDhnBb6ZCg+gBtm94CMf8CBDpJe4dG2tqfbpeS9O9ry4r2Y/0YqsQ
	apj/4invwoRb8sPyvnRcKq5ieoLg5e5pGbSk5bds7U4sy7p+Ii27r6wfkswHgQzNRqS/UgDTSlb
	RsWkOUwGDCFq2X0BBiPYBHBr1lWdRHzPtDK4S8Cori7YcXx99K08ItKNqJ8oI9WY5bPTN7/zl0G
	ab8WZliqXvjozO+EQzqgowQNXqi9wtLUH7Bs=
X-Google-Smtp-Source: AGHT+IFgMJSbKiCJ+YHesw4GIPDKMG7m17QkiSCWYoejm7XnFhQC3e5fKlub+SaUuQ0HvhKw3qtqrw==
X-Received: by 2002:a17:907:c082:b0:ae6:e0b1:9633 with SMTP id a640c23a62f3a-ae9ce0d2fbdmr368414766b.33.1752694299726;
        Wed, 16 Jul 2025 12:31:39 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:39 -0700 (PDT)
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
Subject: [PATCH v6 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed, 16 Jul 2025 22:30:53 +0300
Message-ID: <20250716193111.942217-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b96..f712d7cfc35f5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input ports 0-3
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port 0-3
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.50.1

