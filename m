Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA028C03D
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240786; cv=none; b=e5BltaO89G8EvfZ+H+2imXnBIejKDVrrTHwuF0hNud9DvSCsWnt1DcWIAJo3QtLwrB3pUTAP8IfOqUsYk15gBV9DYQDqTQYUY9Rphp9PNJv2UKqfZ/J4ZZWw93ZHyzOOvVQHzcGe1A8CzsRb0RKYgK9YpY/MTCCAVl4JK7HR9Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240786; c=relaxed/simple;
	bh=opcAlOUBAEVyM/40uDqWPudv7Do8qaT/jl9kHIxioKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKLix9zdbqxEi8BlhNDJNOKxp0QQW83mNJDoN5i0Xk0+S2seBSSjPQ6lzDtOqFTBOloSfqTLnL9OYTAAte/ycB8DdDf6Bx3mfWs7GAV3ZsjoSvJS0dfJ9MTQ3EqwvEcphUeKdjW376eifEAz7Qail76ExC/upAC+1OcbnOM2w0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUfJmiMB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUfJmiMB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso13052675a12.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240783; x=1750845583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3TtowPmSjozBFuMkK36IdX9AC61m1Rtc9Gf3gIV9GI=;
        b=FUfJmiMBQfUD61RbBrny38C0mM3cVEjtdW/Jlwse3jqF/PrqlGfojtQX+ZCRKreP+l
         7hzWqZsBDeqj70aV+DGCB4pkEVD1F8ZnFwxJ7dwooqohzVGqR+SChac+jZr/cOxqpaoM
         KNPGUUKENVtBnwLO/SfieqA8qXYw8yTu3x3Q11RoIA851OfVyqQtyOzyeSyckfjFlghr
         fl+60nHJLFuxPRc6P5ijy61QakYhrUQ/DChaJHkEvjGlbQf/9As97oDmbHrSgukBCmms
         7gAVeo/KUOaXS9rZof9/HVtgajIf/yNYMJSobMx7k8yUNIgsWwsi8TKhc5mXDo5uvh62
         z52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240783; x=1750845583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3TtowPmSjozBFuMkK36IdX9AC61m1Rtc9Gf3gIV9GI=;
        b=RV7c1KX4AGGiz27b+MZLtiFLG9wvzUG2UZJF6vmmH1bW4Mgi0csZx/xfcjwFbTRsTo
         29ediKuYNC89XNES/QV4a2ERjWWDerDDRlHUA6iVEp5WTIHBqceFiyurL/OtY5d68KW+
         XPMhWgq19K2MGDadOJAIybncnOYmTes3XFQfqBeipTkt8BKw/tkSqAICFRgxfkE1k1nD
         0lX9pvVoDeJKqh4RBmD5o7yN9v3PXcWzTcSrN21Pue72V1kbam2cTF2jTpbaalptkinj
         /KStlQrIDPH4uC93LvIqNhaJSbS8Ol3EQGZIHPuOI1voEacC6mryqeyVe+CasQZtBLQ5
         R/jA==
X-Forwarded-Encrypted: i=1; AJvYcCWJCpoURXjWAVRLUacVBYcycbPFkQMEZtNMLEBKyrW1+9+HDaxiDN1lcj3YLWpV6xe1u94pk9VoAjYTZVCp@lists.linux.dev
X-Gm-Message-State: AOJu0YxVNp2MFhfS7WDfyj8kKy6w0CiYwwMiWWFD8hDji+gaUSM7HyXu
	nwTSv8cMiOFlZkA9t3OwJsE6KMGrluVetWCR45u57PWfJv6Ega+nK9Iy
X-Gm-Gg: ASbGncvbnB5+/KCv8ScpA7jWwJEVuhWOgEREVnOhBbQwkmJXrAqhpqTBsPrJ5AsX4pl
	YEljdEQufrxgnGPNk7mW6VEn+CS7op4oC20QBCzGZb/2xynB5oNTcwDfQW6fPs5A2s8UjsvOW1e
	YcXgvaFUv3txeFFRuCWZCcPs0Fcf6RAjhzbR9J51e0ZpZw3oOlqT996+HNs9ARVM21TU3IQQ26Z
	m61gXD4/Hs4Vzyj6WikIr332R+AnWuqk4GP8Add/KjuR1QCDFxkP5WZwk89m3jYGB9ToB5QGtdx
	SzYk7jySOhIMYpW6u0p4hHzXeV8lUZnJHWL3ULiAhHUtZ92DQcze8371jMtz4qkVokX3Z+foiwE
	=
X-Google-Smtp-Source: AGHT+IFo2mAi+jKg9HfLCZ/YVHV7ZAmm6wYfItt+pqPS6cQT+aJd6Xb6iGd5GAERxrnxVqQQtRUrdg==
X-Received: by 2002:a05:6402:42d4:b0:608:6754:ec67 with SMTP id 4fb4d7f45d1cf-608d0a0495dmr15074876a12.30.1750240782842;
        Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:42 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 08/19] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Wed, 18 Jun 2025 12:58:44 +0300
Message-ID: <20250618095858.2145209-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..f712d7cfc35f 100644
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
2.49.0

