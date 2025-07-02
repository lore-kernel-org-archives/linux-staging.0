Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9528852E
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462494; cv=none; b=Bv4SYrR8s/1uQVwPAOrfjNTLpVkdeWorMpapjYNPO7DXayyOOy+mcsY0/vyUWzr6NRCXYgjSZ0y53OMmJbxc7F6WpbSp/CRA4G+ujm1VSDhFjMne3HxMlsUQualkmsHQpCH2bichmAMubpu7jPKDa++4yD/WAZRKQuTksvvrLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462494; c=relaxed/simple;
	bh=26/x9bhCee1GLgPhFD7VmVBVe6ZIvMGCVPtFrfPwiwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDNt0+P4SJz8DdsWbjCrch+LFfG9LjQrzxZ6pGXMVLsNy42/dW5eacjHHu6lwjyi53txx/GsHdK0SMSBCjn2rKcv855GMx2c3QZL4xhJqhME0x0M7g2NQ8INJj7vap5xEeVBQTmJlF/X7AjkSrHqnNRgUlzfOQr063/ic32+jjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzlhBLi3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzlhBLi3"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso934144966b.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462491; x=1752067291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uf9YgoYEo+P3FEMg9oTzk0PbyhLHnx2rt3ig4G7w39M=;
        b=TzlhBLi3ikx2V6t5FX+/12rSUL5pHDbi0UFKyvPGLaiqQBeaIaj1Yjzr7EjzsxC9fZ
         uF5zG3P4vtkvCBy6hV7Yu/2+gP3EPslgSYVJxfkySG2Trdd3Uv7+NUSf6fGdGi7usS77
         ZzWEyphBrlxxSaUkB/JRqadYQCYZDUPWp50asNOVY4o9dOpeb/vpmNDcv3m4BaC2b5Sm
         VHgajLciY86eg5HBQLGMhSL9oKf1mQkoe3OLO4OzDF0P5qfZMrvqUWgG7hL1VQMGQ5QZ
         h6CIcWc9O7mdqXw8CiCYi/mMd2zUIGdYuT2hBKqECfzLJi9kpURTq+Wj/ZNG96485X2v
         aqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462491; x=1752067291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uf9YgoYEo+P3FEMg9oTzk0PbyhLHnx2rt3ig4G7w39M=;
        b=ujz4ZwWOjDEANllB/Zt/WrIA4D+MQZL5z9hfLrKFVrT8Vn1QeFfdhEtMxTx631v0Dm
         LeEU3pYnDtuet4o0gLCMxQmVh9wGbVcBpHwhI7ZnwELCU/SDI8UYltGNid2OOfJXcvdY
         xUNSOyhi82wcQVfaWT4DqFhrt0dg+mDsS8ZK/+RsjGiFAC92uC05ALWw7Emu6b55uh9b
         LkyMl7BGNoSlMpFp4hhxg3abvuwYY8oYyguQYtqFuGc4XGhMYggYOm0acrU3uLIBu5YY
         VBDObnIw9nY/iycH8FjmHDuRH+ANRlfopu1OSg18WmdDW88mnt2P/t9I/Cs+GUnJydx4
         dQsg==
X-Forwarded-Encrypted: i=1; AJvYcCUOCk743GI6f8e1xCVXPrazUoxeC6NnLDbg2jO5AlbGK9UUJWM/eOXqGrnZJEfFUQNllVHt50NAvDpzXoYh@lists.linux.dev
X-Gm-Message-State: AOJu0YxzjlR5MXOR5GULnUGS0rDyDxu7jO38EBjjGuahf8dgMB3DZJlF
	/urwMg8aKEc3yiQeqUfWwT2isN+eg0ul0jUek2CHrIsLcUOYHAnMewRq
X-Gm-Gg: ASbGnctD1SNJXXUnYCHUn7ySnT5BXXYuzCyt+o+tfi9b+TwR7pcZRU1KLCw+BTkzOPj
	BZyizTMkWmu+4QORlqQwDViFNuJ3mt8itnR3dym8mBl2AvI9mBg6z6rne7Zf4HplH8EXpAnn1rQ
	Ai/56C2xhvnGmhCQkPx8OK0TZ9zqoWVlIOzS+Kej0xQeV/IUIPokmg6VqVDpNkDl7y3aGCLwR+q
	iI+0/GLzQETt1gKK9O5oaOvnzmiJ/LIephZdnmcDTpDHR1c2O29pXE1WjaVYUey54MHtY+GcIr4
	sauMEz36imrOrzv34WAwNI+bJsW40iWwbIJJbzpmIqaj98RDpJByCaYo2GzNltqKUC3clz8ZlDo
	=
X-Google-Smtp-Source: AGHT+IEVB4ll9itBxDfBnk9pldAGA6HiQ0uN0SNjS5Ea5oldB9uz1gq8sAy7mWtaLvGL1PJ7vmEutA==
X-Received: by 2002:a17:907:2dac:b0:ade:4339:9367 with SMTP id a640c23a62f3a-ae3c2aeee6emr283944866b.26.1751462491004;
        Wed, 02 Jul 2025 06:21:31 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:30 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed,  2 Jul 2025 16:20:35 +0300
Message-ID: <20250702132104.1537926-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
2.50.0

