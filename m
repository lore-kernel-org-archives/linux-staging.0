Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ABB2DECBA
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 19:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694305; cv=none; b=SvbYOFEEsqnnndZSfuwJLWx3/Yaf9jL2JvR5uSKzPxI41k3ht+NQBTbZ7+cK7JXHY688KsqtBzWMCvHVEQREADi6551B9Vk4VSoIIp3dAY6F9rZRpu4dlScJIFSPOakni+fjRSpB20mByWlJqmNp7L4oEYa1wQiQ9wS16nJ2wLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694305; c=relaxed/simple;
	bh=NSiAFSJxTXVeWHTLdSPMG/Gzwe3s9N0ySr8pok5YgEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwxLGiwngfIFTssGVMfeNLDXcbF/W+0oeoqrIbJsAu40HWMcdA+n9JA4ffXsWGE22nV25c1JAd/VaGHHs5BNXWvviL62N7FDSpMLRoEAovZGG/6wAEDPBQV/BbYv/vzE6WI5KC7+xS2rXift9UquwLC9r7oFM3OfP8VZSo/6sUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPEmnF5x; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPEmnF5x"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so262747a12.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694302; x=1753299102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=hPEmnF5xpPDRywMszg6O/a7wdeImfv6a30qTytCgTrOycfJFU019vD2jYcWwY5lP/W
         Nhlm21aQDi+fqkiEAx8w2wJ40XHER0uTT4xCTojmi3JkLMVCwlmAlr7QK1iHxbBQ2AfS
         HgsWuebr5qUzu64yixtoMMG+WfqN/f/hq9xr+JMOtyOCtgNvCtKawHvAf/b2I0CSnAZI
         Gz/MIvUMSi017YWj8zgDsNIZ2nmLNRnqFSBmrvjZbQqr3KU+gfrQd6LAV0sSrylkEm4K
         TECgZcYvA56yrDmCmIVBdXH/KyUbdXoqpKTYfSVuw1CVBkBJj3G6qbBW0UPv5TujkARW
         TSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694302; x=1753299102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9ZjlAULE2F6JwrtpvzjiapTBh1bKC7bsQfwLuPPxcE=;
        b=JHZOCxMy5nlacB35Vydd6w5tuONVzr3S4SPqFQss5H3sPjSgK2p2dvuuVxdHdAxA31
         xV/sbGgLrZYuALnENQJoXYrOpuwmgc6+d4EVRjiY2lyCUj0itglvTiJGof8iC5r620Jb
         q1ipWZmW7+ckes5oGy2k0OX24JdB7+HUwP6Y+z8WnXL8fkJH/baJmR7N9pHy+ugrCFYD
         LEDal+WNJXnVj6EMkfP6VRxKrTn+obE+O+mYQXLijXGhlot6h51m6IO/oEzTX1fIKMrm
         59a3hP0llsCEwml1i8dobJf+hAn1VyU90WH1GSwZ7jnrkq5yV5XAZjrGIfZGT2I4wYuO
         NS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTQEIp38Rn6uj6jOKyyTUi1IEVye2OMXA4xeQ0z3TxyxzUhSfHW7JM3ghAz7N0U6Z1MC+YIsZPqCxv111j@lists.linux.dev
X-Gm-Message-State: AOJu0Yy94NUsDeKO50BArP3Ukea/aJEo1yiIQ/KAxNnq3rrPRxVaSJjJ
	trcA/Jp5GL+UfUkT/sZ3NBUpiQbkpPu4WW/Q/iKtWIKO7/E4DEF90+jQ
X-Gm-Gg: ASbGncuGzDf2CYEnQ1r94Lgf6Ms1/CgdSaTh8WJ50oN/PGoEtJHtpl7tNfsOJjFwKy9
	LBbbZAnaSBwb8Jt3pWb0Nob7IJXQLIBHCYajd5qEDNdcIStRVrBYcRXeeNP/Qh1QXFJ6af4jYrO
	GxLZT2RbQjHXOyySVRwdCmbnuVHWY64pzMGM03WkNJGn2UbKWX0OrYAlrkFd3N8gPYnkoTR+Kup
	uxBkYVbxVPfpkSmMwO5Rnw/+iGICz7H3RJvqgRWUqFy2ebvs/fT0+luT7NbXtp5kGFZkh3et8Ep
	bNIeNbFxPi2l/6NiSNUylp6DYSTclHMq5xXtNPgQ+0/dh58/HL4xezzCRKkK/l2HWpWhxBEDFIK
	O9LUP96ZjPGF0GLfxeb0G6xtDCz5G5NXmfx8=
X-Google-Smtp-Source: AGHT+IGWB8JnqcECTM+zd1hdAZU/6u/ztEZSqRZvwwB+hZoniDZyCdEYMcR5tsg96ZGbyZYcc5gqSg==
X-Received: by 2002:a17:907:f1e9:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae9ce196c5fmr363790166b.51.1752694301709;
        Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:41 -0700 (PDT)
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
Subject: [PATCH v6 09/24] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Wed, 16 Jul 2025 22:30:54 +0300
Message-ID: <20250716193111.942217-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
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
index f712d7cfc35f5..758c0223977d4 100644
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
2.50.1

