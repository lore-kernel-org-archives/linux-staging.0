Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49232E0B55
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852333; cv=none; b=TRx2CV+OdhYm047MozLSNDQKW0JXCrQEPkHssTcEnwTYfk46LwKWDUsqORSpPLPoA4w9M17FOyjhWJJX9rnJGqNER20EI2bAGPVhQuAya/stmcQ3ChQzMQbHyh+/i0rcmLsq8fv+6X6QLfNOqEvbomTbnIXt2LCatg2oX5/jOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852333; c=relaxed/simple;
	bh=jeuvs5sazyu7V8h/2z/SSmBL9wj/xBK/jonDHUZR3lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCJzhcDIyE4G3D2NoKHBW5wt9h4vmojBPdlvliLhw9cbC3ko4IVMaOk75tLHO1FP4EFNVZN9+x/1BlbNBzjkPnCZepS7m0MVSFyP0RigH60pvqq8ThAKO4llGSXJRubC05xfP8fd2Zm0oo3S6p/Nk+kB6Opl8MAVKpSnDsrvEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf1iB5Ws; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vf1iB5Ws"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so18096065e9.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852330; x=1753457130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=Vf1iB5WsNGR5uD36135+7yEjVGZYBfK8n/sIcYmIuR35izErLV+kKY1SIH9s6s45Ot
         p2r1wyr9+/yvNsRk3WugL6kw2zY6zfq178Iu50U99kAIIafWMKO/zhr4PHT8l1TS2fgK
         kVo6TNA+NqJhbE485st8E2c93mPVcbyosevikRKwrVHMNwMZAkEJsizTxvyikc8/XRJI
         D4q67GNGDQG/7yLt6/cZhhlWLtvi0LFTCyIOzjeotrO5vX7YiR5Jf2TxiHMbld3JYrcK
         EBDD6uVxZBsaspHGep9ZHMBpyYHMvyrAgKic0vJbjJJs68q13Z9NNuL8+poRpnNg0cl3
         YNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852330; x=1753457130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ci6LfyLxOCYVonthXhYdb5sBHYYBJLKis6nF0XYSqcM=;
        b=BRUwBk3lQeWvKVWJ+TBXl/+1+i44ew4myTu2wQBd/QMzJbSH87O4Sr1vZsy3DQInxY
         HgDJUeVU7GKRxutceItcA4ElKnOP9volS+j4R5htUAxMIBVg6rGyhUMyqRj+EWWc/cpQ
         2SR6FHPJN8l/7ZEF9Od4kwH3/IHmXsiLJZZGRIpwCARlbek2tpleuvjMswSuRQPP8Jhh
         qDPyCg7wsZLzH+ly0BVfQxX7dsMTEfoEG54MMDcWgfJRpotdatHAerpUfxcVrHKW5Bry
         QYrQ2UzTKCKyAwEdFhgXerSR1mjj+StkOISDazDItALahZKHVJeLlfKm5GM3NMv+ltxn
         ZBEA==
X-Forwarded-Encrypted: i=1; AJvYcCWPW8X4GMo7OGozTDrVX131f1OXQ3veUFOLK0TA0BTKCjGjADOpRSbENLeMo9XNMspPA/rUu1dujLBLsT8P@lists.linux.dev
X-Gm-Message-State: AOJu0YwEaOe8ChZi9l1VYVk2VkMtH6aQ8qlppTjqz+1RkbvVrvLibZcv
	FAF9ZH3vCp5xCaPvJ3ekAJIqZFeD67nSUN1mtAAFHSn4FIkgux4QLOAF
X-Gm-Gg: ASbGncsqsb38iofb/nGpVguj8NjEo41lGT+dXkmQII75Y/bzEcA6HHQmjXd6EWNwIuR
	FgRLg9+7hsz8+EVH4Lhk8VjIlcSI5hSR7/m7ukOghxEyMWqeQd6pSv+Nz2uiOxR0a0lI4kZCCD5
	9W1D6o0BUCtfppldf7i2QPpKSPbL6/4HjLimqrMSNZ/PB/dIE0T2Dm1Aa6uVlFI7VZLuMHJSYj5
	a4DRwJX11hV9QWD3jk3dwIkQjAjeso8q0FbKRl+HbPqSv6QL+aK3DcZRx/CEpHuEEkWB49DvWyr
	crBKXT2bqwnS3kRAnMKMF9GkRHgfaM/AfmtJNj4MGaRcXV1nrBmqO3bQIkUzMwXM/jp51ELIaVa
	ZzspnJEW5LBi6ocrmsPunyNfZ1nlZlFFTwtg=
X-Google-Smtp-Source: AGHT+IG1vbzbLCgOR5YDotqpNaL70yH20v5dT4HsVfcivIBx8URgZtxb/nuiF60kyvSNGOQRCG9opQ==
X-Received: by 2002:a05:600c:3f12:b0:456:1ab0:d566 with SMTP id 5b1f17b1804b1-456348cbdb0mr81643995e9.16.1752852330035;
        Fri, 18 Jul 2025 08:25:30 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:29 -0700 (PDT)
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
Subject: [PATCH v7 08/24] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Fri, 18 Jul 2025 18:24:44 +0300
Message-ID: <20250718152500.2656391-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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

