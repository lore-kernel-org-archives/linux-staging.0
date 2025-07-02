Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7307F283FCC
	for <linux-staging@lists.linux.dev>; Wed,  2 Jul 2025 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462481; cv=none; b=qyogxoBx6KzW3Hj/toWmYEKgvUQ+7tB/Yzz/CSByDKxSnI5VcrxUuAgVpVNpst/9/XecArtYlWYCPDMvCGiTu5AuKZKxtGERgyw8pUZdDNu8BYhbuDyvBRV0UZScA7FARGTSE1vo0D2zjYab95Bb6q3TVCWpBvKzU6J7OM7l0BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462481; c=relaxed/simple;
	bh=s/p9yqQHlTA4IMsyLZK+CDbjdmCKT8r4mjy1I7nafj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMAgMTkKvYJbhlMbzMnzsGPg+oeXcjRt9FMrMtJ/TkqgTeOBWtaJRn2P05L+OTSfbWElrgN4iXSAgamqJUiLuXBPtRmPQP33s2D6WE5MovJzR/VkVcI5o4xwsiS/9PTqX2h5aJNmZboxde35/go3XXP786mbDQ2Y1ib06x5LvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T17YcBpa; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T17YcBpa"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so5823721a12.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Jul 2025 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462478; x=1752067278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHtKm+EEXzzIlG111wnSsu8XSk7GbNuuARrUp7XVuKU=;
        b=T17YcBpaCGkFT4JWqQ3ZkBP2ndv0BJo9vPwktPujoKgHieNvy2j6ZK7Kr0677M8plK
         Pmg6Y6Rkg+8rA/sbpQ0kAxpPU1ATmVY8YAQVotw3WbMzP4CKt58EptjLyp0A5PM5rPWf
         cbNTnvPDK6Ec2nvPWJdyeuirNCTw9YR+B3hUFy/pTOnKijTag5vfQLy6HlWKJFtuWk4e
         rb4JGC/nne0ENBDHOMeo/aBUf9/gkoqYzpsTYcsQQLFpcT9QuZezY8sa7adOs0Ib31kI
         NFgs4C1mu97wKrQsdKpx9z1smhntaaX7hQr0ZI0YEeS4xOOq/J5s3Nk6+e+PkSp8nkrc
         k1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462478; x=1752067278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHtKm+EEXzzIlG111wnSsu8XSk7GbNuuARrUp7XVuKU=;
        b=Ms8fKGvCDD2YMyWpbXy2u4sfV/U0xRQPeyPPL9scKhb3uF2NrQatDbco2AoZ+yDDeT
         jX0p2eVUQjU73hpP2vthKd2GEpsOkw5eukOfLs3BHUuOuMmlP4dIuaYmh8HR0ljr/Wqm
         JZscgU4Ru7sZfvc/91Ku3+U2jPkh/w+e8F/6AKfO0cIK3i2hmgp9pI1ticzakK8sf7op
         1D14ylFh1iGJAnUSJVhwXYog2BxvqbJJfEDPm/i2C+yoTQnGvuhnt3oSmT6KRGZQX1ck
         O+/ZUwonT9NQPByXIkamedbm3qQ9Z4V3Snf2nTJquO0N2B0oJx4f4SALvcMqEzNfMxna
         PqUg==
X-Forwarded-Encrypted: i=1; AJvYcCXvP3tcMIC1p6FbcG0S9coJKGD1O0D6junCWOxOsAwqKj3Zy0ApiJYWCBDAOksXq1p9XueJthMBMZGH2Yp3@lists.linux.dev
X-Gm-Message-State: AOJu0YwAQOTJCoF0QlC25NryYp+H0W80btY1JjF2isolv62TaWQdvEyj
	pe4z4V2VsdAHb4MDDp0VCflsuz5JLN2eZyAuHpxpixL1gJ4O352kq1BS
X-Gm-Gg: ASbGncvchYg7Qa7xou6/dHgyniwr+G1D6rKVnKY01UytOZsj/1PBsO46+Z7Kdz+CL2c
	JuKFNAyLvBV7wSqqkgbZ//rKUpxIL/7evBuRKyNWGXkVHeMPNJp+KauOYCfaLE2ni28UdYlssCQ
	4CUtHvltKiXT3Pl7+pp9PVoVbc2urhfEBWlwl2BMKplr4YBoHvi6Hjz8CEFBA4MqopE5ZCpgBGh
	2xJNiCotewYeglaMUXo0KRvYaSY6pjKR6DFfA+im/IA4jP/KsLtgrGT5cyYf2X0+/njGMFt1xXo
	mpjkVs+EuWxv1wTanaDDyk5em9daeNMKwQDRBPqf29aTBbGzTTKxRbULB5h2u6FxS1chJYcShyY
	=
X-Google-Smtp-Source: AGHT+IHvM+9PE3ELXwT9U1cnGnuZOCOmHJOManbPYkfa4Wv8dKS7DjN6hAjnrIVhNUqXBWZgB9WpNw==
X-Received: by 2002:a17:906:c141:b0:ae0:da61:71fc with SMTP id a640c23a62f3a-ae3c388298dmr285682166b.10.1751462477402;
        Wed, 02 Jul 2025 06:21:17 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:17 -0700 (PDT)
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
Subject: [PATCH v5 03/24] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed,  2 Jul 2025 16:20:29 +0300
Message-ID: <20250702132104.1537926-4-demonsingur@gmail.com>
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
2.50.0

